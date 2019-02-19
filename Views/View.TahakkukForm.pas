unit View.TahakkukForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvEmbeddedForms,
  Vcl.ExtCtrls, JvExExtCtrls, JvImage, Data.DB, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid,
  View.TemplateForm,
  Model.ProSu.Interfaces,
  Model.FormDeclarations, Vcl.Menus, GrdPMenu;

type
  TTahakkukForm = class(TTemplateForm)
  private
  protected
    procedure NotificationFromProvider(const notifyClass: INotificationClass);
    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
  public
    procedure OrderCommand(command : TBrowseFormCommand); override;
  end;

//var
//  TahakkukForm: TTahakkukForm;

implementation
uses
  Spring.DesignPatterns,
  Model.Fabrication;

{$R *.dfm}
var
  CreateForm : TFactoryMethod<TTemplateForm>;


{ TTahakkukForm }

procedure TTahakkukForm.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TTahakkukForm.OpenDataset;
begin

end;

procedure TTahakkukForm.OrderCommand(command: TBrowseFormCommand);
begin

end;

procedure TTahakkukForm.UpdateLabelsText;
begin

end;

initialization
  CreateForm := function : TTemplateForm
     begin
       Result := TTahakkukForm.Create(Application);
     end;
  MyFactory.RegisterForm<TTahakkukForm>('TTahakkukForm', CreateForm);

end.
