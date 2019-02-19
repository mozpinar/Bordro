unit ViewModel.LocationList;

interface

uses
  Model.Interfaces;

function CreateLocationListViewModelClass: ILocationListViewModelInterface;

implementation
uses
  Model.Location,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TLocationListViewModel = class(TInterfacedObject, ILocationListViewModelInterface)
  private
    fModel: ILocationModelInterface;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: ILocationModelInterface;
    procedure SetModel(const newModel: ILocationModelInterface);
    //function GetLabelsText: TLocationListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ILocationModelInterface read GetModel write SetModel;
    //property LabelsText: TLocationListFormLabelsText read GetLabelsText;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;
    constructor Create;
  end;

{ TLocationViewModel }

constructor TLocationListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateLocationModelClass;
  //GetModel;
end;

{function TLocationListViewModel.GetLabelsText: TLocationListFormLabelsText;
begin
    result := fModel.GetLocationListFormLabelsText;
end;}

function TLocationListViewModel.GetModel: ILocationModelInterface;
begin
  result:=fModel;
end;

function TLocationListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TLocationListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TLocationListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TLocationListViewModel.SendErrorNotification(
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

procedure TLocationListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TLocationListViewModel.SetModel(const newModel: ILocationModelInterface);
begin
  fModel:=newModel;
end;

function CreateLocationListViewModelClass: ILocationListViewModelInterface;
begin
  result:=TLocationListViewModel.Create;
end;

end.
