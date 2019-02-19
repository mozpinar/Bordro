unit View.TemplateEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Model.ProSu.Interfaces, JvComponentBase, JvEmbeddedForms,
  Model.ProSu.Provider, Vcl.StdCtrls, JvFormPlacement, Data.DB,
  Model.FormDeclarations;

type
  TTemplateEdit = class(TForm)
    Panel21: TPanel;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    JvFormStorage1: TJvFormStorage;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FOkToClose : Boolean;

    FProvider : IProviderInterface;
    function GetProvider : IProviderInterface;
  protected
    class procedure CheckAuthorize(cmd : TBrowseFormCommand); virtual;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; virtual;
    procedure PostRec; virtual; abstract;
    procedure PostAsTemplateRec; virtual; abstract;
    procedure CancelRec; virtual; abstract;
    procedure CloseForm; virtual;

    function AddNew : Boolean; virtual;
    function EditCurrent : Boolean; virtual;

    procedure ViewCurrent; virtual;

    procedure BeforePost(DataSet: TDataSet); virtual;
    procedure AfterPost(DataSet: TDataSet); virtual;
    procedure FormLoaded; virtual;

  public
    FormLink: TJvEmbeddedFormLink;
    class function Execute(const aCmd : TBrowseFormCommand;
                              subscriber : ISubscriberInterface;
                              aDataset : TDataset) : Boolean;
    property Provider: IProviderInterface read GetProvider;
  end;

implementation
uses MainDM, Model.LanguageDictionary;
{$R *.dfm}

function TTemplateEdit.AddNew: Boolean;
begin
  Result := False;
  DataSource1.DataSet.Append;
  FormLoaded;  //!!!!!!!!!!!!!!
  try
    if ShowModal=mrOk then
    begin
      DataSource1.DataSet.FieldByName('CreatedOnDate').AsDateTime := Date + Time;
      DataSource1.DataSet.FieldByName('CreatedByUserId').AsInteger := 0; //??????;
      DataSource1.DataSet.FieldByName('LastModifiedOnDate').AsDateTime := Date + Time;
      DataSource1.DataSet.FieldByName('LastModifiedByUserId').AsInteger := 0; //??????;
      DataSource1.DataSet.Post;
      Result := True;
    end
    else
      DataSource1.DataSet.Cancel;
  except
    on e:Exception do
    begin
      DataSource1.DataSet.Cancel;
      raise Exception.Create(e.Message);
    end;

  end;

end;

procedure TTemplateEdit.AfterPost(DataSet: TDataSet);
begin

end;

procedure TTemplateEdit.BeforePost(DataSet: TDataSet);
begin

end;

class procedure TTemplateEdit.CheckAuthorize(cmd: TBrowseFormCommand);
begin
  if not DMMain.Authorize(RequiredPermission(cmd)) then
    raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityEditForm');
end;

class function TTemplateEdit.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  result := '';
end;

procedure TTemplateEdit.CloseForm;
begin
  //Close;
end;

function TTemplateEdit.EditCurrent: Boolean;
begin
  Result := False;
  if DataSource1.DataSet.RecordCount<=0 then
    Exit;
  DataSource1.DataSet.Edit;
  FormLoaded;  //!!!!!!!!!!!!!!!
  try
    if ShowModal=mrOk then
    begin
      DataSource1.DataSet.FieldByName('LastModifiedOnDate').AsDateTime := Date + Time;
      DataSource1.DataSet.FieldByName('LastModifiedByUserId').AsInteger := 0; //??????;
      DataSource1.DataSet.Post;
      Result := True;
    end
    else
      DataSource1.DataSet.Cancel;
  except
    on e:Exception do
    begin
      DataSource1.DataSet.Cancel;
      raise Exception.Create(e.Message);
    end;
  end;
end;

class function TTemplateEdit.Execute(const aCmd: TBrowseFormCommand;
          subscriber: ISubscriberInterface; aDataset: TDataset): Boolean;
var f : TTemplateEdit;
  sbp : TDataSetNotifyEvent;
  sap : TDataSetNotifyEvent;
begin
  CheckAuthorize(aCmd);
  with inherited Create(Application) do
  begin
    Result := True;
    DataSource1.DataSet := aDataset;
    sbp := aDataset.BeforePost;
    sap := aDataset.AfterPost;
    try
      aDataset.BeforePost := BeforePost;
      aDataset.AfterPost := AfterPost;
      Provider.Subscribe(subscriber);
      case aCmd of
        efcmdAdd : Result := AddNew;
        efcmdEdit : Result := EditCurrent;
        efcmdViewDetail : ViewCurrent;
      end;
    finally
      aDataset.BeforePost := sbp;
      aDataset.AfterPost := sap;
    end;
  end;

end;

procedure TTemplateEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseForm;
  Action := caFree;
end;

procedure TTemplateEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FOkToClose;
end;

procedure TTemplateEdit.FormCreate(Sender: TObject);
begin
  FOkToClose := True;
  FormLink:= TJvEmbeddedFormLink.Create(Self);
  btnCancel.Caption := MessageDictionary.GetMessage('CancelButtonCaption');
  btnOk.Caption := MessageDictionary.GetMessage('OkButtonCaption');
end;

procedure TTemplateEdit.FormLoaded;
begin

end;

function TTemplateEdit.GetProvider: IProviderInterface;
begin
  if not Assigned(FProvider) then
    FProvider := Model.ProSu.Provider.CreateProSuProviderClass;
  Result := FProvider;
end;

procedure TTemplateEdit.ViewCurrent;
begin
  FormLoaded;  //!!!!!!!!!!!!!
  ShowModal;
end;

end.
