unit Model.FormDeclarations;

interface
uses
  Model.ProSu.Interfaces,
  Model.ProSu.InterfaceActions;

type
  TBrowseFormCommand = (efcmdNext, efcmdPrev, efcmdFirst, efcmdLast, efcmdAdd, efcmdEdit,
                        efcmdDelete, efcmdUndelete, efcmdViewDetail, efcmdPost,
                        efcmdClose, efcmdRefresh, efcmdSaveAsTemplate,
                        efcmdFind, efcmdPrint, efcmdActivateFilter, efcmdBuildFilter, efcmdDeactivateFilter);


  TNotificationClass = class (TInterfacedObject, INotificationClass)
  private
    factions : TInterfaceActions;
    factionValue : Double;
  public
    property Actions : TInterfaceActions read factions write factions;
    property ActionValue : Double read factionValue write factionValue;

  end;

implementation

end.
