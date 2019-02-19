unit ViewModel.Main;

interface
uses Model.Main, Model.Declarations, Model.FormDeclarations, Model.Interfaces;

function CreateMainViewModelClass: IMainViewModelInterface;

implementation

{ TMainViewMode }
uses System.SysUtils;
type
  TMainViewModel = class (TInterfacedObject, IMainViewModelInterface)
  private
    fModel : IMainModelInterface;  //TMainModel;
    //fLabelsText : TMainFormLabelsText;
    procedure SetModel(const newModel: IMainModelInterface);
    //function GetLabelsText: TMainFormLabelsText;
    function GetModel: IMainModelInterface;
  public
    property Model: IMainModelInterface read GetModel write SetModel;
    //property LabelsText: TMainFormLabelsText read GetLabelsText;
  end;

{function TMainViewModel.GetLabelsText: TMainFormLabelsText;
begin
  fLabelsText := fModel.GetMainFormLabelsText;
  Result := fLabelsText;
end;
}
function TMainViewModel.GetModel: IMainModelInterface;
begin
  Result := fModel;
end;

procedure TMainViewModel.SetModel(const newModel: IMainModelInterface);
begin
  fModel := newModel;
end;

function CreateMainViewModelClass: IMainViewModelInterface;
begin
  Result := TMainViewModel.Create;
end;


end.
