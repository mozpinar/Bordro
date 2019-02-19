unit View.TownListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.TownList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TTownListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : ITownListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ITownListViewModelInterface);
    function GetViewModel : ITownListViewModelInterface;

    function GetProvider : IProviderInterface; override;

    //procedure UpdateLabelsText; override;

    function GetPKName : string; override;
    procedure OpenDataset; override;
  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ITownListViewModelInterface read GetViewModel write SetViewModel;
    property Provider: IProviderInterface read GetProvider;
  end;

var
  TownListForm: TTownListForm;

implementation
uses

  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.TownEdit;

{$R *.dfm}

{ TTemplateForm1 }

procedure TTownListForm.AddNew;
begin
  try
    TTownEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TTownListForm.DeleteCurrent;
begin
  inherited;
end;

procedure TTownListForm.EditCurrent;
begin
  TTownEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TTownListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TTownListForm.GetPKName: string;
begin
  Result := 'TownId';
end;

function TTownListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TTownListForm.GetViewModel: ITownListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateTownListViewModelClass;
  Result := fViewModel;
end;

procedure TTownListForm.NotificationFromProvider(
  const notifyClass: INotificationClass);
var
  tmpNotifClass : TNotificationClass;
  tmpErrorNotifClass : TErrorNotificationClass;
begin
  if notifyClass is TNotificationClass then
  begin
    tmpNotifClass := notifyClass as TNotificationClass;
  end;

  if notifyClass is TErrorNotificationClass then
  begin
    tmpErrorNotifClass := notifyClass as TErrorNotificationClass;
  end;
end;

procedure TTownListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllTowns('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TTownListForm.Print;
begin


end;

procedure TTownListForm.SetViewModel(
  const newViewModel: ITownListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Town List View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3021,3022,3023,3024,3025') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityListForm');
       Result := TTownListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TTownListForm>('TTownListForm', CreateForm);

end.
