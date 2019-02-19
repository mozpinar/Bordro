unit Model.IMyConnection;

interface
uses
  //Spring.Collections,
  Spring.Persistence.Core.Session{,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Data.ObjectDataSet,
  SQLiteTable3,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.DatabaseManager,
  Spring.Persistence.Adapters.SQLite};

type
  IMyConnection = interface
    ['{851EFDD0-FB4F-4AA9-8D51-14631ABA9CA0}']
    function GetSession : TSession;
    property Session: TSession read GetSession;
  end;


implementation

end.
