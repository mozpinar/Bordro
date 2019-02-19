inherited TitleEditForm: TTitleEditForm
  Caption = 'TitleEditForm'
  ClientHeight = 240
  OnDestroy = FormDestroy
  ExplicitHeight = 279
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Height = 199
    ExplicitHeight = 199
    object labelTitleName: TLabel
      Left = 117
      Top = 35
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTitleName'
    end
    object labelTitleNameEng: TLabel
      Left = 96
      Top = 65
      Width = 106
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTitleNameEng'
    end
    object labelParentTitleId: TLabel
      Left = 102
      Top = 95
      Width = 100
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelParentTitleId'
    end
    object labelCompanyId: TLabel
      Left = 111
      Top = 126
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object edTitleName: TDBEdit
      Left = 208
      Top = 32
      Width = 273
      Height = 24
      DataField = 'TitleName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edTitleNameEng: TDBEdit
      Left = 208
      Top = 62
      Width = 273
      Height = 24
      DataField = 'TitleNameEng'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edParentTitleId: TJvDBLookupTreeViewCombo
      Left = 208
      Top = 92
      Width = 273
      Height = 24
      DataField = 'ParentTitleId'
      DataSource = DataSource1
      DropDownWidth = 350
      DropDownHeight = 200
      KeyField = 'TitleId'
      ListField = 'TitleName'
      MasterField = 'TitleId'
      DetailField = 'ParentTitleId'
      StartMasterValue = '0'
      ListSource = dsTitleTree
      TabOrder = 2
    end
    object edCompanyId: TDBLookupComboBox
      Left = 208
      Top = 122
      Width = 273
      Height = 24
      DataField = 'CompanyId'
      DataSource = DataSource1
      KeyField = 'CompanyId'
      ListField = 'CompanyName1'
      ListSource = dsCompany
      TabOrder = 3
    end
    object edIsHeadShip: TDBCheckBox
      Left = 200
      Top = 168
      Width = 97
      Height = 17
      Caption = 'edIsHeadShip'
      DataField = 'IsHeadShip'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  inherited Panel2: TPanel
    Top = 199
    ExplicitTop = 199
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 512
    Top = 0
  end
  inherited DataSource1: TDataSource
    Left = 456
    Top = 0
  end
  object dsCompany: TDataSource
    Left = 456
    Top = 128
  end
  object dsTitleTree: TDataSource
    Left = 512
    Top = 88
  end
end
