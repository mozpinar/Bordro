inherited RoleEditForm: TRoleEditForm
  Caption = 'RoleEditForm'
  ClientHeight = 412
  ClientWidth = 732
  OnDestroy = FormDestroy
  ExplicitWidth = 748
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 732
    Height = 121
    Align = alTop
    ExplicitLeft = -8
    ExplicitTop = 8
    ExplicitHeight = 121
    object labelRoleName: TLabel
      Left = 80
      Top = 32
      Width = 85
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelRoleName'
    end
    object labelCompanyId: TLabel
      Left = 74
      Top = 64
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object edRoleName: TDBEdit
      Left = 171
      Top = 29
      Width = 262
      Height = 24
      DataField = 'RoleName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCompanyId: TJvDBLookupCombo
      Left = 171
      Top = 59
      Width = 206
      Height = 23
      DataField = 'CompanyId'
      DataSource = DataSource1
      LookupField = 'CompanyId'
      LookupDisplay = 'CompanyCode;CompanyName1'
      LookupDisplayIndex = 1
      LookupSource = dsCompany
      TabOrder = 1
    end
  end
  inherited Panel2: TPanel
    Top = 371
    Width = 732
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 121
    Width = 732
    Height = 250
    ActivePage = tabUsers
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 680
    object tabUsers: TTabSheet
      Caption = 'tabUsers'
      ExplicitWidth = 753
      ExplicitHeight = 213
      object Splitter1: TSplitter
        Left = 320
        Top = 25
        Height = 194
        ExplicitLeft = 336
        ExplicitTop = 72
        ExplicitHeight = 100
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 753
        object labelUsers: TLabel
          Left = 24
          Top = 3
          Width = 59
          Height = 16
          Caption = 'labelUsers'
        end
        object labelUsersOfGroup: TLabel
          Left = 396
          Top = 3
          Width = 106
          Height = 16
          Caption = 'labelUsersOfGroup'
        end
      end
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 25
        Width = 320
        Height = 194
        Align = alLeft
        DataSource = dsUsersSource
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
            FieldName = 'UserId'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Username'
            Title.Caption = 'User name'
            Width = 218
            Visible = True
          end>
      end
      object JvDBGrid2: TJvDBGrid
        Left = 385
        Top = 25
        Width = 339
        Height = 194
        Align = alClient
        Ctl3D = True
        DataSource = dsUsersTarget
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
            FieldName = 'UserId'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UserName'
            Width = 277
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 323
        Top = 25
        Width = 62
        Height = 194
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitHeight = 188
        object btnAddUser: TSpeedButton
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
          OnClick = btnAddUserClick
        end
        object btnDeleteUser: TSpeedButton
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
          OnClick = btnDeleteUserClick
        end
      end
    end
    object tabGroups: TTabSheet
      Caption = 'tabGroups'
      ImageIndex = 1
      ExplicitWidth = 753
      ExplicitHeight = 182
      object Splitter2: TSplitter
        Left = 320
        Top = 25
        Height = 194
        ExplicitLeft = 321
        ExplicitTop = 22
        ExplicitHeight = 173
      end
      object JvDBGrid3: TJvDBGrid
        Left = 0
        Top = 25
        Width = 320
        Height = 194
        Align = alLeft
        DataSource = dsGroupsSource
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
            FieldName = 'GroupId'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GroupName'
            Width = 210
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 323
        Top = 25
        Width = 62
        Height = 194
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 157
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
      object JvDBGrid4: TJvDBGrid
        Left = 385
        Top = 25
        Width = 339
        Height = 194
        Align = alClient
        DataSource = dsGroupsTarget
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
            FieldName = 'GroupId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GroupName'
            Width = 253
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 724
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitWidth = 753
        object labelRoles: TLabel
          Left = 24
          Top = 3
          Width = 67
          Height = 16
          Caption = 'labelGroups'
        end
        object labelRolesOfGroup: TLabel
          Left = 396
          Top = 3
          Width = 105
          Height = 16
          Caption = 'labelGroupsOfRole'
        end
      end
    end
    object tabPermissions: TTabSheet
      Caption = 'tabPermissions'
      ImageIndex = 2
      ExplicitWidth = 753
      ExplicitHeight = 182
      object Splitter3: TSplitter
        Left = 317
        Top = 25
        Height = 194
        ExplicitLeft = 336
        ExplicitTop = 72
        ExplicitHeight = 100
      end
      object grd: TJvDBGrid
        Left = 0
        Top = 25
        Width = 317
        Height = 194
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
        Height = 194
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 157
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
        Width = 342
        Height = 194
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
        Width = 724
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitWidth = 753
        object labelPermissions: TLabel
          Left = 24
          Top = 3
          Width = 95
          Height = 16
          Caption = 'labelPermissions'
        end
        object labelPermissionsOfGroup: TLabel
          Left = 396
          Top = 3
          Width = 142
          Height = 16
          Caption = 'labelPermissionsOfGroup'
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 432
    Top = 8
  end
  object dsUsersSource: TDataSource
    Left = 96
    Top = 162
  end
  object dsPermissionsSource: TDataSource
    Left = 96
    Top = 298
  end
  object dsGroupsSource: TDataSource
    Left = 96
    Top = 223
  end
  object dsUsersTarget: TDataSource
    Left = 504
    Top = 152
  end
  object dsPermissionsTarget: TDataSource
    Left = 512
    Top = 274
  end
  object dsGroupsTarget: TDataSource
    Left = 512
    Top = 207
  end
  object dsCompany: TDataSource
    Left = 448
    Top = 64
  end
end
