unit Model.SQLiteConnection;

interface
uses
  System.Classes,
  System.SysUtils,
  Model.IMyConnection;
{.$DEFINE MoDebug}
const
  sqliteDBFilename = 'BRDM.sq3';
function CreateMySQLiteConnection : IMyConnection;

implementation
uses
  Spring.Collections,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Data.ObjectDataSet,
  SQLiteTable3,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.DatabaseManager,
  Spring.Persistence.Adapters.SQLite,
  Spring.Persistence.SQL.Params;

type
  TMySQLiteConnection = class(TInterfacedObject, IMyConnection)
  private
    FSession : Spring.Persistence.Core.Session.TSession;
    {$IFDEF MoDebug}
    FList : TStringList;
    {$ENDIF MoDebug}
    function GetSession: TSession;
    {$IFDEF MoDebug}
    procedure ExecutionListener(const command: string;
      const params: IEnumerable<TDBParam>);
    {$ENDIF MoDebug}
  public
    property Session: TSession read GetSession;
    destructor Destroy; override;
  end;

{ TMySQLiteConnection }

destructor TMySQLiteConnection.Destroy;
begin
  {$IFDEF MoDebug}
  FList.Free;
  {$ENDIF MoDebug}
  inherited;
end;

{$IFDEF MoDebug}
procedure TMySQLiteConnection.ExecutionListener(const command: string;const params: IEnumerable<TDBParam>);
begin
  if FList.Count>500 then
   FList.Delete(FList.Count-1);
  FList.Add(command);
  {s := '';
  for aprm in params do
    if aprm.Value.IsEmpty then
    else
    if s='' then
      s := aprm.Name+'='+aprm.Value.AsString
    else
      s := s+'/'+aprm.Name+'='+aprm.Value.AsString;
  FList.Add(s);}
end;
{$ENDIF MoDebug}

function TMySQLiteConnection.GetSession: TSession;
var dbconn : TSQLiteConnectionAdapter;
    sqliteDB : TSQLiteDatabase;
begin
  if Not Assigned(FSession) then
  begin
    sqliteDB := TSQLiteDatabase.Create;
    sqliteDB.Filename := sqliteDBFilename;
    dbconn := TSQLiteConnectionAdapter.Create(sqliteDB);
    dbconn.Connect;

    FSession := TSession.Create(dbconn);

    {$IFDEF MoDebug}
    FList := TStringList.Create;
    FSession.Connection.AddExecutionListener(ExecutionListener);
    {$ENDIF MoDebug}
  end;
  Result := FSession;
end;


function CreateMySQLiteConnection : IMyConnection;
begin
  Result := TMySQLiteConnection.Create;
end;

end.
