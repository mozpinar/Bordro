unit View.TitleEdit;

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
  Model.FormDeclarations, Vcl.DBCtrls, JvExControls, JvDBLookupTreeView,
  Vcl.Mask;

type
  TTitleEditForm = class(TTemplateEdit)
    dsCompany: TDataSource;
    labelTitleName: TLabel;
    labelTitleNameEng: TLabel;
    labelParentTitleId: TLabel;
    labelCompanyId: TLabel;
    edTitleName: TDBEdit;
    edTitleNameEng: TDBEdit;
    edParentTitleId: TJvDBLookupTreeViewCombo;
    edCompanyId: TDBLookupComboBox;
    dsTitleTree: TDataSource;
    edIsHeadShip: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fCompanyDataset : TObjectDataset;
    fTitleTreeDataset : TObjectDataset;
    procedure RefreshTitleDataset;
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
    { Public declarations }
  end;

var
  TitleEditForm: TTitleEditForm;

implementation
uses
  Spring.Collections,
  MainDM;

{$R *.dfm}
procedure TTitleEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCompanyDataset.Free;
  fTitleTreeDataset.Free;
end;

procedure TTitleEditForm.FormLoaded;
begin
  fCompanyDataset := TObjectDataset.Create(self);
  fCompanyDataset.DataList := DMMain.Session.FindAll<TCompany> as IObjectList;
  fCompanyDataset.Open;
  dsCompany.DataSet := fCompanyDataset;

  fTitleTreeDataset := TObjectDataset.Create(self);
  dsTitleTree.DataSet := fTitleTreeDataset;
  RefreshTitleDataset;
  if fTitleTreeDataset.RecordCount>0 then
    edParentTitleId.FullExpand := True;
end;

procedure TTitleEditForm.RefreshTitleDataset;
begin
  //if DataSource1.DataSet.FieldByName('CompanyId').IsNull then
  //  Exit;
  fTitleTreeDataset.Close;
  fTitleTreeDataset.DataList := dmmain.Session.GetList<TTitle>('select * from Title where CompanyId=:0;',
                                        [DataSource1.DataSet.FieldByName('CompanyId').AsInteger]) as IObjectList;
  fTitleTreeDataset.Open;
end;

class function TTitleEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3522';
    efcmdEdit: Result := '3523';
    efcmdDelete: Result := '3524';
    efcmdViewDetail: Result := '3525';
  end;
end;

procedure TTitleEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelTitleName.Caption := ComponentDictionary.GetText(ClassName, 'labelTitleName.Caption');
  labelTitleNameEng.Caption := ComponentDictionary.GetText(ClassName, 'labelTitleNameEng.Caption');
  labelParentTitleId.Caption := ComponentDictionary.GetText(ClassName, 'labelParentTitleId.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  edIsHeadShip.Caption := ComponentDictionary.GetText(ClassName, 'edIsHeadShip.Caption');
end;

end.
