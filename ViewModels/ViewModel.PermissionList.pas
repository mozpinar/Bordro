unit ViewModel.PermissionList;

interface
uses
  Model.Interfaces;

function CreatePermissionListViewModelClass: IPermissionListViewModelInterface;

implementation
uses
  Model.Permission,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TPermissionListViewModel = class(TInterfacedObject, IPermissionListViewModelInterface)
  private
    fModel: IPermissionModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: IPermissionModelInterface;
    procedure SetModel(const newModel: IPermissionModelInterface);
    //function GetLabelsText: TPermissionListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IPermissionModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TPermissionViewModel }

constructor TPermissionListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreatePermissionModelClass;
end;

function TPermissionListViewModel.GetModel: IPermissionModelInterface;
begin
  result:=fModel;
end;

function TPermissionListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TPermissionListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TPermissionListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TPermissionListViewModel.SendErrorNotification(
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

procedure TPermissionListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TPermissionListViewModel.SetModel(const newModel: IPermissionModelInterface);
begin
  fModel:=newModel;
end;

function CreatePermissionListViewModelClass: IPermissionListViewModelInterface;
begin
  result:=TPermissionListViewModel.Create;
end;

end.
