unit Model.Group;

interface

uses
  Model.Interfaces,
  Model.IMyConnection,
  System.Generics.Collections,
  Spring.Collections,
  Spring.Data.ObjectDataset,
  MainDM;

function CreateGroupModelClass: IGroupModelInterface;
implementation
uses
  System.SysUtils, Model.Declarations, Model.FormDeclarations,
  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.OrderBy,
  Model.MosObjectDataset;

type

  TGroupModel = class (TInterfacedObject, IGroupModelInterface)
  private
    fGroup: TGroup;
  public
    function GetAllGroups(const acompanyId : Integer; const filter : string) : IObjectList;
    function GetAllGroupsDS(const acompanyId : Integer; const filter : string) : TObjectDataset;
    procedure AddGroup(const newGroup: TGroup);
    function GetGroup(const GroupId : Integer) : TGroup;
    procedure UpdateGroup(const Group: TGroup);
    procedure DeleteGroup(const Group: TGroup);

  end;

function CreateGroupModelClass: IGroupModelInterface;
begin
  result:=TGroupModel.Create;
end;

{ TGroupModel }

procedure TGroupModel.AddGroup(const newGroup: TGroup);
begin
   DMMain.Session.Insert(newGroup);
end;

procedure TGroupModel.DeleteGroup(const Group: TGroup);
begin
  DMMain.Session.Delete(Group);
end;

function TGroupModel.GetAllGroups(const acompanyId : Integer;
  const filter: string): IObjectList;
var
  FCriteria : ICriteria<TGroup>;
begin
  FCriteria := DMMain.Session.CreateCriteria<TGroup>;
  Result := FCriteria
    .Add(Restrictions.Eq('CompanyId', acompanyId))
    .Add(Restrictions.NotEq('IsDeleted', 1))
    .OrderBy(TOrderBy.Asc('GroupId')).ToList as IObjectList;
end;

function TGroupModel.GetAllGroupsDS(const acompanyId : Integer; const filter: string): TObjectDataset;
begin
  Result := TmosObjectDataset.Create(nil);
  Result.DataList := GetAllGroups(acompanyId, '');
end;

function TGroupModel.GetGroup(const GroupId : Integer) : TGroup;
begin
  Result := DMMain.Session.FindOne<TGroup>(GroupId);
end;

procedure TGroupModel.UpdateGroup(const Group: TGroup);
begin
  DMMain.Session.Update(Group);
end;

end.
