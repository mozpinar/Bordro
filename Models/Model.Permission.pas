unit Model.Permission;

interface
uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreatePermissionModelClass: IPermissionModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Forms;

type

  TPermissionModel = class (TInterfacedObject, IPermissionModelInterface)
  private
    fPermission: TPermission;
  public
    function GetAllPermissions(const filter : string) : IObjectList;
    function GetAllPermissionsDS(const filter : string) : TObjectDataset;
    procedure AddPermission(const newPermission: TPermission);
    function GetPermission(const PermissionId : Integer) : TPermission;
    procedure UpdatePermission(const Permission: TPermission);
    procedure DeletePermission(const Permission: TPermission);

  end;

function CreatePermissionModelClass: IPermissionModelInterface;
begin
  result:=TPermissionModel.Create;
end;

{ TPermissionModel }

procedure TPermissionModel.AddPermission(const newPermission: TPermission);
begin
  DMMain.Session.Insert(newPermission);
end;

procedure TPermissionModel.DeletePermission(const Permission: TPermission);
begin
  DMMain.Session.Delete(Permission);
end;

function TPermissionModel.GetAllPermissions(const filter: string): IObjectList;
var
  FCriteria : ICriteria<TPermission>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TPermission>;
  Result := FCriteria
    .Add(Restrictions.Eq('IsDeleted', 0))
    .OrderBy(TOrderBy.Asc('PermissionId')).ToList as IObjectList;
end;

function TPermissionModel.GetAllPermissionsDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllPermissions(filter);
end;

function TPermissionModel.GetPermission(const PermissionId : Integer) : TPermission;
begin
  Result := DMMain.Session.FindOne<TPermission>(PermissionId);
end;

procedure TPermissionModel.UpdatePermission(const Permission: TPermission);
begin
  DMMain.Session.Update(Permission);
end;

end.
