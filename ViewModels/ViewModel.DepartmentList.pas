unit ViewModel.DepartmentList;

interface

uses
  Model.Interfaces;

function CreateDepartmentListViewModelClass: IDepartmentListViewModelInterface;

implementation
uses
  Model.Department,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TDepartmentListViewModel = class(TInterfacedObject, IDepartmentListViewModelInterface)
  private
    fModel: IDepartmentModelInterface;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: IDepartmentModelInterface;
    procedure SetModel(const newModel: IDepartmentModelInterface);
    //function GetLabelsText: TDepartmentListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IDepartmentModelInterface read GetModel write SetModel;
    //property LabelsText: TDepartmentListFormLabelsText read GetLabelsText;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;
    constructor Create;
  end;

{ TDepartmentViewModel }

constructor TDepartmentListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateDepartmentModelClass;
  //GetModel;
end;

{function TDepartmentListViewModel.GetLabelsText: TDepartmentListFormLabelsText;
begin
    result := fModel.GetDepartmentListFormLabelsText;
end;}

function TDepartmentListViewModel.GetModel: IDepartmentModelInterface;
begin
  result:=fModel;
end;

function TDepartmentListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TDepartmentListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TDepartmentListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TDepartmentListViewModel.SendErrorNotification(
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

procedure TDepartmentListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TDepartmentListViewModel.SetModel(const newModel: IDepartmentModelInterface);
begin
  fModel:=newModel;
end;

function CreateDepartmentListViewModelClass: IDepartmentListViewModelInterface;
begin
  result:=TDepartmentListViewModel.Create;
end;

end.
