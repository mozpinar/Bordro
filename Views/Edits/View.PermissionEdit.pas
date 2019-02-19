unit View.PermissionEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, JvExControls,
  JvDBLookupTreeView, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.ExtCtrls,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Spring.Data.ObjectDataset,
  Model.FormDeclarations, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls;

type
  TPermissionEditForm = class(TTemplateEdit)
    labelPermissionId: TLabel;
    labelPermissionName: TLabel;
    labelParentId: TLabel;
    dsParents: TDataSource;
    edPermissionId: TDBEdit;
    edPermissionName: TDBEdit;
    edParentId: TJvDBLookupTreeViewCombo;
    PageControl1: TPageControl;
    tabGroups: TTabSheet;
    Splitter1: TSplitter;
    Panel1: TPanel;
    labelGroups: TLabel;
    labelGroupsOfUser: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    Panel3: TPanel;
    btnAddGroup: TSpeedButton;
    btnDeleteGroup: TSpeedButton;
    tabRoles: TTabSheet;
    Splitter2: TSplitter;
    JvDBGrid3: TJvDBGrid;
    Panel4: TPanel;
    btnAddRole: TSpeedButton;
    btnDeleteRole: TSpeedButton;
    JvDBGrid4: TJvDBGrid;
    Panel5: TPanel;
    labelRoles: TLabel;
    labelRolesOfUser: TLabel;
    tabUsers: TTabSheet;
    Splitter3: TSplitter;
    grd: TJvDBGrid;
    Panel6: TPanel;
    btnAddUser: TSpeedButton;
    btnDeleteUser: TSpeedButton;
    JvDBGrid6: TJvDBGrid;
    Panel7: TPanel;
    labelPermissions: TLabel;
    labelPermissionsOfUser: TLabel;
    dsGroupsSource: TDataSource;
    dsRolesSource: TDataSource;
    dsUsersSource: TDataSource;
    dsGroupsTarget: TDataSource;
    dsRolesTarget: TDataSource;
    dsUsersTarget: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnAddRoleClick(Sender: TObject);
    procedure btnDeleteRoleClick(Sender: TObject);
    procedure btnAddGroupClick(Sender: TObject);
    procedure btnDeleteGroupClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
  private
    fPermissionTreeDataset : TObjectDataset;

    fGroupsTargetDS, fGroupsSourceDS : TObjectDataset;
    fRolesTargetDS, fRolesSourceDS : TObjectDataset;
    fUsersTargetDS, fUsersSourceDS : TObjectDataset;

    procedure RefreshPermissionDataset;
    procedure AfterPost(DataSet: TDataSet); override;
    procedure DisableTargetDS(aTargetDS: TDataset);
    procedure EnableSourceDS(aSourceDS: TDataset; aId: Integer;
      aIdField: String);
    procedure AddTargetDisableSourceDS(aSourceDS, aTargetDS: TDataset;
      aId: Integer; aIdField, aNameField, aManagerField, aIsUserField,
      aRUGField: String);
  protected
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
  end;

var
  PermissionEditForm: TPermissionEditForm;

implementation
uses
  Spring.Collections,
  Spring.Persistence.Mapping.Attributes,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  MainDM,
  Model.MosObjectDataset,
  Model.Interfaces,
  Model.GroupUser,
  Model.RoleUserGroup,
  Model.RoleUserGroupPermission;

{$R *.dfm}


procedure TPermissionEditForm.AfterPost(DataSet: TDataSet);
var
  aRugpmdl : IRoleUserGroupPermissionModelInterface;
begin
  aRugpmdl := CreateRoleUserGroupPermissionModelClass;
  aRugpmdl.UpdateRoleUserGroupList(99999991, -1, -1, DataSource1.DataSet.FieldByName('PermissionId').AsInteger, fRolesTargetDS.DataList as IList<TRoleUserGroupPermission>);
  aRugpmdl.UpdateRoleUserGroupList(-1, 99999991, -1, DataSource1.DataSet.FieldByName('PermissionId').AsInteger, fUsersTargetDS.DataList as IList<TRoleUserGroupPermission>);
  aRugpmdl.UpdateRoleUserGroupList(-1, -1, 99999991, DataSource1.DataSet.FieldByName('PermissionId').AsInteger, fGroupsTargetDS.DataList as IList<TRoleUserGroupPermission>);
end;

procedure TPermissionEditForm.EnableSourceDS(aSourceDS : TDataset; aId : Integer; aIdField : String);
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

procedure TPermissionEditForm.DisableTargetDS(aTargetDS : TDataset);
begin
  if aTargetDS.RecordCount<=0 then
    Exit;
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

procedure TPermissionEditForm.AddTargetDisableSourceDS(aSourceDS : TDataset; aTargetDS : TDataset;
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
      aTargetDS.FieldByName('PermissionId').AsInteger := DataSource1.DataSet.FieldByName('PermissionId').AsInteger;
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

procedure TPermissionEditForm.btnAddGroupClick(Sender: TObject);
begin
  if fGroupsSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fGroupsSourceDS, fGroupsTargetDS, fGroupsSourceDS.FieldByName('GroupId').AsInteger,
                    'GroupId', 'GroupName', '', '', 'RUG');
end;

procedure TPermissionEditForm.btnAddRoleClick(Sender: TObject);
begin
  if fRolesSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fRolesSourceDS, fRolesTargetDS, fRolesSourceDS.FieldByName('RoleId').AsInteger,
                    'RoleId', 'RoleName', '', '', 'RUG');
end;

procedure TPermissionEditForm.btnAddUserClick(Sender: TObject);
begin
  if fUsersSourceDS.RecordCount<=0 then
    Exit;
  AddTargetDisableSourceDS(fUsersSourceDS, fUsersTargetDS, fUsersSourceDS.FieldByName('UserId').AsInteger,
                    'UserId', 'UserName', '', '', 'RUG');
end;

procedure TPermissionEditForm.btnDeleteGroupClick(Sender: TObject);
begin
  if fGroupsTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fGroupsSourceDS, fGroupsTargetDS.FieldByName('GroupId').AsInteger, 'GroupId');
  DisableTargetDS(fGroupsTargetDS);
end;

procedure TPermissionEditForm.btnDeleteRoleClick(Sender: TObject);
begin
  if fRolesTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fRolesSourceDS,fRolesTargetDS.FieldByName('RoleId').AsInteger, 'RoleId');
  DisableTargetDS(fRolesTargetDS);
end;

procedure TPermissionEditForm.btnDeleteUserClick(Sender: TObject);
begin
  if fUsersTargetDS.RecordCount<=0 then
    Exit;
  EnableSourceDS(fUsersSourceDS, fUsersTargetDS.FieldByName('UserId').AsInteger, 'UserId');
  DisableTargetDS(fUsersTargetDS);
end;

procedure TPermissionEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelPermissionId.Caption := ComponentDictionary.GetText(ClassName, 'labelPermissionId.Caption');
  labelPermissionName.Caption := ComponentDictionary.GetText(ClassName, 'labelPermissionName.Caption');
  labelParentId.Caption := ComponentDictionary.GetText(ClassName, 'labelParentId.Caption');
end;

procedure TPermissionEditForm.RefreshPermissionDataset;
begin
  fPermissionTreeDataset.Close;
  fPermissionTreeDataset.DataList := dmmain.Session.GetList<TPermission>('select * from Permission where IsDeleted=0;', []) as IObjectList;
  fPermissionTreeDataset.Open;
end;

class function TPermissionEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '132';
    efcmdEdit: Result := '133';
    efcmdDelete: Result := '134';
    efcmdViewDetail: Result := '135';
  end;
end;

procedure TPermissionEditForm.FormLoaded;
var
  //il : IList<TGroupUserExt>;
  aGuMdl : IGroupUserModelInterface;
  aRugMdl : IRoleUserGroupModelInterface;
  aRugPMdl : IRoleUserGroupPermissionModelInterface;

  //aGroupModel : IGroupModelInterface;
  PId : Integer;

begin
  fPermissionTreeDataset := TObjectDataset.Create(self);
  RefreshPermissionDataset;
  dsParents.DataSet := fPermissionTreeDataset;
  if fPermissionTreeDataset.RecordCount>0 then
    edParentId.FullExpand := True;

  if DataSource1.DataSet.State=dsInsert then
    PId := -1
  else
    PId := DataSource1.DataSet.FieldByName('PermissionId').AsInteger;

  fGroupsTargetDS := TObjectDataset.Create(self);
  fGroupsTargetDS.DataList := DMMain.Session.GetList<TRoleUserGroupPermissionExt>('Select RUGP.*, G.[GroupName] as GroupName from RoleUserGroupPermission as RUGP '+
                                         'left join [Group] as G on (G.GroupId=RUGP.GroupId) '+
                                         'where RUGP.RUG=3 and G.CompanyId='+IntToStr(DMMain.Company.CompanyId)+
                                         ' and RUGP.PermissionId=:0', [PId]) as IObjectList;
  dsRolesTarget.DataSet := fRolesTargetDS;

  {DMMain.Session.CreateCriteria<TGroupUserExt>.Add(Restrictions.Eq('UserId', DataSource1.DataSet.FieldByName('UserId').AsInteger))
                                      .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;}
  dsGroupsTarget.Dataset := fGroupsTargetDS;
  fGroupsTargetDS.Open;

  fGroupsSourceDS := TObjectDataset.Create(self);
  fGroupsSourceDS.DataList := DMMain.Session.CreateCriteria<TGroup>.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                                        .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
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
  fRolesTargetDS.DataList := DMMain.Session.GetList<TRoleUserGroupPermissionExt>('Select RUGP.*, R.[RoleName] as RoleName from RoleUserGroupPermission as RUGP '+
                                         'left join [Role] as R on (R.RoleId=RUGP.RoleId) '+
                                         'where RUGP.RUG=1 and R.CompanyId='+IntToStr(DMMain.Company.CompanyId)+
                                         ' and RUGP.PermissionId='+IntToStr(PId), []) as IObjectList;  dsRolesTarget.DataSet := fRolesTargetDS;
        {DMMain.Session.GetList<TRoleUserGroupPermissionExt>('select RUG.*, R.[RoleName] as [RoleName] from RoleUserGroup as RUG '+
                                        'left join [Role] as R on (R.RoleId=RUG.RoleId) '+
                                        'where RUG.UserId='+DataSource1.DataSet.FieldByName('UserId').AsString, []) as IObjectList;}

  fRolesTargetDS.Open;
  aRugMdl := CreateRoleUserGroupModelClass;
  if aRugMdl.GetDifference('Role', fRolesSourceDS, 'Role', fRolesTargetDS) then
  begin
    fRolesSourceDS.Filter := 'IsDeleted = 0';
    fRolesSourceDS.Filtered := True;
  end;
  fRolesSourceDS.First;
  //=======================================================================
  fUsersSourceDS := TObjectDataSet.Create(self);
  fUsersSourceDS.DataList := DMMain.Session.CreateCriteria<TUser>.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                                    .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsUsersSource.DataSet := fUsersSourceDS;
  fUsersSourceDS.Open;

  fUsersTargetDS := TObjectDataSet.Create(self);
  fUsersTargetDS.DataList := DMMain.Session.GetList<TRoleUserGroupPermissionExt>(
              'Select RUGP.*, U.[Username] as Username from RoleUserGroupPermission as RUGP '+
                                         'left join `User` as U on (U.UserId=RUGP.UserId) '+
                                         'where RUGP.RUG=2 and U.CompanyId='+IntToStr(DMMain.Company.CompanyId)+
                                         ' and RUGP.PermissionId='+IntToStr(PId), []) as IObjectList;
  dsUsersTarget.DataSet := fUsersTargetDS;
  fUsersTargetDS.Open;
  aRugPMdl := CreateRoleUserGroupPermissionModelClass;
  if aRugPMdl.GetDifference('User', fUsersSourceDS, 'User', fUsersTargetDS) then
  begin
    fUsersSourceDS.Filter := 'IsDeleted = 0';
    fUsersSourceDS.Filtered := True;
  end;
  fUsersSourceDS.First;
end;

end.
