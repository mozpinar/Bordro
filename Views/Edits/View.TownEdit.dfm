inherited TownEditForm: TTownEditForm
  Caption = 'TownEditForm'
  ClientHeight = 204
  OnDestroy = FormDestroy
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Height = 163
    ExplicitHeight = 163
    object labelTownName: TLabel
      Left = 57
      Top = 48
      Width = 92
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTownName'
    end
    object labelCityId: TLabel
      Left = 90
      Top = 78
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCityId'
    end
    object edTownName: TDBEdit
      Left = 155
      Top = 45
      Width = 214
      Height = 24
      DataField = 'TownName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCityId: TJvDBLookupTreeViewCombo
      Left = 155
      Top = 75
      Width = 246
      Height = 24
      DataField = 'TownId'
      DataSource = DataSource1
      KeyField = 'Id'
      ListField = 'Name'
      MasterField = 'Id'
      DetailField = 'ParentId'
      StartMasterValue = '0'
      ListSource = dsCityCountry
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Top = 163
    ExplicitTop = 163
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 528
    Top = 120
  end
  inherited DataSource1: TDataSource
    Left = 536
    Top = 48
  end
  object dsCityCountry: TDataSource
    Left = 264
    Top = 112
  end
end
