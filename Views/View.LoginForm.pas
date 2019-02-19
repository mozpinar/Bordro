unit View.LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, JvComponentBase, JvFormPlacement;

type
  TLoginForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    labelUsername: TLabel;
    labelPassword: TLabel;
    edUsername: TEdit;
    edPassword: TEdit;
    Image1: TImage;
    JvFormStorage1: TJvFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    OkToClose : Boolean;
    function CheckUserAndPass: Boolean;
    procedure UpdateLabelsText;
  public
    { Public declarations }
    function Login : boolean;
  end;


function ExecLogin : boolean;
implementation
uses
  Spring.Collections,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Model.Declarations,
  Model.LanguageDictionary,
  Sec.Declarations,
  MainDM;
{$R *.dfm}

function ExecLogin : boolean;
begin
  with TLoginForm.Create(Application) do
  begin
    edPassword.Text := '';
    Result := Login;
  end;
end;
procedure TLoginForm.btnCancelClick(Sender: TObject);
begin
  OkToClose := True;
end;

procedure TLoginForm.btnOkClick(Sender: TObject);
begin
  OkToClose := False;
  if ((edUsername.Text='') or (edPassword.Text='')) then
    raise Exception.Create(Model.LanguageDictionary.MessageDictionary.GetMessage('SUsernameAndOrPasswordExpected'));
  OkToClose := CheckUserAndPass;
end;

procedure TLoginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TLoginForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  //CanClose := True;
  CanClose := OkToClose;
end;

function TLoginForm.CheckUserAndPass : Boolean;
var u : TUser;
  ul : IList<TUser>;
begin
  ul := DMMain.Session.CreateCriteria<TUser>
                         .Add(Restrictions.NotEq('IsDeleted', -1)).ToList;
  //ul := DMMain.Session.GetList<TUser>('select UserId, Username, Password, CompanyId, LocationId from [User] where UserName=:0 and IsDeleted<>1', [edUsername.Text]);
  if ul.Count>0 then
    u := ul[0]
  else
    u := nil;
  if (u<>nil) then
  begin
    Result := (edPassword.Text<>'') and (u.Password=edPassword.Text);
    if Result then
    begin
      DMMain.LoggedUserId := u.UserId;
      DMMain.LoggedUserName := u.UserName;
    end;
  end;
end;
function TLoginForm.Login: boolean;

begin
  UpdateLabelsText;
  Result := False;
  if ShowModal=mrOk then
  begin
     Result := True;
  end;
end;

procedure TLoginForm.UpdateLabelsText;
begin
  Caption := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'Caption', Caption);
  labelUsername.Caption := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'labelUsername.Caption', labelUsername.Caption);
  labelPassword.Caption := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'labelPassword.Caption', labelPassword.Caption);
  edUsername.TextHint := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'edUsername.TextHint', edUsername.TextHint);
  edPassword.TextHint := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'edPassword.TextHint', edPassword.TextHint);
  btnOk.Caption := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'btnOk.Caption', btnOk.Caption);
  btnCancel.Caption := Model.LanguageDictionary.ComponentDictionary('').GetText(ClassName, 'btnCancel.Caption', btnCancel.Caption);
end;

initialization
  MainDM.ExecLoginForm := ExecLogin;
end.
