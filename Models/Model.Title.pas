unit Model.Title;

interface
uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  MainDM;

function CreateTitleModelClass: ITitleModelInterface;
implementation
uses
  System.SysUtils,
  Spring.Data.ObjectDataset,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Model.Declarations,
  Model.FormDeclarations,
  Forms;

type
  TTitleModel = class (TInterfacedObject, ITitleModelInterface)
  private
    fTitle: TTitle;
  public
    function GetAllTitles(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllTitlesDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddTitle(const newTitle: TTitle);
    function GetTitle(const TitleId : Integer) : TTitle;
    procedure UpdateTitle(const Title: TTitle);
    procedure DeleteTitle(const Title: TTitle);
  end;

function CreateTitleModelClass: ITitleModelInterface;
begin
  result:=TTitleModel.Create;
end;

{ TTitleModel }

procedure TTitleModel.AddTitle(const newTitle: TTitle);
begin
  DMMain.Session.Insert(newTitle);
end;

procedure TTitleModel.DeleteTitle(const Title: TTitle);
begin
  DMMain.Session.Delete(Title);
end;

function TTitleModel.GetAllTitles(const acompanyId : Integer; const filter: string): IObjectList;
var
  FCriteria : ICriteria<TTitle>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TTitle>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.Eq('IsDeleted', 0))
    .OrderBy(TOrderBy.Asc('TitleId')).ToList as IObjectList;
end;

function TTitleModel.GetAllTitlesDS(const acompanyId : Integer; const filter: string): TObjectDataset;
begin
  Result := TObjectDataSet.Create(Application);
  Result.DataList := GetAllTitles(acompanyId, '');
end;

function TTitleModel.GetTitle(const TitleId : Integer) : TTitle;
begin
  Result := DMMain.Session.FindOne<TTitle>(TitleId);
end;

procedure TTitleModel.UpdateTitle(const Title: TTitle);
begin
  DMMain.Session.Update(Title);
end;


end.
