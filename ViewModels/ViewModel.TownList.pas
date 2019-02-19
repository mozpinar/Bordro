unit ViewModel.TownList;

interface
uses
  Model.Interfaces;

function CreateTownListViewModelClass: ITownListViewModelInterface;

implementation
uses
  Model.Town,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TTownListViewModel = class(TInterfacedObject, ITownListViewModelInterface)
  private
    fModel: ITownModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: ITownModelInterface;
    procedure SetModel(const newModel: ITownModelInterface);
    //function GetLabelsText: TTownListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ITownModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TTownViewModel }

constructor TTownListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateTownModelClass;
end;

function TTownListViewModel.GetModel: ITownModelInterface;
begin
  result:=fModel;
end;

function TTownListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TTownListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TTownListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TTownListViewModel.SendErrorNotification(
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

procedure TTownListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TTownListViewModel.SetModel(const newModel: ITownModelInterface);
begin
  fModel:=newModel;
end;

function CreateTownListViewModelClass: ITownListViewModelInterface;
begin
  result:=TTownListViewModel.Create;
end;

end.
