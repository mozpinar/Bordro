unit Model.User;

interface

uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateUserModelClass: IUserModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Forms;

type

  TUserModel = class (TInterfacedObject, IUserModelInterface)
  private
    fUser: TUser;
  public
    function GetAllUsers(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllUsersDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddUser(const newUser: TUser);
    function GetUser(const UserId : Integer) : TUser;
    procedure UpdateUser(const User: TUser);
    procedure DeleteUser(const User: TUser);

  end;

function CreateUserModelClass: IUserModelInterface;
begin
  result:=TUserModel.Create;
end;

{ TUserModel }

procedure TUserModel.AddUser(const newUser: TUser);
begin
   DMMain.Session.Insert(newUser);
end;

procedure TUserModel.DeleteUser(const User: TUser);
begin
  DMMain.Session.Delete(User);
end;

function TUserModel.GetAllUsers(const acompanyId : Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TUser>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TUser>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('UserId')).ToList as IObjectList;
end;

function TUserModel.GetAllUsersDS(const acompanyId : Integer; const filter: string): TObjectDataset;
begin
  Result := TObjectDataset.Create(Application);
  Result.DataList := GetAllUsers(acompanyId, '');
end;

function TUserModel.GetUser(const UserId : Integer) : TUser;
begin
  Result := DMMain.Session.FindOne<TUser>(UserId);
end;

procedure TUserModel.UpdateUser(const User: TUser);
begin
  DMMain.Session.Update(User);
end;

end.
