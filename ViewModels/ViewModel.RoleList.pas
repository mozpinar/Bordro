unit ViewModel.RoleList;

interface


uses
  Model.Interfaces;

function CreateRoleListViewModelClass: IRoleListViewModelInterface;

implementation
uses
  Model.Role,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TRoleListViewModel = class(TInterfacedObject, IRoleListViewModelInterface)
  private
    fModel: IRoleModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: IRoleModelInterface;
    procedure SetModel(const newModel: IRoleModelInterface);

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IRoleModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TRoleViewModel }

constructor TRoleListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateRoleModelClass;
end;

function TRoleListViewModel.GetModel: IRoleModelInterface;
begin
  result:=fModel;
end;

function TRoleListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TRoleListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TRoleListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TRoleListViewModel.SendErrorNotification(
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

procedure TRoleListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TRoleListViewModel.SetModel(const newModel: IRoleModelInterface);
begin
  fModel:=newModel;
end;

function CreateRoleListViewModelClass: IRoleListViewModelInterface;
begin
  result:=TRoleListViewModel.Create;
end;

end.
