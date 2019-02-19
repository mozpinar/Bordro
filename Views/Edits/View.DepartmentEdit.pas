unit View.DepartmentEdit;

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
  Model.FormDeclarations, JvExControls, JvDBLookupTreeView, Vcl.DBCtrls,
  Vcl.Mask;

type
  TDepartmentEditForm = class(TTemplateEdit)
    edDepartmentName: TDBEdit;
    edCompanyId: TDBLookupComboBox;
    labelCompanyId: TLabel;
    edParentDepartmentId: TJvDBLookupTreeViewCombo;
    labelParentDepartmentId: TLabel;
    labelDepartmentName: TLabel;
    dsCompany: TDataSource;
    dsTitleTree: TDataSource;
    edDepartmentManagerTitleId: TJvDBLookupTreeViewCombo;
    labelDepartmentManagerTitleId: TLabel;
    dsParentDeptTree: TDataSource;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fCompanyDataset : TObjectDataset;
    fTitleTreeDataset : TObjectDataset;
    fParentDeptTreeDataset : TObjectDataset;
    procedure RefreshTitleDataset;
    procedure FormLoaded; override;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
    { Public declarations }
  end;

var
  DepartmentEditForm: TDepartmentEditForm;

implementation
uses
  Spring.Collections,
  MainDM,
  Spring.Persistence.Criteria.Restrictions;

{$R *.dfm}

procedure TDepartmentEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelDepartmentName.Caption := ComponentDictionary.GetText(ClassName, 'labelDepartmentName.Caption');
  labelParentDepartmentId.Caption := ComponentDictionary.GetText(ClassName, 'labelParentDepartmentId.Caption');
  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  //labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  labelDepartmentManagerTitleId.Caption := ComponentDictionary.GetText(ClassName, 'labelDepartmentManagerTitleId.Caption');
end;

procedure TDepartmentEditForm.FormDestroy(Sender: TObject);
begin
  inherited;
  fCompanyDataset.Free;
  fTitleTreeDataset.Free;
  fParentDeptTreeDataset.Free;
end;

procedure TDepartmentEditForm.FormLoaded;
begin
  fCompanyDataset := TObjectDataset.Create(self);
  fCompanyDataset.DataList := DMMain.Session.FindWhere<TCompany>(Restrictions.NotEq('IsDeleted', -1)) as IObjectList;
  fCompanyDataset.Open;
  dsCompany.DataSet := fCompanyDataset;


  fTitleTreeDataset := TObjectDataset.Create(self);
  dsTitleTree.DataSet := fTitleTreeDataset;
  RefreshTitleDataset;
  if fTitleTreeDataset.RecordCount>0 then
    edDepartmentManagerTitleId.FullExpand := True;

  fParentDeptTreeDataset := TObjectDataset.Create(self);
  dsParentDeptTree.DataSet := fParentDeptTreeDataset;
  fParentDeptTreeDataset.DataList := DMMain.Session.CreateCriteria<TDepartment>
                                            .Add(Restrictions.NotEq('IsDeleted', -1))
                                            .Add(Restrictions.Eq('CompanyId', DMMain.Company.CompanyId)).ToList as IObjectList;
  fParentDeptTreeDataset.Open;
  if fParentDeptTreeDataset.RecordCount>0 then
    edParentDepartmentId.FullExpand := True;



end;

procedure TDepartmentEditForm.RefreshTitleDataset;
begin
  fTitleTreeDataset.Close;
  fTitleTreeDataset.DataList := dmmain.Session.GetList<TTitle>('select * from Title where CompanyId=:0;',
                                        [DataSource1.DataSet.FieldByName('CompanyId').AsInteger]) as IObjectList;
  fTitleTreeDataset.Open;
end;

class function TDepartmentEditForm.RequiredPermission(
  cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '3512';
    efcmdEdit: Result := '3513';
    efcmdDelete: Result := '3514';
    efcmdViewDetail: Result := '3515';
  end;
end;

end.
