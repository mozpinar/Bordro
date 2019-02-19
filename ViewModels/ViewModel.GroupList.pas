unit ViewModel.GroupList;

interface


uses
  Model.Interfaces;

function CreateGroupListViewModelClass: IGroupListViewModelInterface;

implementation
uses
  Model.Group,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TGroupListViewModel = class(TInterfacedObject, IGroupListViewModelInterface)
  private
    fModel: IGroupModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: IGroupModelInterface;
    procedure SetModel(const newModel: IGroupModelInterface);

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IGroupModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TGroupViewModel }

constructor TGroupListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateGroupModelClass;
end;

function TGroupListViewModel.GetModel: IGroupModelInterface;
begin
  result:=fModel;
end;

function TGroupListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TGroupListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TGroupListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TGroupListViewModel.SendErrorNotification(
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

procedure TGroupListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TGroupListViewModel.SetModel(const newModel: IGroupModelInterface);
begin
  fModel:=newModel;
end;

function CreateGroupListViewModelClass: IGroupListViewModelInterface;
begin
  result:=TGroupListViewModel.Create;
end;

end.
