inherited EmployeeEditForm: TEmployeeEditForm
  Caption = 'EmployeeEditForm'
  ClientHeight = 665
  ClientWidth = 1045
  ShowHint = True
  ExplicitWidth = 1061
  ExplicitHeight = 704
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 1045
    Height = 624
    ExplicitWidth = 1045
    ExplicitHeight = 624
    object Splitter1: TSplitter
      Left = 4
      Top = 217
      Width = 1037
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 193
      ExplicitWidth = 281
    end
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 1037
      Height = 213
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object labelEmployeeName: TLabel
        Left = 4
        Top = 16
        Width = 115
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelEmployeeName'
      end
      object labelEmployeeSurname: TLabel
        Left = -15
        Top = 46
        Width = 134
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelEmployeeSurname'
      end
      object labelCompanyId: TLabel
        Left = 28
        Top = 77
        Width = 91
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelCompanyId'
      end
      object labelCompanyIdNumber: TLabel
        Left = -17
        Top = 106
        Width = 136
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelCompanyIdNumber'
      end
      object labelTitleId: TLabel
        Left = 56
        Top = 135
        Width = 63
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelTitleId'
      end
      object labelEmploymentDate: TLabel
        Left = 424
        Top = 46
        Width = 123
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelEmploymentDate'
      end
      object labelMAritalStatus: TLabel
        Left = 444
        Top = 16
        Width = 102
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelMaritalStatus'
      end
      object labelRetirementDate: TLabel
        Left = 431
        Top = 106
        Width = 116
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelRetirementDate'
      end
      object labelNickName: TLabel
        Left = 464
        Top = 135
        Width = 83
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelNickName'
      end
      object labelBloodType: TLabel
        Left = 33
        Top = 166
        Width = 86
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelBloodType'
      end
      object labelGender: TLabel
        Left = 479
        Top = 166
        Width = 68
        Height = 16
        Alignment = taRightJustify
        Caption = 'labelGender'
      end
      object edEmployeeName: TDBEdit
        Left = 125
        Top = 13
        Width = 121
        Height = 24
        DataField = 'EmployeeName'
        DataSource = DataSource1
        TabOrder = 0
      end
      object edEmployeeSurname: TDBEdit
        Left = 125
        Top = 43
        Width = 121
        Height = 24
        BevelInner = bvNone
        DataField = 'EmployeeSurname'
        DataSource = DataSource1
        TabOrder = 1
      end
      object edCompanyId: TDBLookupComboBox
        Left = 125
        Top = 73
        Width = 252
        Height = 24
        BevelInner = bvNone
        DataField = 'CompanyId'
        DataSource = DataSource1
        KeyField = 'CompanyId'
        ListField = 'CompanyCode;CompanyName1'
        ListSource = dsCompany
        TabOrder = 2
      end
      object edTitleId: TDBLookupComboBox
        Left = 125
        Top = 133
        Width = 225
        Height = 24
        DataField = 'TitleId'
        DataSource = DataSource1
        KeyField = 'TitleId'
        ListField = 'TitleName'
        ListSource = dsTitle
        TabOrder = 4
      end
      object edCompanyIdNumber: TDBEdit
        Left = 125
        Top = 103
        Width = 180
        Height = 24
        BevelInner = bvNone
        DataField = 'CompanyIdNumber'
        DataSource = DataSource1
        TabOrder = 3
      end
      object edEmploymentDate: TJvDBDateEdit
        Left = 553
        Top = 43
        Width = 144
        Height = 24
        DataField = 'EmploymentDate'
        DataSource = DataSource1
        ShowNullDate = False
        TabOrder = 7
      end
      object edRetirementDate: TJvDBDateEdit
        Left = 553
        Top = 103
        Width = 144
        Height = 24
        DataField = 'RetirementDate'
        DataSource = DataSource1
        ShowNullDate = False
        TabOrder = 9
      end
      object edRetired: TDBCheckBox
        Left = 509
        Top = 78
        Width = 188
        Height = 17
        Caption = 'edRetired'
        DataField = 'Retired'
        DataSource = DataSource1
        TabOrder = 8
      end
      object edNickName: TDBEdit
        Left = 553
        Top = 135
        Width = 200
        Height = 24
        DataField = 'NickName'
        DataSource = DataSource1
        TabOrder = 10
      end
      object edBloodType: TDBComboBox
        Left = 125
        Top = 163
        Width = 180
        Height = 24
        DataField = 'BloodType'
        DataSource = DataSource1
        Items.Strings = (
          'A RH+'
          'A RH-'
          'B RH+'
          'B RH-'
          'AB RH+'
          'AB RH-'
          '0 RH+'
          '0 RH-')
        TabOrder = 5
      end
      object edMaritalStatus: TJvDBComboBox
        Left = 553
        Top = 13
        Width = 145
        Height = 24
        DataField = 'MaritalStatus'
        DataSource = DataSource1
        TabOrder = 6
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
      object Panel9: TPanel
        Left = 852
        Top = 0
        Width = 185
        Height = 213
        Align = alRight
        BevelInner = bvLowered
        BorderWidth = 1
        TabOrder = 11
        object edEmployeeImage: TImage
          Left = 3
          Top = 3
          Width = 179
          Height = 207
          Hint = 'fdsfds'
          Align = alClient
          Center = True
          PopupMenu = popmEmployeeImage
          Proportional = True
          Stretch = True
          OnDblClick = edEmployeeImageDblClick
          ExplicitLeft = 20
          ExplicitTop = 0
          ExplicitWidth = 165
          ExplicitHeight = 183
        end
      end
      object edGender: TJvDBComboBox
        Left = 553
        Top = 165
        Width = 145
        Height = 24
        DataField = 'Gender'
        DataSource = DataSource1
        TabOrder = 12
        ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
        ListSettings.OutfilteredValueFont.Color = clRed
        ListSettings.OutfilteredValueFont.Height = -11
        ListSettings.OutfilteredValueFont.Name = 'Tahoma'
        ListSettings.OutfilteredValueFont.Style = []
      end
    end
    object PageTabsControl: TPageControl
      Left = 4
      Top = 220
      Width = 1037
      Height = 400
      ActivePage = tabWage
      Align = alClient
      TabOrder = 1
      object tabIdentification: TTabSheet
        Caption = 'tabIdentification'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1029
          Height = 369
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 367
            Top = 0
            Height = 369
            ExplicitLeft = 352
            ExplicitTop = 88
            ExplicitHeight = 100
          end
          object Splitter3: TSplitter
            Left = 736
            Top = 0
            Height = 369
            ExplicitLeft = 728
            ExplicitTop = 128
            ExplicitHeight = 100
          end
          object Panel4: TPanel
            Left = 370
            Top = 0
            Width = 366
            Height = 369
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitLeft = 371
            ExplicitTop = 1
            ExplicitHeight = 367
            object labelIdSequenceNo: TLabel
              Left = 46
              Top = 33
              Width = 109
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdSequenceNo'
            end
            object labelIdVolumeNo: TLabel
              Left = 59
              Top = 63
              Width = 96
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdVolumeNo'
            end
            object labelIdFamilyOrderNo: TLabel
              Left = 32
              Top = 94
              Width = 123
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdFamilyOrderNo'
            end
            object labelIdOrderNo: TLabel
              Left = 69
              Top = 123
              Width = 86
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdOrderNo'
            end
            object labelIdIssuePlace: TLabel
              Left = 57
              Top = 153
              Width = 98
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdIssuePlace'
            end
            object labelIdRegistrationNumber: TLabel
              Left = 4
              Top = 183
              Width = 151
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdRegistrationNumber'
            end
            object labelIdRegistrationReason: TLabel
              Left = 7
              Top = 213
              Width = 148
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdRegistrationReason'
            end
            object labelIdRegistrationDate: TLabel
              Left = 23
              Top = 243
              Width = 132
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdRegistrationDate'
            end
            object labelIdMotherMaidenName: TLabel
              Left = 3
              Top = 4
              Width = 152
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdMotherMaidenName'
            end
            object edIdSequenceNo: TDBEdit
              Left = 161
              Top = 30
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdSequenceNo'
              DataSource = DataSource1
              TabOrder = 1
            end
            object edIdVolumeNo: TDBEdit
              Left = 161
              Top = 60
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdVolumeNo'
              DataSource = DataSource1
              TabOrder = 2
            end
            object edIdFamilyOrderNo: TDBEdit
              Left = 161
              Top = 90
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdFamilyOrderNo'
              DataSource = DataSource1
              TabOrder = 3
            end
            object edIdOrderNo: TDBEdit
              Left = 161
              Top = 120
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdOrderNo'
              DataSource = DataSource1
              TabOrder = 4
            end
            object edIdIssuePlace: TDBEdit
              Left = 161
              Top = 150
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdIssuePlace'
              DataSource = DataSource1
              TabOrder = 5
            end
            object edIdRegistrationNumber: TDBEdit
              Left = 161
              Top = 180
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdRegistrationNumber'
              DataSource = DataSource1
              TabOrder = 6
            end
            object edIdRegistrationReason: TDBEdit
              Left = 161
              Top = 210
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'IdRegistrationReason'
              DataSource = DataSource1
              TabOrder = 7
            end
            object edIdMotherMaidenName: TDBEdit
              Left = 161
              Top = 0
              Width = 180
              Height = 24
              DataField = 'IdMotherMaidenName'
              DataSource = DataSource1
              TabOrder = 0
            end
            object edIdRegistrationDate: TJvDBDateEdit
              Left = 161
              Top = 240
              Width = 180
              Height = 24
              DataField = 'IdRegistrationDate'
              DataSource = DataSource1
              ShowNullDate = False
              TabOrder = 8
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 367
            Height = 369
            Align = alLeft
            BevelOuter = bvNone
            DoubleBuffered = False
            ParentDoubleBuffered = False
            TabOrder = 1
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitHeight = 367
            object labelNationalityId: TLabel
              Left = 46
              Top = 96
              Width = 97
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelNationalityId'
            end
            object labelTCIdNumber: TLabel
              Left = 44
              Top = 3
              Width = 99
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelTCIdNumber'
            end
            object labelPassportNumber: TLabel
              Left = 22
              Top = 33
              Width = 121
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelPassportNumber'
            end
            object labelSgkRegNumber: TLabel
              Left = 28
              Top = 63
              Width = 115
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelSgkRegNumber'
            end
            object labelIdSerialNumber: TLabel
              Left = 27
              Top = 123
              Width = 116
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdSerialNumber'
            end
            object labelIdFatherName: TLabel
              Left = 35
              Top = 153
              Width = 108
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdFatherName'
            end
            object labelIdMotherName: TLabel
              Left = 32
              Top = 183
              Width = 111
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdMotherName'
            end
            object labelIdBirthPlace: TLabel
              Left = 49
              Top = 213
              Width = 94
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdBirthPlace'
            end
            object labelIdBirthDate: TLabel
              Left = 53
              Top = 243
              Width = 90
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdBirthDate'
            end
            object labelIdReligion: TLabel
              Left = 60
              Top = 273
              Width = 83
              Height = 16
              Alignment = taRightJustify
              Caption = 'labelIdReligion'
            end
            object edPassportNumber: TDBEdit
              Left = 149
              Top = 30
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'PassportNumber'
              DataSource = DataSource1
              TabOrder = 1
            end
            object edSgkRegNumber: TDBEdit
              Left = 149
              Top = 60
              Width = 180
              Height = 24
              BevelInner = bvNone
              DataField = 'SgkRegNumber'
              DataSource = DataSource1
              TabOrder = 2
            end
            object edNationalityId: TDBLookupComboBox
              Left = 149
              Top = 90
              Width = 180
              Height = 24
              DataField = 'CountryId'
              DataSource = DataSource1
              KeyField = 'CountryId'
              ListField = 'CountryName'
              ListSource = dsCountry
              TabOrder = 3
            end
            object edIdSerialNumber: TDBEdit
              Left = 149
              Top = 120
              Width = 180
              Height = 24
              DataField = 'IdSerialNumber'
              DataSource = DataSource1
              TabOrder = 4
            end
            object edIdFatherName: TDBEdit
              Left = 149
              Top = 150
              Width = 180
              Height = 24
              DataField = 'IdFatherName'
              DataSource = DataSource1
              TabOrder = 5
            end
            object edIdMotherName: TDBEdit
              Left = 149
              Top = 180
              Width = 180
              Height = 24
              DataField = 'IdMotherName'
              DataSource = DataSource1
              TabOrder = 6
            end
            object edIdBirthPlace: TDBEdit
              Left = 149
              Top = 210
              Width = 180
              Height = 24
              DataField = 'IdBirthPlace'
              DataSource = DataSource1
              TabOrder = 7
            end
            object edIdBirthDate: TJvDBDateEdit
              Left = 149
              Top = 240
              Width = 180
              Height = 24
              DataField = 'IdBirthDate'
              DataSource = DataSource1
              ShowNullDate = False
              TabOrder = 8
            end
            object edIdReligion: TJvDBComboBox
              Left = 149
              Top = 270
              Width = 180
              Height = 24
              Style = csDropDown
              DataField = 'IdReligion'
              DataSource = DataSource1
              EnableValues = False
              TabOrder = 9
              ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
              ListSettings.OutfilteredValueFont.Color = clRed
              ListSettings.OutfilteredValueFont.Height = -11
              ListSettings.OutfilteredValueFont.Name = 'Tahoma'
              ListSettings.OutfilteredValueFont.Style = []
            end
            object edTCIdNumber: TJvDBComboEdit
              Left = 149
              Top = 0
              Width = 180
              Height = 24
              Hint = 'Check Id number by pressing button!'
              DataField = 'TCIdNumber'
              DataSource = DataSource1
              ImageIndex = 0
              Images = ImageList1
              TabOrder = 0
              OnButtonClick = edTCIdNumberButtonClick
            end
          end
          object Panel6: TPanel
            Left = 739
            Top = 0
            Width = 290
            Height = 369
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            ExplicitLeft = 740
            ExplicitTop = 1
            ExplicitWidth = 288
            ExplicitHeight = 367
            DesignSize = (
              290
              369)
            object labelIdCardImage: TLabel
              Left = 37
              Top = 0
              Width = 101
              Height = 16
              Anchors = [akTop, akRight]
              Caption = 'labelIdCardImage'
              ExplicitLeft = 55
            end
            object edIdCardImage: TImage
              Left = 31
              Top = 22
              Width = 251
              Height = 283
              Anchors = [akTop, akRight]
              Center = True
              PopupMenu = popmIdCardImage
              Proportional = True
              Stretch = True
              OnDblClick = edIdCardImageDblClick
              ExplicitLeft = 49
            end
          end
        end
      end
      object tabWage: TTabSheet
        Caption = 'tabWage'
        ImageIndex = 1
        ExplicitTop = 29
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 1029
          Height = 369
          Align = alClient
          TabOrder = 0
          ExplicitTop = 2
          object labelSgkGroupId: TLabel
            Left = 102
            Top = 14
            Width = 93
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelSgkGroupId'
          end
          object labelWageCurrency: TLabel
            Left = 84
            Top = 44
            Width = 111
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelWageCurrency'
          end
          object labelIncomeTaxExemptionGroupId: TLabel
            Left = 1
            Top = 74
            Width = 194
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelIncomeTaxExemptionGroupId'
          end
          object labelBankAccountNumber: TLabel
            Left = 51
            Top = 104
            Width = 144
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelBankAccountNumber'
          end
          object edSgkGroupId: TJvDBComboBox
            Left = 201
            Top = 11
            Width = 187
            Height = 24
            DataField = 'SgkGroupId'
            DataSource = DataSource1
            TabOrder = 0
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object edWageCurrency: TDBLookupComboBox
            Left = 201
            Top = 41
            Width = 187
            Height = 24
            DataField = 'WageCurrencyId'
            DataSource = DataSource1
            KeyField = 'CurrencyId'
            ListField = 'CurrencyCode;CurrencyName'
            ListSource = dsCurrency
            TabOrder = 1
          end
          object edIncomeTaxExemptionGroupId: TJvDBComboBox
            Left = 201
            Top = 71
            Width = 187
            Height = 24
            DataField = 'IncomeTaxExemptionGroupId'
            DataSource = DataSource1
            TabOrder = 2
            ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
            ListSettings.OutfilteredValueFont.Color = clRed
            ListSettings.OutfilteredValueFont.Height = -11
            ListSettings.OutfilteredValueFont.Name = 'Tahoma'
            ListSettings.OutfilteredValueFont.Style = []
          end
          object edBankAccountNumber: TDBEdit
            Left = 201
            Top = 101
            Width = 172
            Height = 24
            DataField = 'BankAccountNumber'
            DataSource = DataSource1
            TabOrder = 3
          end
          object edNetWage: TDBCheckBox
            Left = 549
            Top = 15
            Width = 213
            Height = 17
            Caption = 'edNetWage'
            DataField = 'NetWage'
            DataSource = DataSource1
            TabOrder = 4
          end
          object edMinimumWage: TDBCheckBox
            Left = 549
            Top = 45
            Width = 177
            Height = 17
            Caption = 'edMinimumWage'
            DataField = 'MinimumWage'
            DataSource = DataSource1
            TabOrder = 5
          end
          object edWageStampDutyOk: TDBCheckBox
            Left = 549
            Top = 75
            Width = 213
            Height = 17
            Caption = 'edWageStampDutyOk'
            DataField = 'WageStampDutyOk'
            DataSource = DataSource1
            TabOrder = 6
          end
          object edBonusStampDutyOk: TDBCheckBox
            Left = 549
            Top = 103
            Width = 213
            Height = 17
            Caption = 'edBonusStampDutyOk'
            DataField = 'BonusStampDutyOk'
            DataSource = DataSource1
            TabOrder = 7
          end
        end
      end
      object tabConnection: TTabSheet
        Caption = 'tabConnection'
        ImageIndex = 2
        ExplicitLeft = 5
        ExplicitTop = 29
        object labelPhoneMobile: TLabel
          Left = 496
          Top = 29
          Width = 99
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelPhoneMobile'
        end
        object labelPhoneHome: TLabel
          Left = 500
          Top = 59
          Width = 95
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelPhoneHome'
        end
        object labelPhoneOffice: TLabel
          Left = 500
          Top = 89
          Width = 95
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelPhoneOffice'
        end
        object labelPhoneMobileCompany: TLabel
          Left = 443
          Top = 119
          Width = 152
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelPhoneMobileCompany'
        end
        object labelPrivateEmail: TLabel
          Left = 498
          Top = 149
          Width = 97
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelPrivateEmail'
        end
        object labelCompanyEmail: TLabel
          Left = 484
          Top = 179
          Width = 111
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelCompanyEmail'
        end
        object groupAddress: TGroupBox
          Left = 16
          Top = 2
          Width = 401
          Height = 278
          Caption = 'groupAddress'
          TabOrder = 0
          object labelDistrict: TLabel
            Left = 33
            Top = 27
            Width = 66
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelDistrict'
          end
          object labelTown: TLabel
            Left = 40
            Top = 57
            Width = 59
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelTown'
          end
          object labelPostCode: TLabel
            Left = 20
            Top = 86
            Width = 80
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelPostCode'
          end
          object labelStreet: TLabel
            Left = 38
            Top = 116
            Width = 62
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelStreet'
          end
          object labelAddress: TLabel
            Left = 27
            Top = 147
            Width = 73
            Height = 16
            Alignment = taRightJustify
            Caption = 'labelAddress'
          end
          object edAdrDistrict: TDBEdit
            Left = 105
            Top = 24
            Width = 285
            Height = 24
            DataField = 'AdrDistrict'
            DataSource = DataSource1
            TabOrder = 0
          end
          object edAdrPostCode: TDBEdit
            Left = 105
            Top = 84
            Width = 285
            Height = 24
            DataField = 'AdrPostCode'
            DataSource = DataSource1
            TabOrder = 1
          end
          object edAdrStreet: TDBEdit
            Left = 105
            Top = 114
            Width = 285
            Height = 24
            DataField = 'AdrStreet'
            DataSource = DataSource1
            TabOrder = 2
          end
          object edAddress: TDBMemo
            Left = 105
            Top = 144
            Width = 286
            Height = 89
            DataField = 'Address'
            DataSource = DataSource1
            TabOrder = 3
          end
          object edTownCityCountryTree: TJvDBLookupTreeViewCombo
            Left = 105
            Top = 54
            Width = 285
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
            ListSource = dsTownCityCountryTree
            TabOrder = 4
          end
        end
        object edPhoneMobile: TDBEdit
          Left = 600
          Top = 26
          Width = 121
          Height = 24
          DataField = 'PhoneMobile'
          DataSource = DataSource1
          TabOrder = 1
        end
        object edPhoneHome: TDBEdit
          Left = 600
          Top = 56
          Width = 121
          Height = 24
          DataField = 'PhoneHome'
          DataSource = DataSource1
          TabOrder = 2
        end
        object edPhoneOffice: TDBEdit
          Left = 601
          Top = 86
          Width = 121
          Height = 24
          DataField = 'PhoneOffice'
          DataSource = DataSource1
          TabOrder = 3
        end
        object edPhoneMobileCompany: TDBEdit
          Left = 600
          Top = 116
          Width = 121
          Height = 24
          DataField = 'PhoneMobileCompany'
          DataSource = DataSource1
          TabOrder = 4
        end
        object edPrivateEmail: TDBEdit
          Left = 600
          Top = 146
          Width = 404
          Height = 24
          DataField = 'PrivateEmail'
          DataSource = DataSource1
          TabOrder = 5
        end
        object edCompanyEmail: TDBEdit
          Left = 600
          Top = 176
          Width = 404
          Height = 24
          DataField = 'CompanyEmail'
          DataSource = DataSource1
          TabOrder = 6
        end
      end
      object tabFamily: TTabSheet
        Caption = 'tabFamily'
        ImageIndex = 3
        object labelFamilyName: TLabel
          Left = 671
          Top = 44
          Width = 97
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyName'
        end
        object labelFamilySurname: TLabel
          Left = 652
          Top = 74
          Width = 116
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilySurname'
        end
        object labelFamilyRelationshipTypeId: TLabel
          Left = 596
          Top = 104
          Width = 172
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyRelationshipTypeId'
        end
        object labelFamilyGender: TLabel
          Left = 665
          Top = 134
          Width = 105
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyGender'
        end
        object labelFamilyBirthdate: TLabel
          Left = 653
          Top = 164
          Width = 115
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyBirthdate'
        end
        object labelFamilyEducation: TLabel
          Left = 649
          Top = 194
          Width = 119
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyEducation'
        end
        object Splitter4: TSplitter
          Left = 585
          Top = 43
          Height = 326
          ExplicitLeft = 568
          ExplicitTop = 128
          ExplicitHeight = 100
        end
        object labelFamilyJob: TLabel
          Left = 685
          Top = 224
          Width = 83
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyJob'
        end
        object labelFamilyMobilePhone: TLabel
          Left = 632
          Top = 254
          Width = 136
          Height = 16
          Alignment = taRightJustify
          Caption = 'labelFamilyMobilePhone'
        end
        object Panel7: TPanel
          Left = 0
          Top = 43
          Width = 585
          Height = 326
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object gridFamily: TJvDBGrid
            Left = 0
            Top = 0
            Width = 585
            Height = 301
            Align = alClient
            DataSource = dsEmployeeFamily
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            IniStorage = JvFormStorage1
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            EditControls = <>
            RowsHeight = 20
            TitleRowHeight = 20
            Columns = <
              item
                Expanded = False
                FieldName = 'RelationType'
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Name'
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Surname'
                Width = 136
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IdentityNumber'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Gender'
                Width = 69
                Visible = True
              end>
          end
          object DBNavigator1: TDBNavigator
            Left = 0
            Top = 301
            Width = 585
            Height = 25
            DataSource = dsEmployeeFamily
            Align = alBottom
            TabOrder = 1
            OnClick = DBNavigator1Click
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 1029
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object labelChildrenCount: TLabel
            Left = 189
            Top = 11
            Width = 107
            Height = 16
            Caption = 'labelChildrenCount'
          end
          object edChildrenCount: TDBEdit
            Left = 302
            Top = 8
            Width = 121
            Height = 24
            DataField = 'ChildrenCount'
            TabOrder = 0
          end
        end
        object edFamilyIsStudent: TDBCheckBox
          Left = 649
          Top = 281
          Width = 174
          Height = 17
          Caption = 'edFamilyIsStudent'
          DataField = 'IsStudent'
          DataSource = dsEmployeeFamily
          TabOrder = 10
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyWorking: TDBCheckBox
          Left = 649
          Top = 304
          Width = 97
          Height = 17
          Caption = 'edFamilyWorking'
          DataField = 'Working'
          DataSource = dsEmployeeFamily
          TabOrder = 11
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyAlive: TDBCheckBox
          Left = 649
          Top = 327
          Width = 97
          Height = 17
          Caption = 'edFamilyAlive'
          DataField = 'Alive'
          DataSource = dsEmployeeFamily
          TabOrder = 12
        end
        object edFamilyIncomeStatus: TDBCheckBox
          Left = 829
          Top = 281
          Width = 189
          Height = 17
          Caption = 'edFamilyIncomeStatus'
          DataField = 'IncomeStatus'
          DataSource = dsEmployeeFamily
          TabOrder = 13
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyBeLiableToLookAfter: TDBCheckBox
          Left = 829
          Top = 304
          Width = 189
          Height = 17
          Caption = 'edFamilyBeLiableToLookAfter'
          DataField = 'BeLiableToLookAfter'
          DataSource = dsEmployeeFamily
          TabOrder = 14
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyName: TDBEdit
          Left = 776
          Top = 41
          Width = 165
          Height = 24
          DataField = 'Name'
          DataSource = dsEmployeeFamily
          TabOrder = 2
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilySurname: TDBEdit
          Left = 776
          Top = 71
          Width = 165
          Height = 24
          DataField = 'Surname'
          DataSource = dsEmployeeFamily
          TabOrder = 3
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyBirthdate: TJvDBDateEdit
          Left = 776
          Top = 161
          Width = 121
          Height = 24
          DataField = 'BirthDate'
          DataSource = dsEmployeeFamily
          ShowNullDate = False
          TabOrder = 6
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyEducation: TDBEdit
          Left = 776
          Top = 191
          Width = 121
          Height = 24
          DataField = 'Education'
          DataSource = dsEmployeeFamily
          TabOrder = 7
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyJob: TDBEdit
          Left = 776
          Top = 221
          Width = 121
          Height = 24
          DataField = 'Job'
          DataSource = dsEmployeeFamily
          TabOrder = 8
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyMobilePhone: TDBEdit
          Left = 776
          Top = 251
          Width = 121
          Height = 24
          DataField = 'MobilePhone'
          DataSource = dsEmployeeFamily
          TabOrder = 9
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyRelationshipTypeId: TDBLookupComboBox
          Left = 776
          Top = 101
          Width = 211
          Height = 24
          DataField = 'RelationshipTypeId'
          DataSource = dsEmployeeFamily
          KeyField = 'RelationshipTypeId'
          ListField = 'RelationshipTypeName'
          ListSource = dsRelationshipType
          TabOrder = 4
          OnExit = TabFamilyMemberEditsExit
        end
        object edFamilyGender: TJvDBComboBox
          Left = 776
          Top = 131
          Width = 179
          Height = 24
          DataField = 'Gender'
          DataSource = dsEmployeeFamily
          TabOrder = 5
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
          OnExit = TabFamilyMemberEditsExit
        end
      end
      object tabOther: TTabSheet
        Caption = 'tabOther'
        ImageIndex = 4
        object labelUnionMembered: TLabel
          Left = 29
          Top = 16
          Width = 120
          Height = 16
          Caption = 'labelUnionMembered'
        end
        object Label2: TLabel
          Left = 496
          Top = 168
          Width = 37
          Height = 16
          Caption = 'Label2'
        end
        object Label3: TLabel
          Left = 504
          Top = 176
          Width = 37
          Height = 16
          Caption = 'Label3'
        end
        object Label4: TLabel
          Left = 512
          Top = 184
          Width = 37
          Height = 16
          Caption = 'Label4'
        end
        object Label5: TLabel
          Left = 520
          Top = 192
          Width = 37
          Height = 16
          Caption = 'Label5'
        end
        object Label6: TLabel
          Left = 528
          Top = 200
          Width = 37
          Height = 16
          Caption = 'Label6'
        end
        object Label7: TLabel
          Left = 536
          Top = 208
          Width = 37
          Height = 16
          Caption = 'Label7'
        end
        object edUnionMembered: TDBEdit
          Left = 155
          Top = 13
          Width = 166
          Height = 24
          DataField = 'UnionMembered'
          DataSource = DataSource1
          TabOrder = 0
        end
      end
      object tabOpinions: TTabSheet
        Caption = 'tabOpinions'
        ImageIndex = 5
      end
    end
  end
  inherited Panel2: TPanel
    Top = 624
    Width = 1045
    ExplicitTop = 624
    ExplicitWidth = 1045
    inherited btnOk: TButton
      Left = 809
      Top = 6
      ExplicitLeft = 809
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 937
      Top = 6
      ExplicitLeft = 937
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 752
    Top = 72
  end
  inherited DataSource1: TDataSource
    Left = 744
    Top = 168
  end
  object dsEmployeeFamily: TDataSource
    DataSet = memtblEmployeeFamily
    Left = 440
    Top = 360
  end
  object memtblEmployeeFamily: TJvMemoryData
    FieldDefs = <>
    BeforePost = memtblEmployeeFamilyBeforePost
    OnFilterRecord = memtblEmployeeFamilyFilterRecord
    OnNewRecord = memtblEmployeeFamilyNewRecord
    Left = 472
    Top = 434
    object memtblEmployeeFamilyEmployeeFamilyMemberId: TIntegerField
      FieldName = 'EmployeeFamilyMemberId'
    end
    object memtblEmployeeFamilyEmployeeId: TIntegerField
      FieldName = 'EmployeeId'
    end
    object memtblEmployeeFamilyIdentityNumber: TStringField
      FieldName = 'IdentityNumber'
      Size = 50
    end
    object memtblEmployeeFamilyName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object memtblEmployeeFamilySurname: TStringField
      FieldName = 'Surname'
      Size = 50
    end
    object memtblEmployeeFamilyRelationshipTypeId: TIntegerField
      DisplayLabel = 'RelationshipType'
      FieldName = 'RelationshipTypeId'
    end
    object memtblEmployeeFamilyGender: TIntegerField
      FieldName = 'Gender'
    end
    object memtblEmployeeFamilyBirthDate: TDateField
      FieldName = 'BirthDate'
    end
    object memtblEmployeeFamilyIsStudent: TBooleanField
      FieldName = 'IsStudent'
    end
    object memtblEmployeeFamilyEducation: TStringField
      FieldName = 'Education'
      Size = 50
    end
    object memtblEmployeeFamilyJob: TStringField
      FieldName = 'Job'
      Size = 50
    end
    object memtblEmployeeFamilyWorking: TBooleanField
      FieldName = 'Working'
    end
    object memtblEmployeeFamilyAlive: TBooleanField
      FieldName = 'Alive'
    end
    object memtblEmployeeFamilyIncomeStatus: TBooleanField
      FieldName = 'IncomeStatus'
    end
    object memtblEmployeeFamilyMobilePhone: TStringField
      FieldName = 'MobilePhone'
    end
    object memtblEmployeeFamilyBeLiableToLookAfter: TBooleanField
      FieldName = 'BeLiableToLookAfter'
    end
    object memtblEmployeeFamilyRelationType: TStringField
      FieldName = 'RelationType'
    end
    object memtblEmployeeFamilyProcessed: TIntegerField
      FieldName = 'Processed'
      Visible = False
    end
    object memtblEmployeeFamilyRecStatus: TIntegerField
      FieldName = 'RecStatus'
      Visible = False
    end
  end
  object dsTitle: TDataSource
    Left = 388
    Top = 140
  end
  object dsTownCityCountryTree: TDataSource
    Left = 496
    Top = 242
  end
  object dsCompany: TDataSource
    Left = 332
    Top = 44
  end
  object dsCountry: TDataSource
    Left = 329
    Top = 440
  end
  object dsCurrency: TDataSource
    Left = 408
    Top = 282
  end
  object JvDropTarget1: TJvDropTarget
    Control = Panel9
    OnDragDrop = JvDropTarget1DragDrop
    OnDragAccept = JvDropTarget1DragAccept
    Left = 804
    Top = 44
  end
  object JvDropTarget2: TJvDropTarget
    Control = Panel6
    OnDragDrop = JvDropTarget2DragDrop
    OnDragAccept = JvDropTarget2DragAccept
    Left = 832
    Top = 336
  end
  object popmEmployeeImage: TPopupMenu
    Left = 872
    Top = 92
    object popmEmployeeImageLoadImage1: TMenuItem
      Caption = 'Load Image'
      OnClick = popmEmployeeImageLoadImageClick
    end
    object popmEmployeeImageClearImage1: TMenuItem
      Caption = 'Clear Image'
      OnClick = popmEmployeeImageClearImageClick
    end
    object popmEmployeeImageLargeView1: TMenuItem
      Caption = 'Large View'
      OnClick = popmEmployeeImageLargeView1Click
    end
  end
  object popmIdCardImage: TPopupMenu
    Left = 976
    Top = 272
    object popmIdCardImageLoadImage2: TMenuItem
      Caption = 'Load Image'
      OnClick = popmIdCardImageLoadImageClick
    end
    object popmIdCardImageClearImage2: TMenuItem
      Caption = 'Clear Image'
      OnClick = popmIdCardImageClearImageClick
    end
    object popmIdCardImageLargeView1: TMenuItem
      Caption = 'Large View'
      OnClick = popmIdCardImageLargeView1Click
    end
  end
  object dsRelationshipType: TDataSource
    Left = 992
    Top = 343
  end
  object ImageList1: TImageList
    Left = 412
    Top = 84
    Bitmap = {
      494C010102000800240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000AD6D3000CEAE8F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1C396008DAC5D00759E
      38008DAC5D00B1C3960000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD6E3200AA662500AA662500D3AC
      8700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099B47000759E3800759E3800759E
      3800759E3800759E380099B47000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0B29500AA662500AA662500AA66
      2500D3AA82000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1773F00C6A687000000
      0000000000000000000000000000B1C39600759E3800759E3800FFFFFF00B2C9
      8F00759E3800759E3800759E3800B1C396000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5B39300AA662500AA66
      2500AA662500D2A87F000000000000000000CFAE9000C99F7700CBA58000D5C1
      AE0000000000000000000000000000000000B2784100AA662500AA662500C5A3
      83000000000000000000000000008DAC5D00759E3800FFFFFF00FFFFFF00FFFF
      FF00B2C98F00759E3800759E38008DAC5D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5B59600AA66
      2500AA662500AA662500BF834A00AA662500AA662500AA662500AA662500AA66
      2500AA672700000000000000000000000000C8A98C00AA662500AA662500AA66
      2500C4A180000000000000000000759E3800FFFFFF00FFFFFF00B2C98F00FFFF
      FF00FFFFFF00B2C98F00759E3800759E38000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D6B7
      9A00AA662500AA662500AA662500AA662500C48A5300D3AA8200CFA07200AA66
      2500AA662500AA662500D8BDA4000000000000000000C9AB8F00AA662500AA66
      2500AA662500B37C4800000000008DAC5D00759E3800B2C98F00759E3800759E
      3800FFFFFF00FFFFFF00B2C98F008DAC5D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C38D5A00AA662500AA662500F6EBE100FDFDFD00FDFDFD00FFFFFF00FDFD
      FD00C4956900AA662500AA662500000000000000000000000000CAAD9200AA66
      2600AA662500AA66250000000000B1C39600759E3800759E3800759E3800759E
      3800759E3800FFFFFF00759E3800B1C396000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AA662500AA662500F5E9DE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B77E4700AA662500C19A7400000000000000000000000000B684
      5400AA662500B2743A00E9DDD1000000000099B47000759E3800759E3800759E
      3800759E3800759E380099B47000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1B5
      9A00AA662500C2864C00FDFDFD00FFFFFF00FDFDFD00FDFDFD00FFFFFF00FDFD
      FD00FDFDFD00EBD6C200AA662500B0743B00000000000000000000000000AB67
      2700AA672600EBDBCC00FDFDFD00EDEDED0000000000B1C396008DAC5D00759E
      38008DAC5D00B1C3960000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBA5
      8100AA662500D1A47A00FDFDFD00FFFFFF00FDFDFD00FDFDFD00FFFFFF00FDFD
      FD00FDFDFD00F9F2EC00AA662500AA6625000000000000000000CBB19800AA66
      2500BD885600FFFFFF00FDFDFD00FDFDFD00F8F8F80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEAD
      8D00AA662500CB986600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2E5D900AA662500AC6B2D000000000000000000C8AA8C00AA66
      2500C5966900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EADA
      CA00AA662500AD6C2F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AA662500AA662500FDFDFD00FFFFFF00FDFDFD00FDFDFD00FFFFFF00FDFD
      FD00FDFDFD00D5A97F00AA662500B9885900000000000000000000000000AA66
      2500AE6D2F00F9F4EF00FDFDFD00FDFDFD00FFFFFF00FDFDFD00FDFDFD00CDA5
      7F00AA662500B887570000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE713500AA662500BD895700FFFFFF00FDFDFD00FDFDFD00FFFFFF00FDFD
      FD00F0DECC00AA662500AA662500D5C1AE00000000000000000000000000B27A
      4500AA662500C3936500FBF9F700FDFDFD00FFFFFF00FDFDFD00E4D0BC00AB68
      2800AA662500CEB8A20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA662500AA662500B2743A00E6CDB500F4E9DF00F0E0D100D3A5
      7A00AA662500AA662500C1895400000000000000000000000000000000000000
      0000AB692900AA662500B9804B00DEC4AA00E8D5C300CBA27A00AB682800AA66
      2500BA8B5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AA662500AA662500AA662500AA662500AA662500AA66
      2500AA662500C28A560000000000000000000000000000000000000000000000
      0000D1BEAB00AD6E3100AA662500AA662500AA662500AA662500AA662500BB8C
      5F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A58500B47D4900AD6D3000AF723700BB8D
      6000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4A17F00B47D4800AF723800BA8B5E00D0BBA7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF009FFFFF83000000000FFFFF0100000000
      07FF9E0000000000830F0E0000000000C007060000000000E001820000000000
      F001C20000000000F000E10100000000E000E08300000000E000C07F00000000
      E000C00300000000F000E00300000000F000E00300000000F801F00700000000
      FC03F00F00000000FE0FFC1F0000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JPeg|*.jpg|*.jpeg|Bitmap|*.bmp|PNG|*.png'
    Left = 804
    Top = 12
  end
  object SaveDialog1: TSaveDialog
    Left = 844
    Top = 12
  end
end
