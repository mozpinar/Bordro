unit ViewModel.CityList;

interface
uses
  Model.Interfaces;

function CreateCityListViewModelClass: ICityListViewModelInterface;

implementation
uses
  Model.City,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TCityListViewModel = class(TInterfacedObject, ICityListViewModelInterface)
  private
    fModel: ICityModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: ICityModelInterface;
    procedure SetModel(const newModel: ICityModelInterface);
    //function GetLabelsText: TCityListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ICityModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TCityViewModel }

constructor TCityListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateCityModelClass;
end;

function TCityListViewModel.GetModel: ICityModelInterface;
begin
  result:=fModel;
end;

function TCityListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TCityListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TCityListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TCityListViewModel.SendErrorNotification(
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

procedure TCityListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TCityListViewModel.SetModel(const newModel: ICityModelInterface);
begin
  fModel:=newModel;
end;

function CreateCityListViewModelClass: ICityListViewModelInterface;
begin
  result:=TCityListViewModel.Create;
end;

end.
