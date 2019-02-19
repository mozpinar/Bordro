unit ViewModel.RelationshipType;

interface

uses
  Model.Interfaces;

function CreateRelationshipTypeListViewModelClass: IRelationshipTypeListViewModelInterface;

implementation
uses
  Model.RelationshipType,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TRelationshipTypeListViewModel = class(TInterfacedObject, IRelationshipTypeListViewModelInterface)
  private
    fModel: IRelationshipTypeModelInterface;
    fProvider : IProviderInterface;
    fSubscriberToEdit : ISubscriberInterface;

    function GetModel: IRelationshipTypeModelInterface;
    procedure SetModel(const newModel: IRelationshipTypeModelInterface);
    //function GetLabelsText: TRelationshipTypeListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: IRelationshipTypeModelInterface read GetModel write SetModel;
    property Provider: IProviderInterface read GetProvider;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;

    constructor Create;
  end;

{ TRelationshipTypeViewModel }

constructor TRelationshipTypeListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateRelationshipTypeModelClass;
end;

function TRelationshipTypeListViewModel.GetModel: IRelationshipTypeModelInterface;
begin
  result:=fModel;
end;

function TRelationshipTypeListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TRelationshipTypeListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TRelationshipTypeListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TRelationshipTypeListViewModel.SendErrorNotification(
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

procedure TRelationshipTypeListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TRelationshipTypeListViewModel.SetModel(const newModel: IRelationshipTypeModelInterface);
begin
  fModel:=newModel;
end;

function CreateRelationshipTypeListViewModelClass: IRelationshipTypeListViewModelInterface;
begin
  result:=TRelationshipTypeListViewModel.Create;
end;

end.
