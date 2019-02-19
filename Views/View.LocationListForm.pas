unit View.LocationListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,

  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.LocationList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TLocationListForm = class(TTemplateForm)
  private
    fViewModel : ILocationListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ILocationListViewModelInterface);
    function GetViewModel : ILocationListViewModelInterface;

    function GetProvider : IProviderInterface; override;

  protected
    function GetPKName : string; override;
    procedure OpenDataset; override;

  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ILocationListViewModelInterface read GetViewModel write SetViewModel;
  end;

//var
//  LocationListForm: TLocationListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.LocationEdit;
{$R *.dfm}


{ TLocationListForm }

procedure TLocationListForm.AddNew;
begin
  try
    TLocationEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TLocationListForm.EditCurrent;
begin
  try
    TLocationEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;

end;

function TLocationListForm.GetPKName: string;
begin
  Result := 'LocationId';
end;

function TLocationListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TLocationListForm.GetViewModel: ILocationListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateLocationListViewModelClass;
  Result := fViewModel;
end;

procedure TLocationListForm.NotificationFromProvider(
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

procedure TLocationListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllLocations('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TLocationListForm.Print;
begin

end;

procedure TLocationListForm.SetViewModel(
  const newViewModel: ILocationListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Location View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit)
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;

initialization

  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3031,3032,3033,3034,3035') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TLocationListForm');
       Result := TLocationListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TLocationListForm>('TLocationListForm', CreateForm);
end.
