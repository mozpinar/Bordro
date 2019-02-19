unit View.CurrencyEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Model.FormDeclarations;

type
  TCurrencyEditForm = class(TTemplateEdit)
    labelCurrencyCode: TLabel;
    labelCurrencyName: TLabel;
    labelSortOrder: TLabel;
    labelMultiplier: TLabel;
    labelPrecisionNumber: TLabel;
    labelRefId: TLabel;
    edCurrencyCode: TDBEdit;
    edCurrencyName: TDBEdit;
    edSortOrder: TDBEdit;
    edMultiplier: TDBEdit;
    edPrecisionNumber: TDBEdit;
    edRefId: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    class function RequiredPermission(cmd: TBrowseFormCommand): string; override;
  public
    { Public declarations }
  end;

var
  CurrencyEditForm: TCurrencyEditForm;

implementation
uses
  Model.LanguageDictionary;
{$R *.dfm}

procedure TCurrencyEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelCurrencyCode.Caption := ComponentDictionary.GetText(ClassName, 'labelCurrencyCode.Caption');
  labelCurrencyName.Caption := ComponentDictionary.GetText(ClassName, 'labelCurrencyName.Caption');
  labelSortOrder.Caption := ComponentDictionary.GetText(ClassName, 'labelSortOrder.Caption');
  labelMultiplier.Caption := ComponentDictionary.GetText(ClassName, 'labelMultiplier.Caption');
  labelPrecisionNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelPrecisionNumber.Caption');
  labelRefId.Caption := ComponentDictionary.GetText(ClassName, 'labelRefId.Caption');

end;

class function TCurrencyEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3902';
    efcmdEdit: Result := '3903';
    efcmdDelete: Result := '3904';
    efcmdViewDetail: Result := '3905';
  end;
end;

end.
