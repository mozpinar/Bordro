unit View.CityListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.CityList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TCityListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : ICityListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ICityListViewModelInterface);
    function GetViewModel : ICityListViewModelInterface;

  protected
    function GetProvider : IProviderInterface; override;
    function GetPKName : string; override;
    procedure OpenDataset; override;

  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ICityListViewModelInterface read GetViewModel write SetViewModel;
    property Provider: IProviderInterface read GetProvider;
  end;

implementation
uses

  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.CityEdit,
  Sec.Declarations;

{$R *.dfm}

{ TCityListForm }

procedure TCityListForm.AddNew;
begin
  try
    TCityEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;

end;

procedure TCityListForm.DeleteCurrent;
begin
  inherited;
end;

procedure TCityListForm.EditCurrent;
begin
  TCityEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TCityListForm.FormCreate(Sender: TObject);
begin
  inherited;
  if not TUserExt.AutorizeUser(DMMain.LoggedUserName, '3011,3015') then
  begin
    Close;
    raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized'));
  end;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TCityListForm.GetPKName: string;
begin
  Result := 'CityId';
end;

function TCityListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TCityListForm.GetViewModel: ICityListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateCityListViewModelClass;
  Result := fViewModel;
end;

procedure TCityListForm.NotificationFromProvider(
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

procedure TCityListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllCities('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;

end;

procedure TCityListForm.Print;
begin
  inherited;

end;

procedure TCityListForm.SetViewModel(
  const newViewModel: ICityListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('City List View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3011,3012,3013,3014,3015') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityListForm');
       Result := TCityListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TCityListForm>('TCityListForm', CreateForm);

end.
