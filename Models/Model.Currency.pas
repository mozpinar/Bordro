unit Model.Currency;

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

function CreateCurrencyModelClass: ICurrencyModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations;

type

  TCurrencyModel = class (TInterfacedObject, ICurrencyModelInterface)
  private
    fCurrency: TCurrency;
  public
    function GetAllCurrencies(const filter : string) : IObjectList;
    function GetAllCurrenciesDS(const filter : string) : TObjectDataset;
    procedure AddCurrency(const newCurrency: TCurrency);
    function GetCurrency(const CurrencyId : Integer) : TCurrency;
    procedure UpdateCurrency(const Currency: TCurrency);
    procedure DeleteCurrency(const Currency: TCurrency);

  end;

function CreateCurrencyModelClass: ICurrencyModelInterface;
begin
  result:=TCurrencyModel.Create;
end;

{ TCurrencyModel }

procedure TCurrencyModel.AddCurrency(const newCurrency: TCurrency);
begin

end;

procedure TCurrencyModel.DeleteCurrency(const Currency: TCurrency);
begin
  DMMain.Session.Delete(Currency);
end;

function TCurrencyModel.GetAllCurrencies(
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TCurrency>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TCurrency>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('CurrencyId')).ToList as IObjectList;
  //Result := DMMain.Session.FindWhere<TCurrency>(ICriteria) as IObjectList;
end;

function TCurrencyModel.GetCurrency(const CurrencyId : Integer) : TCurrency;
begin
  Result := DMMain.Session.FindOne<TCurrency>(CurrencyId);
end;

function TCurrencyModel.GetAllCurrenciesDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList :=  GetAllCurrencies(filter); //DMMain.Session.FindAll<TCurrency> as IObjectList;
  Result.Open;
end;

procedure TCurrencyModel.UpdateCurrency(const Currency: TCurrency);
begin
  DMMain.Session.Update(Currency);
end;

end.
