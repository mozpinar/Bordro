unit View.EmployeeEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TemplateEdit, Data.DB,
  JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, JvExMask, JvToolEdit, JvDBControls,
  JvCombobox, JvExStdCtrls, JvDBCombobox, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvMemoryDataset,
  Model.LanguageDictionary,
  Model.ProSu.Interfaces,
  Model.ProSu.Provider,
  Model.Declarations,
  Model.FormDeclarations,
  Spring.Data.ObjectDataset,
  JvExControls, JvDBLookupTreeView, JvDragDrop, Spring.Data.VirtualDataSet,
  Vcl.Menus, System.ImageList, Vcl.ImgList;

type
  TEmployeeEditForm = class(TTemplateEdit)
    Panel1: TPanel;
    PageTabsControl: TPageControl;
    tabIdentification: TTabSheet;
    tabWage: TTabSheet;
    tabConnection: TTabSheet;
    tabFamily: TTabSheet;
    edEmployeeName: TDBEdit;
    edEmployeeSurname: TDBEdit;
    edCompanyId: TDBLookupComboBox;
    labelEmployeeName: TLabel;
    labelEmployeeSurname: TLabel;
    edTitleId: TDBLookupComboBox;
    labelCompanyId: TLabel;
    labelCompanyIdNumber: TLabel;
    labelTitleId: TLabel;
    labelEmploymentDate: TLabel;
    labelMAritalStatus: TLabel;
    edCompanyIdNumber: TDBEdit;
    Splitter1: TSplitter;
    edEmploymentDate: TJvDBDateEdit;
    labelRetirementDate: TLabel;
    edRetirementDate: TJvDBDateEdit;
    edRetired: TDBCheckBox;
    Panel3: TPanel;
    labelNickName: TLabel;
    edNickName: TDBEdit;
    Panel4: TPanel;
    labelIdSequenceNo: TLabel;
    labelIdVolumeNo: TLabel;
    labelIdFamilyOrderNo: TLabel;
    labelIdOrderNo: TLabel;
    labelIdIssuePlace: TLabel;
    labelIdRegistrationNumber: TLabel;
    labelIdRegistrationReason: TLabel;
    labelIdRegistrationDate: TLabel;
    edIdSequenceNo: TDBEdit;
    edIdVolumeNo: TDBEdit;
    edIdFamilyOrderNo: TDBEdit;
    edIdOrderNo: TDBEdit;
    edIdIssuePlace: TDBEdit;
    edIdRegistrationNumber: TDBEdit;
    edIdRegistrationReason: TDBEdit;
    Panel5: TPanel;
    labelNationalityId: TLabel;
    labelTCIdNumber: TLabel;
    labelPassportNumber: TLabel;
    labelSgkRegNumber: TLabel;
    edPassportNumber: TDBEdit;
    edSgkRegNumber: TDBEdit;
    labelIdSerialNumber: TLabel;
    labelIdFatherName: TLabel;
    labelIdMotherName: TLabel;
    labelIdBirthPlace: TLabel;
    labelIdBirthDate: TLabel;
    labelIdReligion: TLabel;
    edNationalityId: TDBLookupComboBox;
    edIdSerialNumber: TDBEdit;
    edIdFatherName: TDBEdit;
    edIdMotherName: TDBEdit;
    edIdBirthPlace: TDBEdit;
    edIdBirthDate: TJvDBDateEdit;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel6: TPanel;
    labelIdCardImage: TLabel;
    edIdCardImage: TImage;
    tabOther: TTabSheet;
    labelIdMotherMaidenName: TLabel;
    edIdMotherMaidenName: TDBEdit;
    edBloodType: TDBComboBox;
    labelBloodType: TLabel;
    labelPhoneMobile: TLabel;
    labelPhoneHome: TLabel;
    labelPhoneOffice: TLabel;
    labelPhoneMobileCompany: TLabel;
    labelPrivateEmail: TLabel;
    groupAddress: TGroupBox;
    labelDistrict: TLabel;
    labelTown: TLabel;
    labelPostCode: TLabel;
    labelStreet: TLabel;
    labelAddress: TLabel;
    edAdrDistrict: TDBEdit;
    edAdrPostCode: TDBEdit;
    edAdrStreet: TDBEdit;
    edAddress: TDBMemo;
    labelCompanyEmail: TLabel;
    edPhoneMobile: TDBEdit;
    edPhoneHome: TDBEdit;
    edPhoneOffice: TDBEdit;
    edPhoneMobileCompany: TDBEdit;
    edPrivateEmail: TDBEdit;
    edCompanyEmail: TDBEdit;
    labelUnionMembered: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edUnionMembered: TDBEdit;
    labelFamilyName: TLabel;
    labelFamilySurname: TLabel;
    labelFamilyRelationshipTypeId: TLabel;
    labelFamilyGender: TLabel;
    labelFamilyBirthdate: TLabel;
    labelFamilyEducation: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    labelChildrenCount: TLabel;
    edChildrenCount: TDBEdit;
    gridFamily: TJvDBGrid;
    Splitter4: TSplitter;
    DBNavigator1: TDBNavigator;
    dsEmployeeFamily: TDataSource;
    memtblEmployeeFamily: TJvMemoryData;
    memtblEmployeeFamilyEmployeeFamilyMemberId: TIntegerField;
    memtblEmployeeFamilyEmployeeId: TIntegerField;
    memtblEmployeeFamilyIdentityNumber: TStringField;
    memtblEmployeeFamilyName: TStringField;
    memtblEmployeeFamilySurname: TStringField;
    memtblEmployeeFamilyRelationshipTypeId: TIntegerField;
    memtblEmployeeFamilyGender: TIntegerField;
    memtblEmployeeFamilyBirthDate: TDateField;
    memtblEmployeeFamilyIsStudent: TBooleanField;
    memtblEmployeeFamilyEducation: TStringField;
    memtblEmployeeFamilyJob: TStringField;
    memtblEmployeeFamilyAlive: TBooleanField;
    memtblEmployeeFamilyMobilePhone: TStringField;
    memtblEmployeeFamilyBeLiableToLookAfter: TBooleanField;
    edFamilyIsStudent: TDBCheckBox;
    labelFamilyJob: TLabel;
    edFamilyWorking: TDBCheckBox;
    edFamilyAlive: TDBCheckBox;
    edFamilyIncomeStatus: TDBCheckBox;
    labelFamilyMobilePhone: TLabel;
    edFamilyBeLiableToLookAfter: TDBCheckBox;
    edFamilyName: TDBEdit;
    edFamilySurname: TDBEdit;
    edFamilyBirthdate: TJvDBDateEdit;
    edFamilyEducation: TDBEdit;
    edFamilyJob: TDBEdit;
    edFamilyMobilePhone: TDBEdit;
    edFamilyRelationshipTypeId: TDBLookupComboBox;
    edMaritalStatus: TJvDBComboBox;
    edFamilyGender: TJvDBComboBox;
    tabOpinions: TTabSheet;
    dsTitle: TDataSource;
    dsTownCityCountryTree: TDataSource;
    edTownCityCountryTree: TJvDBLookupTreeViewCombo;
    dsCompany: TDataSource;
    dsCountry: TDataSource;
    dsCurrency: TDataSource;
    Panel9: TPanel;
    edEmployeeImage: TImage;
    JvDropTarget1: TJvDropTarget;
    JvDropTarget2: TJvDropTarget;
    popmEmployeeImage: TPopupMenu;
    popmEmployeeImageLoadImage1: TMenuItem;
    popmEmployeeImageClearImage1: TMenuItem;
    popmIdCardImage: TPopupMenu;
    popmIdCardImageLoadImage2: TMenuItem;
    popmIdCardImageClearImage2: TMenuItem;
    popmIdCardImageLargeView1: TMenuItem;
    labelGender: TLabel;
    edIdRegistrationDate: TJvDBDateEdit;
    edGender: TJvDBComboBox;
    edIdReligion: TJvDBComboBox;
    popmEmployeeImageLargeView1: TMenuItem;
    memtblEmployeeFamilyRelationType: TStringField;
    memtblEmployeeFamilyWorking: TBooleanField;
    memtblEmployeeFamilyIncomeStatus: TBooleanField;
    dsRelationshipType: TDataSource;
    memtblEmployeeFamilyProcessed: TIntegerField;
    memtblEmployeeFamilyRecStatus: TIntegerField;
    edTCIdNumber: TJvDBComboEdit;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel10: TPanel;
    labelSgkGroupId: TLabel;
    labelWageCurrency: TLabel;
    labelIncomeTaxExemptionGroupId: TLabel;
    labelBankAccountNumber: TLabel;
    edSgkGroupId: TJvDBComboBox;
    edWageCurrency: TDBLookupComboBox;
    edIncomeTaxExemptionGroupId: TJvDBComboBox;
    edBankAccountNumber: TDBEdit;
    edNetWage: TDBCheckBox;
    edMinimumWage: TDBCheckBox;
    edWageStampDutyOk: TDBCheckBox;
    edBonusStampDutyOk: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure JvDropTarget1DragAccept(Sender: TJvDropTarget;
      var Accept: Boolean);
    procedure JvDropTarget1DragDrop(Sender: TJvDropTarget;
      var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
    procedure JvDropTarget2DragAccept(Sender: TJvDropTarget;
      var Accept: Boolean);
    procedure JvDropTarget2DragDrop(Sender: TJvDropTarget;
      var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
    procedure popmEmployeeImageLoadImageClick(Sender: TObject);
    procedure popmEmployeeImageClearImageClick(Sender: TObject);
    procedure popmIdCardImageClearImageClick(Sender: TObject);
    procedure popmIdCardImageLoadImageClick(Sender: TObject);
    procedure popmEmployeeImageLargeView1Click(Sender: TObject);
    procedure popmIdCardImageLargeView1Click(Sender: TObject);
    procedure memtblEmployeeFamilyNewRecord(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure memtblEmployeeFamilyFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure memtblEmployeeFamilyBeforePost(DataSet: TDataSet);
    procedure TabFamilyMemberEditsExit(Sender: TObject);
    procedure edTCIdNumberButtonClick(Sender: TObject);
    procedure edEmployeeImageDblClick(Sender: TObject);
    procedure edIdCardImageDblClick(Sender: TObject);
  private
    fOEmployeeImageName : string;
    fOIdCardImageName : string;
    fTitleOD : TObjectDataset;
    fCompanyOD : TObjectDataset;
    fCountryOD : TObjectDataset;
    fCurrencyOD : TObjectDataset;
    fTownCityCountryOD : TObjectDataset;
    fRelationshipTypeOD : TObjectDataset;
    fFormLoaded : Boolean;
    procedure BuildTitleDataset;
    procedure BuildCompanyDataset;
    procedure BuildCountryDataset;
    procedure BuildCurrencyDataset;
    procedure BuildTownCityCountryDataset;

  protected
    procedure BeforePost(DataSet: TDataSet); override;
    procedure AfterPost(DataSet: TDataSet); override;
    procedure FormLoaded; override;
    procedure LoadCurrentLanguageTexts;
    class function RequiredPermission(cmd: TBrowseFormCommand) : string; override;
  public
    { Public declarations }
    function AddNew : Boolean; override;
    function EditCurrent : Boolean; override;
  end;

var
  EmployeeEditForm: TEmployeeEditForm;

implementation
uses
  Model.TownCityCountryTree, MainDM,
  Spring.Collections,
  Model.FileUpload,
  Model.Currency,
  View.PictureForm,
  Spring.Persistence.Mapping.Attributes,
  Support.IdentityVerification,
  System.DateUtils,
  JclStrings;
{$R *.dfm}

type
  [Entity]
  [Table]
  TmoEmployeeFamilyMember = class(TEmployeeFamilyMember)
  private
    FRelationType : string;
  published
    [Column]
    property RelationType: string read FRelationType write FRelationType;
  end;

function TEmployeeEditForm.AddNew: Boolean;
begin
  fOEmployeeImageName := '';
  fOIdCardImageName := '';
  result := inherited;
  //SavePictures;
end;

procedure TEmployeeEditForm.BuildCompanyDataset;
begin
  fCompanyOD := TObjectDataSet.Create(Self);
  fCompanyOD.DataList := DMMain.Session.FindAll<TCompany> as IObjectList;
  fCompanyOD.Open;
  dsCompany.DataSet := fCompanyOD;
end;

procedure TEmployeeEditForm.BuildCountryDataset;
begin
  fCountryOD := TObjectDataSet.Create(Self);
  fCountryOD.DataList := DMMain.Session.FindAll<TCountry> as IObjectList;
  fCountryOD.Open;
  dsCountry.DataSet := fCountryOD;
end;

procedure TEmployeeEditForm.BuildCurrencyDataset;
begin
  {fCurrencyOD := TObjectDataSet.Create(Self);
  fCurrencyOD.DataList := DMMain.Session.GetList<TCurrency>('select * from Currency where IsDeleted = 0', []) as IObjectList;
  fCurrencyOD.Open;
  dsCurrency.DataSet := fCurrencyOD;}
  fCurrencyOD := CreateCurrencyModelClass.GetAllCurrenciesDS('');
  dsCurrency.Dataset := fCurrencyOD;
end;

procedure TEmployeeEditForm.BuildTitleDataset;
begin
  fTitleOD:= TObjectDataSet.Create(Self);
  fTitleOD.DataList := DMMain.Session.GetList<TTitle>('select * from Title where CompanyId='+IntToStr(DMMain.Company.CompanyId)+
                                                      ' and IsDeleted = 0', []) as IObjectList;
  fTitleOD.Open;
  dsTitle.DataSet := fTitleOD;
end;

procedure TEmployeeEditForm.BuildTownCityCountryDataset;
begin
  fTownCityCountryOD := TObjectDataset.Create(self);
  fTownCityCountryOD.DataList := TTownCityCountyTree.GetTreeList(DMMain.Session);
  fTownCityCountryOD.Open;
  dsTownCityCountryTree.DataSet := fTownCityCountryOD;
end;

procedure TEmployeeEditForm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var prestat : TDataSetState;
begin
  if Button=nbDelete then
  begin
    if (memtblEmployeeFamily.State=dsInsert) or (memtblEmployeeFamilyRecStatus.AsInteger=Integer(nbInsert)) then
    begin
      inherited;
    end
    else
    begin
      prestat := memtblEmployeeFamily.State;
      fFormLoaded := False;
      memtblEmployeeFamily.Edit;
      memtblEmployeeFamilyRecStatus.AsInteger:=Integer(nbDelete);  // if this record is in DB,  then
      memtblEmployeeFamily.Post;
      fFormLoaded := True;
      if prestat in [dsEdit, dsInsert] then
        memtblEmployeeFamily.Edit;
    end;
  end
  else
  begin
    if Button=nbInsert then
      memtblEmployeeFamily.Append
    else
      inherited;
    ActiveControl := edFamilyName;
  end;
end;

procedure TEmployeeEditForm.edEmployeeImageDblClick(Sender: TObject);
begin
  popmEmployeeImageLargeView1Click(Sender);
end;

procedure TEmployeeEditForm.edIdCardImageDblClick(Sender: TObject);
begin
  popmIdCardImageLargeView1Click(Sender);
end;

procedure TEmployeeEditForm.TabFamilyMemberEditsExit(Sender: TObject);
begin
  if memtblEmployeeFamily.State in [dsInsert, dsEdit] then
    memtblEmployeeFamily.Post;
end;

procedure TEmployeeEditForm.popmIdCardImageClearImageClick(Sender: TObject);
begin
  edIdCardImage.Picture := Nil;
  DataSource1.DataSet.FieldByName('IdCardImageFilename').AsString := '';
end;

procedure TEmployeeEditForm.popmEmployeeImageClearImageClick(Sender: TObject);
begin
  edEmployeeImage.Picture := Nil;
  DataSource1.DataSet.FieldByName('PictureFileName').AsString := '';
end;

function TEmployeeEditForm.EditCurrent: Boolean;
begin
  fOEmployeeImageName := DataSource1.DataSet.FieldByName('PictureFileName').AsString;
  fOIdCardImageName := DataSource1.DataSet.FieldByName('IdCardImageFilename').AsString;
  TFileUploader.GetExistingPicture(fOEmployeeImageName, edEmployeeImage.Picture);
  TFileUploader.GetExistingPicture(fOIdCardImageName, edIdCardImage.Picture);

  Result := inherited;
end;

procedure TEmployeeEditForm.edTCIdNumberButtonClick(Sender: TObject);
var
   tcid : Int64;
   ad, soyad : string;
   yil : integer;
   NotEnoughInfo : Boolean;
   IDNotVerified : Boolean;
function myUpper(const s : string) : string;
var
  I: Integer;
  Ch : char;
begin
  Result := '';
  for I := 1 to Length(s) do
  begin
    case s[I] of
      'ý': Ch:='I';
      'ð': Ch:='Ð';
      'ü': Ch:='Ü';
      'þ': Ch:='Þ';
      'i': Ch:='Ý';
      'ö': Ch:='Ö';
      'ç': Ch:='Ç';
      'Ý': Ch:='Ý';
    else
      Ch :=UpCase(s[I]);
    end;
    Result := Result + Ch;
  end;
end;
begin
  //
  NotEnoughInfo := (DataSource1.DataSet.FieldByName('TCIdNumber').AsString='') or (DataSource1.DataSet.FieldByName('EmployeeName').AsString='') or (DataSource1.DataSet.FieldByName('EmployeeSurname').AsString='') or
    (DataSource1.DataSet.FieldByName('IdBirthDate').IsNull);
  //raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SInformationMustBeFull'));
  IDNotVerified := True;
  if (NotEnoughInfo=False) then
  begin
    tcid := StrToInt64(edTCIdNumber.Text);
    ad := AnsiUpperCase(edEmployeeName.Text);
    soyad := MyUpper(edEmployeeSurname.Text); //AnsiUpperCase(edEmployeeSurname.Text);
    yil := YearOf(edIdBirthDate.Date);
    if (NotEnoughInfo=False) and GetKPSPublicSoap().TCKimlikNoDogrula(tcid, ad, soyad, yil) then
    begin
      DataSource1.DataSet.FieldByName('TCIdNumberVerified').AsBoolean := True;
      edTCIdNumber.ImageIndex := 1;
      IDNotVerified := False;
    end
  end;

  if NotEnoughInfo or IDNotVerified then
  begin
    DataSource1.DataSet.FieldByName('TCIdNumberVerified').AsBoolean := False;
    edTCIdNumber.ImageIndex := 0;
  end;

  if NotEnoughInfo then
    raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SInformationMustBeFull'));
end;

procedure TEmployeeEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  fFormLoaded := False;
  PageTabsControl.ActivePageIndex := 0;

  BuildTitleDataset;
  BuildCompanyDataset;
  BuildCountryDataset;
  BuildCurrencyDataset;
  BuildTownCityCountryDataset;
end;

procedure TEmployeeEditForm.FormLoaded;
var
  familyMembers : IList<TmoEmployeeFamilyMember>;
  I: Integer;
begin
  inherited;

  fRelationshipTypeOD := TObjectDataset.Create(self);
  fRelationshipTypeOD.DataList := DMMain.Session.FindAll<TRelationshipType> as IObjectList;
  fRelationshipTypeOD.Open;
  dsRelationshipType.DataSet := fRelationshipTypeOD;

  familyMembers := DMMain.Session.GetList<TmoEmployeeFamilyMember>('select EFM.*, RT.RelationshipTypeName as RelationType from EmployeeFamilyMember EFM Left Join RelationshipType RT on (RT.RelationshipTypeId=EFM.RelationshipTypeId) where EFM.EmployeeId=:0;',
                                       [DataSource1.DataSet.FieldByName('EmployeeId').AsInteger]);

  if DataSource1.DataSet.FieldByName('TCIdNumberVerified').AsBoolean then
    edTCIdNumber.ImageIndex := 1
  else
    edTCIdNumber.ImageIndex := 0;

  memtblEmployeeFamily.Open;
  memtblEmployeeFamily.EmptyTable;
  for I := 0 to familyMembers.Count-1 do
  begin
    memtblEmployeeFamily.Append;
    memtblEmployeeFamilyEmployeeFamilyMemberId.AsInteger := familyMembers[i].EmployeeFamilyMemberId;
    memtblEmployeeFamilyEmployeeId.AsInteger := familyMembers[i].EmployeeId;
    memtblEmployeeFamilyIdentityNumber.AsString := familyMembers[i].IdentityNumber;
    memtblEmployeeFamilyName.AsString := familyMembers[i].Name;
    memtblEmployeeFamilySurname.AsString := familyMembers[i].Surname;
    memtblEmployeeFamilyRelationshipTypeId.AsInteger := familyMembers[i].RelationshipTypeId;
    memtblEmployeeFamilyGender.AsInteger := familyMembers[i].Gender;
    memtblEmployeeFamilyBirthDate.AsDateTime := familyMembers[i].BirthDate;
    memtblEmployeeFamilyIsStudent.AsBoolean := familyMembers[i].IsStudent;
    memtblEmployeeFamilyEducation.AsString := familyMembers[i].Education;
    memtblEmployeeFamilyJob.AsString := familyMembers[i].Job;
    memtblEmployeeFamilyWorking.AsBoolean := familyMembers[i].Working;
    memtblEmployeeFamilyAlive.AsBoolean := familyMembers[i].Alive;
    memtblEmployeeFamilyIncomeStatus.AsBoolean := familyMembers[i].IncomeStatus;
    memtblEmployeeFamilyMobilePhone.AsString := familyMembers[i].MobilePhone;
    memtblEmployeeFamilyBeLiableToLookAfter.AsBoolean := familyMembers[i].BeLiableToLookAfter;
    memtblEmployeeFamilyRelationType.AsString := familyMembers[i].RelationType;
    memtblEmployeeFamily.Post;
  end;
  fFormLoaded := True;
  LoadCurrentLanguageTexts;
end;

function FileIsAccepted(sender : TJvDropTarget) : boolean;
var sl : TStringList;
  s : string;
begin
  Result := False;
  sl := TStringList.Create;
  try
    Sender.GetFilenames(sl);
    if sl.Count=1 then
    begin
      s := UpperCase(ExtractFileExt(sl[0]));
      Result := (s='.JPG') or (s='.JPEG') or (s='.BMP') or (s='.PNG');
    end;
  finally
    sl.Free;
  end;
end;

procedure TEmployeeEditForm.JvDropTarget1DragAccept(Sender: TJvDropTarget;
  var Accept: Boolean);
begin
  Accept := FileIsAccepted(Sender);
end;

procedure TEmployeeEditForm.JvDropTarget1DragDrop(Sender: TJvDropTarget;
  var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
var
  sl : TStringList;
  s : string;
begin
  sl := TStringList.Create;
  try
    Sender.GetFilenames(sl);
    s := UpperCase(ExtractFileExt(sl[0]));
    edEmployeeImage.Picture.LoadFromFile(sl[0]);
    DataSource1.DataSet.FieldByName('PictureFileName').AsString := TFileUploader.BuildUniqueFileName(ExtractFileName(sl[0]));
  finally
    sl.Free;
  end;
end;

procedure TEmployeeEditForm.JvDropTarget2DragAccept(Sender: TJvDropTarget;
  var Accept: Boolean);
begin
  Accept := FileIsAccepted(Sender);
end;

procedure TEmployeeEditForm.JvDropTarget2DragDrop(Sender: TJvDropTarget;
  var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
var
  sl : TStringList;
  s : string;
begin
  sl := TStringList.Create;
  try
    Sender.GetFilenames(sl);
    s := UpperCase(ExtractFileExt(sl[0]));
    edIdCardImage.Picture.LoadFromFile(sl[0]);
    DataSource1.DataSet.FieldByName('IdCardImageFilename').AsString := TFileUploader.BuildUniqueFileName(ExtractFileName(sl[0]));
  finally
    sl.Free;
  end;
end;

procedure TEmployeeEditForm.LoadCurrentLanguageTexts;

procedure SetCBLookupItemAndValues(cbox : TJvDBComboBox; aPart : string);
var anames, avalues : string;
begin
  anames := cbox.Items.Text;
  avalues := cbox.Values.Text;
  ComponentListNameDictionary.GetTextNamesAndValues(ClassName, aPart, anames, avalues);
  cbox.Items.Text := anames;
  cbox.Values.Text := avalues;
end;

begin
  Caption := ComponentDictionary.GetText(Self.ClassName, 'Caption');
  labelEmployeeName.Caption := ComponentDictionary.GetText(ClassName, 'labelEmployeeName.Caption');
  labelEmployeeSurname.Caption := ComponentDictionary.GetText(ClassName, 'labelEmployeeSurname.Caption');
  labelMaritalStatus.Caption := ComponentDictionary.GetText(ClassName, 'labelMaritalStatus.Caption');


  SetCBLookupItemAndValues(edMaritalStatus, 'edMaritalStatus.Items.Text');

  labelEmploymentDate.Caption := ComponentDictionary.GetText(ClassName, 'labelEmploymentDate.Caption');
  edRetired.Caption := ComponentDictionary.GetText(ClassName, 'edRetired.Caption');
  labelRetirementDate.Caption := ComponentDictionary.GetText(ClassName, 'labelRetirementDate.Caption');
  labelNickName.Caption := ComponentDictionary.GetText(ClassName, 'labelNickName.Caption');

  labelCompanyId.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyId.Caption');
  labelCompanyIdNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyIdNumber.Caption');
  labelTitleId.Caption := ComponentDictionary.GetText(ClassName, 'labelTitleId.Caption');
  labelBloodType.Caption := ComponentDictionary.GetText(ClassName, 'labelBloodType.Caption');
  labelGender.Caption := ComponentDictionary.GetText(ClassName, 'labelGender.Caption');


  SetCBLookupItemAndValues(edGender, 'edGender.Items.Text');

  labelTCIdNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelTCIdNumber.Caption');
  labelPassportNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelPassportNumber.Caption');
  labelSgkRegNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelSgkRegNumber.Caption');
  labelNationalityId.Caption := ComponentDictionary.GetText(ClassName, 'labelNationalityId.Caption');
  labelIdSerialNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelIdSerialNumber.Caption');
  labelIdFatherName.Caption := ComponentDictionary.GetText(ClassName, 'labelIdFatherName.Caption');
  labelIdMotherName.Caption := ComponentDictionary.GetText(ClassName, 'labelIdMotherName.Caption');
  labelIdBirthPlace.Caption := ComponentDictionary.GetText(ClassName, 'labelIdBirthPlace.Caption');
  labelIdBirthDate.Caption := ComponentDictionary.GetText(ClassName, 'labelIdBirthDate.Caption');
  labelIdReligion.Caption := ComponentDictionary.GetText(ClassName, 'labelIdReligion.Caption');
  labelIdMotherMaidenName.Caption := ComponentDictionary.GetText(ClassName, 'labelIdMotherMaidenName.Caption');
  labelIdSequenceNo.Caption := ComponentDictionary.GetText(ClassName, 'labelIdSequenceNo.Caption');
  labelIdVolumeNo.Caption := ComponentDictionary.GetText(ClassName, 'labelIdVolumeNo.Caption');
  labelIdFamilyOrderNo.Caption := ComponentDictionary.GetText(ClassName, 'labelIdFamilyOrderNo.Caption');
  labelIdOrderNo.Caption := ComponentDictionary.GetText(ClassName, 'labelIdOrderNo.Caption');
  labelIdIssuePlace.Caption := ComponentDictionary.GetText(ClassName, 'labelIdIssuePlace.Caption');
  labelIdRegistrationNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelIdRegistrationNumber.Caption');
  labelIdRegistrationReason.Caption := ComponentDictionary.GetText(ClassName, 'labelIdRegistrationReason.Caption');
  labelIdRegistrationDate.Caption := ComponentDictionary.GetText(ClassName, 'labelIdRegistrationDate.Caption');
  labelIdCardImage.Caption := ComponentDictionary.GetText(ClassName, 'labelIdCardImage.Caption');

  labelSgkGroupId.Caption := ComponentDictionary.GetText(ClassName, 'labelSgkGroupId.Caption');
  labelWageCurrency.Caption := ComponentDictionary.GetText(ClassName, 'labelWageCurrency.Caption');
  labelIncomeTaxExemptionGroupId.Caption := ComponentDictionary.GetText(ClassName, 'labelIncomeTaxExemptionGroupId.Caption');
  labelBankAccountNumber.Caption := ComponentDictionary.GetText(ClassName, 'labelBankAccountNumber.Caption');

  edNetWage.Caption := ComponentDictionary.GetText(ClassName, 'edNetWage.Caption');
  edMinimumWage.Caption := ComponentDictionary.GetText(ClassName, 'edMinimumWage.Caption');
  edWageStampDutyOk.Caption := ComponentDictionary.GetText(ClassName, 'edWageStampDutyOk.Caption');
  edBonusStampDutyOk.Caption := ComponentDictionary.GetText(ClassName, 'edBonusStampDutyOk.Caption');

  groupAddress.Caption := ComponentDictionary.GetText(ClassName, 'groupAddress.Caption');
  labelDistrict.Caption := ComponentDictionary.GetText(ClassName, 'labelDistrict.Caption');
  labelTown.Caption := ComponentDictionary.GetText(ClassName, 'labelTown.Caption');
  labelPostCode.Caption := ComponentDictionary.GetText(ClassName, 'labelPostCode.Caption');
  labelStreet.Caption := ComponentDictionary.GetText(ClassName, 'labelStreet.Caption');
  labelAddress.Caption := ComponentDictionary.GetText(ClassName, 'labelAddress.Caption');

  labelPhoneMobile.Caption := ComponentDictionary.GetText(ClassName, 'labelPhoneMobile.Caption');
  labelPhoneHome.Caption := ComponentDictionary.GetText(ClassName, 'labelPhoneHome.Caption');
  labelPhoneOffice.Caption := ComponentDictionary.GetText(ClassName, 'labelPhoneOffice.Caption');
  labelPhoneMobileCompany.Caption := ComponentDictionary.GetText(ClassName, 'labelPhoneMobileCompany.Caption');
  labelPrivateEmail.Caption := ComponentDictionary.GetText(ClassName, 'labelPrivateEmail.Caption');
  labelCompanyEmail.Caption := ComponentDictionary.GetText(ClassName, 'labelCompanyEmail.Caption');

  labelChildrenCount.Caption := ComponentDictionary.GetText(ClassName, 'labelChildrenCount.Caption');

  labelFamilyName.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyName.Caption');
  labelFamilySurname.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilySurname.Caption');
  labelFamilyRelationshipTypeId.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyRelationshipTypeId.Caption');
  labelFamilyGender.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyGender.Caption');

  SetCBLookupItemAndValues(edFamilyGender, 'edGender.Items.Text');

  labelFamilyBirthdate.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyBirthdate.Caption');
  labelFamilyEducation.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyEducation.Caption');
  labelFamilyJob.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyJob.Caption');
  labelFamilyMobilePhone.Caption := ComponentDictionary.GetText(ClassName, 'labelFamilyMobilePhone.Caption');
  edFamilyIsStudent.Caption := ComponentDictionary.GetText(ClassName, 'edFamilyIsStudent.Caption');
  edFamilyIncomeStatus.Caption := ComponentDictionary.GetText(ClassName, 'edFamilyIncomeStatus.Caption');
  edFamilyWorking.Caption := ComponentDictionary.GetText(ClassName, 'edFamilyWorking.Caption');
  edFamilyAlive.Caption := ComponentDictionary.GetText(ClassName, 'edFamilyAlive.Caption');

  edFamilyBeLiableToLookAfter.Caption := ComponentDictionary.GetText(ClassName, 'edFamilyBeLiableToLookAfter.Caption');


  SetCBLookupItemAndValues(edMaritalStatus, 'edMaritalStatus.Items.Text');
  SetCBLookupItemAndValues(edIdReligion, 'edIdReligion.Items.Text');

  edIdReligion.Items.Text := ComponentListDictionary.GetText(ClassName, 'edIdReligion.Items.Text', edIdReligion.Items.Text);


  Model.LanguageDictionary.GridColumnDictionary().AssignGridColumnTitles(ClassName, gridFamily);
end;

procedure TEmployeeEditForm.memtblEmployeeFamilyBeforePost(DataSet: TDataSet);
begin
  if not fFormLoaded then
    Exit;
  if memtblEmployeeFamily.State=dsInsert then
    memtblEmployeeFamilyRecStatus.AsInteger := Integer(nbInsert)
  else
  if memtblEmployeeFamily.State=dsEdit then
    if memtblEmployeeFamilyRecStatus.AsInteger = Integer(nbInsert) then
      {do nothing. Let it be nbInsert}
    else
      memtblEmployeeFamilyRecStatus.AsInteger := Integer(nbEdit);
end;

procedure TEmployeeEditForm.memtblEmployeeFamilyFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Dataset.FieldByName('RecStatus').AsInteger <> Integer(nbDelete);
end;

procedure TEmployeeEditForm.memtblEmployeeFamilyNewRecord(DataSet: TDataSet);
begin
  memtblEmployeeFamilyIsStudent.AsBoolean := False;
  memtblEmployeeFamilyAlive.AsBoolean := False;
  memtblEmployeeFamilyBeLiableToLookAfter.AsBoolean := False;
  memtblEmployeeFamilyWorking.AsBoolean := False;
  memtblEmployeeFamilyIncomeStatus.AsBoolean := False;
end;

procedure TEmployeeEditForm.popmIdCardImageLargeView1Click(Sender: TObject);
begin
  ShowPicture(edIdCardImage.Picture);
end;

procedure TEmployeeEditForm.popmIdCardImageLoadImageClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edIdCardImage.Picture.LoadFromFile(OpenDialog1.FileName);
  end;

end;

class function TEmployeeEditForm.RequiredPermission(cmd: TBrowseFormCommand): string;
begin
  Result := '>????<';
  case cmd of
    efcmdAdd: Result := '5012';
    efcmdEdit: Result := '5013';
    efcmdDelete: Result := '5014';
    efcmdViewDetail: Result := '5015';
  end;
end;

procedure TEmployeeEditForm.popmEmployeeImageLargeView1Click(Sender: TObject);
begin
  ShowPicture(edEmployeeImage.Picture);
end;

procedure TEmployeeEditForm.popmEmployeeImageLoadImageClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    edEmployeeImage.Picture.LoadFromFile(OpenDialog1.FileName);
    DataSource1.DataSet.FieldByName('PictureFileName').AsString := TFileUploader.BuildUniqueFileName(ExtractFileName(OpenDialog1.FileName));
  end;
end;

procedure TEmployeeEditForm.AfterPost(DataSet: TDataSet);
procedure MoveTblToObj(fm : TEmployeeFamilyMember);
begin
  fm.EmployeeFamilyMemberId := memtblEmployeeFamilyEmployeeFamilyMemberId.AsInteger;
  fm.EmployeeId := DataSource1.DataSet.FieldByName('EmployeeId').AsInteger; //memtblEmployeeFamilyEmployeeId.AsInteger;
  fm.IdentityNumber := memtblEmployeeFamilyIdentityNumber.AsString;
  fm.Name := memtblEmployeeFamilyName.AsString;
  fm.Surname := memtblEmployeeFamilySurname.AsString;
  fm.RelationshipTypeId := memtblEmployeeFamilyRelationshipTypeId.AsInteger;
  fm.Gender := memtblEmployeeFamilyGender.AsInteger;
  fm.BirthDate := memtblEmployeeFamilyBirthDate.AsDateTime;
  fm.IsStudent := memtblEmployeeFamilyIsStudent.AsBoolean;
  fm.Education := memtblEmployeeFamilyEducation.AsString;
  fm.Job := memtblEmployeeFamilyJob.AsString;
  fm.Working := memtblEmployeeFamilyWorking.AsBoolean;
  fm.Alive := memtblEmployeeFamilyAlive.AsBoolean;
  fm.IncomeStatus := memtblEmployeeFamilyIncomeStatus.AsBoolean;
  fm.MobilePhone := memtblEmployeeFamilyMobilePhone.AsString;
  fm.BeLiableToLookAfter := memtblEmployeeFamilyBeLiableToLookAfter.AsBoolean;
end;
var
  //familyMembers : IList<TEmployeeFamilyMember>;
  //I: Integer;
  fm : TEmployeeFamilyMember;
begin
  {familyMembers := DMMain.Session.GetList<TEmployeeFamilyMember>('select * from EmployeeFamilyMember where EmployeeId=:0;',
                                       [DataSource1.DataSet.FieldByName('EmployeeId').AsInteger]);

  for I := 0 to familyMembers.Count-1 do
  begin
    //DMMain.Session.DeleteList<TEmployeeFamilyMember>(familyMembers);
  end;}

  fm := TEmployeeFamilyMember.Create;
  try
    memtblEmployeeFamily.First;
    while not memtblEmployeeFamily.Eof do
    begin
      MoveTblToObj(fm);
      case memtblEmployeeFamilyRecStatus.AsInteger of
      Integer(nbDelete) : DMMain.Session.Delete(fm);
      Integer(nbEdit) : DMMain.Session.Update(fm);
      Integer(nbInsert) : DMMain.Session.Insert(fm);
      end;
      memtblEmployeeFamily.Next;
    end;
  finally
    fm.Free;
  end;
end;

procedure TEmployeeEditForm.BeforePost(DataSet: TDataSet);
begin
  if (fOEmployeeImageName<>'') and (fOEmployeeImageName<>DataSource1.DataSet.FieldByName('PictureFileName').AsString) then
  begin
    TFileUploader.DeleteExistingPicture(fOEmployeeImageName);
  end;

  if (fOIdCardImageName<>'') and (fOIdCardImageName<>DataSource1.DataSet.FieldByName('IdCardImageFilename').AsString) then
  begin
    TFileUploader.DeleteExistingPicture(fOEmployeeImageName);
  end;

  TFileUploader.Execute(DataSource1.DataSet.FieldByName('PictureFileName').AsString, edEmployeeImage.Picture);
  TFileUploader.Execute(DataSource1.DataSet.FieldByName('IdCardImageFilename').AsString, edIdCardImage.Picture);
end;

end.
