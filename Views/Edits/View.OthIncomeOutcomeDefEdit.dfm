inherited OthIncomeOutcomeDefEditForm: TOthIncomeOutcomeDefEditForm
  Caption = 'OthIncomeOutcomeDefEditForm'
  ClientHeight = 504
  ClientWidth = 912
  ExplicitWidth = 928
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 912
    Height = 463
    ExplicitLeft = 32
    ExplicitTop = 3
    ExplicitWidth = 845
    ExplicitHeight = 463
    object labelCompanyId: TLabel
      Left = 45
      Top = 329
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object labelCode: TLabel
      Left = 80
      Top = 24
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCode'
    end
    object labelDescription: TLabel
      Left = 46
      Top = 54
      Width = 90
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelDescription'
    end
    object labelOtvCutPercentage: TLabel
      Left = 7
      Top = 272
      Width = 129
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelOtvCutPercentage'
    end
    object labelAmount: TLabel
      Left = 497
      Top = 24
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelAmount'
    end
    object labelPercentage: TLabel
      Left = 477
      Top = 54
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPercentage'
    end
    object labelCurrencyId: TLabel
      Left = 479
      Top = 85
      Width = 89
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCurrencyId'
    end
    object labelComputationText: TLabel
      Left = 425
      Top = 128
      Width = 124
      Height = 16
      Caption = 'labelComputationText'
    end
    object edCompanyId: TJvDBLookupCombo
      Left = 142
      Top = 329
      Width = 243
      Height = 23
      DataField = 'CompanyId'
      DataSource = DataSource1
      LookupField = 'CompanyId'
      LookupDisplay = 'CompanyCode;CompanyName1'
      LookupDisplayIndex = 1
      LookupSource = dsCompany
      TabOrder = 0
    end
    object edIncomeOutcome: TDBRadioGroup
      Left = 46
      Top = 81
      Width = 313
      Height = 41
      Caption = 'edIncomeOutcome'
      Columns = 2
      DataField = 'IncomeOutcome'
      DataSource = DataSource1
      Items.Strings = (
        'Income'
        'Cut')
      TabOrder = 1
      Values.Strings = (
        '0'
        '1')
    end
    object edCode: TDBEdit
      Left = 142
      Top = 21
      Width = 243
      Height = 24
      DataField = 'Code'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edDescription: TDBEdit
      Left = 142
      Top = 51
      Width = 243
      Height = 24
      DataField = 'Description'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edComputationType: TDBRadioGroup
      Left = 45
      Top = 128
      Width = 313
      Height = 41
      Caption = 'edComputationType'
      Columns = 3
      DataField = 'ComputationType'
      DataSource = DataSource1
      Items.Strings = (
        'Amount'
        'Rate'
        'Formula')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object edIncomeTaxOk: TDBCheckBox
      Left = 46
      Top = 175
      Width = 312
      Height = 17
      Caption = 'edIncomeTaxOk'
      DataField = 'IncomeTaxOk'
      DataSource = DataSource1
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edSgkCutOk: TDBCheckBox
      Left = 46
      Top = 198
      Width = 313
      Height = 17
      Caption = 'edSgkCutOk'
      DataField = 'SgkCutOk'
      DataSource = DataSource1
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edWageStampDutyOk: TDBCheckBox
      Left = 46
      Top = 221
      Width = 312
      Height = 17
      Caption = 'edWageStampDutyOk'
      DataField = 'WageStampDutyOk'
      DataSource = DataSource1
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edOtvCutOk: TDBCheckBox
      Left = 46
      Top = 244
      Width = 312
      Height = 17
      Caption = 'edOtvCutOk'
      DataField = 'OtvCutOk'
      DataSource = DataSource1
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edOtvCutPercentage: TDBEdit
      Left = 142
      Top = 267
      Width = 121
      Height = 24
      DataField = 'OtvCutPercentage'
      DataSource = DataSource1
      TabOrder = 9
    end
    object edIsNet: TDBCheckBox
      Left = 46
      Top = 294
      Width = 312
      Height = 17
      Caption = 'edIsNet'
      DataField = 'IsNet'
      DataSource = DataSource1
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edAmount: TDBEdit
      Left = 574
      Top = 21
      Width = 163
      Height = 24
      DataField = 'Amount1'
      DataSource = DataSource1
      TabOrder = 11
    end
    object edPercentage: TDBEdit
      Left = 574
      Top = 51
      Width = 163
      Height = 24
      DataField = 'Percentage1'
      DataSource = DataSource1
      TabOrder = 12
    end
    object edCurrencyId: TJvDBLookupCombo
      Left = 575
      Top = 81
      Width = 162
      Height = 23
      DropDownCount = 14
      DropDownWidth = 220
      DataField = 'CurrencyId'
      DataSource = DataSource1
      LookupField = 'CurrencyId'
      LookupDisplay = 'CurrencyCode;CurrencyName'
      LookupSource = dsCurrency
      TabOrder = 13
    end
    object edComputationText: TDBSynEdit
      Left = 424
      Top = 150
      Width = 441
      Height = 257
      DataField = 'ComputationText'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 14
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynPasSyn1
    end
  end
  inherited Panel2: TPanel
    Top = 463
    Width = 912
    inherited btnOk: TButton
      Left = 680
      Top = 6
      ExplicitLeft = 680
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 790
      Top = 6
      ExplicitLeft = 790
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 512
    Top = 8
  end
  inherited DataSource1: TDataSource
    Left = 824
    Top = 24
  end
  object dsCompany: TDataSource
    Left = 200
    Top = 424
  end
  object SynPasSyn1: TSynPasSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 792
    Top = 160
  end
  object dsCurrency: TDataSource
    Left = 792
    Top = 112
  end
end
