unit ViewModel.EmployeeList;

interface
uses
  Model.Interfaces;

function CreateEmployeeListViewModelClass: IEmployeeListViewModelInterface;

implementation
uses
  Model.Employee,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TEmployeeListViewModel = class(TInterfacedObject, IEmployeeListViewModelInterface)
  private
    fModel: IEmployeeModelInterface;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: IEmployeeModelInterface;
    procedure SetModel(const newModel: IEmployeeModelInterface);
    //function GetLabelsText: TEmployeeListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IEmployeeModelInterface read GetModel write SetModel;
    //property LabelsText: TEmployeeListFormLabelsText read GetLabelsText;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;
    constructor Create;
  end;

{ TEmployeeViewModel }

constructor TEmployeeListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateEmployeeModelClass;
  //GetModel;
end;

{function TEmployeeListViewModel.GetLabelsText: TEmployeeListFormLabelsText;
begin
    result := fModel.GetEmployeeListFormLabelsText;
end;}

function TEmployeeListViewModel.GetModel: IEmployeeModelInterface;
begin
  result:=fModel;
end;

function TEmployeeListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TEmployeeListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TEmployeeListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TEmployeeListViewModel.SendErrorNotification(
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

procedure TEmployeeListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TEmployeeListViewModel.SetModel(const newModel: IEmployeeModelInterface);
begin
  fModel:=newModel;
end;

function CreateEmployeeListViewModelClass: IEmployeeListViewModelInterface;
begin
  result:=TEmployeeListViewModel.Create;
end;

end.
