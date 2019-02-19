unit ViewModel.OthIncomeOutcomeDefList;

interface
uses
  Model.Interfaces;

function CreateOthIncomeOutcomeDefListViewModelClass: IOthIncomeOutcomeDefListViewModelInterface;

implementation
uses
  Model.OthIncomeOutcomeDef,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TOthIncomeOutcomeDefListViewModel = class(TInterfacedObject, IOthIncomeOutcomeDefListViewModelInterface)
  private
    fModel: IOthIncomeOutcomeDefModelInterface;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: IOthIncomeOutcomeDefModelInterface;
    procedure SetModel(const newModel: IOthIncomeOutcomeDefModelInterface);
    //function GetLabelsText: TOthIncomeOutcomeDefListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IOthIncomeOutcomeDefModelInterface read GetModel write SetModel;
    //property LabelsText: TOthIncomeOutcomeDefListFormLabelsText read GetLabelsText;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;
    constructor Create;
  end;

{ TOthIncomeOutcomeDefViewModel }

constructor TOthIncomeOutcomeDefListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateOthIncomeOutcomeDefModelClass;
  //GetModel;
end;

{function TOthIncomeOutcomeDefListViewModel.GetLabelsText: TOthIncomeOutcomeDefListFormLabelsText;
begin
    result := fModel.GetOthIncomeOutcomeDefListFormLabelsText;
end;}

function TOthIncomeOutcomeDefListViewModel.GetModel: IOthIncomeOutcomeDefModelInterface;
begin
  result:=fModel;
end;

function TOthIncomeOutcomeDefListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TOthIncomeOutcomeDefListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TOthIncomeOutcomeDefListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TOthIncomeOutcomeDefListViewModel.SendErrorNotification(
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

procedure TOthIncomeOutcomeDefListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TOthIncomeOutcomeDefListViewModel.SetModel(const newModel: IOthIncomeOutcomeDefModelInterface);
begin
  fModel:=newModel;
end;

function CreateOthIncomeOutcomeDefListViewModelClass: IOthIncomeOutcomeDefListViewModelInterface;
begin
  result:=TOthIncomeOutcomeDefListViewModel.Create;
end;


end.
