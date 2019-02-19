unit Model.Main;

interface

uses Model.Declarations, Model.FormDeclarations, Model.Interfaces;

function CreateMainModelClass : IMainModelInterface;

implementation

{ TMainModel }
uses System.SysUtils;

type
  TMainModel = class (TInterfacedObject, IMainModelInterface)
  private
    //fMainFormLabelsText : TMainFormLabelsText;
    //fDatabase : IMyConnection;
  public
    constructor Create;
    //function GetMainFormLabelsText : TMainFormLabelsText;
  end;

constructor TMainModel.Create;
begin
  inherited;
  //fDatabase := CreateMySQLiteConnection;//TDatabase.Create;
end;

{function TMainModel.GetMainFormLabelsText: TMainFormLabelsText;
begin
  fMainFormLabelsText.Title := 'MOV Bordro';
  fMainFormLabelsText.EmployeeGroupCaption := 'Personel';
  fMainFormLabelsText.EmployeeCaption := 'Personel';
  fMainFormLabelsText.RecruitmentCaption := '��e Giri�';
  fMainFormLabelsText.JobTerminationCaption := '��ten Ayr�l��';

  fMainFormLabelsText.PayrollGroupCaption := 'Bordro';
  fMainFormLabelsText.CalculationCaption := 'Hesaplatma';
  fMainFormLabelsText.PayrollExamineCaption := 'Bordro �nceleme';
  fMainFormLabelsText.ClosePeriodCaption := 'D�nem Kapama';
  fMainFormLabelsText.ChangeYearAndPeriodCaption := 'D�nem De�i�tirme';
  fMainFormLabelsText.TransferToGeneralLedgerCaption := 'Muhasebeye Aktar';
  fMainFormLabelsText.TotalIncomeTaxBaseEntryCaption := 'Toplam Gelir Vergisi Matrah� Giri�i';
  fMainFormLabelsText.ScoringEntryCaption := 'Tahakkuk Giri�i';
  fMainFormLabelsText.OtherIncomeEntryCaption := 'Di�er Gelirler Giri�i';
  fMainFormLabelsText.OtherCutsEntryCaption := 'Di�er Kesintiler Giri�i';

  fMainFormLabelsText.CurrencyGroup := 'D�viz';
  fMainFormLabelsText.CurrencyDaily := 'D�viz Kurlar�';
  fMainFormLabelsText.Currency := 'D�viz Kodlar�';

  fMainFormLabelsText.ReportsGroupCaption := 'Raporlar';
  fMainFormLabelsText.PayrollReportWideCaption := 'Bordro D�k�m� (Geni� ka��t)';
  fMainFormLabelsText.PayrollReportLaserCaption := 'Bordro D�k�m� (Lazer yaz�c�)';
  fMainFormLabelsText.EnvelopeDumpCaption := 'Zarf D�k�m�';
  fMainFormLabelsText.PayrollCompendiumCaption := 'Tahakkuklar D�k�m�';
  fMainFormLabelsText.PersonelWageListCaption := 'Personel �cret Listesi';
  fMainFormLabelsText.PersonnelTimekeepingListCaption := 'Puantaj Listesi';
  fMainFormLabelsText.SocialPaymentsListCaption := 'Sosyal �dentiler Listesi';
  fMainFormLabelsText.OtherPaymentsListCaption := 'Di�er �dentiler Listesi';
  fMainFormLabelsText.OtherCutsListCaption := 'Di�er Kesintiler Listesi';
  fMainFormLabelsText.MonthlySGKPremiumsDeclarationReportCaption := 'Ayl�k SGK Primleri Bildirgesi';
  fMainFormLabelsText.DeclarationReportOfSocialSecurityPremiumSupportCaption := 'Ayl�k Sosyal G�venlik Destekleme Prim Bildirgesi';
  fMainFormLabelsText.AFour_monthInsurancePremiumsPayrollReportCaption := 'D�rt Ayl�k Sigorta Primleri Bordrosu';
  fMainFormLabelsText.SGKPremiumsReportCaption := 'SGK Primleri Raporu';
  fMainFormLabelsText.UserDefinedReportsCaption := 'Kullan�c� Tan�ml� Raporlar';

  fMainFormLabelsText.ParametersCaption := 'Parametreler';
  fMainFormLabelsText.CountryEntryCaption := '�lke';
  fMainFormLabelsText.CityEntryCaption := '�ehir';
  fMainFormLabelsText.TownEntryCaption := '�l�e';
  fMainFormLabelsText.LocationEntryCaption := 'Lokasyon';
  fMainFormLabelsText.LanguageEntryCaption := 'Dil';
  fMainFormLabelsText.DepartmentEntryCaption := 'Departman';
  fMainFormLabelsText.TitleEntryCaption := '�nvan';
  fMainFormLabelsText.BankEntryCaption := 'Banka';
  fMainFormLabelsText.OthIncomeCutsEntryCaption := 'Di�er Gelir ve Kesinti Tan�mlar�';
  fMainFormLabelsText.RelationshipTypeEntryCaption := 'Akrabal�k t�r�';
  fMainFormLabelsText.GeneralParametersCaption := 'Genel Parametreler';
  fMainFormLabelsText.CompanyParametersCaption := 'Firma Parametreleri';

  fMainFormLabelsText.OptionsCaption := 'Se�enekler';
  fMainFormLabelsText.DatabaseConnectionOptionsCaption := 'Veri Taban� Ba�lant�s�';
  fMainFormLabelsText.ProgramOptionsCaption := 'Program Se�enekleri';

  fMainFormLabelsText.CompanyCaption := 'Firmalar';
  fMainFormLabelsText.CompanyListCaption := 'Firma Listesi';
  fMainFormLabelsText.CompanyOpenCaption := 'Firma A�';
  fMainFormLabelsText.CompanyCloseCaption := 'Kapat';

  fMainFormLabelsText.SecurityCaption := 'G�venlik';
  fMainFormLabelsText.UserEntryCaption := 'Kullan�c�';
  fMainFormLabelsText.PermissionEntryCaption := '�zin Tan�mlar�';
  fMainFormLabelsText.GroupEntryCaption := 'Gruplar';
  fMainFormLabelsText.RoleEntryCaption := 'Roller';

  Result := fMainFormLabelsText;
end;}

function CreateMainModelClass : IMainModelInterface;
begin
  Result := TMainModel.Create;
end;

end.
