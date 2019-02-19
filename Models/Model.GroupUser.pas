unit Model.GroupUser;

interface

uses
  Model.Interfaces;

function CreateGroupUserModelClass: IGroupUserModelInterface;

implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Spring.Persistence.Core.Interfaces,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  Model.MosObjectDataset,
  Model.Base,
  Model.IMyConnection,
  DB,
  MainDM;

type

  TGroupUserModel = class (TOwnershipModel, IGroupUserModelInterface)
  public
    function GetGroupsOfAUser(const aUserId : Integer; const filter : string) : IObjectList;
    function GetUsersOfAGroup(const aGroupId : Integer; const filter : string) : IObjectList;
    function GetGroupsOfAUserDS(const aUserId : Integer; const filter : string) : TObjectDataset;
    function GetUsersOfAGroupDS(const aGroupId : Integer; const filter : string) : TObjectDataset;
    function UpdateGroupUserList(aUserId, aGroupId : Integer; aGUDS : TDataset) : Boolean;
                          //AGUList : IList<TGroupUser>) : boolean;
  end;

function CreateGroupUserModelClass: IGroupUserModelInterface;
begin
  result:=TGroupUserModel.Create;
end;

{ TGroupUserModel }

function TGroupUserModel.GetGroupsOfAUser(const aUserId: Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TGroupUser>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TGroupUser>;
  Result := FCriteria
    .Add(Restrictions.Eq('UserId', aUserId))
    .OrderBy(TOrderBy.Asc('GroupId')).ToList as IObjectList;
end;

function TGroupUserModel.GetGroupsOfAUserDS(const aUserId: Integer;
  const filter: string): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetGroupsOfAUser(aUserId, filter);
end;


function TGroupUserModel.GetUsersOfAGroup(const aGroupId: Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TGroupUser>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TGroupUser>;
  Result := FCriteria
    .Add(Restrictions.Eq('GroupId', aGroupId))
    .OrderBy(TOrderBy.Asc('UserId')).ToList as IObjectList;
end;

function TGroupUserModel.GetUsersOfAGroupDS(const aGroupId: Integer;
  const filter: string): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetUsersOfAGroup(aGroupId, filter);
end;
///
/// one of aUserId or aGroupId have to be 0 or positive value depends on EditForm (UserEdit or GroupEdit), other value must be negative.
function TGroupUserModel.UpdateGroupUserList(aUserId, aGroupId : Integer; aGUDS : TDataset) : Boolean;
              //AGUList: IList<TGroupUser>): boolean;
var
  newds : TmosObjectDataset; // IList<TGroupUser>;
  gurO : TGroupUser;
  //gurN : TGroupUser;
  sid : String;
  isuser :  boolean;
  found : boolean;
  idbt : IDBTransaction;

begin
  Result := True;
  //if aGUDS.RecordCount<=0 then
  //  Exit;
  if aUserId>=0 then
  begin
    newds := GetGroupsOfAUserDS(aUserId, '') as TMosObjectDataset;
    sid := 'UserId';
    isuser := True;
  end
  else
  if aGroupId>=0 then
  begin
    newds := GetUsersOfAGroupDS(aGroupId, '') as TMosObjectDataset;
    sid := 'GroupId';
    isuser := False;
  end;
  newds.Open;
  idbt := DMMain.Session.BeginTransaction;
  try
    aGUDS.Filtered := False;
    aGUDS.First;
    while not aGUDS.Eof do
    begin
      if isuser then
        found := newds.Locate('GroupId', aGUDS.FieldByName('GroupId').AsString, [])
      else
        found := newds.Locate('UserId', aGUDS.FieldByName('UserId').AsString, []);
      if found then
      begin
        if aGUDS.FieldByName('IsDeleted').AsBoolean then
          newds.Delete;
      end
      else
      if not aGUDS.FieldByName('IsDeleted').AsBoolean then
      begin
        guro := TGroupUser.Create;
        guro.GroupId := aGUDS.FieldByName('GroupId').AsInteger;
        guro.UserId := aGUDS.FieldByName('UserId').AsInteger;
        guro.GroupManager := False;
        guro.IsDeleted := False;
        DMMain.Session.Insert(guro);
      end;

      aGUDS.Next;
    end;
    idbt.Commit;
  except
    on e: Exception do
    begin
      idbt.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;


  {
  if AGUList.Count<=0 then
    Exit;
  if aUserId>=0 then
  begin
    newds := GetGroupsOfAUserDS(aUserId, '') as TMosObjectDataset;
    sid := 'UserId';
    isuser := True;
  end
  else
  if aGroupId>=0 then
  begin
    newds := GetUsersOfAGroupDS(aGroupId, '') as TMosObjectDataset;
    sid := 'GroupId';
    isuser := False;
  end;
  newds.Open;
  idbt := DMMain.Session.BeginTransaction;
  try
    for gurN in AGUList do
    begin
      if isuser then
        found := newds.Locate('GroupId', gurN.GroupId.ToString, [])
      else
        found := newds.Locate('UserId', gurN.UserId.ToString, []);
      if found then
      begin
        if gurN.IsDeleted then
          newds.Delete;
      end
      else
      if not gurN.IsDeleted then
      begin
        guro := TGroupUser.Create;
        guro.GroupId := gurN.GroupId;
        guro.UserId := gurN.UserId;
        guro.GroupManager := False;
        guro.IsDeleted := False;
        DMMain.Session.Insert(guro);
      end;
    end;
    idbt.Commit;
  except
    on e: Exception do
    begin
      idbt.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
  }
end;

end.
