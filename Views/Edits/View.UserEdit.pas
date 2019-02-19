unit View.UserEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, JvExControls,
  JvDBLookup, Vcl.Mask, Vcl.DBCtrls,
  JvExMask, JvToolEdit, JvDBControls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls,
  Spring.Data.ObjectDataset,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Model.FormDeclarations;

type
  TUserEditForm = class(TTemplateEdit)
    labelUsername: TLabel;
    labelPassword: TLabel;
    labelUserGuid: TLabel;
    labelDocPassword: TLabel;
    labelCompanyId: TLabel;
    labelLocationId: TLabel;
    labelMobilePhone: TLabel;
    labelEmail: TLabel;
    edUsername: TDBEdit;
    edPassword: TDBEdit;
    edDocPassword: TDBEdit;
    edCompanyId: TJvDBLookupCombo;
    edLocationId: TJvDBLookupCombo;
    edMobilePhone: TDBEdit;
    edEmail: TDBEdit;
    edUserGuid: TJvDBComboEdit;
    PageControl1: TPageControl;
    tabGroups: TTabSheet;
    tabRoles: TTabSheet;
    tabPermissions: TTabSheet;
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    Panel3: TPanel;
    Splitter1: TSplitter;
    btnAddGroup: TSpeedButton;
    btnDeleteGroup: TSpeedButton;
    labelGroups: TLabel;
    labelGroupsOfUser: TLabel;
    JvDBGrid3: TJvDBGrid;
    Panel4: TPanel;
    btnAddRole: TSpeedButton;
    btnDeleteRole: TSpeedButton;
    JvDBGrid4: TJvDBGrid;
    Panel5: TPanel;
    labelRoles: TLabel;
    labelRolesOfUser: TLabel;
    grd: TJvDBGrid;
    Panel6: TPanel;
    btnAddPermission: TSpeedButton;
    btnDeletePermission: TSpeedButton;
    JvDBGrid6: TJvDBGrid;
    Panel7: TPanel;
    labelPermissions: TLabel;
    labelPermissionsOfUser: TLabel;
    dsCompany: TDataSource;
    dsLocation: TDataSource;
    dsGroupsSource: TDataSource;
    dsRolesSource: TDataSource;
    dsPermissionsSource: TDataSource;
    dsGroupsTarget: TDataSource;
    dsRolesTarget: TDataSource;
    dsPermissionsTarget: TDataSource;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edUserGuidButtonClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure btnDeleteGroupClick(Sender: TObject);
    procedure btnAddRoleClick(Sender: TObject);
    procedure btnDeleteRoleClick(Sender: TObject);
    procedure btnAddPermissionClick(Sender: TObject);
    procedure btnDeletePermissionClick(Sender: TObject);
    procedure edCompanyIdChange(Sender: TObject);
  private
    fCompanyDataset : TObjectDataset;
    fLocationDataset : TObjectDataset;

    fGroupsTargetDS, fGroupsSourceDS : TObjectDataset;
    fRolesTargetDS, fRolesSourceDS : TObjectDataset;
    fPermissionsTargetDS, fPermissionsSourceDS : TObjectDataset;

    procedure EnableSourceDS(aSourceDS: TDataset; aId: Integer; aIdField: String);
    procedure DisableTargetDS(aTargetDS : TDataset);
    procedure AddTargetDisableSourceDS(aSourceDS, aTargetDS: TDataset;
      aId: Integer; aIdField, aNameField, aManagerField, aIsUserField, aRUGField : String);
  protected
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
    procedure AfterPost(DataSet: TDataSet); override;
  public
  end;

var
  UserEditForm: TUserEditForm;

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

procedure TUserEditForm.AfterPost(DataSet: TDataSet);
var
  agumdl : IGroupUserModelInterface;
  aRugmdl : IRoleUserGroupModelInterface;
  aRugpmdl : IRoleUserGroupPermissionModelInterface;
begin
  agumdl := CreateGroupUserModelClass;
  agumdl.UpdateGroupUserList(DataSource1.DataSet.FieldByName('UserId').AsInteger, -1, fGroupsTargetDS); //.DataList as IList<TGroupUser>);
  aRugmdl := CreateRoleUserGroupModelClass;
  aRugmdl.UpdateRoleUserGroupList(-1, DataSource1.DataSet.FieldByName('UserId').AsInteger, -1, fRolesTargetDS.DataList as IList<TRoleUserGroup>);
  aRugpmdl := CreateRoleUserGroupPermissionModelClass;
  aRugpmdl.UpdateRoleUserGroupList(-1, DataSource1.DataSet.FieldByName('UserId').AsInteger, -1, -1, fPermissionsTargetDS.DataList as IList<TRoleUserGroupPermission>);
end;

procedure TUserEditForm.EnableSourceDS(aSourceDS : TDataset; aId : Integer; aIdField : String);
var
  prefiltered : boolean;
begin
  aSourceDS.DisableControls;
  prefiltered := fRolesSourceDS.Filtered;
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

procedure TUserEditForm.DisableTargetDS(aTargetDS : TDataset);
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

procedure TUserEditForm.AddTargetDisableSourceDS(aSourceDS : TDataset; aTargetDS : TDataset;
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
      aTargetDS.FieldByName('UserId').AsInteger := DataSource1.DataSet.FieldByName('UserId').AsInteger;
      if aIsUserField<>'' then
        aTargetDS.FieldByName(aIsUserField).AsBoolean := True;
      if aRUGField<>'' then
        aTargetDS.FieldByName(aRUGField).AsInteger := 2;
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
procedure TUserEditForm.btnAddGroupClick(Sender: TObject);
begin
  if fGroupsSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fGroupsSourceDS, fGroupsTargetDS, fGroupsSourceDS.FieldByName('GroupId').AsInteger,
                    'GroupId', 'GroupName', 'GroupManager', '', '');
end;

procedure TUserEditForm.btnAddPermissionClick(Sender: TObject);
//var
  //prefiltered : boolean;
begin
  if fPermissionsSourceDS.RecordCount<=0 then
    Exit;

  AddTargetDisableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS, fPermissionsSourceDS.FieldByName('PermissionId').AsInteger,
                    'PermissionId', 'PermissionName', '', '', 'RUG');
end;

procedure TUserEditForm.btnAddRoleClick(Sender: TObject);
var
  prefiltered : boolean;
begin
  if fRolesSourceDS.RecordCount<=0 then
    Exit;

  AddTargetDisableSourceDS(fRolesSourceDS, fRolesTargetDS, fRolesSourceDS.FieldByName('RoleId').AsInteger,
                    'RoleId', 'RoleName', '', 'IsUser', '');

end;

procedure TUserEditForm.btnDeleteGroupClick(Sender: TObject);
begin
  if fGroupsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fGroupsSourceDS, fGroupsTargetDS.FieldByName('GroupId').AsInteger, 'GroupId');
  DisableTargetDS(fGroupsTargetDS);
end;

procedure TUserEditForm.btnDeletePermissionClick(Sender: TObject);
begin
  if fPermissionsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fPermissionsSourceDS, fPermissionsTargetDS.FieldByName('PermissionId').AsInteger, 'PermissionId');
  DisableTargetDS(fPermissionsTargetDS);
end;

procedure TUserEditForm.btnDeleteRoleClick(Sender: TObject);
begin
  if fRolesTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fRolesSourceDS,fRolesTargetDS.FieldByName('RoleId').AsInteger, 'RoleId');
  DisableTargetDS(fRolesTargetDS);
end;

procedure TUserEditForm.edCompanyIdChange(Sender: TObject);
begin
  if DataSource1.DataSet.FieldByName('CompanyId').IsNull then
  begin
    fLocationDataset.Filter := '';
    fLocationDataset.Filtered := False;
  end
  else
  begin
    fLocationDataset.Filter := 'CompanyId='+DataSource1.DataSet.FieldByName('CompanyId').AsString;
    fLocationDataset.Filtered := True;
  end;

end;

procedure TUserEditForm.edUserGuidButtonClick(Sender: TObject);
var
  guid : TGUID;
begin
  CreateGUID(guid);
  edUserGuid.Text := GUIDToString(guid);
end;

procedure TUserEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelUsername.Caption := ComponentDictionary.GetText(ClassName, 'labelUsername.Caption');
  labelPassword.Caption := ComponentDictionary.GetText(ClassName, 'labelPassword.Caption');
  labelUserGuid.Caption := ComponentDictionary.GetText(ClassName, 'labelUserGuid.Caption');
  labelDocPassword.Caption := ComponentDictionary.GetText(ClassName, 'labelDocPassword.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  labelLocationId.Caption := ComponentDictionary.GetText(ClassName, 'labelLocationId.Caption');
  labelMobilePhone.Caption := ComponentDictionary.GetText(ClassName, 'labelMobilePhone.Caption');
  labelEmail.Caption := ComponentDictionary.GetText(ClassName, 'labelEmail.Caption');
  tabGroups.Caption := ComponentDictionary.GetText(ClassName, 'tabGroups.Caption');
  tabRoles.Caption := ComponentDictionary.GetText(ClassName, 'tabRoles.Caption');
  tabPermissions.Caption := ComponentDictionary.GetText(ClassName, 'tabPermissions.Caption');
end;

procedure TUserEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCompanyDataset.Free;
  fLocationDataset.Free;
end;

procedure TUserEditForm.FormLoaded;
var
  //il : IList<TGroupUserExt>;
  aGuMdl : IGroupUserModelInterface;
  aRugMdl : IRoleUserGroupModelInterface;
  aRugPMdl : IRoleUserGroupPermissionModelInterface;

  //aGroupModel : IGroupModelInterface;

  UId : Integer;
begin
  fCompanyDataset := TObjectDataset.Create(self);
  fCompanyDataset.DataList := DMMain.Session.CreateCriteria<TCompany>.Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  fCompanyDataset.Open;
  dsCompany.DataSet := fCompanyDataset;

  fLocationDataset  := TObjectDataset.Create(self);
  fLocationDataset .DataList := DMMain.Session.CreateCriteria<TLocation>.Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsLocation.DataSet := fLocationDataset ;
  fLocationDataset .Open;
  edCompanyIdChange(nil);

  if DataSource1.DataSet.State=dsInsert then
    UId := -1
  else
    UId := DataSource1.DataSet.FieldByName('UserId').AsInteger;

  fGroupsTargetDS := TObjectDataset.Create(self);
  fGroupsTargetDS.DataList := DMMain.Session.CreateCriteria<TGroupUserExt>.Add(Restrictions.Eq('UserId', UId))
                                      .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
    {DMMain.Session.GetList<TGroupUserExt>('select GU.*, G.GroupName as GroupName from GroupUser as GU '+
                                     'left join [Group] as G on (G.GroupId=GU.GroupId) '+
                                     'where GU.UserId='+DataSource1.DataSet.FieldByName('UserId').AsString+' and GU.IsDeleted<>-1', []) as IObjectList;
    }
  dsGroupsTarget.Dataset := fGroupsTargetDS;
  fGroupsTargetDS.Open;

  fGroupsSourceDS := TObjectDataset.Create(self);
  fGroupsSourceDS.DataList := DMMain.Session.CreateCriteria<TGroup>.Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsGroupsSource.Dataset := fGroupsSourceDS;
  fGroupsSourceDS.Open;
  agumdl := CreateGroupUserModelClass;
  if agumdl.GetDifference('Group', fGroupsSourceDS, 'Group', fGroupsTargetDS) then
  begin
    fGroupsSourceDS.Filter := 'IsDeleted = 0';
    fGroupsSourceDS.Filtered := True;
  end;
  fGroupsSourceDS.First;

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
                                        'where RUG.UserId='+IntToStr(UId), []) as IObjectList;
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
                                         'where RUGP.UserId='+IntToStr(UId), []) as IObjectList;
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

class function TUserEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '102';
    efcmdEdit: Result := '103';
    efcmdDelete: Result := '104';
    efcmdViewDetail: Result := '105';
  end;
end;

end.


