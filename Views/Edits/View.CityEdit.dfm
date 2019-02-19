inherited CityEditForm: TCityEditForm
  Caption = 'CityEditForm'
  ClientHeight = 244
  OnDestroy = FormDestroy
  ExplicitHeight = 283
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Height = 203
    ExplicitHeight = 203
    object labelCityName: TLabel
      Left = 89
      Top = 59
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCityName'
    end
    object labelCountryId: TLabel
      Left = 88
      Top = 120
      Width = 82
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCountryId'
    end
    object labelCityCode: TLabel
      Left = 93
      Top = 89
      Width = 77
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCityCode'
    end
    object edCityName: TDBEdit
      Left = 176
      Top = 56
      Width = 257
      Height = 24
      DataField = 'CityName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCountryId: TDBLookupComboBox
      Left = 176
      Top = 116
      Width = 233
      Height = 24
      DataField = 'CountryId'
      DataSource = DataSource1
      KeyField = 'CountryId'
      ListField = 'CountryName'
      ListSource = dsCountry
      TabOrder = 2
    end
    object edCityCode: TDBEdit
      Left = 176
      Top = 86
      Width = 137
      Height = 24
      DataField = 'CityCode'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Top = 203
    ExplicitTop = 203
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 392
    Top = 24
  end
  inherited DataSource1: TDataSource
    Top = 24
  end
  object dsCountry: TDataSource
    Left = 464
    Top = 96
  end
end
