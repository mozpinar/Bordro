unit Model.City;

interface
uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateCityModelClass: ICityModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Forms;

type

  TCityModel = class (TInterfacedObject, ICityModelInterface)
  private
    fCity: TCity;
  public
    function GetAllCities(const filter : string) : IObjectList;
    function GetAllCitiesDS(const filter : string) : TObjectDataset;
    procedure AddCity(const newCity: TCity);
    function GetCity(const CityId : Integer) : TCity;
    procedure UpdateCity(const City: TCity);
    procedure DeleteCity(const City: TCity);

  end;

function CreateCityModelClass: ICityModelInterface;
begin
  result:=TCityModel.Create;
end;

{ TCityModel }

procedure TCityModel.AddCity(const newCity: TCity);
begin
   DMMain.Session.Insert(newCity);
end;

procedure TCityModel.DeleteCity(const City: TCity);
begin
  DMMain.Session.Delete(City);
end;

function TCityModel.GetAllCities(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TCity>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TCity>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('CityId')).ToList as IObjectList;
  //Result := DMMain.Session.FindAll<TCity> as IObjectList;
end;

function TCityModel.GetAllCitiesDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllCities('');
end;

function TCityModel.GetCity(const CityId : Integer) : TCity;
begin
  Result := DMMain.Session.FindOne<TCity>(CityId);
end;

procedure TCityModel.UpdateCity(const City: TCity);
begin
  DMMain.Session.Update(City);
end;

end.
