unit ViewModel.TitleList;

interface
uses
  Model.Interfaces;

function CreateTitleListViewModelClass: ITitleListViewModelInterface;

implementation
uses
  Model.Title,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TTitleListViewModel = class(TInterfacedObject, ITitleListViewModelInterface)
  private
    fModel: ITitleModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: ITitleModelInterface;
    procedure SetModel(const newModel: ITitleModelInterface);

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ITitleModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TTitleViewModel }

constructor TTitleListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateTitleModelClass;
end;

function TTitleListViewModel.GetModel: ITitleModelInterface;
begin
  result:=fModel;
end;

function TTitleListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TTitleListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TTitleListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TTitleListViewModel.SendErrorNotification(
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

procedure TTitleListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TTitleListViewModel.SetModel(const newModel: ITitleModelInterface);
begin
  fModel:=newModel;
end;

function CreateTitleListViewModelClass: ITitleListViewModelInterface;
begin
  result:=TTitleListViewModel.Create;
end;


end.
