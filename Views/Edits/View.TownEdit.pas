unit View.TownEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, JvExControls,
  JvDBLookupTreeView, Vcl.Mask, Vcl.DBCtrls,
  Spring.Data.ObjectDataset,
  Model.FormDeclarations,
  Model.Declarations;

type
  TTownEditForm = class(TTemplateEdit)
    labelTownName: TLabel;
    labelCityId: TLabel;
    edTownName: TDBEdit;
    edCityId: TJvDBLookupTreeViewCombo;
    dsCityCountry: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fCityCountryDataset : TObjectDataset;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
    { Public declarations }
  end;

var
  TownEditForm: TTownEditForm;

implementation
uses
  Spring.Collections,
  Model.LanguageDictionary,
  Model.CityCountryTree,
  MainDM;
{$R *.dfm}

procedure TTownEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelTownName.Caption := ComponentDictionary.GetText(ClassName, 'labelTownName.Caption');
  labelCityId.Caption := ComponentDictionary.GetText(ClassName, 'labelCityId.Caption');

  edCityId.DataField := 'CityId';
  edCityId.DataSource := DataSource1;
  edCityId.DetailField := 'ParentId';
  edCityId.KeyField := 'Id';
  edCityId.ListField := 'Name';
  edCityId.ListSource := dsCityCountry;
  edCityId.MasterField := 'Id';
  edCityId.DropDownWidth := 450;
  edCityId.DropDownHeight := 250;
  edCityId.StartMasterValue := '0';

  fCityCountryDataset := TObjectDataset.Create(self);
  fCityCountryDataset.DataList := TCityCountyTree.GetTreeList(DMMain.Session);
  fCityCountryDataset.Open;
  dsCityCountry.DataSet := fCityCountryDataset;
end;

procedure TTownEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCityCountryDataset.Free;
end;

class function TTownEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3022';
    efcmdEdit: Result := '3023';
    efcmdDelete: Result := '3024';
    efcmdViewDetail: Result := '3025';
  end;

end;

end.
