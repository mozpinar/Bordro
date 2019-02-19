inherited PermissionEditForm: TPermissionEditForm
  Caption = 'PermissionEditForm'
  ClientHeight = 430
  ClientWidth = 773
  ExplicitWidth = 789
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 773
    Height = 389
    ExplicitWidth = 773
    ExplicitHeight = 389
    object labelPermissionId: TLabel
      Left = 78
      Top = 35
      Width = 100
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPermissionId'
    end
    object labelPermissionName: TLabel
      Left = 56
      Top = 67
      Width = 122
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelPermissionName'
    end
    object labelParentId: TLabel
      Left = 103
      Top = 98
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelParentId'
    end
    object edPermissionId: TDBEdit
      Left = 184
      Top = 32
      Width = 121
      Height = 24
      DataField = 'PermissionId'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edPermissionName: TDBEdit
      Left = 184
      Top = 64
      Width = 377
      Height = 24
      DataField = 'PermissionName'
      DataSource = DataSource1
      TabOrder = 1
    end
    object edParentId: TJvDBLookupTreeViewCombo
      Left = 184
      Top = 94
      Width = 377
      Height = 24
      DataField = 'ParentId'
      DataSource = DataSource1
      DropDownWidth = 300
      DropDownHeight = 300
      KeyField = 'PermissionId'
      ListField = 'PermissionName'
      MasterField = 'PermissionId'
      DetailField = 'ParentId'
      StartMasterValue = '0'
      ListSource = dsParents
      TabOrder = 2
      FullExpand = True
    end
    object PageControl1: TPageControl
      Left = 4
      Top = 156
      Width = 765
      Height = 229
      ActivePage = tabRoles
      Align = alBottom
      TabOrder = 3
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
          Width = 372
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
          Width = 757
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
      object tabUsers: TTabSheet
        Caption = 'tabUsers'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 701
        ExplicitHeight = 0
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
          DataSource = dsUsersSource
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
              FieldName = 'UserId'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Username'
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
        object JvDBGrid6: TJvDBGrid
          Left = 382
          Top = 25
          Width = 375
          Height = 173
          Align = alClient
          DataSource = dsUsersTarget
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
              FieldName = 'UserId'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Username'
              Width = 233
              Visible = True
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 757
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          ExplicitWidth = 701
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
      object tabGroups: TTabSheet
        Caption = 'tabGroups'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 701
        ExplicitHeight = 0
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
          Width = 757
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 701
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
          Width = 372
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
    end
  end
  inherited Panel2: TPanel
    Top = 389
    Width = 773
    ExplicitTop = 389
    ExplicitWidth = 773
    inherited btnOk: TButton
      Left = 551
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 551
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 640
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 640
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 440
    Top = 24
  end
  inherited DataSource1: TDataSource
    Left = 392
    Top = 24
  end
  object dsParents: TDataSource
    Left = 528
    Top = 80
  end
  object dsGroupsSource: TDataSource
    Left = 72
    Top = 251
  end
  object dsRolesSource: TDataSource
    Left = 72
    Top = 308
  end
  object dsUsersSource: TDataSource
    Left = 72
    Top = 372
  end
  object dsGroupsTarget: TDataSource
    Left = 520
    Top = 240
  end
  object dsRolesTarget: TDataSource
    Left = 520
    Top = 280
  end
  object dsUsersTarget: TDataSource
    Left = 520
    Top = 332
  end
end
