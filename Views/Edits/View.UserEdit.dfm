inherited UserEditForm: TUserEditForm
  Caption = 'UserEditForm'
  ClientHeight = 562
  ClientWidth = 775
  OnDestroy = FormDestroy
  ExplicitWidth = 791
  ExplicitHeight = 601
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 775
    Height = 521
    ExplicitWidth = 775
    ExplicitHeight = 521
    object labelUsername: TLabel
      Left = 80
      Top = 32
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelUsername'
    end
    object labelPassword: TLabel
      Left = 83
      Top = 62
      Width = 82
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPassword'
    end
    object labelUserGuid: TLabel
      Left = 87
      Top = 92
      Width = 78
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelUserGuid'
    end
    object labelDocPassword: TLabel
      Left = 62
      Top = 122
      Width = 103
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelDocPassword'
    end
    object labelCompanyId: TLabel
      Left = 74
      Top = 152
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object labelLocationId: TLabel
      Left = 80
      Top = 182
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelLocationId'
    end
    object labelMobilePhone: TLabel
      Left = 66
      Top = 210
      Width = 99
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelMobilePhone'
    end
    object labelEmail: TLabel
      Left = 107
      Top = 240
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelEmail'
    end
    object edUsername: TDBEdit
      Left = 171
      Top = 29
      Width = 262
      Height = 24
      DataField = 'Username'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edPassword: TDBEdit
      Left = 171
      Top = 59
      Width = 174
      Height = 24
      DataField = 'Password'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 1
    end
    object edDocPassword: TDBEdit
      Left = 171
      Top = 119
      Width = 174
      Height = 24
      DataField = 'DocPassword'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 3
    end
    object edCompanyId: TJvDBLookupCombo
      Left = 171
      Top = 149
      Width = 206
      Height = 23
      DataField = 'CompanyId'
      DataSource = DataSource1
      LookupField = 'CompanyId'
      LookupDisplay = 'CompanyCode;CompanyName1'
      LookupDisplayIndex = 1
      LookupSource = dsCompany
      TabOrder = 4
      OnChange = edCompanyIdChange
    end
    object edLocationId: TJvDBLookupCombo
      Left = 171
      Top = 178
      Width = 206
      Height = 23
      DataField = 'LocationId'
      DataSource = DataSource1
      LookupField = 'LocationId'
      LookupDisplay = 'LocationCode;LocationName'
      LookupDisplayIndex = 1
      LookupSource = dsLocation
      TabOrder = 5
    end
    object edMobilePhone: TDBEdit
      Left = 171
      Top = 207
      Width = 174
      Height = 24
      DataField = 'MobilePhone'
      DataSource = DataSource1
      TabOrder = 6
    end
    object edEmail: TDBEdit
      Left = 171
      Top = 237
      Width = 310
      Height = 24
      DataField = 'Email'
      DataSource = DataSource1
      TabOrder = 7
    end
    object edUserGuid: TJvDBComboEdit
      Left = 171
      Top = 89
      Width = 310
      Height = 24
      ButtonHint = 'Build Guid'
      DataField = 'UserGuid'
      DataSource = DataSource1
      Flat = False
      ParentFlat = False
      TabOrder = 2
      OnButtonClick = edUserGuidButtonClick
    end
    object PageControl1: TPageControl
      Left = 4
      Top = 288
      Width = 767
      Height = 229
      ActivePage = tabGroups
      Align = alBottom
      TabOrder = 8
      object tabGroups: TTabSheet
        Caption = 'tabGroups'
        object Splitter1: TSplitter
          Left = 320
          Top = 25
          Height = 173
          ExplicitLeft = 336
          ExplicitTop = 72
          ExplicitHeight = 100
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 759
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object labelGroups: TLabel
            Left = 24
            Top = 3
            Width = 67
            Height = 16
            Caption = 'labelGroups'
          end
          object labelGroupsOfUser: TLabel
            Left = 396
            Top = 3
            Width = 106
            Height = 16
            Caption = 'labelGroupsOfUser'
          end
        end
        object JvDBGrid1: TJvDBGrid
          Left = 0
          Top = 25
          Width = 320
          Height = 173
          Align = alLeft
          DataSource = dsGroupsSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'GroupId'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GroupName'
              Title.Caption = 'Group name'
              Width = 218
              Visible = True
            end>
        end
        object JvDBGrid2: TJvDBGrid
          Left = 385
          Top = 25
          Width = 374
          Height = 173
          Align = alClient
          Ctl3D = True
          DataSource = dsGroupsTarget
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'GroupId'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GroupName'
              Width = 277
              Visible = True
            end>
        end
        object Panel3: TPanel
          Left = 323
          Top = 25
          Width = 62
          Height = 173
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 3
          object btnAddGroup: TSpeedButton
            Left = 10
            Top = 43
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1773EB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnAddGroupClick
          end
          object btnDeleteGroup: TSpeedButton
            Left = 10
            Top = 71
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnDeleteGroupClick
          end
        end
      end
      object tabRoles: TTabSheet
        Caption = 'tabRoles'
        ImageIndex = 1
        object Splitter2: TSplitter
          Left = 320
          Top = 25
          Height = 173
          ExplicitLeft = 321
          ExplicitTop = 22
        end
        object JvDBGrid3: TJvDBGrid
          Left = 0
          Top = 25
          Width = 320
          Height = 173
          Align = alLeft
          DataSource = dsRolesSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'RoleId'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RoleName'
              Width = 210
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 323
          Top = 25
          Width = 62
          Height = 173
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object btnAddRole: TSpeedButton
            Left = 10
            Top = 43
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1773EB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnAddRoleClick
          end
          object btnDeleteRole: TSpeedButton
            Left = 10
            Top = 71
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnDeleteRoleClick
          end
        end
        object JvDBGrid4: TJvDBGrid
          Left = 385
          Top = 25
          Width = 374
          Height = 173
          Align = alClient
          DataSource = dsRolesTarget
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'RoleId'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RoleName'
              Width = 253
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 759
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object labelRoles: TLabel
            Left = 24
            Top = 3
            Width = 58
            Height = 16
            Caption = 'labelRoles'
          end
          object labelRolesOfUser: TLabel
            Left = 396
            Top = 3
            Width = 97
            Height = 16
            Caption = 'labelRolesOfUser'
          end
        end
      end
      object tabPermissions: TTabSheet
        Caption = 'tabPermissions'
        ImageIndex = 2
        object Splitter3: TSplitter
          Left = 317
          Top = 25
          Height = 173
          ExplicitLeft = 336
          ExplicitTop = 72
          ExplicitHeight = 100
        end
        object grd: TJvDBGrid
          Left = 0
          Top = 25
          Width = 317
          Height = 173
          Align = alLeft
          DataSource = dsPermissionsSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'PermissionId'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PermissionName'
              Width = 206
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 320
          Top = 25
          Width = 62
          Height = 173
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object btnAddPermission: TSpeedButton
            Left = 10
            Top = 43
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1773EB3783FB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
              3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
              783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnAddPermissionClick
          end
          object btnDeletePermission: TSpeedButton
            Left = 10
            Top = 71
            Width = 41
            Height = 22
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnDeletePermissionClick
          end
        end
        object JvDBGrid6: TJvDBGrid
          Left = 382
          Top = 25
          Width = 377
          Height = 173
          Align = alClient
          DataSource = dsPermissionsTarget
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 20
          TitleRowHeight = 20
          Columns = <
            item
              Expanded = False
              FieldName = 'PermissionId'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PermissionName'
              Width = 233
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 759
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object labelPermissions: TLabel
            Left = 24
            Top = 3
            Width = 95
            Height = 16
            Caption = 'labelPermissions'
          end
          object labelPermissionsOfUser: TLabel
            Left = 396
            Top = 3
            Width = 134
            Height = 16
            Caption = 'labelPermissionsOfUser'
          end
        end
      end
    end
  end
  inherited Panel2: TPanel
    Top = 521
    Width = 775
    ExplicitTop = 521
    ExplicitWidth = 775
    inherited btnOk: TButton
      Left = 573
      Top = 6
      ExplicitLeft = 573
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 670
      Top = 6
      ExplicitLeft = 670
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 384
    Top = 24
  end
  inherited DataSource1: TDataSource
    Left = 432
    Top = 72
  end
  object dsCompany: TDataSource
    Left = 600
    Top = 136
  end
  object dsLocation: TDataSource
    Left = 608
    Top = 200
  end
  object dsGroupsSource: TDataSource
    Left = 48
    Top = 387
  end
  object dsRolesSource: TDataSource
    Left = 48
    Top = 440
  end
  object dsPermissionsSource: TDataSource
    Left = 48
    Top = 496
  end
  object dsGroupsTarget: TDataSource
    Left = 496
    Top = 352
  end
  object dsRolesTarget: TDataSource
    Left = 496
    Top = 392
  end
  object dsPermissionsTarget: TDataSource
    Left = 496
    Top = 440
  end
end
