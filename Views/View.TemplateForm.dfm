object TemplateForm: TTemplateForm
  Left = 0
  Top = 0
  ActiveControl = JvDBGrid1
  Caption = 'TemplateForm'
  ClientHeight = 515
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel11: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 515
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    Caption = 'Panel11'
    TabOrder = 0
    object JvDBGrid1: TJvDBGrid
      Left = 4
      Top = 4
      Width = 757
      Height = 507
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = GridPMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = JvDBGrid1DblClick
      BevelInner = bvNone
      BevelOuter = bvNone
      SelectColumn = scGrid
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      ColumnResize = gcrNone
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
  end
  object DataSource1: TDataSource
    Left = 336
    Top = 88
  end
  object JvFormStorage2: TJvFormStorage
    AppStorage = DMMain.JvAppXMLFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'JvDBGrid1.Font'
      'JvDBGrid1.Color'
      'JvDBGrid1.Columns'
      'JvDBGrid1.RowsHeight'
      'JvDBGrid1.TitleFont'
      'JvDBGrid1.TitleRowHeight')
    StoredValues = <>
    Left = 432
    Top = 81
  end
  object GridPMenu1: TGridPMenu
    DBGrid = JvDBGrid1
    Left = 352
    Top = 304
  end
end
