unit View.TemplateForm;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.UITypes,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvEmbeddedForms,
  Model.ProSu.Provider, Model.ProSu.Interfaces,
  Model.ProSu.Subscriber,
  Model.FormDeclarations, JvFormPlacement, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Spring.Data.ObjectDataSet,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Model.MosObjectDataset, Vcl.Menus, GrdPMenu;

type
  TTemplateForm = class(TForm)
    Panel11: TPanel;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    JvFormStorage2: TJvFormStorage;
    GridPMenu1: TGridPMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FOkToClose : Boolean;
  protected
    fObjectDataset : TMosObjectDataset;

    procedure FormLoaded; virtual;
    function GetProvider : IProviderInterface; virtual; abstract;

    procedure UpdateLabelsText; virtual;

    procedure OpenDataset; virtual; abstract;
    procedure AddNew; virtual; abstract;
    procedure EditCurrent; virtual; abstract;
    procedure Print; virtual; abstract;

    function GetPKName : string; virtual;

    procedure DeleteCurrent; virtual;
    procedure UndeleteCurrent; virtual;
  public
    FormLink: TJvEmbeddedFormLink;
    property Provider: IProviderInterface read GetProvider;

    procedure Refresh; virtual;
    procedure OrderCommand(command : TBrowseFormCommand); virtual;
  end;

implementation
uses MainDM, Model.LanguageDictionary;

{$R *.dfm}

procedure TTemplateForm.DeleteCurrent;
begin
  if MessageDlg(MessageDictionary('').GetMessage('SConfirmToDelete'), mtWarning, [mbCancel, mbOk], 0)<>mrOk then
    Exit;
  fObjectDataset.Edit;
  fObjectDataset.FieldByName('IsDeleted').AsBoolean := True; //not fObjectDataset.FieldByName('IsDeleted').AsBoolean;
  fObjectDataset.FieldByName('LastModifiedOnDate').AsDateTime := Date + Time;
  fObjectDataset.FieldByName('LastModifiedByUserId').AsInteger := 0; //??????;
  fObjectDataset.Post;
end;

procedure TTemplateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TTemplateForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FOkToClose;
end;

procedure TTemplateForm.FormCreate(Sender: TObject);
begin
  FOkToClose := True;
  fObjectDataset := TMosObjectDataset.Create(self);
  DataSource1.DataSet := fObjectDataset;
  FormLink:= TJvEmbeddedFormLink.Create(Self);
  OpenDataset;
  With TObjectDataset(DataSource1.DataSet) do
  begin
    Filter := 'IsDeleted=0';
    Filtered := True;
  end;
end;

procedure TTemplateForm.FormLoaded;
begin
  UpdateLabelsText;
end;

procedure TTemplateForm.FormShow(Sender: TObject);
begin
  FormLoaded;
end;

function TTemplateForm.GetPKName: string;
begin
  Result := '';
end;

procedure TTemplateForm.JvDBGrid1DblClick(Sender: TObject);
begin
   OrderCommand(TBrowseFormCommand.efcmdEdit);
end;

procedure TTemplateForm.OrderCommand(command: TBrowseFormCommand);
begin
  case command of
    efcmdNext: fObjectDataset.Next;
    efcmdPrev: fObjectDataset.Prior;
    efcmdFirst: fObjectDataset.First;
    efcmdLast: fObjectDataset.Last;
    efcmdAdd: AddNew;
    efcmdDelete: DeleteCurrent;
    efcmdUndelete: UndeleteCurrent;
    efcmdEdit: EditCurrent;
    efcmdViewDetail : ;
    efcmdClose: ;
    efcmdRefresh: Refresh;
    efcmdFind : ;
    efcmdPrint : ;
    efcmdActivateFilter : ;
    efcmdBuildFilter : ;
    efcmdDeactivateFilter : ;
  end;
end;

procedure TTemplateForm.Refresh;
var
  PKname : string;
  PK : string;
begin
  PKname := GetPKName;
  if PKname<>'' then
    pk := fObjectDataset.FieldByName(PKname).AsString;
  fObjectDataset.Close;
  OpenDataset;
  if PKname<>'' then
    fObjectDataset.Locate(PKname, PK, []);
end;

procedure TTemplateForm.UndeleteCurrent;
begin
  if MessageDlg(MessageDictionary('').GetMessage('SConfirmToUndelete'), mtConfirmation, [mbCancel, mbOk], 0)<>mrOk then
    Exit;
  fObjectDataset.Edit;
  fObjectDataset.FieldByName('IsDeleted').AsBoolean := False;
  fObjectDataset.FieldByName('LastModifiedOnDate').AsDateTime := Date + Time;
  fObjectDataset.FieldByName('LastModifiedByUserId').AsInteger := 0; //??????;
  fObjectDataset.Post;
end;

procedure TTemplateForm.UpdateLabelsText;
begin
  Caption := ComponentDictionary('').GetText(ClassName, 'Caption');
  GridColumnDictionary.AssignGridColumnTitles(ClassName, JvDBGrid1);
end;

end.
