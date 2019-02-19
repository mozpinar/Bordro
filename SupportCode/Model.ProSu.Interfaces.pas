unit Model.ProSu.Interfaces;

interface
//uses
//  Model.ProSu.InterfaceActions:

type
  INotificationClass = Interface
    ['{26528B51-7972-43E6-9626-F9424533B4B1}']
  End;

  TUpdateSubscriberMethod = procedure(const notifyClass : INotificationClass) of Object;

  ISubscriberInterface = Interface
    ['{AF1BEC65-1048-4668-BD20-5F2F48134EE7}']

    procedure UpdateSubscriber(const notifyClass : INotificationClass);
    procedure SetUpdateSubscriberMethod(newMethot : TUpdateSubscriberMethod);
  end;

  IProviderInterface = Interface
    ['{4E915173-78D1-4B95-9AA0-81B6309714F3}']
    procedure Subscribe(const tmpSubscriber : ISubscriberInterface);
    procedure Unsubscribe(const tmpSubscriber : ISubscriberInterface);
    procedure NotifySubscribers(const notifyClass : INotificationClass);
  end;

implementation

end.
