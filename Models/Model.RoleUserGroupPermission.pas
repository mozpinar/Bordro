unit Model.RoleUserGroupPermission;

interface
uses
  Model.Interfaces;

function CreateRoleUserGroupPermissionModelClass: IRoleUserGroupPermissionModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Spring.Persistence.Core.Interfaces,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM,
  Model.MosObjectDataset,
  Model.Base,
  Model.LanguageDictionary;

type
  TRoleUserGroupPermissionModel = class (TOwnershipModel, IRoleUserGroupPermissionModelInterface)
  public
    function GetPermissionsOfAUser(const aUserId : Integer) : IObjectList;
    function GetPermissionsOfAGroup(const aGroupId : Integer) : IObjectList;
    function GetPermissionsOfARole(const aRoleId : Integer) : IObjectList;
    function GetGroupsOfAPermission(const aPermissionId : Integer) : IObjectList;
    function GetUsersOfAPermission(const aPermissionId : Integer) : IObjectList;
    function GetRolesOfAPermission(const aPermissionId : Integer) : IObjectList;

    function GetPermissionsOfAUserDS(const aUserId : Integer) : TObjectDataset;
    function GetPermissionsOfAGroupDS(const aGroupId : Integer) : TObjectDataset;
    function GetPermissionsOfARoleDS(const aRoleId : Integer) : TObjectDataset;
    function GetGroupsOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;
    function GetUsersOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;
    function GetRolesOfAPermissionDS(const aPermissionId : Integer) : TObjectDataset;

    function UpdateRoleUserGroupList(aRoleId, aUserId, aGroupId, aPermissionId : Integer; ARUGPList : IList<TRoleUserGroupPermission>) : boolean;
  end;


function CreateRoleUserGroupPermissionModelClass: IRoleUserGroupPermissionModelInterface;
begin
  Result := TRoleUserGroupPermissionModel.Create;
end;

{ TRoleUserGroupPermissionModel }

function TRoleUserGroupPermissionModel.GetGroupsOfAPermission(
  const aPermissionId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('PermissionId', aPermissionId))
    .Add(Restrictions.Eq('RUG', 3))
    .OrderBy(TOrderBy.Asc('GroupId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetGroupsOfAPermissionDS(
  const aPermissionId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetGroupsOfAPermission(aPermissionId);
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfAGroup(
  const aGroupId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('GroupId', aGroupId))
    .Add(Restrictions.Eq('RUG', 3))
    .OrderBy(TOrderBy.Asc('PermissionId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfAGroupDS(
  const aGroupId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetPermissionsOfAGroup(aGroupId);
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfARole(
  const aRoleId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('RoleId', aRoleId))
    .Add(Restrictions.Eq('RUG', 1))
    .OrderBy(TOrderBy.Asc('PermissionId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfARoleDS(
  const aRoleId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetPermissionsOfARole(aRoleId);
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfAUser(
  const aUserId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('UserId', aUserId))
    .Add(Restrictions.Eq('RUG', 2))
    .OrderBy(TOrderBy.Asc('PermissionId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetPermissionsOfAUserDS(
  const aUserId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetPermissionsOfAUser(aUserId);
end;

function TRoleUserGroupPermissionModel.GetRolesOfAPermission(
  const aPermissionId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('PermissionId', aPermissionId))
    .Add(Restrictions.Eq('RUG', 1))
    .OrderBy(TOrderBy.Asc('RoleId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetRolesOfAPermissionDS(
  const aPermissionId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetRolesOfAPermission(aPermissionId);
end;

function TRoleUserGroupPermissionModel.GetUsersOfAPermission(
  const aPermissionId: Integer): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroupPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroupPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('PermissionId', aPermissionId))
    .Add(Restrictions.Eq('RUG', 2))
    .OrderBy(TOrderBy.Asc('UserId')).ToList as IObjectList;
end;

function TRoleUserGroupPermissionModel.GetUsersOfAPermissionDS(
  const aPermissionId: Integer): TObjectDataset;
begin
  Result := Model.MosObjectDataset.TMosObjectDataset.Create(nil);
  Result.DataList := GetUsersOfAPermission(aPermissionId);
end;

function TRoleUserGroupPermissionModel.UpdateRoleUserGroupList(aRoleId, aUserId,
  aGroupId, aPermissionId: Integer;
  ARUGPList: IList<TRoleUserGroupPermission>): boolean;
var
  newds : TmosObjectDataset;
  RugO, RugN : TRoleUserGroupPermission;

  sid : String;
  frompermission : boolean;
  RUG :  integer;
  found : boolean;
  idbt : IDBTransaction;

begin
  Result := True;
  if ARUGPList.Count<=0 then
    Exit;
  if aPermissionId>=0 then
  begin
    frompermission := True;
    sid := 'PermissionId';
    if aRoleId>=0 then
    begin
      newds := GetRolesOfAPermissionDS(aPermissionId) as TMosObjectDataset;
      RUG := 1;
    end
    else
    if aUserId>=0 then
    begin
      newds := GetUsersOfAPermissionDS(aPermissionId) as TMosObjectDataset;
      RUG := 2;
    end
    else
    if aGroupId>=0 then
    begin
      newds := GetGroupsOfAPermissionDS(aPermissionId) as TMosObjectDataset;
      RUG := 3;
    end;
  end
  else
  begin
    frompermission := False;
    if aRoleId>=0 then
    begin
      newds := GetPermissionsOfARoleDS(aRoleId) as TMosObjectDataset;
      sid := 'RoleId';
      RUG := 1;
    end
    else
    if aUserId>=0 then
    begin
      newds := GetPermissionsOfAUserDS(aUserId) as TMosObjectDataset;
      sid := 'UserId';
      RUG := 2;
    end
    else
    if aGroupId>=0 then
    begin
      newds := GetPermissionsOfAGroupDS(aGroupId) as TMosObjectDataset;
      sid := 'GroupId';
      RUG := 3;
    end;
  end;

  Result := False;

  newds.Open;
  idbt := DMMain.Session.BeginTransaction;
  try
    for RugN in ARUGPList do
    begin
      if frompermission then
        case RUG of
        1 : found := newds.Locate('RoleId', RugN.RoleId.ToString, []);
        2 : found := newds.Locate('UserId', RugN.UserId.ToString, []);
        3 : found := newds.Locate('GroupId', RugN.GroupId.ToString, []);
        else
          raise Exception.Create(MessageDictionary.GetMessage('SSeriousInplaceError'))
        end
      else
        found := newds.Locate('PermissionId', RugN.PermissionId.ToString, []);

      if found then
      begin
        if RugN.IsDeleted then
        begin
          newds.Delete;
        end;
      end
      else
      if not RugN.IsDeleted then
      begin
        RugO := TRoleUserGroupPermission.Create;
        RugO.RUG := RUG;
        RugO.PermissionId := RugN.PermissionId;
        RugO.RoleId := RugN.RoleId;
        RugO.GroupId := RugN.GroupId;
        RugO.UserId := RugN.UserId;
        RugO.IsDeleted := False;
        DMMain.Session.Insert(RugO);
      end;
    end;
    idbt.Commit;
  except
    on e: Exception do
    begin
      idbt.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
