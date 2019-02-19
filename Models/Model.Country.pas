unit Model.Country;

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

function CreateCountryModelClass: ICountryModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Forms;

type

  TCountryModel = class (TInterfacedObject, ICountryModelInterface)
  private
    fCountry: TCountry;
  public
    function GetAllCountries(const filter : string) : IObjectList;
    function GetAllCountriesDS(const filter : string) : TObjectDataset;
    procedure AddCountry(const newCountry: TCountry);
    function GetCountry(const CountryId : Integer) : TCountry;
    procedure UpdateCountry(const Country: TCountry);
    procedure DeleteCountry(const Country: TCountry);

  end;

function CreateCountryModelClass: ICountryModelInterface;
begin
  result:=TCountryModel.Create;
end;

{ TCountryModel }

procedure TCountryModel.AddCountry(const newCountry: TCountry);
begin

end;

procedure TCountryModel.DeleteCountry(const Country: TCountry);
begin
  DMMain.Session.Delete(Country);
end;

function TCountryModel.GetAllCountries(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TCountry>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TCountry>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('CountryId')).ToList as IObjectList;
  //Result := DMMain.Session.FindAll<TCountry> as IObjectList;
end;

function TCountryModel.GetAllCountriesDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataSet.Create(Application);
  Result.DataList := GetAllCountries('');
end;

function TCountryModel.GetCountry(const CountryId : Integer) : TCountry;
begin
  Result := DMMain.Session.FindOne<TCountry>(CountryId);
end;

procedure TCountryModel.UpdateCountry(const Country: TCountry);
begin
  DMMain.Session.Update(Country);
end;

end.
