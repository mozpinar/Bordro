unit View.TitleListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TahakkukForm, Data.DB, Vcl.Menus,
  GrdPMenu, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  View.TemplateForm,
  Spring.Collections,
  Model.Interfaces,
  Model.ProSu.Interfaces,
  ViewModel.CountryList,
  Spring.Data.ObjectDataSet,
  Model.Fabrication,
  Model.LanguageDictionary,
  Model.Declarations,
  Model.FormDeclarations, Vcl.ComCtrls, JvExComCtrls, JvDBTreeView;

type
  TTitleListForm = class(TTemplateForm)
    Panel1: TPanel;
    JvDBTreeView1: TJvDBTreeView;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private
    fViewModel : ITitleListViewModelInterface;

    fPossibleParentTitleId : Integer;
    procedure NotificationFromProvider(const notifyClass : INotificationClass);
    procedure SetViewModel(const newViewModel: ITitleListViewModelInterface);
    function GetViewModel : ITitleListViewModelInterface;

    function GetProvider : IProviderInterface; override;

    procedure UpdateLabelsText; override;
    procedure OpenDataset; override;
    procedure NewTitle(aDS : TDataset);
  public
    procedure AddNew; override;
    procedure DeleteCurrent; override; //this placed in the ancestor type (TTemplateForm)...
    procedure EditCurrent; override;
    procedure Print; override;
    property ViewModel : ITitleListViewModelInterface read GetViewModel write SetViewModel default nil;
    property Provider: IProviderInterface read GetProvider default nil;
  end;

var
  TitleListForm: TTitleListForm;

implementation
uses

  Model.ProSu.InterfaceActions,
  Model.ProSu.Subscriber,
  Model.ProSu.Provider,
  MainDM,
  Model.Title,
  ViewModel.TitleList,
  View.TitleEdit;

{$R *.dfm}

procedure TTitleListForm.AddNew;
begin
  try
    if fObjectDataset.RecordCount>0 then
      fPossibleParentTitleId := fObjectDataset.FieldByName('TitleId').AsInteger
    else
      fPossibleParentTitleId := -1;
    if TTitleEditForm.Execute(efcmdAdd, ViewModel.SubscriberToEdit, fObjectDataset) then
    begin
      if JvDBTreeView1.Items.Count>0 then
        JvDBTreeView1.Items[JvDBTreeView1.SelectedIndex].Expand(False);
      fObjectDataset.Refresh;
    end;
    //fObjectDataset.Locate('TitleId', IntToStr(fPossibleParentTitleId), []);
  finally
    fObjectDataset.Cancel;
  end;

end;

procedure TTitleListForm.DeleteCurrent;
begin
  inherited;

end;

procedure TTitleListForm.EditCurrent;
begin
  TTitleEditForm.Execute(efcmdEdit, ViewModel.SubscriberToEdit, fObjectDataset);
end;

procedure TTitleListForm.FormCreate(Sender: TObject);
begin
  inherited;
  ViewModel.SubscriberToEdit.SetUpdateSubscriberMethod(NotificationFromProvider);
end;

function TTitleListForm.GetProvider: IProviderInterface;
begin
  Result := ViewModel.Provider;
end;

function TTitleListForm.GetViewModel: ITitleListViewModelInterface;
begin
  if not Assigned(fViewModel) then
    fViewModel := CreateTitleListViewModelClass;
  Result := FViewModel;
end;

procedure TTitleListForm.NewTitle(aDS: TDataset);
begin
  fObjectDataset.FieldByName('CompanyId').AsInteger := DMMain.Company.CompanyId;
  if fPossibleParentTitleId>=0 then
    fObjectDataset.FieldByName('ParentTitleId').AsInteger := fPossibleParentTitleId;
end;

procedure TTitleListForm.NotificationFromProvider(
  const notifyClass: INotificationClass);
begin

end;

procedure TTitleListForm.OpenDataset;
begin
  fObjectDataset.DataList := ViewModel.Model.GetAllTitles(DMMain.Company.CompanyId, '');
  fObjectDataset.Open;
  DataSource1.DataSet := fObjectDataset;
  fObjectDataset.OnNewRecord := NewTitle;
  if fObjectDataset.RecordCount>0 then
    JvDBTreeView1.Items[0].Expand(True);
end;

procedure TTitleListForm.Print;
begin
  inherited;

end;

procedure TTitleListForm.SetViewModel(
  const newViewModel: ITitleListViewModelInterface);
begin
  fViewModel := newViewModel;
  if not Assigned(fViewModel) then
    raise Exception.Create('Country List View Model is required!');

  fViewModel.Provider.Subscribe(ViewModel.SubscriberToEdit);
end;

procedure TTitleListForm.UpdateLabelsText;
begin
  inherited;

end;

var
  CreateForm : TFactoryMethod<TTemplateForm>;
initialization
  CreateForm := function : TTemplateForm
     begin
       if not DMMain.Authorize('3521,3522,3523,3524,3525') then
         raise Exception.Create(Model.LanguageDictionary.MessageDictionary().GetMessage('SNotAuthorized')+#13#10+'TCityListForm');
       Result := TTitleListForm.Create(Application);
     end;
  MyFactory.RegisterForm<TTitleListForm>('TTitleListForm', CreateForm);

end.
