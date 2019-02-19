inherited DepartmentEditForm: TDepartmentEditForm
  Caption = 'DepartmentEditForm'
  ClientHeight = 257
  OnDestroy = FormDestroy
  ExplicitHeight = 296
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Height = 216
    object labelCompanyId: TLabel
      Left = 111
      Top = 96
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object labelParentDepartmentId: TLabel
      Left = 60
      Top = 65
      Width = 142
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelParentDepartmentId'
    end
    object labelDepartmentName: TLabel
      Left = 75
      Top = 35
      Width = 127
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelDepartmentName'
    end
    object labelDepartmentManagerTitleId: TLabel
      Left = 22
      Top = 125
      Width = 180
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelDepartmentManagerTitleId'
    end
    object edDepartmentName: TDBEdit
      Left = 208
      Top = 32
      Width = 273
      Height = 24
      DataField = 'DepartmentName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCompanyId: TDBLookupComboBox
      Left = 208
      Top = 92
      Width = 273
      Height = 24
      DataField = 'CompanyId'
      DataSource = DataSource1
      KeyField = 'CompanyId'
      ListField = 'CompanyName1'
      ListSource = dsCompany
      TabOrder = 1
    end
    object edParentDepartmentId: TJvDBLookupTreeViewCombo
      Left = 208
      Top = 62
      Width = 305
      Height = 24
      DataField = 'ParentId'
      DataSource = DataSource1
      DropDownWidth = 350
      DropDownHeight = 200
      KeyField = 'DepartmentId'
      ListField = 'DepartmentName'
      MasterField = 'DepartmentId'
      DetailField = 'ParentId'
      StartMasterValue = '0'
      ListSource = dsParentDeptTree
      TabOrder = 2
    end
    object edDepartmentManagerTitleId: TJvDBLookupTreeViewCombo
      Left = 208
      Top = 122
      Width = 273
      Height = 24
      DataField = 'TitleId'
      DataSource = DataSource1
      DropDownWidth = 350
      DropDownHeight = 200
      KeyField = 'TitleId'
      ListField = 'TitleName'
      MasterField = 'TitleId'
      DetailField = 'ParentTitleId'
      StartMasterValue = '0'
      ListSource = dsTitleTree
      TabOrder = 3
    end
  end
  inherited Panel2: TPanel
    Top = 216
  end
  inherited DataSource1: TDataSource
    Left = 424
    Top = 8
  end
  object dsCompany: TDataSource
    Left = 544
    Top = 96
  end
  object dsTitleTree: TDataSource
    Left = 544
    Top = 160
  end
  object dsParentDeptTree: TDataSource
    Left = 544
    Top = 40
  end
end
