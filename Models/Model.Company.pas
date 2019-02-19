unit Model.Company;

interface
uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Data.ObjectDataset,
  Spring.Collections;

function CreateCompanyModelClass: ICompanyModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations, MainDM,
  Model.LanguageDictionary,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Forms;

type

  TCompanyModel = class (TInterfacedObject, ICompanyModelInterface)
  private
  public
    function GetAllCompanies(const filter : string) : IObjectList;
    function GetAllCompaniesDS(const filter : string) : TObjectDataset;
    procedure AddCompany(const newCompany: TCompany);

    function GetCompany(const CompanyId : Integer) : TCompany; overload;
    function GetCompany(const CompanyCode : string) : TCompany; overload;

    procedure UpdateCompany(const Company: TCompany);
    procedure DeleteCompany(const Company: TCompany);
  end;

function CreateCompanyModelClass: ICompanyModelInterface;
begin
  result:=TCompanyModel.Create;
end;

{ TCompanyModel }

procedure TCompanyModel.AddCompany(const newCompany: TCompany);
begin

end;

procedure TCompanyModel.DeleteCompany(const Company: TCompany);
begin
  DMMain.Session.Delete(Company);
end;

function TCompanyModel.GetAllCompanies(const filter: string): IObjectList;
var
  FCriteria : ICriteria<TCompany>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TCompany>;
  Result := FCriteria
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('CompanyId')).ToList as IObjectList;
  //Result := DMMain.Session.FindAll<TCompany> as IObjectList;
end;

function TCompanyModel.GetAllCompaniesDS(const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllCompanies('');
end;

function TCompanyModel.GetCompany(const CompanyCode: string): TCompany;
var acomp : TCompany;
begin
  Result := nil;
  if CompanyCode='' then
    Exit;
  acomp := DMMain.Session.FirstOrDefault<TCompany>('select * from Company where CompanyCode=:0', [CompanyCode]);
  if Assigned(acomp) then
  begin
    Result := acomp
  end
  else
    raise Exception.Create(MessageDictionary('').GetMessage('SCompanyNotFound'));
end;

function TCompanyModel.GetCompany(const CompanyId : Integer) : TCompany;
begin
  Result := DMMain.Session.FindOne<TCompany>(CompanyId);
end;

{procedure TCompanyModel.GetPeriod(const CompanyCode: string; var CurrentYear,
  CurrentPeriod: Integer);
var
  company : TCompany;
begin
  company := DMMain.Session.First<TCompany>('select * from Company where CompanyCode='''+CompanyCode+'''', []);
  CurrentYear := company.CurrentYear;
  CurrentPeriod := company.CurrentPeriod;
end;

procedure TCompanyModel.GetPeriod(const CompanyId: Integer; var CurrentYear,
  CurrentPeriod: Integer);
var
  company : TCompany;
begin
  company := DMMain.Session.First<TCompany>('select * from Company where CompanyId='+IntToStr(CompanyId), []);
  CurrentYear := company.CurrentYear;
  CurrentPeriod := company.CurrentPeriod;
end;

procedure TCompanyModel.SetPeriod(const CompanyId, CurrentYear,
  CurrentPeriod: Integer);
var
  company : TCompany;
begin
  company := DMMain.Session.First<TCompany>('select * from Company where CompanyId='+IntToStr(CompanyId), []);
  company.CurrentYear := CurrentYear;
  company.CurrentPeriod := CurrentPeriod;
  DMMain.Session.Update(company);
end;

procedure TCompanyModel.SetPeriod(const CompanyCode: string; const CurrentYear,
  CurrentPeriod: Integer);
var
  company : TCompany;
begin
  company := DMMain.Session.First<TCompany>('select * from Company where CompanyCode='''+CompanyCode+'''', []);
  company.CurrentYear := CurrentYear;
  company.CurrentPeriod := CurrentPeriod;
  DMMain.Session.Update(company);
end;

procedure TCompanyModel.SetWorkingCompany(aCompany: TCompany);
begin
  fCompany := aCompany;
end;

procedure TCompanyModel.SetWorkingCompanyCode(aValue: string);
var acomp : TCompany;
begin
  if aValue='' then
    Exit;
  acomp := DMMain.Session.FirstOrDefault<TCompany>('select * from Company where CompanyCode=:0', [aValue]);
  if Assigned(acomp) then
  begin
    fCompany := acomp
  end
  else
    raise Exception.Create(GetMessageText('SCompanyNotFoundToSet'));
end;
}
procedure TCompanyModel.UpdateCompany(const Company: TCompany);
begin
  DMMain.Session.Update(Company);
end;


{function TCompanyModel.GetWorkingCompanyCode: string;
begin
  if Assigned(fCompany) then
    Result := fCompany.CompanyCode
  else
    Result := '';
end;}

end.
