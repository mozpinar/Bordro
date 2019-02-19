unit View.EmployeeListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  JvComponentBase, JvEmbeddedForms,
  View.TemplateForm,
  Model.Fabrication, JvFormPlacement,
  Model.ProSu.Interfaces,
  Model.FormDeclarations,
  Model.Declarations,
  Vcl.Menus, GrdPMenu,
  Model.Interfaces;

type
  TEmployeeListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : IEmployeeListViewModelInterface;

    procedure SetViewModel(const newViewModel: IEmployeeListViewModelInterface);
    function GetViewModel : IEmployeeListViewModelInterface;
    procedure NotificationFromProvider(const notifyClass: INotificationClass);
    procedure DatasetGetGender(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure DatasetGetMaritalStatus(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure DatasetGetWagePeriods(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DatasetGetTitle(Sender: TField; var Text: string;
      DisplayText: Boolean);

  protected
    procedure OpenDataset; override;
    function GetProvider : IProviderInterface; override;

    procedure NewEmployee(aDS : TDataset);

  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Refresh; override;

    procedure DeleteCurrent; override;
    procedure UndeleteCurrent; override;
    procedure Print; override;
    property ViewModel : IEmployeeListViewModelInterface read GetViewModel write SetViewModel;
  end;

implementation
uses

  MainDM,
  Model.Employee,
  ViewModel.EmployeeList,
  View.EmployeeEdit,
  Model.ProSu.InterfaceActions,
  Model.LanguageDictionary;
{$R *.dfm}


{ TEmployeeForm }

procedure TEmployeeListForm.AddNew;
begin
  try
    TEmployeeEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TEmployeeListForm.DatasetGetGender(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger in [1..3] then
    Text := GendersStr[TGenders(Sender.AsInteger)];
end;

procedure TEmployeeListForm.DatasetGetMaritalStatus(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger in [1..4] then
    Text := MaritalStatusStr[TMaritalStatus(Sender.AsInteger)];
end;

procedure TEmployeeListForm.DatasetGetTitle(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (not Sender.IsNull) and (Sender.AsInteger>0) then
    Text := DMMain.Session.FindOne<TTitle>(Sender.AsInteger).TitleName;
end;

procedure TEmployeeListForm.DatasetGetWagePeriods(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger in [1..4] then
    Text := WagePeriodsStr[TWagePeriods(Sender.AsInteger)];
end;

procedure TEmployeeListForm.DeleteCurrent;
begin
  inherited;
end;

procedure TEmployeeListForm.EditCurrent;
begin
  TEmployeeEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TEmployeeListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TEmployeeListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TEmployeeListForm.GetViewModel: IEmployeeListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateEmployeeListViewModelClass;
  Result := fViewModel;
end;

procedure TEmployeeListForm.NewEmployee(aDS: TDataset);
begin
  aDS.FieldByName('CompanyId').AsInteger := DMMain.Company.CompanyId;
end;

procedure TEmployeeListForm.NotificationFromProvider(
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

procedure TEmployeeListForm.OpenDataset;
begin
  if DMMain.Company=Nil then
  begin
    Close;
    raise Exception.Create(MessageDictionary.GetMessage('SThereIsNoSelectedCompany'));
  end;
  fObjectDataset.DataList := ViewModel.Model.GetAllEmployees(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  fObjectDataset.FieldByName('Gender').OnGetText := DatasetGetGender;
  fObjectDataset.FieldByName('MaritalStatus').OnGetText := DatasetGetMaritalStatus;
  fObjectDataset.FieldByName('WagePeriod').OnGetText := DatasetGetMaritalStatus;
  fObjectDataset.FieldByName('TitleId').OnGetText := DatasetGetTitle;
  DataSource1.DataSet := fObjectDataset;
  fObjectDataset.OnNewRecord := NewEmployee;
end;

procedure TEmployeeListForm.Print;
begin

end;

procedure TEmployeeListForm.Refresh;
//var I : Integer;
begin
  inherited;
  {Caption := FormDictionary.GetText(ClassName, 'Caption');
  for I := 0 to fObjectDataset.FieldCount-1 do
    fObjectDataset.Fields[i].DisplayLabel := FormDictionary('').GetText(ClassName, 'fObjectDataset.Fields['+IntToStr(i)+'].DisplayName');
  }
end;

procedure TEmployeeListForm.SetViewModel(
  const newViewModel: IEmployeeListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Employee List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TEmployeeListForm.UndeleteCurrent;
begin
  inherited;
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;

initialization

  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('5011,5012,5013,5014,5015') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TEmployeeListForm');
       Result := TEmployeeListForm.Create(Application);
     end;

  MyFactory.RegisterForm<TEmployeeListForm>('TEmployeeListForm', CreateForm);
end.
