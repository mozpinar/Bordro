inherited LocationEditForm: TLocationEditForm
  Caption = 'LocationEditForm'
  ClientHeight = 509
  ClientWidth = 939
  ExplicitWidth = 955
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 939
    Height = 468
    ExplicitWidth = 841
    ExplicitHeight = 447
    object labelLocationCode: TLabel
      Left = 34
      Top = 19
      Width = 103
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelLocationCode'
    end
    object labelLocationName: TLabel
      Left = 30
      Top = 49
      Width = 107
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelLocationName'
    end
    object labelAddress: TLabel
      Left = 64
      Top = 109
      Width = 73
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelAddress'
    end
    object labelStreet: TLabel
      Left = 75
      Top = 199
      Width = 62
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelStreet'
    end
    object labelPhone1: TLabel
      Left = 573
      Top = 17
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPhone1'
    end
    object labelPhone2: TLabel
      Left = 573
      Top = 47
      Width = 69
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPhone2'
    end
    object labelFax: TLabel
      Left = 595
      Top = 77
      Width = 47
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelFax'
    end
    object labelTown: TLabel
      Left = 78
      Top = 260
      Width = 59
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTown'
    end
    object labelTaxOffice: TLabel
      Left = 56
      Top = 322
      Width = 81
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTaxOffice'
    end
    object labelTaxRegistrationNumber: TLabel
      Left = -24
      Top = 349
      Width = 161
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelTaxRegistrationNumber'
    end
    object labelEmployeeName1: TLabel
      Left = 520
      Top = 111
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelEmployeeName1'
    end
    object labelEmployeeName2: TLabel
      Left = 520
      Top = 141
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelEmployeeName2'
    end
    object labelResponsible1: TLabel
      Left = 540
      Top = 169
      Width = 102
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelResponsible1'
    end
    object labelResponsible2: TLabel
      Left = 540
      Top = 199
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
    object labelRegion: TLabel
      Left = 71
      Top = 229
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelRegion'
    end
    object labelLongtitude: TLabel
      Left = 556
      Top = 259
      Width = 86
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelLongtitude'
    end
    object labelLatitude: TLabel
      Left = 570
      Top = 229
      Width = 72
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelLatitude'
    end
    object btnFindGpsLoc: TSpeedButton
      Left = 856
      Top = 242
      Width = 23
      Height = 22
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000080
        0000800000FFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF800000800000808080FFFFFF800000FFFFFF00FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080800000C0
        C0C0FFFFFF80808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF800000800000808080800000FFFFFF808080800000FFFFFF00FF
        FF00FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080FFFFFFC0
        C0C0800000800000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF800000800000FFFFFFFFFFFFFFFFFFC0C0C0800000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF800000800000808080FFFFFF80808080000080
        0000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000800000
        808080FFFFFFC0C0C0800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF800000808080FFFFFFC0C0C0C0C0C0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFF
        C0C0C0C0C0C0800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF800000800000800000800000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object labelCompany: TLabel
      Left = 57
      Top = 80
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompany'
    end
    object edLocationCode: TDBEdit
      Left = 143
      Top = 16
      Width = 121
      Height = 24
      DataField = 'LocationCode'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edLocationName: TDBEdit
      Left = 143
      Top = 46
      Width = 213
      Height = 24
      DataField = 'LocationName'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edLocationAddress1: TDBEdit
      Left = 143
      Top = 106
      Width = 213
      Height = 24
      DataField = 'LocationAddress1'
      DataSource = DataSource1
      TabOrder = 2
    end
    object edLocationAddress2: TDBEdit
      Left = 143
      Top = 136
      Width = 213
      Height = 24
      DataField = 'LocationAddress2'
      DataSource = DataSource1
      TabOrder = 3
    end
    object edLocationAddress3: TDBEdit
      Left = 143
      Top = 166
      Width = 138
      Height = 24
      DataField = 'LocationAddress3'
      DataSource = DataSource1
      TabOrder = 4
    end
    object edStreet: TDBEdit
      Left = 143
      Top = 196
      Width = 203
      Height = 24
      DataField = 'Street'
      DataSource = DataSource1
      TabOrder = 5
    end
    object edTaxOffice: TDBEdit
      Left = 143
      Top = 316
      Width = 203
      Height = 24
      DataField = 'TaxOffice'
      DataSource = DataSource1
      TabOrder = 6
    end
    object edTaxRegistrationNumber: TDBEdit
      Left = 143
      Top = 346
      Width = 203
      Height = 24
      DataField = 'TaxRegistrationNumber'
      DataSource = DataSource1
      TabOrder = 7
    end
    object edPostCode: TDBEdit
      Left = 143
      Top = 286
      Width = 203
      Height = 24
      DataField = 'PostCode'
      DataSource = DataSource1
      TabOrder = 8
    end
    object edPhone1: TDBEdit
      Left = 648
      Top = 16
      Width = 203
      Height = 24
      DataField = 'Phone1'
      DataSource = DataSource1
      TabOrder = 9
    end
    object edPhone2: TDBEdit
      Left = 648
      Top = 46
      Width = 203
      Height = 24
      DataField = 'Phone2'
      DataSource = DataSource1
      TabOrder = 10
    end
    object edFax: TDBEdit
      Left = 648
      Top = 76
      Width = 203
      Height = 24
      DataField = 'Fax'
      DataSource = DataSource1
      TabOrder = 11
    end
    object edEmployeeName1: TDBEdit
      Left = 648
      Top = 106
      Width = 203
      Height = 24
      DataField = 'EmployeeName1'
      DataSource = DataSource1
      TabOrder = 12
    end
    object edEmployeeName2: TDBEdit
      Left = 648
      Top = 136
      Width = 203
      Height = 24
      DataField = 'EmployeeName2'
      DataSource = DataSource1
      TabOrder = 13
    end
    object edResponsible1: TDBEdit
      Left = 648
      Top = 166
      Width = 203
      Height = 24
      DataField = 'Responsible1'
      DataSource = DataSource1
      TabOrder = 14
    end
    object edResponsible2: TDBEdit
      Left = 648
      Top = 196
      Width = 203
      Height = 24
      DataField = 'Responsible2'
      DataSource = DataSource1
      TabOrder = 15
    end
    object JvDBLookupTreeViewCombo1: TJvDBLookupTreeViewCombo
      Left = 143
      Top = 256
      Width = 346
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
      TabOrder = 16
    end
    object edRegion: TDBEdit
      Left = 143
      Top = 226
      Width = 203
      Height = 24
      DataField = 'Region'
      DataSource = DataSource1
      TabOrder = 17
    end
    object edLongtitude: TDBEdit
      Left = 648
      Top = 256
      Width = 203
      Height = 24
      DataField = 'Responsible2'
      DataSource = DataSource1
      TabOrder = 18
    end
    object edLatitude: TDBEdit
      Left = 648
      Top = 226
      Width = 203
      Height = 24
      DataField = 'Responsible1'
      DataSource = DataSource1
      TabOrder = 19
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 143
      Top = 77
      Width = 213
      Height = 23
      DataField = 'CompanyId'
      DataSource = DataSource1
      DisplayEmpty = '<Select a company>'
      LookupField = 'CompanyId'
      LookupDisplay = 'CompanyCode;CompanyName'
      LookupSource = dsCompany
      TabOrder = 20
    end
  end
  inherited Panel2: TPanel
    Top = 468
    Width = 939
    ExplicitTop = 447
    ExplicitWidth = 841
    inherited btnOk: TButton
      Left = 559
      Top = 6
      ExplicitLeft = 559
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 672
      Top = 6
      ExplicitLeft = 672
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 544
    Top = 208
  end
  inherited DataSource1: TDataSource
    Left = 352
    Top = 112
  end
  object dsIlIlce: TDataSource
    Left = 576
    Top = 312
  end
  object dsCompany: TDataSource
    Left = 368
    Top = 80
  end
end
