unit View.OthIncomeOutcomeDefListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Model.Fabrication,
  Model.ProSu.Interfaces,
  Model.FormDeclarations,
  Model.Declarations,
  Model.Interfaces;

type
  TOthIncomeOutcomeDefListForm = class(TTemplateForm)
  private
    fViewModel : IOthIncomeOutcomeDefListViewModelInterface;

    procedure SetViewModel(const newViewModel: IOthIncomeOutcomeDefListViewModelInterface);
    function GetViewModel : IOthIncomeOutcomeDefListViewModelInterface;
    procedure NotificationFromProvider(const notifyClass: INotificationClass);
  protected
    procedure OpenDataset; override;
    function GetProvider : IProviderInterface; override;

  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Refresh; override;

    procedure DeleteCurrent; override;
    procedure UndeleteCurrent; override;
    procedure Print; override;
    property ViewModel : IOthIncomeOutcomeDefListViewModelInterface read GetViewModel write SetViewModel;
  end;

//var
//  OthIncomeOutcomeDefListForm: TOthIncomeOutcomeDefListForm;

implementation
uses
  MainDM,
  Model.OthIncomeOutcomeDef,
  ViewModel.OthIncomeOutcomeDefList,
  View.OthIncomeOutcomeDefEdit,
  Model.ProSu.InterfaceActions,
  Model.LanguageDictionary;

{$R *.dfm}

{ TOthIncomeOutcomeDefListForm }

procedure TOthIncomeOutcomeDefListForm.AddNew;
begin
  try
    TOthIncomeOutcomeDefEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TOthIncomeOutcomeDefListForm.DeleteCurrent;
begin
  inherited;

end;

procedure TOthIncomeOutcomeDefListForm.EditCurrent;
begin
  try
    TOthIncomeOutcomeDefEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

function TOthIncomeOutcomeDefListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TOthIncomeOutcomeDefListForm.GetViewModel: IOthIncomeOutcomeDefListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateOthIncomeOutcomeDefListViewModelClass;
  Result := fViewModel;
end;

procedure TOthIncomeOutcomeDefListForm.NotificationFromProvider(
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

procedure TOthIncomeOutcomeDefListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllOthIncomeOutcomeDefs(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
end;

procedure TOthIncomeOutcomeDefListForm.Print;
begin
  inherited;

end;

procedure TOthIncomeOutcomeDefListForm.Refresh;
begin
  inherited;

end;

procedure TOthIncomeOutcomeDefListForm.SetViewModel(
  const newViewModel: IOthIncomeOutcomeDefListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('OthIncomeOutcomeDef List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TOthIncomeOutcomeDefListForm.UndeleteCurrent;
begin
  inherited;

end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;

initialization

  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3541,3542,3543,3544,3545') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TOthIncomeOutcomeDefListForm');
       Result := TOthIncomeOutcomeDefListForm.Create(Application);
     end;

  MyFactory.RegisterForm<TOthIncomeOutcomeDefListForm>('TOthIncomeOutcomeDefListForm', CreateForm);
end.
