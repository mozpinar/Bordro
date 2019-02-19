unit Model.TownCityCountryTree;

interface
uses
  Spring.Persistence.Core.Session,
  Spring.Collections,
  Spring.Persistence.Mapping.Attributes;
type
  {ITownCityCountryTree = interface
    function GetTreeList(sess : TSession) : IObjectList;
  end;}

  [Entity]
  [Table]
  TTownCityCountyTree = class  //(TInterfacedObject, ITownCityCountryTree)
  private
    FId: Integer;
    FName: string;
    FLevel: Integer;
    FParentId: Integer;
  public
    class function GetTreeList(sess : TSession) : IObjectList;
  published
    [Column([TColumnProperty.cpPrimaryKey], 0, 0, 0)]
    property Id: Integer read FId write FId;
    [Column]
    property Name: string read FName write FName;
    [Column]
    property Level: Integer read FLevel write FLevel;
    [Column]
    property ParentId: Integer read FParentId write FParentId;
  end;


implementation

{ TTownCityCountyTree }

class function TTownCityCountyTree.GetTreeList(sess: TSession): IObjectList;
begin
  with inherited Create do
  begin
    Result := sess.GetList<TTownCityCountyTree>('select CountryId + 100000 as Id, CountryName as `Name`, 2 as Level, 0 as ParentId from Country '+
      'union all '+
      'select CityId + 10000 as Id, CityName as `Name`, 1 as Level, CountryId + 100000 as ParentId from City '+
      'union all '+
      'select TownId as Id, TownName as `Name`, 0 as Level, CityId + 10000 as ParentId from Town;;', []) as IObjectList;
  end;
end;

end.
