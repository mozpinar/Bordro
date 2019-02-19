unit View.CurrencyListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,

  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.CurrencyList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TCurrencyListForm = class(TTemplateForm)
  private
    fViewModel : ICurrencyListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ICurrencyListViewModelInterface);
    function GetViewModel : ICurrencyListViewModelInterface;

  protected
    function GetProvider : IProviderInterface; override;

    //procedure UpdateLabelsText; override;

    function GetPKName : string; override;
    procedure OpenDataset; override;

  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ICurrencyListViewModelInterface read GetViewModel write SetViewModel;
    property Provider: IProviderInterface read GetProvider;
  end;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.CurrencyEdit;
{$R *.dfm}

{ TCurrencyListForm }

procedure TCurrencyListForm.AddNew;
var
  currency : TCurrency;
begin
  try
    TCurrencyEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;

end;

procedure TCurrencyListForm.DeleteCurrent;
begin
  inherited;
end;

procedure TCurrencyListForm.EditCurrent;
begin
  TCurrencyEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

function TCurrencyListForm.GetPKName: string;
begin
  Result := 'CurrencyId';
end;

function TCurrencyListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TCurrencyListForm.GetViewModel: ICurrencyListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateCurrencyListViewModelClass;
  Result := fViewModel;
end;

procedure TCurrencyListForm.NotificationFromProvider(
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

procedure TCurrencyListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllCurrencies('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TCurrencyListForm.Print;
begin
end;

procedure TCurrencyListForm.SetViewModel(
  const newViewModel: ICurrencyListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Country List View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3901,3902,3903,3904,3905') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCurrencyListForm');
       Result := TCurrencyListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TCurrencyListForm>('TCurrencyListForm', CreateForm);
end.
