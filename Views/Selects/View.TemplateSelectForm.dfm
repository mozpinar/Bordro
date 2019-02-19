object TemplateSelectForm: TTemplateSelectForm
  Left = 0
  Top = 0
  Caption = 'TemplateSelectForm'
  ClientHeight = 368
  ClientWidth = 648
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 327
    Width = 648
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnOk: TButton
      Left = 400
      Top = 9
      Width = 75
      Height = 25
      Caption = 'btnOk'
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 513
      Top = 9
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'btnCancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel21: TPanel
    Left = 0
    Top = 49
    Width = 648
    Height = 278
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    ParentBackground = False
    TabOrder = 1
    object JvDBUltimGrid1: TJvDBUltimGrid
      Left = 4
      Top = 4
      Width = 640
      Height = 270
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = JvDBUltimGrid1DblClick
      IniStorage = JvFormStorage1
      TitleButtons = True
      PostOnEnterKey = True
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 648
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
  end
  object JvFormStorage1: TJvFormStorage
    AppStorage = DMMain.JvAppXMLFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'JvDBUltimGrid1.Columns'
      'JvDBUltimGrid1.Color'
      'JvDBUltimGrid1.FixedColor'
      'JvDBUltimGrid1.FixedCols'
      'JvDBUltimGrid1.Font'
      'JvDBUltimGrid1.RowsHeight'
      'JvDBUltimGrid1.TitleFont')
    StoredValues = <>
    Left = 344
    Top = 96
  end
  object DataSource1: TDataSource
    Left = 488
    Top = 104
  end
end
