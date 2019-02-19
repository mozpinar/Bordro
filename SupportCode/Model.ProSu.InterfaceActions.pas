unit Model.ProSu.InterfaceActions;

interface

uses Model.ProSu.Interfaces;

type
  TInterfaceAction = (actInvoiceItemsChanged,
                      actPrintingStart, actPrintingFinish);
  TInterfaceActions = set of TInterfaceAction;


  TInterfaceError = (errInvoiceItemEmpty, errInvoiceItemQuantityEmpty,
                     errInvoiceItemQuantityNonPositive,
                     errInvoiceItemQuantityNotNumber, errNoError);
  TInterfaceErrors = set of TInterfaceError;

  TErrorNotificationClass = class (TInterfacedObject, INotificationClass)
  private
    fActions: TInterfaceErrors;
    fActionMessage: string;
  public
    property Actions: TInterfaceErrors read fActions write fActions;
    property ActionMessage: string read fActionMessage write fActionMessage;
  end;
implementation

end.
