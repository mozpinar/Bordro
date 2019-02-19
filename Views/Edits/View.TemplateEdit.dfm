object TemplateEdit: TTemplateEdit
  Left = 0
  Top = 0
  Caption = 'TemplateEdit'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel21: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 258
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    ParentBackground = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
  object JvFormStorage1: TJvFormStorage
    AppStorage = DMMain.JvAppXMLFileStorage1
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 320
    Top = 64
  end
  object DataSource1: TDataSource
    Left = 448
    Top = 64
  end
end
