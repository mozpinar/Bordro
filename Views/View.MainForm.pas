unit View.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, JvExComCtrls, JvComCtrls,
  Vcl.CategoryButtons, JvExControls, JvEmbeddedForms, JvExExtCtrls,
  JvExtComponent, JvPanel, JvComponentBase, JvExStdCtrls, JvEdit, JvCheckBox,
  JvListBox, JvLabel, JvXPBar, JvXPCore, JvXPContainer, JvSplitter,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  Model.Main,
  ViewModel.Main,
  Model.ProSu.Subscriber,
  Model.ProSu.InterfaceActions, JvSpeedButton, JvMenus, Vcl.Menus,
  JvActionsEngine, JvControlActions,
  Model.FormDeclarations,
  Model.Fabrication, JvFormPlacement, JvXPButtons, TB2Item, TB2Dock, TB2Toolbar,
  JvCombobox, JvImageList, Vcl.DBActns, Vcl.Mask, JvExMask, JvToolEdit;

type
  TMainForm = class(TForm)
    ImageList16: TImageList;
    ImageList32: TImageList;
    ImageList64: TImageList;
    ImageList24: TImageList;
    ActionList1: TActionList;
    actViewPersonelGridForm: TAction;
    actStartEmployeeRecruitment: TAction;
    actStartEmployeeJobTermination: TAction;
    actPayrollScoringEntryForm: TAction;
    actPayrollOtherIncomesCutsEntryForm: TAction;
    actPayrollChangeYearPeriod: TAction;
    actPayrollExamine: TAction;
    actPayrollClosePeriod: TAction;
    actCurrencyDaily: TAction;
    actCurrency: TAction;
    actParamsGeneralParameters: TAction;
    actParamsCompanyParameters: TAction;
    actRepPayrollReportWideDlg: TAction;
    actRepPayrollReportLaserDlg: TAction;
    actRepEnvelopeDumpDlg: TAction;
    actRepPayrollCompendiumDlg: TAction;
    actRepPersonelWageListDlg: TAction;
    actRepPersonnelTimekeepingListDlg: TAction;
    actRepSocialPaymentsListDlg: TAction;
    actRepOtherPaymentsListDlg: TAction;
    actRepOtherCutsListDlg: TAction;
    actRepMonthlySGKPremiumsDeclarationReportDlg: TAction;
    actRepDeclarationReportOfSocialSecurityPremiumSupportDlg: TAction;
    actRepAFour_monthInsurancePremiumsPayrollReportDlg: TAction;
    actRepSGKPremiumsReportDlg: TAction;
    actRepUserDefinedReportsDlg: TAction;
    actPayrollCalculation: TAction;
    actPayrollTransferToGeneralLedger: TAction;
    actPayrollTotalIncomeTaxBaseEntry: TAction;
    actParamsBankEntry: TAction;
    actParamsCityEntry: TAction;
    actParamsCountryEntry: TAction;
    actParamsDepartmentEntry: TAction;
    actParamsLanguageEntry: TAction;
    actParamsLocationEntry: TAction;
    actParamsOthIncomeCutsEntry: TAction;
    actParamsRelationshipTypeEntry: TAction;
    actParamsTitleEntry: TAction;
    actParamsTownEntry: TAction;
    actOpsDatabaseConnectionOptions: TAction;
    actOpsProgramOptions: TAction;
    actCompanyList: TAction;
    actSecUser: TAction;
    actSecPermission: TAction;
    actSecGroup: TAction;
    actSecRole: TAction;
    ActionManager1: TActionManager;
    JvFormStorage1: TJvFormStorage;
    ActionMainMenuBar1: TActionMainMenuBar;
    JvPanel1: TJvPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    catbtnLeftMenu: TCategoryButtons;
    TBDock1: TTBDock;
    tbtTableActions: TTBToolbar;
    tbiDelete: TTBItem;
    tbiEdit: TTBItem;
    tbiAdd: TTBItem;
    ActImageList16: TImageList;
    tbiFind: TTBItem;
    tbiView: TTBItem;
    tbiPrint: TTBItem;
    tbtEditActions: TTBToolbar;
    tbiSaveAsTemplate: TTBItem;
    tbiCancel: TTBItem;
    tbiSave: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    btiDeactivateFilter: TTBItem;
    btiActivateFilter: TTBItem;
    tbiDefineFilter: TTBItem;
    tbiRefresh: TTBItem;
    actFirst: TAction;
    actPrior: TAction;
    actNext: TAction;
    actLast: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actPost: TAction;
    actCancel: TAction;
    actRefresh: TAction;
    actShowDetail: TAction;
    actFind: TAction;
    actPrint: TAction;
    actSaveAsTemplate: TAction;
    actActivateFilter: TAction;
    actBuildFilter: TAction;
    actDeactivateFilter: TAction;
    TBItem2: TTBItem;
    actFormClose: TAction;
    actUndelete: TAction;
    tbiUndelete: TTBItem;
    actCreateDatabase: TAction;
    tbtCompany: TTBToolbar;
    TBControlItem2: TTBControlItem;
    TBControlItem1: TTBControlItem;
    TBItem1: TTBItem;
    cbxCurrentPeriod: TJvComboBox;
    cbxCurrentYear: TJvComboBox;
    edSelectCompany: TJvComboEdit;
    TBControlItem3: TTBControlItem;
    actSecLogin: TAction;
    actSecAuthorize: TAction;
    tbtLogin: TTBToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    actSecLogout: TAction;
    JvEmbeddedFormPanel1: TJvEmbeddedFormPanel;
    procedure actTahakkuklarExecute(Sender: TObject);
    procedure actCreateDatabaseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actParamsCountryEntryExecute(Sender: TObject);
    procedure actViewPersonelGridFormExecute(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actShowDetailExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSaveAsTemplateExecute(Sender: TObject);
    procedure actActivateFilterExecute(Sender: TObject);
    procedure actBuildFilterExecute(Sender: TObject);
    procedure actDeactivateFilterExecute(Sender: TObject);
    procedure actPayrollScoringEntryFormExecute(Sender: TObject);
    procedure actCompanyListExecute(Sender: TObject);
    procedure actUndeleteExecute(Sender: TObject);
    procedure edSelectCompanyButtonClick(Sender: TObject);
    procedure JvFormStorage1BeforeSavePlacement(Sender: TObject);
    procedure JvFormStorage1RestorePlacement(Sender: TObject);
    procedure cbxCurrentYearChange(Sender: TObject);
    procedure actParamsCityEntryExecute(Sender: TObject);
    procedure actParamsTownEntryExecute(Sender: TObject);
    procedure actParamsLocationEntryExecute(Sender: TObject);
    procedure actParamsLanguageEntryExecute(Sender: TObject);
    procedure actParamsDepartmentEntryExecute(Sender: TObject);
    procedure actParamsTitleEntryExecute(Sender: TObject);
    procedure actParamsBankEntryExecute(Sender: TObject);
    procedure actCurrencyExecute(Sender: TObject);
    procedure actSecLoginExecute(Sender: TObject);
    procedure actSecLogoutExecute(Sender: TObject);
    procedure actSecPermissionExecute(Sender: TObject);
    procedure actSecUserExecute(Sender: TObject);
    procedure actParamsRelationshipTypeEntryExecute(Sender: TObject);
    procedure actParamsOthIncomeCutsEntryExecute(Sender: TObject);
    procedure actSecGroupExecute(Sender: TObject);
    procedure actSecRoleExecute(Sender: TObject);
  private
    fSubscriber: ISubscriberInterface;

    fMainModel : IMainModelInterface; //TMainModel;
    fViewModel : IMainViewModelInterface; // TMainViewModel;
    procedure SetViewModel(const newViewModel: IMainViewModelInterface);
    procedure UpdateLabels;
    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure ActivateNewForm(const name : string);
    procedure SendActionMessageToActiveForm(aMsg : TBrowseFormCommand);
  public
    property ViewModel: IMainViewModelInterface read fViewModel write SetViewModel;
  end;

var
  MainForm: TMainForm;

implementation
uses
  View.TemplateForm,
  Model.Declarations,
  Model.LanguageDictionary,
  View.CompanySelectForm,
  Sec.Declarations,
  MainDM;
{$R *.dfm}

procedure TMainForm.actCreateDatabaseExecute(Sender: TObject);
begin
  if Assigned(DMMain) then
    DMMain.BuildDatabase;
end;

procedure TMainForm.actCurrencyExecute(Sender: TObject);
begin
  ActivateNewForm('TCurrencyListForm');
end;

procedure TMainForm.actActivateFilterExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdActivateFilter);
end;

procedure TMainForm.actBuildFilterExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdBuildFilter);
end;

procedure TMainForm.actCancelExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdClose);
end;

procedure TMainForm.actCompanyListExecute(Sender: TObject);
begin
  ActivateNewForm('TCompanyListForm');
end;

procedure TMainForm.actDeactivateFilterExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdDeactivateFilter);
end;

procedure TMainForm.actDeleteExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdDelete);
end;

procedure TMainForm.actEditExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdEdit);
end;

procedure TMainForm.actFindExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdFind);
end;

procedure TMainForm.actFirstExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdFirst);
end;

procedure TMainForm.actInsertExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdAdd);
end;

procedure TMainForm.actLastExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdLast);
end;

procedure TMainForm.actNextExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdNext);
end;

procedure TMainForm.actPrintExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdPrint);
end;

procedure TMainForm.actPriorExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdPrev);
end;

procedure TMainForm.actRefreshExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdRefresh);
end;

procedure TMainForm.actShowDetailExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(efcmdViewDetail);
end;

procedure TMainForm.actPostExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(TBrowseFormCommand.efcmdPost);
end;

procedure TMainForm.actSaveAsTemplateExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(TBrowseFormCommand.efcmdSaveAsTemplate);
end;

procedure TMainForm.actSecGroupExecute(Sender: TObject);
begin
  ActivateNewForm('TGroupListForm');
end;

procedure TMainForm.actSecLoginExecute(Sender: TObject);
begin
  DMMain.LoggedIn := ExecLoginForm;
  if DMMain.LoggedIn then
  begin
    tbtTableActions.Enabled := True;
    tbtEditActions.Enabled := True;
    tbtCompany.Enabled := True;
    ActionMainMenuBar1.Enabled := True;
    catbtnLeftMenu.Enabled := True;
  end
  else
    actSecLogoutExecute(Sender);
end;

procedure TMainForm.actSecLogoutExecute(Sender: TObject);
begin
  DMMain.LoggedIn := False;
  tbtTableActions.Enabled := False;
  tbtEditActions.Enabled := False;
  tbtCompany.Enabled := False;
  ActionMainMenuBar1.Enabled := False;
  catbtnLeftMenu.Enabled := False;
end;

procedure TMainForm.actSecPermissionExecute(Sender: TObject);
begin
  ActivateNewForm('TPermissionListForm');
end;

procedure TMainForm.actSecRoleExecute(Sender: TObject);
begin
  ActivateNewForm('TRoleListForm')
end;

procedure TMainForm.actSecUserExecute(Sender: TObject);
begin
  ActivateNewForm('TUserListForm');
end;

procedure TMainForm.actParamsBankEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TBankListForm');
end;

procedure TMainForm.actParamsCityEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TCityListForm');
end;

procedure TMainForm.actParamsCountryEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TCountryListForm');
end;

procedure TMainForm.actParamsDepartmentEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TDepartmentListForm');
end;

procedure TMainForm.actParamsLanguageEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TLanguageListForm');
end;

procedure TMainForm.actParamsLocationEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TLocationListForm');
end;

procedure TMainForm.actParamsOthIncomeCutsEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TOthIncomeOutcomeDefListForm');
end;

procedure TMainForm.actParamsRelationshipTypeEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TRelationshipTypeListForm');
end;

procedure TMainForm.actParamsTitleEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TTitleListForm');
end;

procedure TMainForm.actParamsTownEntryExecute(Sender: TObject);
begin
  ActivateNewForm('TTownListForm');
end;

procedure TMainForm.actPayrollScoringEntryFormExecute(Sender: TObject);
begin
  ActivateNewForm('TTahakkukForm');
end;

procedure TMainForm.ActivateNewForm(const name: string);
var f : TTemplateForm;
begin
  if Assigned(JvEmbeddedFormPanel1.LinkedForm) then
  begin
    if (JvEmbeddedFormPanel1.LinkedForm.ClassName=name) then
      Exit;
    JvEmbeddedFormPanel1.LinkedForm.Close;
  end;
  f := MyFactory.GetForm(name);
  JvEmbeddedFormPanel1.FormLink := f.FormLink;
  f.Provider.Subscribe(fSubscriber);
  f.Show;
end;

procedure TMainForm.actTahakkuklarExecute(Sender: TObject);
var f : TTemplateForm;
begin
  //ActivateNewForm('');
end;

procedure TMainForm.actUndeleteExecute(Sender: TObject);
begin
  SendActionMessageToActiveForm(TBrowseFormCommand.efcmdUndelete);
end;

procedure TMainForm.actViewPersonelGridFormExecute(Sender: TObject);
var f : TTemplateForm;
begin
  ActivateNewForm('TEmployeeListForm');
end;

procedure TMainForm.cbxCurrentYearChange(Sender: TObject);
begin
  StrToInt(cbxCurrentYear.Text);
end;

procedure TMainForm.edSelectCompanyButtonClick(Sender: TObject);
var
  sel : string;
begin
  sel := edSelectCompany.Text;
  if TCompanySelectForm.ExecuteSelect('CompanyCode', sel) and (sel<>edSelectCompany.Text) then
  begin
    DMMain.SetCurrentCompanyCode(sel);
    if Assigned(JvEmbeddedFormPanel1.LinkedForm) then
      (JvEmbeddedFormPanel1.LinkedForm as TTemplateForm).Refresh;
      //JvEmbeddedFormPanel1.LinkedForm.Close;
    edSelectCompany.Text := sel;
    JvFormStorage1.StoredValue['CurrentCompany'] := edSelectCompany.Text;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var s: string;
  item : TJvStoredValue;
begin
  DMMain := TDMMain.Create(Application);

  fMainModel := CreateMainModelClass;
  fViewModel := CreateMainViewModelClass;
  fViewModel.Model := fMainModel;

  fSubscriber := CreateProSuSubscriberClass;
  fSubscriber.SetUpdateSubscriberMethod(NotificationFromProvider);

  UpdateLabels;

  actSecLogoutExecute(Sender);
  actSecLoginExecute(Sender);
end;

procedure TMainForm.JvFormStorage1BeforeSavePlacement(Sender: TObject);
begin
  if DMMain.Company=nil then
    Exit;
  JvFormStorage1.StoredValue['CurrentCompany'] := DMMain.Company.CompanyCode;
  if cbxCurrentYear.Text<>'' then
    JvFormStorage1.StoredValue['CurrentYear'] := StrToInt(cbxCurrentYear.Text);
  JvFormStorage1.StoredValue['CurrentPeriod'] := cbxCurrentPeriod.ItemIndex;
end;

procedure TMainForm.JvFormStorage1RestorePlacement(Sender: TObject);
var
  item : TJvStoredValue;
  itemP : TJvStoredValue;
  itemY : TJvStoredValue;
  code : string;
  D, P, Y : Word;
begin
  code := '';
  DecodeDate(Date, Y, P, D);
  DMMain.FileUploadFolder := JvFormStorage1.StoredValue['FileUploadFolder'];


  item := JvFormStorage1.StoredValues.Values['CurrentCompany']; //.StoredValue['CurrentCompany'].ToString;
  if item<>nil then
    code := item.Value;
  DMMain.SetCurrentCompanyCode(code);
  edSelectCompany.Text := code;

  itemY := JvFormStorage1.StoredValues.Values['CurrentYear'];
  itemP := JvFormStorage1.StoredValues.Values['CurrentPeriod'];
  if itemP<>nil then
    P := itemP.Value;
  if not(P in [0..11]) then
    P := 0;

  if itemY<>nil then
    Y := itemY.Value;

  cbxCurrentYear.Text := IntToStr(Y);
  cbxCurrentPeriod.ItemIndex := P;

end;

procedure TMainForm.NotificationFromProvider(
  const notifyClass: INotificationClass);
var
  tmpNotifClass : TNotificationClass;
begin
  if notifyClass is TNotificationClass then
  begin
    tmpNotifClass := notifyClass as TNotificationClass;
    {
       Add here the codes to notify main form...
    }
  end;
end;

procedure TMainForm.SendActionMessageToActiveForm(aMsg: TBrowseFormCommand);
begin
  if Assigned(JvEmbeddedFormPanel1.LinkedForm) then
  begin
    TTemplateForm(JvEmbeddedFormPanel1.LinkedForm).OrderCommand(aMsg);
  end;
end;

procedure TMainForm.SetViewModel(const newViewModel: IMainViewModelInterface);
begin
  fViewModel := newViewModel;
  UpdateLabels;
end;

procedure TMainForm.UpdateLabels;
begin
  ActionMainMenuBar1.ActionClient.Items[0].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[0].Caption');
  catbtnLeftMenu.Categories[0].Caption := ActionMainMenuBar1.ActionClient.Items[0].Caption;
  ActionMainMenuBar1.ActionClient.Items[1].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[1].Caption');
  catbtnLeftMenu.Categories[1].Caption := ActionMainMenuBar1.ActionClient.Items[1].Caption;
  ActionMainMenuBar1.ActionClient.Items[2].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[2].Caption');
  catbtnLeftMenu.Categories[2].Caption := ActionMainMenuBar1.ActionClient.Items[2].Caption;
  ActionMainMenuBar1.ActionClient.Items[3].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[3].Caption');
  catbtnLeftMenu.Categories[3].Caption := ActionMainMenuBar1.ActionClient.Items[3].Caption;
  ActionMainMenuBar1.ActionClient.Items[4].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[4].Caption');
  catbtnLeftMenu.Categories[4].Caption := ActionMainMenuBar1.ActionClient.Items[4].Caption;
  ActionMainMenuBar1.ActionClient.Items[5].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[5].Caption');
  catbtnLeftMenu.Categories[5].Caption := ActionMainMenuBar1.ActionClient.Items[5].Caption;
  ActionMainMenuBar1.ActionClient.Items[6].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[6].Caption');
  catbtnLeftMenu.Categories[6].Caption := ActionMainMenuBar1.ActionClient.Items[6].Caption;
  ActionMainMenuBar1.ActionClient.Items[7].Caption := ComponentDictionary.GetText(ClassName, 'ActionMainMenuBar1.ActionClient.Items[7].Caption');
  catbtnLeftMenu.Categories[7].Caption := ActionMainMenuBar1.ActionClient.Items[7].Caption;

{
  actViewPersonelGridForm.ImageIndex := 0;
  actStartEmployeeRecruitment.ImageIndex := 1;
  actStartEmployeeJobTermination.ImageIndex := 2;

  actPayrollCalculation.ImageIndex := 3;
  actPayrollExamine.ImageIndex := 4;
  actPayrollClosePeriod.ImageIndex := 5;
  actPayrollChangeYearPeriod.ImageIndex := 6;
  actPayrollTransferToGeneralLedger.ImageIndex := 7;
  actPayrollTotalIncomeTaxBaseEntry.ImageIndex := 8;
  actPayrollScoringEntryForm.ImageIndex := 9;

  actCurrencyDaily.ImageIndex := 12;
  actCurrency.ImageIndex := 13;

  actRepPayrollReportWideDlg.ImageIndex := 14;
  actRepPayrollReportLaserDlg.ImageIndex := 15;
  actRepEnvelopeDumpDlg.ImageIndex := 16;
  actRepPayrollCompendiumDlg.ImageIndex := 17;
  actRepPersonelWageListDlg.ImageIndex := 18;
  actRepPersonnelTimekeepingListDlg.ImageIndex := 19;
  actRepSocialPaymentsListDlg.ImageIndex := 20;
  actRepOtherPaymentsListDlg.ImageIndex := 21;
  actRepOtherCutsListDlg.ImageIndex := 22;
  actRepMonthlySGKPremiumsDeclarationReportDlg.ImageIndex := 23;
  actRepDeclarationReportOfSocialSecurityPremiumSupportDlg.ImageIndex := 24;
  actRepAFour_monthInsurancePremiumsPayrollReportDlg.ImageIndex := 25;
  actRepSGKPremiumsReportDlg.ImageIndex := 26;
  actRepUserDefinedReportsDlg.ImageIndex := 27;

  actParamsCountryEntry.ImageIndex := 28;
  actParamsCityEntry.ImageIndex := 29;
  actParamsTownEntry.ImageIndex := 30;
  actParamsLocationEntry.ImageIndex := 31;
  actParamsLanguageEntry.ImageIndex := 32;
  actParamsDepartmentEntry.ImageIndex := 33;
  actParamsTitleEntry.ImageIndex := 34;
  actParamsBankEntry.ImageIndex := 35;
  actParamsOthIncomeCutsEntry.ImageIndex := 36;
  actParamsRelationshipTypeEntry.ImageIndex := 37;
  actParamsGeneralParameters.ImageIndex := 38;
  actParamsCompanyParameters.ImageIndex := 39;

  actOpsDatabaseConnectionOptions.ImageIndex := 40;
  actOpsProgramOptions.ImageIndex := 41;

  actCompanyList.ImageIndex := 42;

  actSecUser.ImageIndex := 45;
  actSecPermission.ImageIndex := 46;
  actSecGroup.ImageIndex := 47;
  actSecRole.ImageIndex := 48;

}
  actViewPersonelGridForm.Caption := ComponentDictionary.GetText(ClassName, 'actViewPersonelGridForm.Caption');
  actStartEmployeeRecruitment.Caption := ComponentDictionary.GetText(ClassName, 'actStartEmployeeRecruitment.Caption'); //lbltexts.RecruitmentCaption;
  actStartEmployeeJobTermination.Caption := ComponentDictionary.GetText(ClassName, 'actStartEmployeeJobTermination.Caption');//lbltexts.JobTerminationCaption;

  actPayrollCalculation.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollCalculation.Caption');//lbltexts.CalculationCaption;
  actPayrollExamine.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollExamine.Caption');//lbltexts.PayrollExamineCaption;
  actPayrollClosePeriod.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollClosePeriod.Caption');//lbltexts.ClosePeriodCaption;
  actPayrollChangeYearPeriod.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollChangeYearPeriod.Caption');//lbltexts.ChangeYearAndPeriodCaption;
  actPayrollTransferToGeneralLedger.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollTransferToGeneralLedger.Caption');//lbltexts.TransferToGeneralLedgerCaption;
  actPayrollTotalIncomeTaxBaseEntry.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollTotalIncomeTaxBaseEntry.Caption');//lbltexts.TotalIncomeTaxBaseEntryCaption;
  actPayrollScoringEntryForm.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollScoringEntryForm.Caption');//lbltexts.ScoringEntryCaption;
  {
  actPayrollOtherIncomesEntryForm.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollOtherIncomesEntryForm.Caption');//lbltexts.OtherIncomeEntryCaption;
  actPayrollOtherIncomesEntryForm.ImageIndex := 10;
  actPayrollOtherCutsEntryForm.Caption := ComponentDictionary.GetText(ClassName, 'actPayrollOtherCutsEntryForm.Caption');//lbltexts.OtherCutsEntryCaption;
  actPayrollOtherCutsEntryForm.ImageIndex := 11;
  }

  actCurrencyDaily.Caption := ComponentDictionary.GetText(ClassName, 'actCurrencyDaily.Caption');//lbltexts.CurrencyDaily;
  actCurrency.Caption := ComponentDictionary.GetText(ClassName, 'actCurrency.Caption');//lbltexts.Currency;

  actRepPayrollReportWideDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepPayrollReportWideDlg.Caption');//lbltexts.PayrollReportWideCaption;
  actRepPayrollReportLaserDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepPayrollReportLaserDlg.Caption');//lbltexts.PayrollReportLaserCaption;
  actRepEnvelopeDumpDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepEnvelopeDumpDlg.Caption');//lbltexts.EnvelopeDumpCaption;
  actRepPayrollCompendiumDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepPayrollCompendiumDlg.Caption');//lbltexts.PayrollCompendiumCaption;
  actRepPersonelWageListDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepPersonelWageListDlg.Caption');//lbltexts.PersonelWageListCaption;
  actRepPersonnelTimekeepingListDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepPersonnelTimekeepingListDlg.Caption');//lbltexts.PersonnelTimekeepingListCaption;
  actRepSocialPaymentsListDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepSocialPaymentsListDlg.Caption');//lbltexts.SocialPaymentsListCaption;
  actRepOtherPaymentsListDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepOtherPaymentsListDlg.Caption');//lbltexts.OtherPaymentsListCaption;
  actRepOtherCutsListDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepOtherCutsListDlg.Caption');//lbltexts.OtherCutsEntryCaption;
  actRepMonthlySGKPremiumsDeclarationReportDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepMonthlySGKPremiumsDeclarationReportDlg.Caption');//lbltexts.MonthlySGKPremiumsDeclarationReportCaption;
  actRepDeclarationReportOfSocialSecurityPremiumSupportDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepDeclarationReportOfSocialSecurityPremiumSupportDlg.Caption');//lbltexts.DeclarationReportOfSocialSecurityPremiumSupportCaption;
  actRepAFour_monthInsurancePremiumsPayrollReportDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepAFour_monthInsurancePremiumsPayrollReportDlg.Caption');//lbltexts.AFour_monthInsurancePremiumsPayrollReportCaption;
  actRepSGKPremiumsReportDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepSGKPremiumsReportDlg.Caption');//lbltexts.SGKPremiumsReportCaption;
  actRepUserDefinedReportsDlg.Caption := ComponentDictionary.GetText(ClassName, 'actRepUserDefinedReportsDlg.Caption');//lbltexts.UserDefinedReportsCaption;

  actParamsCountryEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsCountryEntry.Caption');//lbltexts.CountryEntryCaption;
  actParamsCityEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsCityEntry.Caption');//lbltexts.CityEntryCaption;
  actParamsTownEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsTownEntry.Caption');//lbltexts.TownEntryCaption;
  actParamsLocationEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsLocationEntry.Caption');//lbltexts.LocationEntryCaption;
  actParamsLanguageEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsLanguageEntry.Caption');//lbltexts.LanguageEntryCaption;
  actParamsDepartmentEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsDepartmentEntry.Caption');//lbltexts.DepartmentEntryCaption;
  actParamsTitleEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsTitleEntry.Caption');//lbltexts.TitleEntryCaption;
  actParamsBankEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsBankEntry.Caption');//lbltexts.BankEntryCaption;
  actParamsOthIncomeCutsEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsOthIncomeCutsEntry.Caption');//lbltexts.OthIncomeCutsEntryCaption;
  actParamsRelationshipTypeEntry.Caption := ComponentDictionary.GetText(ClassName, 'actParamsRelationshipTypeEntry.Caption');//lbltexts.RelationshipTypeEntryCaption;
  actParamsGeneralParameters.Caption := ComponentDictionary.GetText(ClassName, 'actParamsGeneralParameters.Caption');//lbltexts.GeneralParametersCaption;
  actParamsCompanyParameters.Caption := ComponentDictionary.GetText(ClassName, 'actParamsCompanyParameters.Caption');//lbltexts.CompanyParametersCaption;

  actOpsDatabaseConnectionOptions.Caption := ComponentDictionary.GetText(ClassName, 'actOpsDatabaseConnectionOptions.Caption');//lbltexts.DatabaseConnectionOptionsCaption;
  actOpsProgramOptions.Caption := ComponentDictionary.GetText(ClassName, 'actOpsProgramOptions.Caption');//lbltexts.ProgramOptionsCaption;

  actCompanyList.Caption := ComponentDictionary.GetText(ClassName, 'actCompanyList.Caption');//lbltexts.CompanyListCaption;

  actSecUser.Caption := ComponentDictionary.GetText(ClassName, 'actSecUser.Caption');//lbltexts.UserEntryCaption;
  actSecPermission.Caption := ComponentDictionary.GetText(ClassName, 'actSecPermission.Caption');//lbltexts.PermissionEntryCaption;
  actSecGroup.Caption := ComponentDictionary.GetText(ClassName, 'actSecGroup.Caption');//lbltexts.GroupEntryCaption;
  actSecRole.Caption := ComponentDictionary.GetText(ClassName, 'actSecRole.Caption');//lbltexts.RoleEntryCaption;

  catbtnLeftMenu.Categories[0].Items[0].Action := actViewPersonelGridForm;
  catbtnLeftMenu.Categories[0].Items[1].Action := actStartEmployeeRecruitment;
  catbtnLeftMenu.Categories[0].Items[2].Action := actStartEmployeeJobTermination;

  catbtnLeftMenu.Categories[1].Items[0].Action := actPayrollCalculation;
  catbtnLeftMenu.Categories[1].Items[1].Action := actPayrollExamine;
  catbtnLeftMenu.Categories[1].Items[2].Action := actPayrollClosePeriod;
  catbtnLeftMenu.Categories[1].Items[3].Action := actPayrollChangeYearPeriod;
  catbtnLeftMenu.Categories[1].Items[4].Action := actPayrollTransferToGeneralLedger;
  catbtnLeftMenu.Categories[1].Items[5].Action := actPayrollTotalIncomeTaxBaseEntry;
  catbtnLeftMenu.Categories[1].Items[6].Action := actPayrollScoringEntryForm;
  catbtnLeftMenu.Categories[1].Items[7].Action := actPayrollOtherIncomesCutsEntryForm;

  catbtnLeftMenu.Categories[2].Items[0].Action := actCurrencyDaily;
  catbtnLeftMenu.Categories[2].Items[1].Action := actCurrency;

  catbtnLeftMenu.Categories[3].Items[0].Action := actRepPayrollReportWideDlg;

  catbtnLeftMenu.Categories[3].Items[1].Action := actRepPayrollReportLaserDlg;
  catbtnLeftMenu.Categories[3].Items[2].Action := actRepEnvelopeDumpDlg;
  catbtnLeftMenu.Categories[3].Items[3].Action := actRepPayrollCompendiumDlg;
  catbtnLeftMenu.Categories[3].Items[4].Action := actRepPersonelWageListDlg;
  catbtnLeftMenu.Categories[3].Items[5].Action := actRepPersonnelTimekeepingListDlg;
  catbtnLeftMenu.Categories[3].Items[6].Action := actRepSocialPaymentsListDlg;
  catbtnLeftMenu.Categories[3].Items[7].Action := actRepOtherPaymentsListDlg;
  catbtnLeftMenu.Categories[3].Items[8].Action := actRepOtherCutsListDlg;
  catbtnLeftMenu.Categories[3].Items[9].Action := actRepMonthlySGKPremiumsDeclarationReportDlg;
  catbtnLeftMenu.Categories[3].Items[10].Action := actRepDeclarationReportOfSocialSecurityPremiumSupportDlg;
  catbtnLeftMenu.Categories[3].Items[11].Action := actRepAFour_monthInsurancePremiumsPayrollReportDlg;
  catbtnLeftMenu.Categories[3].Items[12].Action := actRepSGKPremiumsReportDlg;
  catbtnLeftMenu.Categories[3].Items[13].Action := actRepUserDefinedReportsDlg;

  catbtnLeftMenu.Categories[4].Items[0].Action := actParamsCountryEntry;
  catbtnLeftMenu.Categories[4].Items[1].Action := actParamsCityEntry;
  catbtnLeftMenu.Categories[4].Items[2].Action := actParamsTownEntry;
  catbtnLeftMenu.Categories[4].Items[3].Action := actParamsLocationEntry;
  catbtnLeftMenu.Categories[4].Items[4].Action := actParamsLanguageEntry;
  catbtnLeftMenu.Categories[4].Items[5].Action := actParamsDepartmentEntry;
  catbtnLeftMenu.Categories[4].Items[6].Action := actParamsTitleEntry;
  catbtnLeftMenu.Categories[4].Items[7].Action := actParamsBankEntry;
  catbtnLeftMenu.Categories[4].Items[8].Action := actParamsOthIncomeCutsEntry;
  catbtnLeftMenu.Categories[4].Items[9].Action := actParamsRelationshipTypeEntry;
  catbtnLeftMenu.Categories[4].Items[10].Action := actParamsGeneralParameters;
  catbtnLeftMenu.Categories[4].Items[11].Action := actParamsCompanyParameters;

  catbtnLeftMenu.Categories[5].Items[0].Action := actOpsDatabaseConnectionOptions;
  catbtnLeftMenu.Categories[5].Items[1].Action := actOpsProgramOptions;

  catbtnLeftMenu.Categories[6].Items[0].Action := actCompanyList;

  catbtnLeftMenu.Categories[7].Items[0].Action := actSecUser;
  catbtnLeftMenu.Categories[7].Items[0].ImageIndex := actSecUser.ImageIndex;
  catbtnLeftMenu.Categories[7].Items[1].Action := actSecPermission;
  catbtnLeftMenu.Categories[7].Items[1].ImageIndex := actSecPermission.ImageIndex;
  catbtnLeftMenu.Categories[7].Items[2].Action := actSecGroup;
  catbtnLeftMenu.Categories[7].Items[2].ImageIndex := actSecGroup.ImageIndex;
  catbtnLeftMenu.Categories[7].Items[3].Action := actSecRole;
  catbtnLeftMenu.Categories[7].Items[3].ImageIndex := actSecRole.ImageIndex;

  catbtnLeftMenu.Categories[0].Items[0].ImageIndex := actViewPersonelGridForm.ImageIndex;
  catbtnLeftMenu.Categories[0].Items[1].ImageIndex := actStartEmployeeRecruitment.ImageIndex;
  catbtnLeftMenu.Categories[0].Items[2].ImageIndex := actStartEmployeeJobTermination.ImageIndex;

  catbtnLeftMenu.Categories[1].Items[0].ImageIndex := actPayrollCalculation.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[1].ImageIndex := actPayrollExamine.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[2].ImageIndex := actPayrollClosePeriod.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[3].ImageIndex := actPayrollChangeYearPeriod.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[4].ImageIndex := actPayrollTransferToGeneralLedger.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[5].ImageIndex := actPayrollTotalIncomeTaxBaseEntry.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[6].ImageIndex := actPayrollScoringEntryForm.ImageIndex;
  catbtnLeftMenu.Categories[1].Items[7].ImageIndex := actPayrollOtherIncomesCutsEntryForm.ImageIndex;

  catbtnLeftMenu.Categories[2].Items[0].ImageIndex := actCurrencyDaily.ImageIndex;
  catbtnLeftMenu.Categories[2].Items[1].ImageIndex := actCurrency.ImageIndex;

  catbtnLeftMenu.Categories[3].Items[0].ImageIndex := actRepPayrollReportWideDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[1].ImageIndex := actRepPayrollReportLaserDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[2].ImageIndex := actRepEnvelopeDumpDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[3].ImageIndex := actRepPayrollCompendiumDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[4].ImageIndex := actRepPersonelWageListDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[5].ImageIndex := actRepPersonnelTimekeepingListDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[6].ImageIndex := actRepSocialPaymentsListDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[7].ImageIndex := actRepOtherPaymentsListDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[8].ImageIndex := actRepOtherCutsListDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[9].ImageIndex := actRepMonthlySGKPremiumsDeclarationReportDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[10].ImageIndex := actRepDeclarationReportOfSocialSecurityPremiumSupportDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[11].ImageIndex := actRepAFour_monthInsurancePremiumsPayrollReportDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[12].ImageIndex := actRepSGKPremiumsReportDlg.ImageIndex;
  catbtnLeftMenu.Categories[3].Items[13].ImageIndex := actRepUserDefinedReportsDlg.ImageIndex;

  catbtnLeftMenu.Categories[4].Items[0].ImageIndex := actParamsCountryEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[1].ImageIndex := actParamsCityEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[2].ImageIndex := actParamsTownEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[3].ImageIndex := actParamsLocationEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[4].ImageIndex := actParamsLanguageEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[5].ImageIndex := actParamsDepartmentEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[6].ImageIndex := actParamsTitleEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[7].ImageIndex := actParamsBankEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[8].ImageIndex := actParamsOthIncomeCutsEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[9].ImageIndex := actParamsRelationshipTypeEntry.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[10].ImageIndex := actParamsGeneralParameters.ImageIndex;
  catbtnLeftMenu.Categories[4].Items[11].ImageIndex := actParamsCompanyParameters.ImageIndex;

  catbtnLeftMenu.Categories[5].Items[0].ImageIndex := actOpsDatabaseConnectionOptions.ImageIndex;
  catbtnLeftMenu.Categories[5].Items[1].ImageIndex := actOpsProgramOptions.ImageIndex;

  catbtnLeftMenu.Categories[6].Items[0].ImageIndex := actCompanyList.ImageIndex;

end;

end.
