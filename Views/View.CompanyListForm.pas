unit View.CompanyListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ExtCtrls, Vcl.Menus, GrdPMenu,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  Model.FormDeclarations,
  Model.Declarations,
  Model.ProSu.InterfaceActions;

type
  TCompanyListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : ICompanyListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ICompanyListViewModelInterface);
    function GetViewModel : ICompanyListViewModelInterface;

  protected
    procedure OpenDataset; override;
    function GetProvider : IProviderInterface; override;
  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ICompanyListViewModelInterface read GetViewModel write SetViewModel;
  end;

//var
//  CompanyListForm: TCompanyListForm;

implementation
uses
  View.CompanyEdit,
  ViewModel.CompanyList,
  Model.LanguageDictionary,
  Spring.DesignPatterns,
  Model.Fabrication,
  MainDM;
{$R *.dfm}

{ TCompanyListForm }

procedure TCompanyListForm.AddNew;
begin
  try
    TCompanyEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TCompanyListForm.EditCurrent;
//var
  //company : TCompany;
begin
  //company := fObjectDataset.DataList.Items[fObjectDataset.Index] as TCompany;
  try
    TCompanyEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TCompanyListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TCompanyListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TCompanyListForm.GetViewModel: ICompanyListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateCompanyListViewModelClass;
  Result := fViewModel;
end;

procedure TCompanyListForm.NotificationFromProvider(
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

procedure TCompanyListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllCompanies('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TCompanyListForm.Print;
begin

end;


procedure TCompanyListForm.SetViewModel(const newViewModel: ICompanyListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Company List View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3501,3502,3503,3504,3505') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCompanyListForm');
       Result := TCompanyListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TCompanyListForm>('TCompanyListForm', CreateForm);
end.
