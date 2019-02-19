unit Model.Employee;

interface
uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateEmployeeModelClass: IEmployeeModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type
  TEmployeeModel = class (TInterfacedObject, IEmployeeModelInterface)
  private
    fEmployee: TEmployee;
  public
    function GetAllEmployees(acompanyId : integer; const filter : string) : IObjectList;
    function GetAllEmployeesDS(acompanyId : integer; const filter : string) : TObjectDataset;
    procedure AddEmployee(const newEmployee: TEmployee);
    function GetEmployee(const EmployeeId : Integer) : TEmployee;
    procedure UpdateEmployee(const Employee: TEmployee);
    procedure DeleteEmployee(const Employee: TEmployee);
  end;

function CreateEmployeeModelClass: IEmployeeModelInterface;
begin
  result:=TEmployeeModel.Create;
end;

{ TEmployeeModel }

procedure TEmployeeModel.AddEmployee(const newEmployee: TEmployee);
begin
  DMMain.Session.Insert(newEmployee);
end;

procedure TEmployeeModel.DeleteEmployee(const Employee: TEmployee);
begin
  DMMain.Session.Delete(Employee);
end;

function TEmployeeModel.GetAllEmployees(acompanyId : integer; const filter: string): IObjectList;
var
  FCriteria : ICriteria<TEmployee>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TEmployee>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('EmployeeId')).ToList as IObjectList;
end;

function TEmployeeModel.GetAllEmployeesDS(acompanyId: integer;
  const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllEmployees(acompanyId, '');
end;

function TEmployeeModel.GetEmployee(const EmployeeId : Integer) : TEmployee;
begin
  Result := DMMain.Session.FindOne<TEmployee>(EmployeeId);
end;

procedure TEmployeeModel.UpdateEmployee(const Employee: TEmployee);
begin
  DMMain.Session.Update(Employee);
end;

end.
