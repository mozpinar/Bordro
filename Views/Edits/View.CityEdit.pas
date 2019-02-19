unit View.CityEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Spring.Data.ObjectDataset,
  Model.FormDeclarations, Vcl.DBCtrls, Vcl.Mask;

type
  TCityEditForm = class(TTemplateEdit)
    labelCityName: TLabel;
    labelCountryId: TLabel;
    edCityName: TDBEdit;
    edCountryId: TDBLookupComboBox;
    dsCountry: TDataSource;
    labelCityCode: TLabel;
    edCityCode: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fCountryDataset : TObjectDataset;
  protected
    class procedure CheckAuthorize(cmd : TBrowseFormCommand); override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
    { Public declarations }
  end;

implementation
uses
  Spring.Collections,
  MainDM;
{$R *.dfm}

class procedure TCityEditForm.CheckAuthorize(cmd: TBrowseFormCommand);
begin
  if not DMMain.Authorize(RequiredPermission(cmd)) then
    raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityEditForm');
end;

class function TCityEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3012';
    efcmdEdit: Result := '3013';
    efcmdDelete: Result := '3014';
    efcmdViewDetail: Result := '3015';
  end;
end;

procedure TCityEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelCityName.Caption := ComponentDictionary.GetText(ClassName, 'labelCityName.Caption');
  labelCityCode.Caption := ComponentDictionary.GetText(ClassName, 'labelCityCode.Caption');
  labelCountryId.Caption := ComponentDictionary.GetText(ClassName, 'labelCountryId.Caption');

  fCountryDataset := TObjectDataset.Create(self);
  fCountryDataset.DataList := DMMain.Session.FindAll<TCountry> as IObjectList;
  fCountryDataset.Open;
  dsCountry.DataSet := fCountryDataset;
end;

procedure TCityEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCountryDataset.Free;
end;

end.
