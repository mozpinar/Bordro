unit View.CompanySelectForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateSelectForm, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  Model.Interfaces,
  Spring.Data.ObjectDataSet
  ;

type
  TCompanySelectForm = class(TTemplateSelectForm)
  private
    { Private declarations }
    FViewModel: ICompanyListViewModelInterface;
    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
    function GetViewModel : ICompanyListViewModelInterface;
  public
    { Public declarations }
    property ViewModel: ICompanyListViewModelInterface read GetViewModel default nil;
  end;

implementation
uses
  ViewModel.CompanyList,
  Model.LanguageDictionary;
{$R *.dfm}

{ TTemplateSelectForm1 }

function TCompanySelectForm.GetViewModel: ICompanyListViewModelInterface;
begin
  if not Assigned(FViewModel) then
    FViewModel := CreateCompanyListViewModelClass;
  Result := FViewModel;
end;

procedure TCompanySelectForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllCompanies('');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
end;

procedure TCompanySelectForm.UpdateLabelsText;
begin
  inherited;
  JvDBUltimGrid1.Columns[0].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[0].Title.Caption');
  JvDBUltimGrid1.Columns[1].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[1].Title.Caption');
  JvDBUltimGrid1.Columns[2].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[2].Title.Caption');
  JvDBUltimGrid1.Columns[3].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[3].Title.Caption');
  JvDBUltimGrid1.Columns[4].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[4].Title.Caption');
  JvDBUltimGrid1.Columns[5].Title.Caption := ComponentDictionary.GetText(ClassName, 'JvDBUltimGrid1.Columns[5].Title.Caption');

end;

end.
