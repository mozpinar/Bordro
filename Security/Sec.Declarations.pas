unit Sec.Declarations;
{
   Bu unit
}
interface
uses
  SysUtils,
  Spring,
  Spring.Collections,
  Spring.Persistence.Mapping.Attributes,
  Spring.Persistence.Core.Session,
  Model.Base,
  Model.Declarations;

var
  LoginSession : TSession = Nil;

type
  TPermissionExt = class(TPermission)
  protected
    class function GetCascadedPermissions(aPermission : string) : string;
  end;

  TUserExt = class(TUser)
  protected
  public
    class function GetUserByName(const aUsername : string) : TUser;
    class function LoginUser(const aUsername, aPassword : string) : boolean;
    class function AutorizeUser(const aUsername, aPermission : string) : boolean;
  end;

  TRoleExt = class(TRole)
    class function HasPermission(const aUserId : Integer; aPermissions : string) : Boolean;
  end;

  TGroupExt = class(TGroup)
    function HasPermission(const aUserId : Integer; const aPermissions : string) : Boolean;
  end;

  TGroupUserExt = class(TGroupUser)
  protected
    class function GroupsUserHas(aUserId : Integer) : string; //IList<Integer>;
  end;

  TRoleUserGroupExt = class(TRoleUserGroup)
  protected
    class function RolesUserHas(aUserId : Integer) : string; //IList<Integer>;
    class function RolesGroupsHas(groups : string) : string; //IList<Integer>;
  end;

  TRoleUserGroupPermissionExt = class(TRoleUserGroupPermission)
  protected
    class function HasTheUserPermissions(aUsername : string; const aPermissions : string) : boolean;
  end;

  TSessionTokensExt = class(TSessionTokens)
    function TokenIsValid(const aToken : string) : boolean;
  end;

implementation
uses
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions;

{ TUser }

class function TUserExt.AutorizeUser(const aUsername, aPermission: string): boolean;
begin
  Result := TRoleUserGroupPermissionExt.HasTheUserPermissions(aUsername, aPermission);
end;

class function TUserExt.GetUserByName(const aUsername: string): TUser;
var
  //user : TUser;
  FCriteria : ICriteria<TUser>;
  ll : IList<TUser>;
begin
  Result := Nil;
  FCriteria := LoginSession.CreateCriteria<TUser>;
  ll := FCriteria
    .Add(Restrictions.Eq('UserName', aUsername))
    .Add(Restrictions.NotEq('IsDeleted', 1)).ToList;
  if ll.Count<=0 then
    Exit;
  Result := ll[0];
end;

class function TUserExt.LoginUser(const aUsername, aPassword: string): boolean;
var
  FCriteria : ICriteria<TUser>;
  ll : IList<TUser>;
begin
  Result := False;
  if LoginSession=nil then
    Exit;
  FCriteria := LoginSession.CreateCriteria<TUser>;
  ll := FCriteria
    .Add(Restrictions.Eq('UserName', aUsername))
    .Add(Restrictions.NotEq('IsDeleted', 1)).ToList;
  if ll.Count<=0 then
    Exit;
  result := (ll[0].Password=aPassword);
end;

{ TRoleUserGroupPermissionExt }

class function TRoleUserGroupPermissionExt.HasTheUserPermissions(aUsername : string; const aPermissions: string): boolean;
var perms : string;
  groups, roles : string;
  uid : Integer;
  user : TUser;
  rugp : TRoleUserGroupPermission;
  ll : IList<TRoleUserGroupPermission>;
  s : string;
begin
  if aPermissions='' then
  begin
    Result := True;
    exit;
  end;
  Result := False;
  perms := TPermissionExt.GetCascadedPermissions(aPermissions);
  user := TUserExt.GetUserByName(aUsername);
  uid := user.UserId;
  try
    groups := TGroupUserExt.GroupsUserHas(uid);

    roles := TRoleUserGroupExt.RolesUserHas(uid);
    s := TRoleUserGroupExt.RolesGroupsHas(groups);
    if s<>'' then
      roles := roles + ',' + s;
    ll := LoginSession.GetList<TRoleUserGroupPermission>('select * from RoleUserGroupPermission where (RUG=1 and RoleId in (:0)) or (RUG=2 and UserId=:1) or (RUG=3 and GroupId in (:2))',
                                           [roles, IntToStr(uid), groups]);
    for rugp in ll do
      if Pos(IntToStr(rugp.PermissionId), perms)>0 then
      begin
        Result := True;
        Break;
      end;
  finally
    //user.Free;
  end;

end;

{ TPermissionExt }

class function TPermissionExt.GetCascadedPermissions(aPermission: string): string;
var s : string;
  perm : TPermission;
  lp : IList<TPermission>;

begin
  Result := '';
  if aPermission='' then
    Exit;
  lp := LoginSession.GetList<TPermission>('select * from Permission where PermissionId in ('+aPermission+')', [aPermission]);
  for perm in lp do
  begin
    if (perm.ParentId.HasValue) and (perm.ParentId.Value>0) then
      s := GetCascadedPermissions(IntToStr(perm.ParentId))
    else
      s := '';

    if s='' then
      s := IntToStr(perm.PermissionId)
    else
      s := s + ',' + IntToStr(perm.PermissionId);
    if Result='' then
      Result := s
    else
      Result := Result + ',' + s;
  end;
end;

{ TGroupUserExt }

class function TGroupUserExt.GroupsUserHas(aUserId: Integer): string;

function GetCascadedGroups(aGroupId : Integer) : string;
var s : string;
  g : TGroup;
begin
  Result := '';
  if aGroupId<0 then
    Exit;
  for g in LoginSession.GetList<TGroup>('select * from [Group] where GroupId=:0', [aGroupId]) do
  begin
    if (g.ParentId.HasValue) and (g.ParentId.Value>0) then
      s := GetCascadedGroups(g.ParentId.Value)
    else
      s := '';

    if s='' then
      s := IntToStr(g.GroupId)
    else
      s := s + ',' + IntToStr(g.GroupId);
    if Result='' then
      Result := s
    else
      Result := Result + ',' + s;
    {if (g.ParentId.HasValue) and (g.ParentId.Value>0) then
      s := GetCascadedGroups(g.ParentId.Value)
    else
      s := '';
    if Result='' then
      Result := s
    else
      Result := Result + ',' + s;}
  end;
end;
var s : string;
  gu : TGroupUser;
begin
  Result := '';
  if aUserId<=0 then
    Exit;
  for gu in LoginSession.GetList<TGroupUser>('select * from GroupUser where UserId=:0', [aUserId]) do
  begin
    if gu.GroupId.HasValue then
    begin
      s := GetCascadedGroups(gu.GroupId.Value);
      if s<>'' then
        if Result='' then
          Result := s
        else
          Result := Result + ',' + s;
    end;
  end;
end;

{ TRoleUserGroupExt }

class function TRoleUserGroupExt.RolesGroupsHas(groups : string): string;
var
  s : string;
  rug : TRoleUserGroup;
begin
  s := '';
  for rug in LoginSession.GetList<TRoleUserGroup>('select * from RoleUserGroup where GroupId in (:0) and IsDeleted<>1 and IsUser=0', [groups]) do
  begin
    if s='' then
      s := IntToStr(rug.RoleId)
    else
      s := s + ',' + IntToStr(rug.RoleId);
  end;
  Result := s;
end;

class function TRoleUserGroupExt.RolesUserHas(aUserId: Integer): string;
var
  s : string;
  rug : TRoleUserGroup;
begin
  s := '';
  for rug in LoginSession.GetList<TRoleUserGroup>('select * from RoleUserGroup where UserId=:0 and IsDeleted<>1 and IsUser=1', [aUserId]) do
  begin
    if s='' then
      s := IntToStr(rug.RoleId)
    else
      s := s + ',' + IntToStr(rug.RoleId);
  end;
  Result := s;
end;

{ TRoleExt }

class function TRoleExt.HasPermission(const aUserId: Integer;
  aPermissions: string): Boolean;
begin
  Result := False;
end;

{ TGroupExt }

function TGroupExt.HasPermission(const aUserId: Integer;
  const aPermissions: string): Boolean;
begin
  Result := False;
end;

{ TSessionTokensExt }

function TSessionTokensExt.TokenIsValid(const aToken: string): boolean;
begin
  Result := False;
end;

end.
