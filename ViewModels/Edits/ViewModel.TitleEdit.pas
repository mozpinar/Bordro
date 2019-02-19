unit ViewModel.TitleEdit;

interface
uses
  Model.Interfaces;


function CreateTitleEditViewModelClass: ITitleEditViewModelInterface;

implementation
uses
  Model.Title,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TTitleEditViewModel = class(TInterfacedObject, ITitleEditViewModelInterface)
  private
    fModel: ITitleModelInterface;
    //fLabelsText: TTitleListFormLabelsText;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: ITitleModelInterface;
    procedure SetModel(const newModel: ITitleModelInterface);

    function GetProvider: IProviderInterface;
    //function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    //procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ITitleModelInterface read GetModel write SetModel;
    constructor Create;
  end;


{ TTitleEditViewModel }

constructor TTitleEditViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateTitleModelClass;
  //GetModel;
end;

function TTitleEditViewModel.GetModel: ITitleModelInterface;
begin
  result:=fModel;
end;

function TTitleEditViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

procedure TTitleEditViewModel.SendErrorNotification(
  const errorType: TInterfaceErrors; const errorMessage: string);
var
  tmpErrorNotificationClass: TErrorNotificationClass;
begin
  tmpErrorNotificationClass:=TErrorNotificationClass.Create;
  try
    tmpErrorNotificationClass.Actions:=errorType;
    tmpErrorNotificationClass.ActionMessage:=errorMessage;
    fProvider.NotifySubscribers(tmpErrorNotificationClass);
  finally
    tmpErrorNotificationClass.Free;
  end;
end;

procedure TTitleEditViewModel.SendNotification(
  const actions: TInterfaceActions);
var
  tmpNotification : TNotificationClass;
begin
  tmpNotification := TNotificationClass.Create;
  try
    tmpNotification.Actions := actions;
    fProvider.NotifySubscribers(tmpNotification);
  finally
    tmpNotification.Free;
  end;
end;

procedure TTitleEditViewModel.SetModel(
  const newModel: ITitleModelInterface);
begin
  fModel:=newModel;
end;

function CreateTitleEditViewModelClass: ITitleEditViewModelInterface;
begin
  result:=TTitleEditViewModel.Create;
end;

end.
