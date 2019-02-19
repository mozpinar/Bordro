unit Model.Role;

interface

uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateRoleModelClass: IRoleModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Model.MosObjectDataset;

type

  TRoleModel = class (TInterfacedObject, IRoleModelInterface)
  private
    fRole: TRole;
  public
    function GetAllRoles(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllRolesDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddRole(const newRole: TRole);
    function GetRole(const RoleId : Integer) : TRole;
    procedure UpdateRole(const Role: TRole);
    procedure DeleteRole(const Role: TRole);

  end;

function CreateRoleModelClass: IRoleModelInterface;
begin
  result:=TRoleModel.Create;
end;

{ TRoleModel }

procedure TRoleModel.AddRole(const newRole: TRole);
begin
   DMMain.Session.Insert(newRole);
end;

procedure TRoleModel.DeleteRole(const Role: TRole);
begin
  DMMain.Session.Delete(Role);
end;

function TRoleModel.GetAllRoles(const acompanyId : Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TRole>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRole>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('RoleId')).ToList as IObjectList;
end;

function TRoleModel.GetAllRolesDS(const acompanyId : Integer; const filter: string): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetAllRoles(acompanyId, '');
end;

function TRoleModel.GetRole(const RoleId : Integer) : TRole;
begin
  Result := DMMain.Session.FindOne<TRole>(RoleId);
end;

procedure TRoleModel.UpdateRole(const Role: TRole);
begin
  DMMain.Session.Update(Role);
end;

end.
