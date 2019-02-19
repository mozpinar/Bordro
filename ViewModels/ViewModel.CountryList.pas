unit ViewModel.CountryList;

interface
uses
  Model.Interfaces;

function CreateCountryListViewModelClass: ICountryListViewModelInterface;

implementation
uses
  Model.Country,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TCountryListViewModel = class(TInterfacedObject, ICountryListViewModelInterface)
  private
    fModel: ICountryModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: ICountryModelInterface;
    procedure SetModel(const newModel: ICountryModelInterface);
    //function GetLabelsText: TCountryListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ICountryModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TCountryViewModel }

constructor TCountryListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateCountryModelClass;
end;

function TCountryListViewModel.GetModel: ICountryModelInterface;
begin
  result:=fModel;
end;

function TCountryListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TCountryListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TCountryListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TCountryListViewModel.SendErrorNotification(
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

procedure TCountryListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TCountryListViewModel.SetModel(const newModel: ICountryModelInterface);
begin
  fModel:=newModel;
end;

function CreateCountryListViewModelClass: ICountryListViewModelInterface;
begin
  result:=TCountryListViewModel.Create;
end;

end.
