unit View.OthIncomeOutcomeDefEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExControls, JvDBLookup,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Spring.Data.ObjectDataset,
  Model.FormDeclarations, SynEditHighlighter, SynHighlighterPas, SynEdit,
  SynDBEdit, Vcl.DBCtrls, Vcl.Mask;

type
  TOthIncomeOutcomeDefEditForm = class(TTemplateEdit)
    labelCompanyId: TLabel;
    edCompanyId: TJvDBLookupCombo;
    dsCompany: TDataSource;
    edIncomeOutcome: TDBRadioGroup;
    labelCode: TLabel;
    edCode: TDBEdit;
    edDescription: TDBEdit;
    labelDescription: TLabel;
    edComputationType: TDBRadioGroup;
    edIncomeTaxOk: TDBCheckBox;
    edSgkCutOk: TDBCheckBox;
    edWageStampDutyOk: TDBCheckBox;
    edOtvCutOk: TDBCheckBox;
    labelOtvCutPercentage: TLabel;
    edOtvCutPercentage: TDBEdit;
    edIsNet: TDBCheckBox;
    edAmount: TDBEdit;
    labelAmount: TLabel;
    edPercentage: TDBEdit;
    labelPercentage: TLabel;
    labelCurrencyId: TLabel;
    edCurrencyId: TJvDBLookupCombo;
    edComputationText: TDBSynEdit;
    labelComputationText: TLabel;
    SynPasSyn1: TSynPasSyn;
    dsCurrency: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    fCompanyDataset : TObjectDataset;
    fCurrencyDataset : TObjectDataset;
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
  end;

var
  OthIncomeOutcomeDefEditForm: TOthIncomeOutcomeDefEditForm;

implementation
uses
  Spring.Collections,
  MainDM,
  Spring.Persistence.Criteria.Restrictions;

{$R *.dfm}

{ TOthIncomeOutcomeDefEditForm }

procedure TOthIncomeOutcomeDefEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelCode.Caption := ComponentDictionary.GetText(ClassName, 'labelCode.Caption');
  labelDescription.Caption := ComponentDictionary.GetText(ClassName, 'labelDescription.Caption');
  edIncomeOutcome.Caption := ComponentDictionary.GetText(ClassName, 'edIncomeOutcome.Caption');
  edComputationType.Caption := ComponentDictionary.GetText(ClassName, 'edComputationType.Caption');
  edIncomeTaxOk.Caption := ComponentDictionary.GetText(ClassName, 'edIncomeTaxOk.Caption');
  edSgkCutOk.Caption := ComponentDictionary.GetText(ClassName, 'edSgkCutOk.Caption');
  edWageStampDutyOk.Caption := ComponentDictionary.GetText(ClassName, 'edWageStampDutyOk.Caption');
  edOtvCutOk.Caption := ComponentDictionary.GetText(ClassName, 'edOtvCutOk.Caption');
  labelOtvCutPercentage.Caption := ComponentDictionary.GetText(ClassName, 'labelOtvCutPercentage.Caption');
  edIsNet.Caption := ComponentDictionary.GetText(ClassName, 'edIsNet.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  labelAmount.Caption := ComponentDictionary.GetText(ClassName, 'labelAmount.Caption');
  labelPercentage.Caption := ComponentDictionary.GetText(ClassName, 'labelPercentage.Caption');
  labelCurrencyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCurrencyId.Caption');
  labelComputationText.Caption := ComponentDictionary.GetText(ClassName, 'labelComputationText.Caption');

  edIncomeOutcome.Items.Text := ComponentListDictionary.GetText(ClassName, 'edIncomeOutcome.Items.Text');
  edComputationType.Items.Text := ComponentListDictionary.GetText(ClassName, 'edComputationType.Items.Text');
end;

procedure TOthIncomeOutcomeDefEditForm.FormLoaded;
begin
  if DataSource1.DataSet.State=dsInsert then
  begin
    DataSource1.DataSet.FieldByName('ComputationType').AsInteger := 0;
    DataSource1.DataSet.FieldByName('IncomeTaxOk').AsBoolean := True;
    DataSource1.DataSet.FieldByName('SgkCutOk').AsBoolean := False;
    DataSource1.DataSet.FieldByName('WageStampDutyOk').AsBoolean := True;
    DataSource1.DataSet.FieldByName('OtvCutOk').AsBoolean := False;
    DataSource1.DataSet.FieldByName('IsNet').AsBoolean := True;
    DataSource1.DataSet.FieldByName('CompanyId').AsInteger := DMMain.Company.CompanyId;
  end;

  fCompanyDataset := TObjectDataset.Create(self);
  fCompanyDataset.DataList := DMMain.Session.FindWhere<TCompany>(Restrictions.NotEq('IsDeleted', -1)) as IObjectList;
  fCompanyDataset.Open;
  dsCompany.DataSet := fCompanyDataset;

  fCurrencyDataset := TObjectDataset.Create(self);
  dsCurrency.DataSet := fCurrencyDataset;
  fCurrencyDataset.DataList := DMMain.Session.CreateCriteria<TCurrency>
                                            .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  fCurrencyDataset.Open;
end;

class function TOthIncomeOutcomeDefEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3542';
    efcmdEdit: Result := '3543';
    efcmdDelete: Result := '3544';
    efcmdViewDetail: Result := '3545';
  end;
end;

end.
