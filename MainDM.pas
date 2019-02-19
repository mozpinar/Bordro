unit MainDM;

interface

uses
  System.SysUtils, System.Classes, JvComponentBase, JvAppStorage,
  JvTranslateString, JvAppIniStorage, JvAppXMLStorage,
  Spring,
  Spring.Persistence.Core.Session,
  Model.IMyConnection, JvFormPlacement,
  Model.Interfaces,
  Model.Declarations,
  Model.Company,
  //JvStringHolder,
  Sec.Declarations;

type
  TDMMain = class(TDataModule)
    JvTranslateString1: TJvTranslateString;
    JvAppXMLFileStorage1: TJvAppXMLFileStorage;
    JvFormStorage1: TJvFormStorage;
    procedure JvAppIniFileStorage1GetFileName(Sender: TJvCustomAppStorage;
      var FileName: TFileName);
    procedure FormCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure JvFormStorage1RestorePlacement(Sender: TObject);
  private
    { Private declarations }
    FDatabase : IMyConnection;
    FCompanyModel : ICompanyModelInterface;
    FCompany : TCompany;

    FFileUploadFolder : string;
    FLoggedIn: Boolean;
    FLoggedUserId: Nullable<Integer>;
    FLoggedUserName: Nullable<string>;

    function GetSession : TSession;
    function GetCompany : TCompany;
    procedure SetCompany(aCompany : TCompany);
    procedure AddStandardRecords;
  public
    { Public declarations }

    property Session: TSession read GetSession;
    property Company : TCompany read GetCompany write SetCompany default nil;
    property CompanyModel: ICompanyModelInterface read FCompanyModel default nil;

    property FileUploadFolder : string read FFileUploadFolder write FFileUploadFolder;

    /// Only proxy
    function Authorize(aPermissions : string) : boolean;

    procedure SetCurrentCompanyCode(const aCompanyCode : string);
    procedure BuildDatabase;
    property LoggedIn: Boolean read FLoggedIn write FLoggedIn;
    property LoggedUserId: Nullable<Integer> read FLoggedUserId write FLoggedUserId;
    property LoggedUserName: Nullable<string> read FLoggedUserName write FLoggedUserName;
  end;

var
  ExecLoginForm : Function : Boolean;
var
  DMMain: TDMMain;

implementation
uses System.IOUtils,
  Model.SQLiteConnection,
  Spring.Persistence.Core.DatabaseManager,
  Model.PermissionList,
  Spring.Persistence.Core.Interfaces
  ;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
  if FCompany<>nil then
    FCompany.Free;
  //JvFormStorage1.StoredValue['CurrentCompany'] := FCompany.WorkingCompanyCode;

end;

procedure TDMMain.FormCreate(Sender: TObject);
var cc : string;
  BuildDB : boolean;
begin
  BuildDB := not FileExists(ExtractFilePath(ParamStr(0))+'\'+sqliteDBFileName);

  FDatabase := CreateMySQLiteConnection;
  FCompanyModel := CreateCompanyModelClass;

  FFileUploadFolder := '.\Files';
  FFileUploadFolder := JvFormStorage1.StoredValue['FileUploadFolder'];

  Sec.Declarations.LoginSession := FDatabase.Session;
  if BuildDB then
  begin
    BuildDatabase;
  end;

end;

function TDMMain.GetCompany: TCompany;
begin
  Result := fCompany;
end;

function TDMMain.GetSession: TSession;
begin
  Result := FDatabase.Session;
end;

procedure TDMMain.JvAppIniFileStorage1GetFileName(Sender: TJvCustomAppStorage;
  var FileName: TFileName);
begin
  FileName := ExtractFilePath(ParamStr(0))+TPath.GetFileNameWithoutExtension(ParamStr(0))+'.ini'
end;

procedure TDMMain.JvFormStorage1RestorePlacement(Sender: TObject);
var cc : string;
begin
  cc := JvFormStorage1.StoredValue['CurrentCompany'];
  FFileUploadFolder := JvFormStorage1.StoredValue['FileUploadFolder'];
end;

procedure TDMMain.SetCompany(aCompany: TCompany);
begin
  fCompany := aCompany;
end;

procedure TDMMain.SetCurrentCompanyCode(const aCompanyCode: string);
var aComp : TCompany;
begin
  aComp := FCompanyModel.GetCompany(aCompanyCode);
  if Assigned(FCompany) then
    FCompany.Free;
  FCompany := aComp;
end;

function TDMMain.Authorize(aPermissions: string): boolean;
begin
  result := TUserExt.AutorizeUser(FLoggedUserName, aPermissions);
end;

procedure TDMMain.BuildDatabase;
var
  FDBMan : TDatabaseManager;
begin
  FDBMan := TDatabaseManager.Create(Session.Connection);
  try
    FDBMan.ClearEntities;
    FDBMan.RegisterEntity(TCurrency);
    FDBMan.RegisterEntity(TCurrencyDaily);
    FDBMan.RegisterEntity(TCountry);
    FDBMan.RegisterEntity(TLanguage);
    FDBMan.RegisterEntity(TCompany);
    FDBMan.RegisterEntity(TCity);
    FDBMan.RegisterEntity(TTown);
    FDBMan.RegisterEntity(TLocation);
    //FDBMan.RegisterEntity(TCompanyLocation);

    FDBMan.RegisterEntity(TPermission);
    FDBMan.RegisterEntity(TUser);
    FDBMan.RegisterEntity(TRole);
    FDBMan.RegisterEntity(TGroup);
    FDBMan.RegisterEntity(TGroupUser);
    FDBMan.RegisterEntity(TRoleUserGroup);
    FDBMan.RegisterEntity(TRoleUserGroupPermission);

    FDBMan.RegisterEntity(TEmployee);
    FDBMan.RegisterEntity(TDepartment);
    FDBMan.RegisterEntity(TEmployeeFamilyMember);
    FDBMan.RegisterEntity(TRelationshipType);
    FDBMan.RegisterEntity(TTitle);
    FDBMan.RegisterEntity(TEmployeePayroll);
    FDBMan.RegisterEntity(TOthIncomeOutcomeDef);
    FDBMan.RegisterEntity(TOthIncomeOutcome);
    FDBMan.RegisterEntity(TIncomeTaxPercentage);
    FDBMan.RegisterEntity(TSgkCutPercentage);
    FDBMan.RegisterEntity(TSgkHazardClassPremiumRate);
    FDBMan.RegisterEntity(TCompanyInfo);
    FDBMan.RegisterEntity(TEmployeeWage);
    FDBMan.RegisterEntity(FGeneralInfo);
    FDBMan.RegisterEntity(TBank);
    FDBMan.BuildDatabase;
    AddStandardRecords;
  finally
    FDBMan.Free;
  end;

end;

procedure TDMMain.AddStandardRecords;
var
  company : TCompany;
  user : TUser;
  permission : TPermission;
  RoleUserGroupPermission : TRoleUserGroupPermission;
  group : TGroup;
  groupuser : TGroupUser;
  trn : IDBTransaction;
  I : Integer;
begin
  trn := Session.BeginTransaction;
  try
    group := TGroup.Create;
    group.GroupId := 1;
    group.GroupName := 'Administrators';
    group.ParentId := 0;
    Session.Insert(group);
    groupuser := TGroupUser.Create;
    groupuser.GroupId := 1;
    groupuser.UserId := 1;
    Session.Insert(groupuser);

    user := TUser.Create;
    user.UserId := 1;
    user.UserName := 'admin';
    user.Password := 'a';
    Session.Insert(user);

    permission := TPermission.Create;
    for I := 1 to 48 do
    begin
      permission.PermissionId := arrPerms[I].Id;
      permission.PermissionName := arrPerms[I].Name;
      permission.ParentId := arrPerms[I].Parent;
      Session.Insert(permission);
    end;

    RoleUserGroupPermission := TRoleUserGroupPermission.Create;
    RoleUserGroupPermission.RUGPermissionId := 1;
    RoleUserGroupPermission.UserId := 1;
    RoleUserGroupPermission.PermissionId := 1;

    trn.Commit;

  Except
    trn.Rollback;
  end;
end;

end.
