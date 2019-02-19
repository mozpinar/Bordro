unit View.PermissionListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  Model.FormDeclarations,
  Model.Declarations,
  Model.ProSu.InterfaceActions, Vcl.ComCtrls, JvExComCtrls, JvDBTreeView;

type
  TPermissionListForm = class(TTemplateForm)
    JvDBTreeView1: TJvDBTreeView;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure JvDBTreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBTreeView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    fViewModel : IPermissionListViewModelInterface;
    fPossibleParentPermissionId : Integer;

    lastHintNode : TTreeNode;

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: IPermissionListViewModelInterface);
    function GetViewModel : IPermissionListViewModelInterface;
    procedure NewPermission(aDS: TDataset);

  protected
    procedure OpenDataset; override;
    function GetProvider : IProviderInterface; override;
  public
    procedure AddNew; override;
    //procedure DeleteCurrent; override;
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : IPermissionListViewModelInterface read GetViewModel write SetViewModel;
  end;

var
  PermissionListForm: TPermissionListForm;

implementation
uses
  //View.PermissionEdit,
  ViewModel.PermissionList,
  Model.LanguageDictionary,
  Spring.DesignPatterns,
  Model.Fabrication, MainDM,
  View.PermissionEdit;

{$R *.dfm}


procedure TPermissionListForm.EditCurrent;
begin
  try
    TPermissionEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;
end;
procedure TPermissionListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TPermissionListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TPermissionListForm.GetViewModel: IPermissionListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreatePermissionListViewModelClass;
  Result := fViewModel;
end;

procedure TPermissionListForm.JvDBTreeView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=vk_Return then
  begin
    EditCurrent;
  end;
end;

procedure TPermissionListForm.JvDBTreeView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  tree: TJvDBTreeView;
  hoverNode: TTreeNode;
  hitTest : THitTests;
begin
  {if (Sender is TJvDBTreeView) then
    tree := TJvDBTreeView(Sender)
  else
    Exit;

   hoverNode := tree.GetNodeAt(X, Y) ;
   hitTest := tree.GetHitTestInfoAt(X, Y) ;

   if (lastHintNode <> hoverNode) then
   begin
     Application.CancelHint;

     if (hitTest <= [htOnItem, htOnIcon, htOnLabel,     htOnStateIcon]) then
     begin
       lastHintNode := hoverNode;
       tree.Hint := IntToStr(Integer(hoverNode.Index))+' '+hoverNode.Text;
     end;
   end;
   }
end;

procedure TPermissionListForm.AddNew;
begin
  try
    if fObjectDataset.RecordCount>0 then
      fPossibleParentPermissionId := fObjectDataset.FieldByName('PermissionId').AsInteger
    else
      fPossibleParentPermissionId := 0;
    TPermissionEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset);
  finally
    fObjectDataset.Cancel;
  end;

end;

procedure TPermissionListForm.NewPermission(aDS: TDataset);
begin
  //fObjectDataset.FieldByName('CompanyId').AsInteger := DMMain.Company.CompanyId;
  if fPossibleParentPermissionId>=0 then
    fObjectDataset.FieldByName('ParentId').AsInteger := fPossibleParentPermissionId;
end;


procedure TPermissionListForm.NotificationFromProvider(
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

procedure TPermissionListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllPermissions('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
  fObjectDataset.OnNewRecord := NewPermission;
  if fObjectDataset.RecordCount>0 then
    JvDBTreeView1.Items[0].Expand(True);

end;

procedure TPermissionListForm.Print;
begin

end;


procedure TPermissionListForm.SetViewModel(const newViewModel: IPermissionListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Permission List View Model is required!');
  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;


var
  CreateForm : TFactoryMethod<TTemplateForm>;


initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('131,132,133,134,135') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TEmployeeListForm');
       Result := TPermissionListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TPermissionListForm>('TPermissionListForm', CreateForm);

end.
