unit Model.RelationshipType;

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

function CreateRelationshipTypeModelClass: IRelationshipTypeModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type

  TRelationshipTypeModel = class (TInterfacedObject, IRelationshipTypeModelInterface)
  private
    fRelationshipType: TRelationshipType;
  public
    function GetAllRelationshipTypes(const filter : string) : IObjectList;
    function GetAllRelationshipTypesDS(const filter : string) : TObjectDataset;
    procedure AddRelationshipType(const newRelationshipType: TRelationshipType);
    function GetRelationshipType(const RelationshipTypeId : Integer) : TRelationshipType; overload;
    procedure UpdateRelationshipType(const RelationshipType: TRelationshipType);
    procedure DeleteRelationshipType(const RelationshipType: TRelationshipType);

  end;

function CreateRelationshipTypeModelClass: IRelationshipTypeModelInterface;
begin
  result:=TRelationshipTypeModel.Create;
end;

{ TRelationshipTypeModel }

procedure TRelationshipTypeModel.AddRelationshipType(const newRelationshipType: TRelationshipType);
begin

end;

procedure TRelationshipTypeModel.DeleteRelationshipType(const RelationshipType: TRelationshipType);
begin
  DMMain.Session.Delete(RelationshipType);
end;

function TRelationshipTypeModel.GetAllRelationshipTypes(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TRelationshipType>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TRelationshipType>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('RelationshipTypeId')).ToList as IObjectList;
end;

function TRelationshipTypeModel.GetAllRelationshipTypesDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataSet.Create(Application);
  Result.DataList := GetAllRelationshipTypes('');
end;

function TRelationshipTypeModel.GetRelationshipType(const RelationshipTypeId : Integer) : TRelationshipType;
begin
  Result := DMMain.Session.FindOne<TRelationshipType>(RelationshipTypeId);
end;

procedure TRelationshipTypeModel.UpdateRelationshipType(const RelationshipType: TRelationshipType);
begin
  DMMain.Session.Update(RelationshipType);
end;

end.
