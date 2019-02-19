unit Model.Base;

interface
uses
  Spring.Collections, System.Generics.Collections,
  Spring.Persistence.Mapping.Attributes,
  DB;
type
  IRepository<T> = interface
    ['{01B1C8AF-F0E5-4731-9657-A9347932AAD7}']
    function GetList : IList<T>;
    function AddEntity(entity : T) : boolean;
    function EditEntity(entity : T) : boolean;
    function DeleteEntity(entity : T) : boolean;
    function GetFiltered(const sql : string) : TList<T>;
    function GetItemById(const Id : Integer) : T;
  end;

  IBaseModel = interface
    ['{35921B2B-D015-4025-BD28-54BB25818FA5}']
    function GetIsDeleted : Boolean;
    procedure SetIsDeleted(value : Boolean);
    function GetCreatedOnDate: TDateTime;
    procedure SetCreatedOnDate(value : TDateTime);
    function GetCreatedByUserId: Integer;
    procedure SetCreatedByUserId(value : Integer);
    function GetLastModifiedOnDate : TDateTime;
    procedure SetLastModifiedOnDate(value : TDateTime);
    function GetLastModifiedByUserId: Integer;
    procedure SetLastModifiedByUserId(value : Integer);

    property IsDeleted: Boolean read GetIsDeleted write SetIsDeleted;
    property CreatedOnDate: TDateTime read GetCreatedOnDate write SetCreatedOnDate;
    property CreatedByUserId: Integer read GetCreatedByUserId write SetCreatedByUserId;
    property LastModifiedOnDate: TDateTime read GetLastModifiedOnDate write SetLastModifiedOnDate;
    property LastModifiedByUserId: Integer read GetLastModifiedByUserId write SetLastModifiedByUserId;
  end;

  TBaseModel = class(TInterfacedObject, IBaseModel)
  private
    FIsDeleted : Boolean;
    FCreatedOnDate: TDateTime;
    FCreatedByUserId: Integer;
    FLastModifiedOnDate : TDateTime;
    FLastModifiedByUserId: Integer;
    function GetIsDeleted : Boolean;
    procedure SetIsDeleted(value : Boolean);
    function GetCreatedOnDate: TDateTime;
    procedure SetCreatedOnDate(value : TDateTime);
    function GetCreatedByUserId: Integer;
    procedure SetCreatedByUserId(value : Integer);
    function GetLastModifiedOnDate : TDateTime;
    procedure SetLastModifiedOnDate(value : TDateTime);
    function GetLastModifiedByUserId: Integer;
    procedure SetLastModifiedByUserId(value : Integer);
  public
    //constructor Create;
  published
    [Column]
    property IsDeleted: Boolean read GetIsDeleted write SetIsDeleted default False;
    [Column]
    property CreatedOnDate: TDateTime read GetCreatedOnDate write SetCreatedOnDate;
    [Column]
    property CreatedByUserId: Integer read GetCreatedByUserId write SetCreatedByUserId;
    [Column]
    property LastModifiedOnDate: TDateTime read GetLastModifiedOnDate write SetLastModifiedOnDate;
    [Column]
    property LastModifiedByUserId: Integer read GetLastModifiedByUserId write SetLastModifiedByUserId;
  end;

  TOwnershipModel = class(TInterfacedObject)
  public
    function GetDifference(const SourcePrefix: string; SourceDS : TDataset;
                   const TargetPrefix: string; TargetDS : TDataset) : boolean; virtual;
  end;
implementation

{ TBaseModel }

function TBaseModel.GetCreatedByUserId: Integer;
begin
  Result := FCreatedByUserId;
end;

function TBaseModel.GetCreatedOnDate: TDateTime;
begin
  Result := FCreatedOnDate;
end;

function TBaseModel.GetIsDeleted: Boolean;
begin
  Result := FIsDeleted;
end;

function TBaseModel.GetLastModifiedByUserId: Integer;
begin
  Result := FLastModifiedByUserId;
end;

function TBaseModel.GetLastModifiedOnDate: TDateTime;
begin
  Result := FLastModifiedOnDate;
end;

procedure TBaseModel.SetCreatedByUserId(value: Integer);
begin
  FCreatedByUserId := value;
end;

procedure TBaseModel.SetCreatedOnDate(value: TDateTime);
begin
  FCreatedOnDate := value;
end;

procedure TBaseModel.SetIsDeleted(value: Boolean);
begin
  FIsDeleted := value;
end;

procedure TBaseModel.SetLastModifiedByUserId(value: Integer);
begin
  FLastModifiedByUserId := value;
end;

procedure TBaseModel.SetLastModifiedOnDate(value: TDateTime);
begin
  FLastModifiedOnDate := value;
end;

{ TOwnershipModel }

function TOwnershipModel.GetDifference(const SourcePrefix: string;
  SourceDS: TDataset; const TargetPrefix: string; TargetDS: TDataset): boolean;
var
  sflt, tflt : Boolean;
begin
  Result := True;
  if (SourceDS.RecordCount=0) or (TargetDS.RecordCount=0) then
    Exit;
  Result := False;
  sflt := SourceDS.Filtered;
  tflt := TargetDS.Filtered;
  SourceDS.Filtered := False;
  TargetDS.Filtered := False;
  SourceDS.First;
  try
    while not SourceDS.Eof do
    begin
      if TargetDS.Locate(TargetPrefix+'Id', SourceDS.FieldByName(SourcePrefix+'Id').AsString, []) then
      begin
        TargetDS.Edit;
        TargetDS.FieldByName(TargetPrefix+'Name').AsString := SourceDS.FieldByName(SourcePrefix+'Name').AsString;
        TargetDS.Post;
        SourceDS.Edit;
        SourceDS.FieldByName('IsDeleted').AsBoolean := True;
        SourceDS.Post;
        Result := True;
      end;
      SourceDS.Next;
    end;
  finally
    SourceDS.Filtered := sflt;
    TargetDS.Filtered := tflt;
  end;
end;

end.
