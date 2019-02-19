unit View.RoleEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExControls,
  JvDBLookup, Vcl.Mask, Vcl.DBCtrls,
  Spring.Data.ObjectDataset,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Model.FormDeclarations;

type
  TRoleEditForm = class(TTemplateEdit)
    labelRoleName: TLabel;
    labelCompanyId: TLabel;
    edRoleName: TDBEdit;
    edCompanyId: TJvDBLookupCombo;
    dsUsersSource: TDataSource;
    dsPermissionsSource: TDataSource;
    dsGroupsSource: TDataSource;
    dsUsersTarget: TDataSource;
    dsPermissionsTarget: TDataSource;
    dsGroupsTarget: TDataSource;
    dsCompany: TDataSource;
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
    tabGroups: TTabSheet;
    Splitter2: TSplitter;
    JvDBGrid3: TJvDBGrid;
    Panel4: TPanel;
    btnAddGroup: TSpeedButton;
    btnDeleteGroup: TSpeedButton;
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
    procedure btnAddUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure btnDeleteGroupClick(Sender: TObject);
    procedure btnAddPermissionClick(Sender: TObject);
    procedure btnDeletePermissionClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fCompanyDataset : TObjectDataset;

    fUsersTargetDS, fUsersSourceDS : TObjectDataset;
    fGroupsTargetDS, fGroupsSourceDS : TObjectDataset;
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
    { Public declarations }
  end;

var
  RoleEditForm: TRoleEditForm;

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

procedure TRoleEditForm.AfterPost(DataSet: TDataSet);
var
  agumdl : IGroupUserModelInterface;
  aRugmdl : IRoleUserGroupModelInterface;
  aRugpmdl : IRoleUserGroupPermissionModelInterface;
begin
  agumdl := CreateGroupUserModelClass;
  agumdl.UpdateGroupUserList(-1, DataSource1.DataSet.FieldByName('RoleId').AsInteger, fUsersTargetDS);
  aRugmdl := CreateRoleUserGroupModelClass;
  aRugmdl.UpdateRoleUserGroupList(-1, -1, DataSource1.DataSet.FieldByName('RoleId').AsInteger, fGroupsTargetDS.DataList as IList<TRoleUserGroup>);
  aRugpmdl := CreateRoleUserGroupPermissionModelClass;
  aRugpmdl.UpdateRoleUserGroupList(-1, -1, DataSource1.DataSet.FieldByName('RoleId').AsInteger, -1, fPermissionsTargetDS.DataList as IList<TRoleUserGroupPermission>);
end;

procedure TRoleEditForm.btnAddGroupClick(Sender: TObject);
begin
  if fGroupsSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fGroupsSourceDS, fGroupsTargetDS, fGroupsSourceDS.FieldByName('GroupId').AsInteger,
                    'GroupId', 'GroupName', '', 'IsUser', '');
end;

procedure TRoleEditForm.btnAddPermissionClick(Sender: TObject);
begin
  if fPermissionsSourceDS.RecordCount<=0 then
    Exit;

  AddTargetDisableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS, fPermissionsSourceDS.FieldByName('PermissionId').AsInteger,
                    'PermissionId', 'PermissionName', '', '', 'RUG');
end;

procedure TRoleEditForm.btnAddUserClick(Sender: TObject);
begin
  if fUsersSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fUsersSourceDS, fUsersTargetDS, fUsersSourceDS.FieldByName('UserId').AsInteger,
                    'UserId', 'Username', '', '', '');
end;

procedure TRoleEditForm.btnDeleteGroupClick(Sender: TObject);
begin
  if fGroupsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fGroupsSourceDS, fGroupsTargetDS.FieldByName('GroupId').AsInteger, 'GroupId');
  DisableTargetDS(fGroupsTargetDS);
end;

procedure TRoleEditForm.btnDeletePermissionClick(Sender: TObject);
begin
  if fPermissionsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS.FieldByName('PermissionId').AsInteger, 'PermissionId');
  DisableTargetDS(fPermissionsTargetDS);
end;

procedure TRoleEditForm.btnDeleteUserClick(Sender: TObject);
begin
  if fUsersTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fUsersSourceDS, fUsersTargetDS.FieldByName('UserId').AsInteger, 'UserId');
  DisableTargetDS(fUsersTargetDS);
end;

procedure TRoleEditForm.EnableSourceDS(aSourceDS : TDataset; aId : Integer; aIdField : String);
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

procedure TRoleEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelRoleName.Caption := ComponentDictionary.GetText(ClassName, 'labelRoleName.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  tabUsers.Caption := ComponentDictionary.GetText(ClassName, 'tabUsers.Caption');
  tabGroups.Caption := ComponentDictionary.GetText(ClassName, 'tabGroups.Caption');
  tabPermissions.Caption := ComponentDictionary.GetText(ClassName, 'tabPermissions.Caption');
end;

procedure TRoleEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCompanyDataset.Free;
end;

procedure TRoleEditForm.FormLoaded;
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
    GId := DataSource1.DataSet.FieldByName('RoleId').AsInteger;

  fUsersTargetDS := TObjectDataset.Create(self);
  fUsersTargetDS.DataList := DMMain.Session.CreateCriteria<TRoleUserGroupExt>
                                      .Add(Restrictions.Eq('RoleId', GId))
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
  fGroupsSourceDS := TObjectDataset.Create(self);
  fGroupsSourceDS.DataList := DMMain.Session.CreateCriteria<TGroup>.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                                .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsGroupsSource.DataSet := fGroupsSourceDS;
  fGroupsSourceDS.Open;

  fGroupsTargetDS := TObjectDataset.Create(self);
  fGroupsTargetDS.DataList := //DMMain.Session.GetList<TGroupUserGroup>.Add(Restrictions.Eq())
  DMMain.Session.GetList<TRoleUserGroupExt>('select RUG.*, R.[GroupName] as [GroupName] from RoleUserGroup as RUG '+
                                        'left join [Group] as R on (R.GroupId=RUG.GroupId) '+
                                        'where RUG.GroupId='+IntToStr(GId), []) as IObjectList;
  dsGroupsTarget.DataSet := fGroupsTargetDS;
  fGroupsTargetDS.Open;
  aRugMdl := CreateRoleUserGroupModelClass;
  if aRugMdl.GetDifference('Group', fGroupsSourceDS, 'Group', fGroupsTargetDS) then
  begin
    fGroupsSourceDS.Filter := 'IsDeleted = 0';
    fGroupsSourceDS.Filtered := True;
  end;
  fGroupsSourceDS.First;
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

class function TRoleEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin

end;

procedure TRoleEditForm.DisableTargetDS(aTargetDS : TDataset);
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

procedure TRoleEditForm.AddTargetDisableSourceDS(aSourceDS : TDataset; aTargetDS : TDataset;
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

end.
