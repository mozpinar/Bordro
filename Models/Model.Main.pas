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
  fMainFormLabelsText.RecruitmentCaption := 'Ýþe Giriþ';
  fMainFormLabelsText.JobTerminationCaption := 'Ýþten Ayrýlýþ';

  fMainFormLabelsText.PayrollGroupCaption := 'Bordro';
  fMainFormLabelsText.CalculationCaption := 'Hesaplatma';
  fMainFormLabelsText.PayrollExamineCaption := 'Bordro Ýnceleme';
  fMainFormLabelsText.ClosePeriodCaption := 'Dönem Kapama';
  fMainFormLabelsText.ChangeYearAndPeriodCaption := 'Dönem Deðiþtirme';
  fMainFormLabelsText.TransferToGeneralLedgerCaption := 'Muhasebeye Aktar';
  fMainFormLabelsText.TotalIncomeTaxBaseEntryCaption := 'Toplam Gelir Vergisi Matrahý Giriþi';
  fMainFormLabelsText.ScoringEntryCaption := 'Tahakkuk Giriþi';
  fMainFormLabelsText.OtherIncomeEntryCaption := 'Diðer Gelirler Giriþi';
  fMainFormLabelsText.OtherCutsEntryCaption := 'Diðer Kesintiler Giriþi';

  fMainFormLabelsText.CurrencyGroup := 'Döviz';
  fMainFormLabelsText.CurrencyDaily := 'Döviz Kurlarý';
  fMainFormLabelsText.Currency := 'Döviz Kodlarý';

  fMainFormLabelsText.ReportsGroupCaption := 'Raporlar';
  fMainFormLabelsText.PayrollReportWideCaption := 'Bordro Dökümü (Geniþ kaðýt)';
  fMainFormLabelsText.PayrollReportLaserCaption := 'Bordro Dökümü (Lazer yazýcý)';
  fMainFormLabelsText.EnvelopeDumpCaption := 'Zarf Dökümü';
  fMainFormLabelsText.PayrollCompendiumCaption := 'Tahakkuklar Dökümü';
  fMainFormLabelsText.PersonelWageListCaption := 'Personel Ücret Listesi';
  fMainFormLabelsText.PersonnelTimekeepingListCaption := 'Puantaj Listesi';
  fMainFormLabelsText.SocialPaymentsListCaption := 'Sosyal Ödentiler Listesi';
  fMainFormLabelsText.OtherPaymentsListCaption := 'Diðer Ödentiler Listesi';
  fMainFormLabelsText.OtherCutsListCaption := 'Diðer Kesintiler Listesi';
  fMainFormLabelsText.MonthlySGKPremiumsDeclarationReportCaption := 'Aylýk SGK Primleri Bildirgesi';
  fMainFormLabelsText.DeclarationReportOfSocialSecurityPremiumSupportCaption := 'Aylýk Sosyal Güvenlik Destekleme Prim Bildirgesi';
  fMainFormLabelsText.AFour_monthInsurancePremiumsPayrollReportCaption := 'Dört Aylýk Sigorta Primleri Bordrosu';
  fMainFormLabelsText.SGKPremiumsReportCaption := 'SGK Primleri Raporu';
  fMainFormLabelsText.UserDefinedReportsCaption := 'Kullanýcý Tanýmlý Raporlar';

  fMainFormLabelsText.ParametersCaption := 'Parametreler';
  fMainFormLabelsText.CountryEntryCaption := 'Ülke';
  fMainFormLabelsText.CityEntryCaption := 'Þehir';
  fMainFormLabelsText.TownEntryCaption := 'Ýlçe';
  fMainFormLabelsText.LocationEntryCaption := 'Lokasyon';
  fMainFormLabelsText.LanguageEntryCaption := 'Dil';
  fMainFormLabelsText.DepartmentEntryCaption := 'Departman';
  fMainFormLabelsText.TitleEntryCaption := 'Ünvan';
  fMainFormLabelsText.BankEntryCaption := 'Banka';
  fMainFormLabelsText.OthIncomeCutsEntryCaption := 'Diðer Gelir ve Kesinti Tanýmlarý';
  fMainFormLabelsText.RelationshipTypeEntryCaption := 'Akrabalýk türü';
  fMainFormLabelsText.GeneralParametersCaption := 'Genel Parametreler';
  fMainFormLabelsText.CompanyParametersCaption := 'Firma Parametreleri';

  fMainFormLabelsText.OptionsCaption := 'Seçenekler';
  fMainFormLabelsText.DatabaseConnectionOptionsCaption := 'Veri Tabaný Baðlantýsý';
  fMainFormLabelsText.ProgramOptionsCaption := 'Program Seçenekleri';

  fMainFormLabelsText.CompanyCaption := 'Firmalar';
  fMainFormLabelsText.CompanyListCaption := 'Firma Listesi';
  fMainFormLabelsText.CompanyOpenCaption := 'Firma Aç';
  fMainFormLabelsText.CompanyCloseCaption := 'Kapat';

  fMainFormLabelsText.SecurityCaption := 'Güvenlik';
  fMainFormLabelsText.UserEntryCaption := 'Kullanýcý';
  fMainFormLabelsText.PermissionEntryCaption := 'Ýzin Tanýmlarý';
  fMainFormLabelsText.GroupEntryCaption := 'Gruplar';
  fMainFormLabelsText.RoleEntryCaption := 'Roller';

  Result := fMainFormLabelsText;
end;}

function CreateMainModelClass : IMainModelInterface;
begin
  Result := TMainModel.Create;
end;

end.
