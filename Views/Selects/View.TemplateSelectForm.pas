unit View.TemplateSelectForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvComponentBase,
  JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Model.MosObjectDataset,
  Spring.Data.ObjectDataSet;

type
  TTemplateSelectForm = class(TForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Panel21: TPanel;
    JvFormStorage1: TJvFormStorage;
    DataSource1: TDataSource;
    JvDBUltimGrid1: TJvDBUltimGrid;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure JvDBUltimGrid1DblClick(Sender: TObject);
  private
  protected
    fObjectDataset : TMosObjectDataset;
    procedure UpdateLabelsText; virtual;
    procedure OpenDataset; virtual; abstract;
  public
    { Public declarations }
    class function ExecuteSelect(aFieldSelected : string; var aValue : string) : Boolean;
  end;

implementation
uses
  Model.LanguageDictionary;
{$R *.dfm}

{ TTemplateSelectForm }

class function TTemplateSelectForm.ExecuteSelect(aFieldSelected : string; var aValue : string): Boolean;
begin
  with inherited Create(Application) do
  begin
    Result := False;
    OpenDataset;
    fObjectDataset.Locate(aFieldSelected, aValue, []);
    if ShowModal=mrOk then
    begin
      Result := True;
      aValue := fObjectDataset.FieldByName(aFieldSelected).AsString;
      Free;
    end;
  end;

end;

procedure TTemplateSelectForm.FormCreate(Sender: TObject);
begin
  fObjectDataset := TMosObjectDataset.Create(self);
end;

procedure TTemplateSelectForm.JvDBUltimGrid1DblClick(Sender: TObject);
begin
  btnOk.Click;
end;

procedure TTemplateSelectForm.UpdateLabelsText;
begin
  Caption := ComponentDictionary.GetText(ClassName, 'Caption');
  btnCancel.Caption := MessageDictionary.GetMessage('CancelButtonCaption');
  btnOk.Caption := MessageDictionary.GetMessage('OkButtonCaption');
end;

end.
