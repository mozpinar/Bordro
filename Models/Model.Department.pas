unit Model.Department;

interface

uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  MainDM;

function CreateDepartmentModelClass: IDepartmentModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type

  TDepartmentModel = class (TInterfacedObject, IDepartmentModelInterface)
  private
    fDepartment: TDepartment;
  public
    function GetAllDepartments(const companyId : Integer; const filter : string) : IObjectList;
    function GetAllDepartmentsDS(const companyId : Integer; const filter : string) : TObjectDataset;
    procedure AddDepartment(const newDepartment: TDepartment);
    function GetDepartment(const DepartmentCode: string): TDepartment; overload;
    function GetDepartment(const DepartmentId : Integer) : TDepartment; overload;
    procedure UpdateDepartment(const Department: TDepartment);
    procedure DeleteDepartment(const Department: TDepartment);

  end;

function CreateDepartmentModelClass: IDepartmentModelInterface;
begin
  result:=TDepartmentModel.Create;
end;

{ TDepartmentModel }

procedure TDepartmentModel.AddDepartment(const newDepartment: TDepartment);
begin

end;

procedure TDepartmentModel.DeleteDepartment(const Department: TDepartment);
begin
  DMMain.Session.Delete(Department);
end;

function TDepartmentModel.GetAllDepartments(const companyId : Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TDepartment>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TDepartment>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', companyId))
    .Add(Restrictions.NotEq('IsDeleted', -1))
    .OrderBy(TOrderBy.Asc('DepartmentId')).ToList as IObjectList;
end;

function TDepartmentModel.GetAllDepartmentsDS(const companyId : Integer; const filter: string): TObjectDataset;
begin
  Result := TObjectDataSet.Create(Application);
  Result.DataList := GetAllDepartments(companyId, '');
end;

function TDepartmentModel.GetDepartment(const DepartmentCode: string): TDepartment;
begin
  Result := DMMain.Session.FirstOrDefault<TDepartment>('select * from Department where DepartmentCode=:0', [DepartmentCode]);
end;

function TDepartmentModel.GetDepartment(const DepartmentId : Integer) : TDepartment;
begin
  Result := DMMain.Session.FindOne<TDepartment>(DepartmentId);
end;

procedure TDepartmentModel.UpdateDepartment(const Department: TDepartment);
begin
  DMMain.Session.Update(Department);
end;


end.
