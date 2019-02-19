unit Model.Location;

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

function CreateLocationModelClass: ILocationModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type

  TLocationModel = class (TInterfacedObject, ILocationModelInterface)
  private
    fLocation: TLocation;
  public
    function GetAllLocations(const filter : string) : IObjectList;
    function GetAllLocationsDS(const filter : string) : TObjectDataset;
    procedure AddLocation(const newLocation: TLocation);
    function GetLocation(const LocationId : Integer) : TLocation; overload;
    function GetLocation(const LocationCode : string) : TLocation; overload;
    procedure UpdateLocation(const Location: TLocation);
    procedure DeleteLocation(const Location: TLocation);

  end;

function CreateLocationModelClass: ILocationModelInterface;
begin
  result:=TLocationModel.Create;
end;

{ TLocationModel }

procedure TLocationModel.AddLocation(const newLocation: TLocation);
begin
  DMMain.Session.Insert(newLocation);
end;

procedure TLocationModel.DeleteLocation(const Location: TLocation);
begin
  DMMain.Session.Delete(Location);
end;

function TLocationModel.GetAllLocations(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TLocation>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TLocation>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
    .OrderBy(TOrderBy.Asc('LocationId')).ToList as IObjectList;
  //Result := DMMain.Session.FindAll<TLocation> as IObjectList;
end;

function TLocationModel.GetAllLocationsDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataSet.Create(Application);
  Result.DataList := GetAllLocations('');
end;

function TLocationModel.GetLocation(const LocationCode: string): TLocation;
begin
  Result := DMMain.Session.FirstOrDefault<TLocation>('select * from Location where LocationCode=:0', [LocationCode]);
end;

function TLocationModel.GetLocation(const LocationId : Integer) : TLocation;
begin
  Result := DMMain.Session.FindOne<TLocation>(LocationId);
end;

procedure TLocationModel.UpdateLocation(const Location: TLocation);
begin
  DMMain.Session.Update(Location);
end;

end.
