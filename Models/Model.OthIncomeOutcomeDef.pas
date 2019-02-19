unit Model.OthIncomeOutcomeDef;

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

function CreateOthIncomeOutcomeDefModelClass: IOthIncomeOutcomeDefModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type
  TOthIncomeOutcomeDefModel = class (TInterfacedObject, IOthIncomeOutcomeDefModelInterface)
  private
    fOthIncomeOutcomeDef: TOthIncomeOutcomeDef;
  public
    function GetAllOthIncomeOutcomeDefs(acompanyId : integer; const filter : string) : IObjectList;
    function GetAllOthIncomeOutcomeDefsDS(acompanyId : integer; const filter : string) : TObjectDataset;
    procedure AddOthIncomeOutcomeDef(const newOthIncomeOutcomeDef: TOthIncomeOutcomeDef);
    function GetOthIncomeOutcomeDef(const OthIncomeOutcomeDefId : Integer) : TOthIncomeOutcomeDef;
    procedure UpdateOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
    procedure DeleteOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
  end;

function CreateOthIncomeOutcomeDefModelClass: IOthIncomeOutcomeDefModelInterface;
begin
  result:=TOthIncomeOutcomeDefModel.Create;
end;

{ TOthIncomeOutcomeDefModel }

procedure TOthIncomeOutcomeDefModel.AddOthIncomeOutcomeDef(const newOthIncomeOutcomeDef: TOthIncomeOutcomeDef);
begin
  DMMain.Session.Insert(newOthIncomeOutcomeDef);
end;

procedure TOthIncomeOutcomeDefModel.DeleteOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
begin
  DMMain.Session.Delete(OthIncomeOutcomeDef);
end;

function TOthIncomeOutcomeDefModel.GetAllOthIncomeOutcomeDefs(acompanyId : integer; const filter: string): IObjectList;
var
  FCriteria : ICriteria<TOthIncomeOutcomeDef>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TOthIncomeOutcomeDef>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('OthIncomeOutcomeDefId')).ToList as IObjectList;
end;

function TOthIncomeOutcomeDefModel.GetAllOthIncomeOutcomeDefsDS(acompanyId: integer;
  const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllOthIncomeOutcomeDefs(acompanyId, '');
end;

function TOthIncomeOutcomeDefModel.GetOthIncomeOutcomeDef(const OthIncomeOutcomeDefId : Integer) : TOthIncomeOutcomeDef;
begin
  Result := DMMain.Session.FindOne<TOthIncomeOutcomeDef>(OthIncomeOutcomeDefId);
end;

procedure TOthIncomeOutcomeDefModel.UpdateOthIncomeOutcomeDef(const OthIncomeOutcomeDef: TOthIncomeOutcomeDef);
begin
  DMMain.Session.Update(OthIncomeOutcomeDef);
end;


end.
