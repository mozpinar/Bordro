unit ViewModel.CountryEdit;

interface
uses
  Model.Interfaces;


function CreateCountryEditViewModelClass: ICountryEditViewModelInterface;

implementation
uses
  Model.Country,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TCountryEditViewModel = class(TInterfacedObject, ICountryEditViewModelInterface)
  private
    fModel: ICountryModelInterface;
    //fLabelsText: TCountryListFormLabelsText;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: ICountryModelInterface;
    procedure SetModel(const newModel: ICountryModelInterface);

    function GetProvider: IProviderInterface;
    //function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    //procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ICountryModelInterface read GetModel write SetModel;
    constructor Create;
  end;


{ TCountryEditViewModel }

constructor TCountryEditViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateCountryModelClass;
  //GetModel;
end;

function TCountryEditViewModel.GetModel: ICountryModelInterface;
begin
  result:=fModel;
end;

function TCountryEditViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

procedure TCountryEditViewModel.SendErrorNotification(
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

procedure TCountryEditViewModel.SendNotification(
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

procedure TCountryEditViewModel.SetModel(
  const newModel: ICountryModelInterface);
begin
  fModel:=newModel;
end;

function CreateCountryEditViewModelClass: ICountryEditViewModelInterface;
begin
  result:=TCountryEditViewModel.Create;
end;


end.
