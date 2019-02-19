unit View.CompanyEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, JvComponentBase,
  JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Model.ProSu.Interfaces,
  Model.Declarations,
  Model.FormDeclarations,
  Model.LanguageDictionary, Data.DB, JvDBLookupTreeView, JvExMask, JvToolEdit,
  JvDBLookup, JvDBLookupComboEdit, JvExControls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids,
  Spring.Data.ObjectDataSet, JvExComCtrls, JvDBTreeView;

type
  TCompanyEditForm = class(TTemplateEdit)
    labelCompanyCode: TLabel;
    labelCompanyName: TLabel;
    labelAddress: TLabel;
    labelStreet: TLabel;
    labellShortName: TLabel;
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
    edCompanyCode: TDBEdit;
    edCompanyName1: TDBEdit;
    edCompanyName2: TDBEdit;
    edCompanyAddress1: TDBEdit;
    edCompanyAddress2: TDBEdit;
    edCompanyAddress3: TDBEdit;
    edStreet: TDBEdit;
    edShortName: TDBEdit;
    edTaxOffice: TDBEdit;
    edTaxRegistrationNumber: TDBEdit;
    labelPostCode: TLabel;
    edPostCode: TDBEdit;
    edPhone1: TDBEdit;
    edPhone2: TDBEdit;
    edFax: TDBEdit;
    edEmployeeName1: TDBEdit;
    edEmployeeName2: TDBEdit;
    edResponsible1: TDBEdit;
    edResponsible2: TDBEdit;
    dsIlIlce: TDataSource;
    JvDBLookupTreeViewCombo1: TJvDBLookupTreeViewCombo;
    procedure FormCreate(Sender: TObject);
  private
    FCCTownODS : TObjectDataSet;
    class function RequiredPermission(cmd: TBrowseFormCommand): string; override;
  protected

    procedure PostRec; virtual;
    procedure PostAsTemplateRec; virtual;
    procedure CancelRec; virtual;
  public
  end;


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

{type
  [Entity]
  [Table]
  TCCTown = class
  private
    FId: Integer;
    FName: string;
    FLevel: Integer;
    FParentId: Integer;
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
}
procedure TCompanyEditForm.CancelRec;
begin

end;

procedure TCompanyEditForm.FormCreate(Sender: TObject);
var //lCountry : IList<TCountry>;
  LCountryIlIlce : IObjectList;
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');

  LCountryIlIlce := TTownCityCountyTree.GetTreeList(DMMain.Session);
  {DMMain.Session.GetList<TTownCityCountyTree>('select CountryId + 100000 as Id, CountryName as `Name`, 0 as `Level`, 0 as ParentId from Country '+
    'union all '+
    'select CityId + 10000 as Id, CityName as `Name`, 1 as `Level`, CountryId + 100000 as ParentId from City '+
    'union all '+
    'select TownId as Id, TownName as `Name`, 2 as `Level`, CityId + 10000 as ParentId from Town;;', []);
  }
  FCCTownODS := TObjectDataset.Create(self);
  FCCTownODS.DataList := LCountryIlIlce as IObjectList;
  FCCTownODS.Open;
  dsIlIlce.DataSet := FCCTownODS;
  
  labelCompanyCode.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyCode.Caption');
  labelCompanyName.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyName.Caption');
  labelStreet.Caption := ComponentDictionary.GetText(ClassName, 'labelStreet.Caption');
  labellShortName.Caption := ComponentDictionary.GetText(ClassName, 'labellShortName.Caption');
  labelAddress.Caption := ComponentDictionary.GetText(ClassName, 'labelAddress.Caption');
  labelStreet.Caption := ComponentDictionary.GetText(ClassName, 'labelStreet.Caption');

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

procedure TCompanyEditForm.PostAsTemplateRec;
begin

end;

procedure TCompanyEditForm.PostRec;
begin

end;

class function TCompanyEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3502';
    efcmdEdit: Result := '3503';
    efcmdDelete: Result := '3504';
    efcmdViewDetail: Result := '3505';
  end;
end;

end.
