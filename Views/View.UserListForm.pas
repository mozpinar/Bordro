unit View.UserListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.CountryList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TUserListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : IUserListViewModelInterface;
    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IUserListViewModelInterface);
    function GetViewModel : IUserListViewModelInterface;

  protected
    function GetProvider : IProviderInterface; override;

    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IUserListViewModelInterface read GetViewModel write SetViewModel default nil;
    property Provider: IProviderInterface read GetProvider default nil;
  end;

var
  UserListForm: TUserListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  Model.User,
  ViewModel.UserList,
  View.UserEdit;

{$R *.dfm}

{ TUserListForm }

procedure TUserListForm.AddNew;
begin
  try
    TUserEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;

end;

procedure TUserListForm.DeleteCurrent;
begin
  inherited;

end;

procedure TUserListForm.EditCurrent;
begin
  TUserEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TUserListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TUserListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TUserListForm.GetViewModel: IUserListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateUserListViewModelClass;
  Result := FViewModel;
end;

procedure TUserListForm.NotificationFromProvider(
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

procedure TUserListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllUsers(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TUserListForm.Print;
begin
  inherited;

end;

procedure TUserListForm.SetViewModel(
  const newViewModel: IUserListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Country List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TUserListForm.UpdateLabelsText;
begin
  inherited;

end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;
initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('101,102,103,104,105') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityListForm');
       Result := TUserListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TUserListForm>('TUserListForm', CreateForm);

end.
