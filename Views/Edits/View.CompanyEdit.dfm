inherited CompanyEditForm: TCompanyEditForm
  Caption = 'CompanyEditForm'
  ClientHeight = 534
  ClientWidth = 794
  ExplicitWidth = 810
  ExplicitHeight = 573
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 794
    Height = 493
    ExplicitWidth = 794
    ExplicitHeight = 493
    object labelCompanyCode: TLabel
      Left = 28
      Top = 19
      Width = 109
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyCode'
    end
    object labelCompanyName: TLabel
      Left = 24
      Top = 49
      Width = 113
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyName'
    end
    object labelAddress: TLabel
      Left = 64
      Top = 139
      Width = 73
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelAddress'
    end
    object labelStreet: TLabel
      Left = 75
      Top = 229
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelStreet'
    end
    object labellShortName: TLabel
      Left = 43
      Top = 109
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = 'labellShortName'
    end
    object labelPhone1: TLabel
      Left = 68
      Top = 317
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPhone1'
    end
    object labelPhone2: TLabel
      Left = 68
      Top = 347
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPhone2'
    end
    object labelFax: TLabel
      Left = 90
      Top = 377
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelFax'
    end
    object labelTown: TLabel
      Left = 78
      Top = 256
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTown'
    end
    object labelTaxOffice: TLabel
      Left = 457
      Top = 82
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTaxOffice'
    end
    object labelTaxRegistrationNumber: TLabel
      Left = 377
      Top = 109
      Width = 161
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTaxRegistrationNumber'
    end
    object labelEmployeeName1: TLabel
      Left = 15
      Top = 411
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelEmployeeName1'
    end
    object labelEmployeeName2: TLabel
      Left = 15
      Top = 441
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelEmployeeName2'
    end
    object labelResponsible1: TLabel
      Left = 436
      Top = 19
      Width = 102
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelResponsible1'
    end
    object labelResponsible2: TLabel
      Left = 436
      Top = 49
      Width = 102
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelResponsible2'
    end
    object labelPostCode: TLabel
      Left = 57
      Top = 287
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPostCode'
    end
    object edCompanyCode: TDBEdit
      Left = 143
      Top = 16
      Width = 121
      Height = 24
      DataField = 'CompanyCode'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCompanyName1: TDBEdit
      Left = 143
      Top = 46
      Width = 213
      Height = 24
      DataField = 'CompanyName1'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edCompanyName2: TDBEdit
      Left = 143
      Top = 76
      Width = 214
      Height = 24
      DataField = 'CompanyName2'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edCompanyAddress1: TDBEdit
      Left = 143
      Top = 136
      Width = 213
      Height = 24
      DataField = 'CompanyAddress1'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edCompanyAddress2: TDBEdit
      Left = 143
      Top = 166
      Width = 213
      Height = 24
      DataField = 'CompanyAddress2'
      DataSource = DataSource1
      TabOrder = 5
    end
    object edCompanyAddress3: TDBEdit
      Left = 143
      Top = 196
      Width = 138
      Height = 24
      DataField = 'CompanyAddress3'
      DataSource = DataSource1
      TabOrder = 6
    end
    object edStreet: TDBEdit
      Left = 143
      Top = 226
      Width = 203
      Height = 24
      DataField = 'Street'
      DataSource = DataSource1
      TabOrder = 7
    end
    object edShortName: TDBEdit
      Left = 143
      Top = 106
      Width = 213
      Height = 24
      DataField = 'ShortName'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edTaxOffice: TDBEdit
      Left = 544
      Top = 76
      Width = 203
      Height = 24
      DataField = 'TaxOffice'
      DataSource = DataSource1
      TabOrder = 17
    end
    object edTaxRegistrationNumber: TDBEdit
      Left = 544
      Top = 106
      Width = 203
      Height = 24
      DataField = 'TaxRegistrationNumber'
      DataSource = DataSource1
      TabOrder = 18
    end
    object edPostCode: TDBEdit
      Left = 143
      Top = 286
      Width = 203
      Height = 24
      DataField = 'PostCode'
      DataSource = DataSource1
      TabOrder = 9
    end
    object edPhone1: TDBEdit
      Left = 143
      Top = 316
      Width = 203
      Height = 24
      DataField = 'Phone1'
      DataSource = DataSource1
      TabOrder = 10
    end
    object edPhone2: TDBEdit
      Left = 143
      Top = 346
      Width = 203
      Height = 24
      DataField = 'Phone2'
      DataSource = DataSource1
      TabOrder = 11
    end
    object edFax: TDBEdit
      Left = 143
      Top = 376
      Width = 203
      Height = 24
      DataField = 'Fax'
      DataSource = DataSource1
      TabOrder = 12
    end
    object edEmployeeName1: TDBEdit
      Left = 143
      Top = 406
      Width = 203
      Height = 24
      DataField = 'EmployeeName1'
      DataSource = DataSource1
      TabOrder = 13
    end
    object edEmployeeName2: TDBEdit
      Left = 143
      Top = 436
      Width = 203
      Height = 24
      DataField = 'EmployeeName2'
      DataSource = DataSource1
      TabOrder = 14
    end
    object edResponsible1: TDBEdit
      Left = 544
      Top = 16
      Width = 203
      Height = 24
      DataField = 'Responsible1'
      DataSource = DataSource1
      TabOrder = 15
    end
    object edResponsible2: TDBEdit
      Left = 544
      Top = 46
      Width = 203
      Height = 24
      DataField = 'Responsible2'
      DataSource = DataSource1
      TabOrder = 16
    end
    object JvDBLookupTreeViewCombo1: TJvDBLookupTreeViewCombo
      Left = 143
      Top = 256
      Width = 370
      Height = 24
      DataField = 'TownId'
      DataSource = DataSource1
      DropDownWidth = 450
      DropDownHeight = 250
      KeyField = 'Id'
      ListField = 'Name'
      MasterField = 'Id'
      DetailField = 'ParentId'
      StartMasterValue = '0'
      ListSource = dsIlIlce
      TabOrder = 8
    end
  end
  inherited Panel2: TPanel
    Top = 493
    Width = 794
    ExplicitTop = 493
    ExplicitWidth = 794
    inherited btnOk: TButton
      Left = 580
      Top = 8
      Anchors = [akTop, akRight]
      ExplicitLeft = 580
      ExplicitTop = 8
    end
    inherited btnCancel: TButton
      Left = 693
      Top = 8
      Anchors = [akTop, akRight]
      ExplicitLeft = 693
      ExplicitTop = 8
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 672
    Top = 488
  end
  inherited DataSource1: TDataSource
    Left = 416
    Top = 208
  end
  object dsIlIlce: TDataSource
    Left = 680
    Top = 288
  end
end
