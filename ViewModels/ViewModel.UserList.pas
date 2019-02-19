unit ViewModel.UserList;

interface

uses
  Model.Interfaces;

function CreateUserListViewModelClass: IUserListViewModelInterface;

implementation
uses
  Model.User,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TUserListViewModel = class(TInterfacedObject, IUserListViewModelInterface)
  private
    fModel: IUserModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: IUserModelInterface;
    procedure SetModel(const newModel: IUserModelInterface);

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IUserModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TUserViewModel }

constructor TUserListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateUserModelClass;
end;

function TUserListViewModel.GetModel: IUserModelInterface;
begin
  result:=fModel;
end;

function TUserListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TUserListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TUserListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TUserListViewModel.SendErrorNotification(
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

procedure TUserListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TUserListViewModel.SetModel(const newModel: IUserModelInterface);
begin
  fModel:=newModel;
end;

function CreateUserListViewModelClass: IUserListViewModelInterface;
begin
  result:=TUserListViewModel.Create;
end;

end.
