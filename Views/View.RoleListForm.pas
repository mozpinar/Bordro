unit View.RoleListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;


type
  TRoleListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : IRoleListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IRoleListViewModelInterface);
    function GetViewModel : IRoleListViewModelInterface;

    function GetProvider : IProviderInterface; override;

    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
    procedure NewRole(aDS : TDataset);
  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IRoleListViewModelInterface read GetViewModel write SetViewModel default nil;
    property Provider: IProviderInterface read GetProvider default nil;
  end;

var
  RoleListForm: TRoleListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  Model.Role,
  ViewModel.RoleList,
  View.RoleEdit;

{$R *.dfm}

var
  CreateForm : TFactoryMethod<TTemplateForm>;
procedure TRoleListForm.AddNew;
begin
  try
    TRoleEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TRoleListForm.DeleteCurrent;
begin
  inherited;

end;

procedure TRoleListForm.EditCurrent;
begin
  TRoleEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TRoleListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TRoleListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TRoleListForm.GetViewModel: IRoleListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateRoleListViewModelClass;
  Result := FViewModel;
end;

procedure TRoleListForm.NewRole(aDS: TDataset);
begin

end;

procedure TRoleListForm.NotificationFromProvider(
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

procedure TRoleListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllRoles(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TRoleListForm.Print;
begin
  inherited;

end;

procedure TRoleListForm.SetViewModel(
  const newViewModel: IRoleListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Role List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TRoleListForm.UpdateLabelsText;
begin
  inherited;

end;

initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('121,122,123,124,125') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TRoleListForm');
       Result := TRoleListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TRoleListForm>('TRoleListForm', CreateForm);
end.
