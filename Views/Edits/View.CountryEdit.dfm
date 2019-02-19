inherited CountryEditForm: TCountryEditForm
  Caption = 'CountryEditForm'
  ClientHeight = 215
  ClientWidth = 544
  ExplicitWidth = 560
  ExplicitHeight = 254
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 544
    Height = 170
    ExplicitWidth = 544
    ExplicitHeight = 170
    object labelCountryName: TLabel
      Left = 40
      Top = 43
      Width = 81
      Height = 16
      Caption = 'country_name'
    end
    object labelCountryCode2: TLabel
      Left = 40
      Top = 75
      Width = 83
      Height = 16
      Caption = 'country_code2'
    end
    object labelCountryCode3: TLabel
      Left = 40
      Top = 107
      Width = 83
      Height = 16
      Caption = 'country_code3'
    end
    object edCountryName: TDBEdit
      Left = 144
      Top = 42
      Width = 225
      Height = 24
      DataField = 'CountryName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCountryCode2: TDBEdit
      Left = 144
      Top = 72
      Width = 121
      Height = 24
      DataField = 'Code2'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edCountryCode3: TDBEdit
      Left = 144
      Top = 104
      Width = 121
      Height = 24
      DataField = 'Code3'
      DataSource = DataSource1
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Top = 170
    Width = 544
    Height = 45
    ExplicitTop = 170
    ExplicitWidth = 544
    ExplicitHeight = 45
    inherited btnOk: TButton
      Left = 332
      Top = 11
      Anchors = [akTop, akRight]
      ExplicitLeft = 332
      ExplicitTop = 11
    end
    inherited btnCancel: TButton
      Left = 445
      Top = 11
      Anchors = [akTop, akRight]
      ExplicitLeft = 445
      ExplicitTop = 11
    end
  end
end
