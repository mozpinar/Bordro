unit ViewModel.CurrencyList;

interface
uses
  Model.Interfaces;

function CreateCurrencyListViewModelClass: ICurrencyListViewModelInterface;

implementation
uses
  Model.Currency,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TCurrencyListViewModel = class(TInterfacedObject, ICurrencyListViewModelInterface)
  private
    fModel: ICurrencyModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: ICurrencyModelInterface;
    procedure SetModel(const newModel: ICurrencyModelInterface);
    //function GetLabelsText: TCurrencyListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ICurrencyModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TCurrencyViewModel }

constructor TCurrencyListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateCurrencyModelClass;
end;

function TCurrencyListViewModel.GetModel: ICurrencyModelInterface;
begin
  result:=fModel;
end;

function TCurrencyListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TCurrencyListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TCurrencyListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TCurrencyListViewModel.SendErrorNotification(
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

procedure TCurrencyListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TCurrencyListViewModel.SetModel(const newModel: ICurrencyModelInterface);
begin
  fModel:=newModel;
end;

function CreateCurrencyListViewModelClass: ICurrencyListViewModelInterface;
begin
  result:=TCurrencyListViewModel.Create;
end;

end.
