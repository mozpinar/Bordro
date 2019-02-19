unit Model.FileUpload;

interface
uses
  Graphics, System.SysUtils;
type
  TFileUploader = class
  public
    class function BuildUniqueFileName(const oldfilename : string) : string;
    class procedure Execute(name : String; picture : TPicture);
    class procedure GetExistingPicture(name : String; picture : TPicture);
    class procedure DeleteExistingPicture(name : String);
  end;


implementation
uses
  MainDM,
  System.IOUtils;
{ TFileUploader }

class function TFileUploader.BuildUniqueFileName(const oldfilename : string) : string;
var
  s : string;
  I: Integer;
const
  rndchars : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
begin
  s := '';
  for I := 1 to 20 do
    s := s + rndchars[Random(35)+1];
  Result := FormatDateTime('yyyymmddhhnnzzz', Date+Time) + s + ExtractFileExt(oldfilename);
end;

class procedure TFileUploader.DeleteExistingPicture(name: String);
begin
  ForceDirectories(DMMain.FileUploadFolder+'\Trash\');
  TFile.Move(DMMain.FileUploadFolder+'\'+name, DMMain.FileUploadFolder+'\Trash\'+name);
end;

class procedure TFileUploader.Execute(name: String; picture: TPicture);
var fname : string;
begin
  if (name='') then
    Exit;
  fname := ExcludeTrailingBackslash(DMMain.FileUploadFolder)+'\'+name;
  ForceDirectories(DMMain.FileUploadFolder);
  picture.SaveToFile(fname);
end;

class procedure TFileUploader.GetExistingPicture(name: String;
  picture: TPicture);
var fname : string;
begin
  if (name='') then
    Exit;
  fname := ExcludeTrailingBackslash(DMMain.FileUploadFolder)+'\'+name;
  //picture := TPicture.Create;
  picture.LoadFromFile(fname);
end;

initialization
  Randomize;
end.
