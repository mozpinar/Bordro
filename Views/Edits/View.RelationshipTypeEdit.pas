unit View.RelationshipTypeEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls,
  Model.ProSu.Interfaces,
  Model.Declarations,
  Model.FormDeclarations,
  Model.LanguageDictionary,
  Spring.Data.ObjectDataSet;

type
  TRelationshipTypeEditForm = class(TTemplateEdit)
    edRelationshipTypeName: TDBEdit;
    labelRelationshipTypeName: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    class function RequiredPermission(cmd: TBrowseFormCommand): string; override;
  public
    { Public declarations }
  end;

//var
//  RelationshipTypeEditForm: TRelationshipTypeEditForm;

implementation
uses
  Spring.Collections,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Mapping.Attributes,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  MainDM;

{$R *.dfm}

procedure TRelationshipTypeEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');

  labelRelationshipTypeName.Caption := ComponentDictionary.GetText(ClassName, 'labelRelationshipTypeName.Caption');
end;

class function TRelationshipTypeEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3052';
    efcmdEdit: Result := '3053';
    efcmdDelete: Result := '3054';
    efcmdViewDetail: Result := '3055';
  end;
end;

end.
