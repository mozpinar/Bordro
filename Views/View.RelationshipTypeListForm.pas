unit View.RelationshipTypeListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,

  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.RelationshipType,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations;

type
  TRelationshipTypeListForm = class(TTemplateForm)
  private
    fViewModel : IRelationshipTypeListViewModelInterface;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IRelationshipTypeListViewModelInterface);
    function GetViewModel : IRelationshipTypeListViewModelInterface;

    function GetProvider : IProviderInterface; override;

  protected
    function GetPKName : string; override;
    procedure OpenDataset; override;

  public
    procedure AddNew; override;
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IRelationshipTypeListViewModelInterface read GetViewModel write SetViewModel;
  end;

//var
//  RelationshipTypeListForm: TRelationshipTypeListForm;

implementation
uses
  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  View.RelationshipTypeEdit;

{$R *.dfm}

{ TRelationshipTypeListForm }

procedure TRelationshipTypeListForm.AddNew;
begin
  try
    TRelationshipTypeEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

procedure TRelationshipTypeListForm.EditCurrent;
begin
  try
    TRelationshipTypeEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;

function TRelationshipTypeListForm.GetPKName: string;
begin
  Result := 'RelationshipTypeId';
end;

function TRelationshipTypeListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TRelationshipTypeListForm.GetViewModel: IRelationshipTypeListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateRelationshipTypeListViewModelClass;
  Result := fViewModel;
end;

procedure TRelationshipTypeListForm.NotificationFromProvider(
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

procedure TRelationshipTypeListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllRelationshipTypes('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TRelationshipTypeListForm.Print;
begin

end;

procedure TRelationshipTypeListForm.SetViewModel(
  const newViewModel: IRelationshipTypeListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('RelationshipType View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;

initialization

  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3031,3032,3033,3034,3035') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TRelationshipTypeListForm');
       Result := TRelationshipTypeListForm.Create(Application);
     end;

  MyFactory.RegisterForm<TRelationshipTypeListForm>('TRelationshipTypeListForm', CreateForm);

end.
