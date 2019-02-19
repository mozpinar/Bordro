unit Model.RoleUserGroup;

interface



uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateRoleUserGroupModelClass: IRoleUserGroupModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Spring.Persistence.Core.Interfaces,
  Model.MosObjectDataset,
  Model.Base;

type

  TRoleUserGroupModel = class (TOwnershipModel, IRoleUserGroupModelInterface)
  public
    function GetRolesOfAUser(const aUserId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetRolesOfAGroup(const aGroupId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetGroupsOfARole(const aRoleId : Integer; const aCriterion : ICriterion) : IObjectList;
    function GetUsersOfARole(const aRoleId : Integer; const aCriterion : ICriterion) : IObjectList;

    function GetRolesOfAUserDS(const aUserId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetRolesOfAGroupDS(const aGroupId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetGroupsOfARoleDS(const aRoleId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function GetUsersOfARoleDS(const aRoleId : Integer; const aCriterion : ICriterion) : TObjectDataset;
    function UpdateRoleUserGroupList(aRoleId, aUserId, aGroupId : Integer; ARUGList : IList<TRoleUserGroup>) : boolean;
  end;

function CreateRoleUserGroupModelClass: IRoleUserGroupModelInterface;
begin
  result:=TRoleUserGroupModel.Create;
end;

{ TRoleUserGroupModel }

function TRoleUserGroupModel.GetGroupsOfARole(const aRoleId: Integer;
  const aCriterion: ICriterion): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroup>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroup>;
  Result := FCriteria
    .Add(Restrictions.Eq('RoleId', aRoleId))
    .OrderBy(TOrderBy.Asc('GroupId')).ToList as IObjectList;
end;

function TRoleUserGroupModel.GetGroupsOfARoleDS(const aRoleId: Integer;
  const aCriterion: ICriterion): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetGroupsOfARole(aRoleId, aCriterion);
end;

function TRoleUserGroupModel.GetRolesOfAGroup(const aGroupId: Integer;
  const aCriterion: ICriterion): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroup>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroup>;
  Result := FCriteria
    .Add(Restrictions.Eq('GroupId', aGroupId))
    .OrderBy(TOrderBy.Asc('RoleId')).ToList as IObjectList;
end;

function TRoleUserGroupModel.GetRolesOfAGroupDS(const aGroupId: Integer;
  const aCriterion: ICriterion): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetRolesOfAGroup(aGroupId, aCriterion);
end;

function TRoleUserGroupModel.GetRolesOfAUser(const aUserId: Integer;
  const aCriterion: ICriterion): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroup>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroup>;
  if aCriterion=nil then
    Result := FCriteria
      .Add(Restrictions.Eq('UserId', aUserId))
      .OrderBy(TOrderBy.Asc('RoleId')).ToList as IObjectList
  else
    Result := FCriteria.Add(aCriterion)
      .Add(Restrictions.Eq('UserId', aUserId))
      .OrderBy(TOrderBy.Asc('RoleId')).ToList as IObjectList;
end;

function TRoleUserGroupModel.GetRolesOfAUserDS(const aUserId: Integer;
  const aCriterion: ICriterion): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetRolesOfAUser(aUserId, aCriterion);
end;

function TRoleUserGroupModel.GetUsersOfARole(const aRoleId: Integer;
  const aCriterion: ICriterion): IObjectList;
var
  FCriteria : ICriteria<TRoleUserGroup>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRoleUserGroup>;
  Result := FCriteria
    .Add(Restrictions.Eq('RoleId', aRoleId))
    .OrderBy(TOrderBy.Asc('UserId')).ToList as IObjectList;
end;

function TRoleUserGroupModel.GetUsersOfARoleDS(const aRoleId: Integer;
  const aCriterion: ICriterion): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetUsersOfARole(aRoleId, aCriterion);
end;

function TRoleUserGroupModel.UpdateRoleUserGroupList(aRoleId, aUserId,
  aGroupId: Integer; ARUGList: IList<TRoleUserGroup>): boolean;
var
  newds : TmosObjectDataset;
  RugO, RugN : TRoleUserGroup;

  sid : String;
  fromrole : boolean;
  isuser :  boolean;
  found : boolean;
  idbt : IDBTransaction;

begin
  Result := True;
  if ARUGList.Count<=0 then
    Exit;
  if aRoleId>=0 then
  begin
    fromrole := True;
    sid := 'RoleId';
    if aUserId>=0 then
    begin
      newds := GetUsersOfARoleDS(aRoleId, nil) as TMosObjectDataset;
      isuser := True;
    end
    else
    if aGroupId>=0 then
    begin
      newds := GetGroupsOfARoleDS(aRoleId, nil) as TMosObjectDataset;
      isuser := False;
    end;
  end
  else
  begin
    fromrole := False;
    if aUserId>=0 then
    begin
      newds := GetRolesOfAUserDS(aUserId, nil) as TMosObjectDataset;
      sid := 'UserId';
      isuser := True;
    end
    else
    if aGroupId>=0 then
    begin
      newds := GetRolesOfAGroupDS(aGroupId, nil) as TMosObjectDataset;
      sid := 'GroupId';
      isuser := False;
    end;
  end;

  Result := False;

  newds.Open;
  idbt := DMMain.Session.BeginTransaction;
  try
    for RugN in ARUGList do
    begin
      if fromrole then
        if isuser then
          found := newds.Locate('UserId', RugN.UserId.ToString, [])
        else
          found := newds.Locate('GroupId', RugN.GroupId.ToString, [])
      else
        found := newds.Locate('RoleId', RugN.RoleId.ToString, []);

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
        RugO := TRoleUserGroup.Create;
        RugO.IsUser := isuser;
        RugO.RoleId := RugN.RoleId;
        RugO.GroupId := RugN.GroupId;
        RugO.UserId := RugN.UserId;
        RugO.IsUser := RugN.IsUser;
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
