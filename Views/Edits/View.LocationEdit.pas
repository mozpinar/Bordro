unit View.LocationEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, JvExControls,
  JvDBLookupTreeView, Vcl.Mask, Vcl.DBCtrls,
  Model.ProSu.Interfaces,
  Model.Declarations,
  Model.FormDeclarations,
  Model.LanguageDictionary,
  Spring.Data.ObjectDataSet, Vcl.Buttons, JvDBLookup;

type
  TLocationEditForm = class(TTemplateEdit)
    labelLocationCode: TLabel;
    labelLocationName: TLabel;
    labelAddress: TLabel;
    labelStreet: TLabel;
    labelPhone1: TLabel;
    labelPhone2: TLabel;
    labelFax: TLabel;
    labelTown: TLabel;
    labelTaxOffice: TLabel;
    labelTaxRegistrationNumber: TLabel;
    labelEmployeeName1: TLabel;
    labelEmployeeName2: TLabel;
    labelResponsible1: TLabel;
    labelResponsible2: TLabel;
    labelPostCode: TLabel;
    edLocationCode: TDBEdit;
    edLocationName: TDBEdit;
    edLocationAddress1: TDBEdit;
    edLocationAddress2: TDBEdit;
    edLocationAddress3: TDBEdit;
    edStreet: TDBEdit;
    edTaxOffice: TDBEdit;
    edTaxRegistrationNumber: TDBEdit;
    edPostCode: TDBEdit;
    edPhone1: TDBEdit;
    edPhone2: TDBEdit;
    edFax: TDBEdit;
    edEmployeeName1: TDBEdit;
    edEmployeeName2: TDBEdit;
    edResponsible1: TDBEdit;
    edResponsible2: TDBEdit;
    JvDBLookupTreeViewCombo1: TJvDBLookupTreeViewCombo;
    edRegion: TDBEdit;
    labelRegion: TLabel;
    dsIlIlce: TDataSource;
    edLongtitude: TDBEdit;
    labelLongtitude: TLabel;
    edLatitude: TDBEdit;
    labelLatitude: TLabel;
    btnFindGpsLoc: TSpeedButton;
    labelCompany: TLabel;
    JvDBLookupCombo1: TJvDBLookupCombo;
    dsCompany: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    fCompanyDS : TObjectDataset;
    FCCTownODS : TObjectDataSet;
    class function RequiredPermission(cmd: TBrowseFormCommand): string; override;
  protected

    procedure PostRec; virtual;
    procedure PostAsTemplateRec; virtual;
    procedure CancelRec; virtual;
    procedure BeforePost(DataSet: TDataSet); override;
    procedure FormLoaded; override;
  public
    { Public declarations }
  end;

//var
//  LocationEditForm: TLocationEditForm;

implementation
uses
  Spring.Collections,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Mapping.Attributes,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Model.TownCityCountryTree,
  MainDM;

{$R *.dfm}

{ TLocationEditForm }

procedure TLocationEditForm.BeforePost(DataSet: TDataSet);
var id, lvl : Integer;
begin
  id := DataSource1.DataSet.FieldByName('TownId').AsInteger;
  if (id>0) and (dsIlIlce.DataSet.Locate('Id', IntToStr(id), [])) then
    if dsIlIlce.DataSet.FieldByName('Level').AsInteger>0 then
      raise Exception.Create(MessageDictionary.GetMessage('SThisOptionCantSelected'));
end;

procedure TLocationEditForm.CancelRec;
begin

end;

procedure TLocationEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');

  FCCTownODS := TObjectDataset.Create(self);
  FCCTownODS.DataList := TTownCityCountyTree.GetTreeList(DMMain.Session);
  FCCTownODS.Open;
  dsIlIlce.DataSet := FCCTownODS;

  labelLocationCode.Caption := ComponentDictionary.GetText(ClassName, 'labelLocationCode.Caption');
  labelLocationName.Caption := ComponentDictionary.GetText(ClassName, 'labelLocationName.Caption');
  labelStreet.Caption := ComponentDictionary.GetText(ClassName, 'labelStreet.Caption');
  labelAddress.Caption := ComponentDictionary.GetText(ClassName, 'labelAddress.Caption');
  labelStreet.Caption := ComponentDictionary.GetText(ClassName, 'labelStreet.Caption');
  labelRegion.Caption := ComponentDictionary.GetText(ClassName, 'labelRegion.Caption');

  labelTown.Caption := ComponentDictionary.GetText(ClassName, 'labelTown.Caption');
  labelPostCode.Caption := ComponentDictionary.GetText(ClassName, 'labelPostCode.Caption');
  labelPhone1.Caption := ComponentDictionary.GetText(ClassName, 'labelPhone1.Caption');
  labelPhone2.Caption := ComponentDictionary.GetText(ClassName, 'labelPhone2.Caption');
  labelFax.Caption := ComponentDictionary.GetText(ClassName, 'labelFax.Caption');
  labelEmployeeName1.Caption := ComponentDictionary.GetText(ClassName, 'labelEmployeeName1.Caption');
  labelEmployeeName2.Caption := ComponentDictionary.GetText(ClassName, 'labelEmployeeName2.Caption');
  labelResponsible1.Caption := ComponentDictionary.GetText(ClassName, 'labelResponsible1.Caption');
  labelResponsible2.Caption := ComponentDictionary.GetText(ClassName, 'labelResponsible2.Caption');
  labelTaxOffice.Caption := ComponentDictionary.GetText(ClassName, 'labelTaxOffice.Caption');
  labelTaxRegistrationNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelTaxRegistrationNumber.Caption');
end;

procedure TLocationEditForm.FormLoaded;
begin
  fCompanyDS := TObjectDataset.Create(self);
  fCompanyDS.DataList := DMMain.Session.CreateCriteria<TCompany>   //.Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId))
                                              .Add(Restrictions.NotEq('IsDeleted', -1)).ToList as IObjectList;
  dsCompany.DataSet := fCompanyDS;
  fCompanyDS.Open;
end;

procedure TLocationEditForm.PostAsTemplateRec;
begin

end;

procedure TLocationEditForm.PostRec;
begin

end;

class function TLocationEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3032';
    efcmdEdit: Result := '3033';
    efcmdDelete: Result := '3034';
    efcmdViewDetail: Result := '3035';
  end;
end;

end.
