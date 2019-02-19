inherited CurrencyEditForm: TCurrencyEditForm
  Caption = 'CurrencyEditForm'
  ClientHeight = 272
  ExplicitHeight = 311
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Height = 231
    ExplicitHeight = 231
    object labelCurrencyCode: TLabel
      Left = 124
      Top = 35
      Width = 107
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCurrencyCode'
    end
    object labelCurrencyName: TLabel
      Left = 120
      Top = 65
      Width = 111
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCurrencyName'
    end
    object labelSortOrder: TLabel
      Left = 147
      Top = 95
      Width = 84
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelSortOrder'
    end
    object labelMultiplier: TLabel
      Left = 152
      Top = 121
      Width = 79
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelMultiplier'
    end
    object labelPrecisionNumber: TLabel
      Left = 108
      Top = 155
      Width = 123
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPrecisionNumber'
    end
    object labelRefId: TLabel
      Left = 174
      Top = 187
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelRefId'
    end
    object edCurrencyCode: TDBEdit
      Left = 237
      Top = 32
      Width = 121
      Height = 24
      DataField = 'CurrencyCode'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCurrencyName: TDBEdit
      Left = 237
      Top = 62
      Width = 212
      Height = 24
      DataField = 'CurrencyName'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edSortOrder: TDBEdit
      Left = 237
      Top = 92
      Width = 121
      Height = 24
      DataField = 'SortOrder'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edMultiplier: TDBEdit
      Left = 237
      Top = 122
      Width = 121
      Height = 24
      DataField = 'Multiplier'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edPrecisionNumber: TDBEdit
      Left = 237
      Top = 152
      Width = 121
      Height = 24
      DataField = 'PrecisionNumber'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edRefId: TDBEdit
      Left = 237
      Top = 184
      Width = 121
      Height = 24
      DataField = 'RefId'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  inherited Panel2: TPanel
    Top = 231
    ExplicitTop = 231
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 544
  end
  inherited DataSource1: TDataSource
    Left = 560
    Top = 120
  end
end
