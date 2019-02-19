unit View.CountryListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, JvExDBGrids, JvDBGrid, JvComponentBase, JvFormPlacement,

  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.CountryList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations, Vcl.Menus, GrdPMenu;

type
  TCountryListForm = class(TTemplateForm)
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : ICountryListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ICountryListViewModelInterface);
    function GetViewModel : ICountryListViewModelInterface;

    function GetProvider : IProviderInterface; override;

    //procedure UpdateLabelsText; override;

    function GetPKName : string; override;
    procedure OpenDataset; override;

  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ICountryListViewModelInterface read GetViewModel write SetViewModel;
    property Provider: IProviderInterface read GetProvider;
  end;

var
  CountryListForm: TCountryListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.CountryEdit;

{$R *.dfm}


procedure TCountryListForm.AddNew;
var
  country : TCountry;
begin
  try
    TCountryEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TCountryListForm.DeleteCurrent;
begin
  inherited;
end;

procedure TCountryListForm.EditCurrent;
begin
  TCountryEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TCountryListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllCountries('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TCountryListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TCountryListForm.GetPKName: string;
begin
  Result := 'CountryId';
end;

function TCountryListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TCountryListForm.GetViewModel: ICountryListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateCountryListViewModelClass;
  Result := fViewModel;
end;

procedure TCountryListForm.NotificationFromProvider(
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

procedure TCountryListForm.SetViewModel(
  const newViewModel: ICountryListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Country List View Model is required!');


  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TCountryListForm.Print;
begin

end;

{
procedure TCountryListForm.UpdateLabelsText;
var I : Integer;
begin
  Caption := FormDictionary('').GetText(ClassName, 'Caption');
  for I := 0 to fObjectDataset.FieldCount-1 do
    fObjectDataset.Fields[i].DisplayLabel := FormDictionary('').GetText(ClassName, 'fObjectDataset.Fields['+IntToStr(i)+'].DisplayName');
end;
}

var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3001,3002,3003,3004,3005') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCountryListForm');
       Result := TCountryListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TCountryListForm>('TCountryListForm', CreateForm);
end.
