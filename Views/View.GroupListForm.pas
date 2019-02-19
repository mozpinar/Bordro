unit View.GroupListForm;

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
  TGroupListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : IGroupListViewModelInterface;

    fPossibleParentGroupId : Integer;
    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IGroupListViewModelInterface);
    function GetViewModel : IGroupListViewModelInterface;

    function GetProvider : IProviderInterface; override;

    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
    procedure NewGroup(aDS : TDataset);
  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IGroupListViewModelInterface read GetViewModel write SetViewModel default nil;
    property Provider: IProviderInterface read GetProvider default nil;
  end;

var
  GroupListForm: TGroupListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  Model.Group,
  ViewModel.GroupList,
  View.GroupEdit;

{$R *.dfm}

procedure TGroupListForm.AddNew;
begin
  try
    TGroupEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TGroupListForm.DeleteCurrent;
begin
  inherited;

end;

procedure TGroupListForm.EditCurrent;
begin
  TGroupEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TGroupListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TGroupListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TGroupListForm.GetViewModel: IGroupListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateGroupListViewModelClass;
  Result := FViewModel;
end;

procedure TGroupListForm.NewGroup(aDS: TDataset);
begin

end;

procedure TGroupListForm.NotificationFromProvider(
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

procedure TGroupListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllGroups(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TGroupListForm.Print;
begin
  inherited;

end;

procedure TGroupListForm.SetViewModel(
  const newViewModel: IGroupListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Group List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TGroupListForm.UpdateLabelsText;
begin
  inherited;

end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;
initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('111,112,113,114,115') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityListForm');
       Result := TGroupListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TGroupListForm>('TGroupListForm', CreateForm);

end.
