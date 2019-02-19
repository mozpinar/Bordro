unit View.PictureForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TPictureForm = class(TForm)
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
  public
    { Public declarations }
  end;

procedure ShowPicture(aPic : TPicture);
implementation

{$R *.dfm}

procedure ShowPicture(aPic : TPicture);
var dw, dh : double;
begin
  if aPic=nil then
    Exit;
  with TPictureForm.Create(Application) do
  begin
    {dw := ((Screen.Width-(Width-ClientWidth))/aPic.Width);
    dh := ((Screen.Height-(Height-ClientHeight))/aPic.Height);
    if ((Screen.Width-(Width-ClientWidth))<aPic.Width) or ((Screen.Height-(Height-ClientHeight))<aPic.Height) then
    begin
      Image1.Stretch := True;
      if dw<dh then
      begin

      end
      else
      begin

      end;
    end
    else
    begin}
      ClientWidth := aPic.Width;
      ClientHeight := aPic.Height;
    //end;
    Left := (Screen.Width - Width) div 2;
    Top := (Screen.Height - Height) div 2;
    Image1.Picture.Assign(aPic);
    //Image1.Stretch := True;

    ShowModal;
  end;
end;
procedure TPictureForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_Escape then
    Close;
end;

procedure TPictureForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if Msg.Result = htClient then Msg.Result := htCaption;
end;

end.
