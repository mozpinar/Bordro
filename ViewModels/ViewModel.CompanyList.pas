unit ViewModel.CompanyList;

interface
uses
  Model.Interfaces;

function CreateCompanyListViewModelClass: ICompanyListViewModelInterface;

implementation
uses
  Model.Company,
  Model.FormDeclarations,
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions,
  Model.ProSu.Provider,
  Model.ProSu.Subscriber;

type
  TCompanyListViewModel = class(TInterfacedObject, ICompanyListViewModelInterface)
  private
    fModel: ICompanyModelInterface;

    fProvider: IProviderInterface;
    fSubscriberToEdit: ISubscriberInterface;

    function GetModel: ICompanyModelInterface;
    procedure SetModel(const newModel: ICompanyModelInterface);
    //function GetLabelsText: TCompanyListFormLabelsText;

    function GetProvider: IProviderInterface;
    function GetSubscriberToEdit: ISubscriberInterface;

    procedure SendNotification(const actions : TInterfaceActions);
    procedure SendErrorNotification (const errorType: TInterfaceErrors; const errorMessage: string);

    procedure NotificationFromProvider(const notifyClass : INotificationClass);
  public
    property Model: ICompanyModelInterface read GetModel write SetModel;
    //property LabelsText: TCompanyListFormLabelsText read GetLabelsText;
    property SubscriberToEdit: ISubscriberInterface read GetSubscriberToEdit;
    constructor Create;
  end;

{ TCompanyViewModel }

constructor TCompanyListViewModel.Create;
begin
  fProvider:=CreateProSuProviderClass;
  fModel := CreateCompanyModelClass;
  //GetModel;
end;

{function TCompanyListViewModel.GetLabelsText: TCompanyListFormLabelsText;
begin
    result := fModel.GetCompanyListFormLabelsText;
end;}

function TCompanyListViewModel.GetModel: ICompanyModelInterface;
begin
  result:=fModel;
end;

function TCompanyListViewModel.GetProvider: IProviderInterface;
begin
  result:=fProvider;
end;

function TCompanyListViewModel.GetSubscriberToEdit: ISubscriberInterface;
begin
  if not Assigned(fSubscriberToEdit) then
    fSubscriberToEdit := CreateProSuSubscriberClass;
  Result := fSubscriberToEdit;
end;

procedure TCompanyListViewModel.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TCompanyListViewModel.SendErrorNotification(
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

procedure TCompanyListViewModel.SendNotification(const actions: TInterfaceActions);
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

procedure TCompanyListViewModel.SetModel(const newModel: ICompanyModelInterface);
begin
  fModel:=newModel;
end;

function CreateCompanyListViewModelClass: ICompanyListViewModelInterface;
begin
  result:=TCompanyListViewModel.Create;
end;

end.
