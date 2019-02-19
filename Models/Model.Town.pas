unit Model.Town;

interface
uses
  Forms,
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  MainDM;

function CreateTownModelClass: ITownModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations;

type

  TTownModel = class (TInterfacedObject, ITownModelInterface)
  private
    fTown: TTown;
  public
    function GetAllTowns(const filter : string) : IObjectList;
    function GetTownsDataset(const filter : string) : TObjectDataset;
    procedure AddTown(const newTown: TTown);
    function GetTown(const TownId : Integer) : TTown;
    procedure UpdateTown(const Town: TTown);
    procedure DeleteTown(const Town: TTown);

  end;

function CreateTownModelClass: ITownModelInterface;
begin
  result:=TTownModel.Create;
end;

{ TTownModel }

procedure TTownModel.AddTown(const newTown: TTown);
begin

end;

procedure TTownModel.DeleteTown(const Town: TTown);
begin
  DMMain.Session.Delete(Town);
end;

function TTownModel.GetAllTowns(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TTown>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TTown>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('TownId')).ToList as IObjectList;
  //Result := DMMain.Session.FindWhere<TTown>(ICriteria) as IObjectList;
end;

function TTownModel.GetTown(const TownId : Integer) : TTown;
begin
  Result := DMMain.Session.FindOne<TTown>(TownId);
end;

function TTownModel.GetTownsDataset(const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := DMMain.Session.FindAll<TTown> as IObjectList;
end;

procedure TTownModel.UpdateTown(const Town: TTown);
begin
  DMMain.Session.Update(Town);
end;

end.
