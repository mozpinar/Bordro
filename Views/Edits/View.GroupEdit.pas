unit View.GroupEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  JvDBLookupTreeView, JvExControls, JvDBLookup, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Spring.Data.ObjectDataset,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Model.FormDeclarations;

type
  TGroupEditForm = class(TTemplateEdit)
    labelGroupName: TLabel;
    edGroupName: TDBEdit;
    labelCompanyId: TLabel;
    edCompanyId: TJvDBLookupCombo;
    labelParentId: TLabel;
    edParentId: TJvDBLookupTreeViewCombo;
    dsCompany: TDataSource;
    dsGroupTree: TDataSource;
    PageControl1: TPageControl;
    tabUsers: TTabSheet;
    Splitter1: TSplitter;
    Panel1: TPanel;
    labelUsers: TLabel;
    labelUsersOfGroup: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    Panel3: TPanel;
    btnAddUser: TSpeedButton;
    btnDeleteUser: TSpeedButton;
    tabRoles: TTabSheet;
    Splitter2: TSplitter;
    JvDBGrid3: TJvDBGrid;
    Panel4: TPanel;
    btnAddRole: TSpeedButton;
    btnDeleteRole: TSpeedButton;
    JvDBGrid4: TJvDBGrid;
    Panel5: TPanel;
    labelRoles: TLabel;
    labelRolesOfGroup: TLabel;
    tabPermissions: TTabSheet;
    Splitter3: TSplitter;
    grd: TJvDBGrid;
    Panel6: TPanel;
    btnAddPermission: TSpeedButton;
    btnDeletePermission: TSpeedButton;
    JvDBGrid6: TJvDBGrid;
    Panel7: TPanel;
    labelPermissions: TLabel;
    labelPermissionsOfGroup: TLabel;
    dsUsersSource: TDataSource;
    dsRolesSource: TDataSource;
    dsPermissionsSource: TDataSource;
    dsUsersTarget: TDataSource;
    dsRolesTarget: TDataSource;
    dsPermissionsTarget: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddPermissionClick(Sender: TObject);
    procedure btnAddRoleClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure btnDeletePermissionClick(Sender: TObject);
    procedure btnDeleteRoleClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
  private
    fCompanyDataset : TObjectDataset;

    fUsersTargetDS, fUsersSourceDS : TObjectDataset;
    fRolesTargetDS, fRolesSourceDS : TObjectDataset;
    fPermissionsTargetDS, fPermissionsSourceDS : TObjectDataset;
    procedure AddTargetDisableSourceDS(aSourceDS, aTargetDS: TDataset;
      aId: Integer; aIdField, aNameField, aManagerField, aIsUserField,
      aRUGField: String);
    procedure DisableTargetDS(aTargetDS: TDataset);
    procedure EnableSourceDS(aSourceDS: TDataset; aId: Integer;
      aIdField: String);
  protected
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
    procedure AfterPost(DataSet: TDataSet); override;

  public
  end;

var
  GroupEditForm: TGroupEditForm;

implementation
uses
  Spring.Collections,
  Spring.Persistence.Mapping.Attributes,
  MainDM,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Model.MosObjectDataset,
  Spring.Persistence.Core.Interfaces,
  Model.Interfaces,
  Model.GroupUser,
  Model.RoleUserGroup,
  Model.RoleUserGroupPermission;

{$R *.dfm}

procedure TGroupEditForm.AfterPost(DataSet: TDataSet);
var
  agumdl : IGroupUserModelInterface;
  aRugmdl : IRoleUserGroupModelInterface;
  aRugpmdl : IRoleUserGroupPermissionModelInterface;
begin
  agumdl := CreateGroupUserModelClass;
  agumdl.UpdateGroupUserList(-1, DataSource1.DataSet.FieldByName('GroupId').AsInteger, fUsersTargetDS);
  aRugmdl := CreateRoleUserGroupModelClass;
  aRugmdl.UpdateRoleUserGroupList(-1, -1, DataSource1.DataSet.FieldByName('GroupId').AsInteger, fRolesTargetDS.DataList as IList<TRoleUserGroup>);
  aRugpmdl := CreateRoleUserGroupPermissionModelClass;
  aRugpmdl.UpdateRoleUserGroupList(-1, -1, DataSource1.DataSet.FieldByName('GroupId').AsInteger, -1, fPermissionsTargetDS.DataList as IList<TRoleUserGroupPermission>);
end;

procedure TGroupEditForm.EnableSourceDS(aSourceDS : TDataset; aId : Integer; aIdField : String);
var
  prefiltered : boolean;
begin
  aSourceDS.DisableControls;
  prefiltered := aSourceDS.Filtered;
  try
    aSourceDS.Filtered := false;
    if aSourceDS.Locate(aIdField, IntToStr(aId), []) then
    begin
      aSourceDS.Edit;
      aSourceDS.FieldByName('IsDeleted').AsBoolean := False;
      aSourceDS.Post;
    end;
  finally
    aSourceDS.Filtered := prefiltered;
    aSourceDS.EnableControls;
    aSourceDS.Locate(aIdField, IntToStr(aId), []);
  end;
end;

procedure TGroupEditForm.DisableTargetDS(aTargetDS : TDataset);
begin
  aTargetDS.Edit;
  try
    aTargetDS.FindField('IsDeleted').AsBoolean := True;
    aTargetDS.Post;
  except
    on e:Exception do
    begin
      aTargetDS.Cancel;
      ShowMessage(e.Message);
    end;
  end;
  if not aTargetDS.Filtered then
  begin
    aTargetDS.Filter := 'IsDeleted = 0 ';
    aTargetDS.Filtered := True;
  end;
end;

procedure TGroupEditForm.AddTargetDisableSourceDS(aSourceDS : TDataset; aTargetDS : TDataset;
                        aId : Integer; aIdField, aNameField, aManagerField, aIsUserField, aRUGField : String);
var
  prefiltered : boolean;
begin
  if aSourceDS.RecordCount<0 then
    Exit;
  aSourceDS.DisableControls;
  prefiltered := aSourceDS.Filtered;
  aSourceDS.Filtered := False;
  try
    if not aSourceDS.Locate(aIdField, IntToStr(aId), []) then
      raise Exception.Create(MessageDictionary.GetMessage('SSeriousUnknownError'));
    if aTargetDS.Locate(aIdField, IntToStr(aId), []) then
    begin
      aTargetDS.Edit;
      aTargetDS.FieldByName('IsDeleted').AsBoolean := False;
      aTargetDS.Post;
    end
    else
    begin
      aTargetDS.Append;
      aTargetDS.FieldByName(aIdField).AsInteger := aSourceDS.FieldByName(aIdField).AsInteger;
      aTargetDS.FieldByName('GroupId').AsInteger := DataSource1.DataSet.FieldByName('GroupId').AsInteger;
      if aIsUserField<>'' then
        aTargetDS.FieldByName(aIsUserField).AsBoolean := False;
      if aRUGField<>'' then
        aTargetDS.FieldByName(aRUGField).AsInteger := 3;
      if aManagerField<>'' then
        aTargetDS.FieldByName(aManagerField).AsBoolean := False;
      aTargetDS.FieldByName(aNameField).AsString := aSourceDS.FieldByName(aNameField).AsString;
      aTargetDS.Post;
    end;

    aSourceDS.Edit;
    aSourceDS.FieldByName('IsDeleted').AsBoolean := True;
    aSourceDS.Post;

    aSourceDS.Filter := 'IsDeleted = 0 ';
    aSourceDS.Filtered := True;
  finally
    aSourceDS.Filtered := prefiltered;
    aSourceDS.EnableControls;
  end;

end;
procedure TGroupEditForm.btnAddUserClick(Sender: TObject);
begin
  if fUsersSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fUsersSourceDS, fUsersTargetDS, fUsersSourceDS.FieldByName('UserId').AsInteger,
                    'UserId', 'Username', 'GroupManager', '', '');
end;

procedure TGroupEditForm.btnAddPermissionClick(Sender: TObject);
begin
  if fPermissionsSourceDS.RecordCount<=0 then
    Exit;

  AddTargetDisableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS, fPermissionsSourceDS.FieldByName('PermissionId').AsInteger,
                    'PermissionId', 'PermissionName', '', '', 'RUG');
end;

procedure TGroupEditForm.btnAddRoleClick(Sender: TObject);
var
  prefiltered : boolean;
begin
  if fRolesSourceDS.RecordCount<=0 then
    Exit;

  AddTargetDisableSourceDS(fRolesSourceDS, fRolesTargetDS, fRolesSourceDS.FieldByName('RoleId').AsInteger,
                    'RoleId', 'RoleName', '', 'IsUser', '');
end;

procedure TGroupEditForm.btnDeleteUserClick(Sender: TObject);
begin
  if fUsersTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fUsersSourceDS, fUsersTargetDS.FieldByName('UserId').AsInteger, 'UserId');
  DisableTargetDS(fUsersTargetDS);
end;

procedure TGroupEditForm.btnDeletePermissionClick(Sender: TObject);
begin
  if fPermissionsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS.FieldByName('PermissionId').AsInteger, 'PermissionId');
  DisableTargetDS(fPermissionsTargetDS);
end;

procedure TGroupEditForm.btnDeleteRoleClick(Sender: TObject);
begin
  if fRolesTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fRolesSourceDS,fRolesTargetDS.FieldByName('RoleId').AsInteger, 'RoleId');
  DisableTargetDS(fRolesTargetDS);
end;


procedure TGroupEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelGroupName.Caption := ComponentDictionary.GetText(ClassName, 'labelGroupName.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  labelParentId.Caption := ComponentDictionary.GetText(ClassName, 'labelParentId.Caption');
  tabUsers.Caption := ComponentDictionary.GetText(ClassName, 'tabUsers.Caption');
  tabRoles.Caption := ComponentDictionary.GetText(ClassName, 'tabRoles.Caption');
  tabPermissions.Caption := ComponentDictionary.GetText(ClassName, 'tabPermissions.Caption');
end;

procedure TGroupEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCompanyDataset.Free;
end;

procedure TGroupEditForm.FormLoaded;
var
  aGuMdl : IGroupUserModelInterface;
  aRugMdl : IRoleUserGroupModelInterface;
  aRugPMdl : IRoleUserGroupPermissionModelInterface;

  GId : Integer;
begin
  fCompanyDataset := TObjectDataset.Create(self);
  fCompanyDataset.DataList := DMMain.Session.CreateCriteria<TCompany>.Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  fCompanyDataset.Open;
  dsCompany.DataSet := fCompanyDataset;


  if DataSource1.DataSet.State=dsInsert then
    GId := -1
  else
    GId := DataSource1.DataSet.FieldByName('GroupId').AsInteger;

  fUsersTargetDS := TObjectDataset.Create(self);
  fUsersTargetDS.DataList := DMMain.Session.CreateCriteria<TGroupUserExt>
                                      .Add(Restrictions.Eq('GroupId', GId))
                                      .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsUsersTarget.Dataset := fUsersTargetDS;
  fUsersTargetDS.Open;

  fUsersSourceDS := TObjectDataset.Create(self);
  fUsersSourceDS.DataList := DMMain.Session.CreateCriteria<TUser>.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                                      .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsUsersSource.Dataset := fUsersSourceDS;
  fUsersSourceDS.Open;
  agumdl := CreateGroupUserModelClass;
  if agumdl.GetDifference('User', fUsersSourceDS, 'User', fUsersTargetDS) then
  begin
    fUsersSourceDS.Filter := 'IsDeleted = 0';
    fUsersSourceDS.Filtered := True;
  end;
  fUsersSourceDS.First;

  //==========================================================================
  fRolesSourceDS := TObjectDataset.Create(self);
  fRolesSourceDS.DataList := DMMain.Session.CreateCriteria<TRole>.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                                .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsRolesSource.DataSet := fRolesSourceDS;
  fRolesSourceDS.Open;

  fRolesTargetDS := TObjectDataset.Create(self);
  fRolesTargetDS.DataList := //DMMain.Session.GetList<TRoleUserGroup>.Add(Restrictions.Eq())
  DMMain.Session.GetList<TRoleUserGroupExt>('select RUG.*, R.[RoleName] as [RoleName] from RoleUserGroup as RUG '+
                                        'left join [Role] as R on (R.RoleId=RUG.RoleId) '+
                                        'where RUG.GroupId='+IntToStr(GId), []) as IObjectList;
  dsRolesTarget.DataSet := fRolesTargetDS;
  fRolesTargetDS.Open;
  aRugMdl := CreateRoleUserGroupModelClass;
  if aRugMdl.GetDifference('Role', fRolesSourceDS, 'Role', fRolesTargetDS) then
  begin
    fRolesSourceDS.Filter := 'IsDeleted = 0';
    fRolesSourceDS.Filtered := True;
  end;
  fRolesSourceDS.First;
  //=======================================================================
  fPermissionsSourceDS := TObjectDataSet.Create(self);
  fPermissionsSourceDS.DataList := DMMain.Session.CreateCriteria<TPermission>.Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsPermissionsSource.DataSet := fPermissionsSourceDS;
  fPermissionsSourceDS.Open;

  fPermissionsTargetDS := TObjectDataSet.Create(self);
  fPermissionsTargetDS.DataList := DMMain.Session.GetList<TRoleUserGroupPermissionExt>('Select RUGP.*, P.[PermissionName] as PermissionName from RoleUserGroupPermission as RUGP '+
                                         'left join [Permission] as P on (P.PermissionId=RUGP.PermissionId) '+
                                         'where RUGP.GroupId='+IntToStr(GId), []) as IObjectList;
  dsPermissionsTarget.DataSet := fPermissionsTargetDS;
  fPermissionsTargetDS.Open;
  aRugPMdl := CreateRoleUserGroupPermissionModelClass;
  if aRugPMdl.GetDifference('Permission', fPermissionsSourceDS, 'Permission', fPermissionsTargetDS) then
  begin
    fPermissionsSourceDS.Filter := 'IsDeleted = 0';
    fPermissionsSourceDS.Filtered := True;
  end;
  fPermissionsSourceDS.First;
end;

class function TGroupEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '112';
    efcmdEdit: Result := '113';
    efcmdDelete: Result := '114';
    efcmdViewDetail: Result := '115';
  end;
end;

end.
