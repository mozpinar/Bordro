unit View.CountryEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Model.FormDeclarations, JvComponentBase, JvFormPlacement, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TCountryEditForm = class(TTemplateEdit)
    labelCountryName: TLabel;
    labelCountryCode2: TLabel;
    labelCountryCode3: TLabel;
    edCountryName: TDBEdit;
    edCountryCode2: TDBEdit;
    edCountryCode3: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    class function RequiredPermission(cmd: TBrowseFormCommand): string; override;
  public
  end;


implementation

{$R *.dfm}
procedure TCountryEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelCountryName.Caption := ComponentDictionary.GetText(ClassName, 'labelCountryName.Caption');
  labelCountryCode2.Caption := ComponentDictionary.GetText(ClassName, 'labelCountryCode2.Caption');
  labelCountryCode3.Caption := ComponentDictionary.GetText(ClassName, 'labelCountryCode3.Caption');
end;

class function TCountryEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3002';
    efcmdEdit: Result := '3003';
    efcmdDelete: Result := '3004';
    efcmdViewDetail: Result := '3005';
  end;
end;

end.
