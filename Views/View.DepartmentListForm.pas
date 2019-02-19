unit View.DepartmentListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,

  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.DepartmentList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations, Vcl.ComCtrls, JvExComCtrls, JvDBTreeView;

type
  TDepartmentListForm = class(TTemplateForm)
    JvDBTreeView1: TJvDBTreeView;
  private
    fViewModel : IDepartmentListViewModelInterface;
    fPossibleParentDepartmentId : Integer;
    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IDepartmentListViewModelInterface);
    function GetViewModel : IDepartmentListViewModelInterface;

    function GetProvider : IProviderInterface; override;

  protected
    function GetPKName : string; override;
    procedure OpenDataset; override;
    procedure NewDepartment(aDS : TDataset);

  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IDepartmentListViewModelInterface read GetViewModel write SetViewModel;
  end;

var
  DepartmentListForm: TDepartmentListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.DepartmentEdit;

{$R *.dfm}

var
  CreateForm : TFactoryMethod<TTemplateForm>;

{ TDepartmentListForm }

procedure TDepartmentListForm.AddNew;
begin
  try
    TDepartmentEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TDepartmentListForm.EditCurrent;
begin
  try
    TDepartmentEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

function TDepartmentListForm.GetPKName: string;
begin
  Result := 'DepartmentId';
end;

function TDepartmentListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TDepartmentListForm.GetViewModel: IDepartmentListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateDepartmentListViewModelClass;
  Result := fViewModel;
end;

procedure TDepartmentListForm.NewDepartment(aDS: TDataset);
begin
  fObjectDataset.FieldByName('CompanyId').AsInteger := DMMain.Company.CompanyId;
  if fPossibleParentDepartmentId>=0 then
    fObjectDataset.FieldByName('ParentId').AsInteger := fPossibleParentDepartmentId;
end;

procedure TDepartmentListForm.NotificationFromProvider(
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

procedure TDepartmentListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllDepartments(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
  fObjectDataset.OnNewRecord := NewDepartment;
  if fObjectDataset.RecordCount>0 then
    JvDBTreeView1.Items[0].Expand(True);

end;

procedure TDepartmentListForm.Print;
begin

end;

procedure TDepartmentListForm.SetViewModel(
  const newViewModel: IDepartmentListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Department View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit)
end;

initialization

  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3511,3512,3513,3514,3515') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TDepartmentListForm');
       Result := TDepartmentListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TDepartmentListForm>('TDepartmentListForm', CreateForm);

end.
