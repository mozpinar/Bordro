inherited GroupEditForm: TGroupEditForm
  Caption = 'GroupEditForm'
  ClientHeight = 414
  ClientWidth = 761
  OnDestroy = FormDestroy
  ExplicitWidth = 777
  ExplicitHeight = 453
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 761
    Height = 129
    Align = alTop
    ExplicitWidth = 761
    ExplicitHeight = 129
    object labelGroupName: TLabel
      Left = 71
      Top = 32
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelGroupName'
    end
    object labelCompanyId: TLabel
      Left = 74
      Top = 64
      Width = 91
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelCompanyId'
    end
    object labelParentId: TLabel
      Left = 90
      Top = 86
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelParentId'
    end
    object edGroupName: TDBEdit
      Left = 171
      Top = 29
      Width = 262
      Height = 24
      DataField = 'GroupName'
      DataSource = DataSource1
      TabOrder = 0
    end
    object edCompanyId: TJvDBLookupCombo
      Left = 171
      Top = 59
      Width = 262
      Height = 23
      DataField = 'CompanyId'
      DataSource = DataSource1
      LookupField = 'CompanyId'
      LookupDisplay = 'CompanyCode;CompanyName1'
      LookupDisplayIndex = 1
      LookupSource = dsCompany
      TabOrder = 1
    end
    object edParentId: TJvDBLookupTreeViewCombo
      Left = 171
      Top = 88
      Width = 262
      Height = 24
      DataField = 'ParentId'
      DataSource = DataSource1
      KeyField = 'GroupId'
      ListField = 'GroupName'
      MasterField = 'GroupId'
      DetailField = 'ParentId'
      ListSource = dsGroupTree
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    Top = 373
    Width = 761
    ExplicitTop = 373
    ExplicitWidth = 761
    inherited btnOk: TButton
      Left = 544
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 544
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 641
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 641
      ExplicitTop = 6
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 129
    Width = 761
    Height = 244
    ActivePage = tabUsers
    Align = alClient
    TabOrder = 2
    object tabUsers: TTabSheet
      Caption = 'tabUsers'
      object Splitter1: TSplitter
        Left = 320
        Top = 25
        Height = 188
        ExplicitLeft = 336
        ExplicitTop = 72
        ExplicitHeight = 100
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Height = 188
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
        Width = 368
        Height = 188
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
        Height = 188
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
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
    object tabRoles: TTabSheet
      Caption = 'tabRoles'
      ImageIndex = 1
      object Splitter2: TSplitter
        Left = 320
        Top = 25
        Height = 188
        ExplicitLeft = 321
        ExplicitTop = 22
        ExplicitHeight = 173
      end
      object JvDBGrid3: TJvDBGrid
        Left = 0
        Top = 25
        Width = 320
        Height = 188
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
        Height = 188
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
        Width = 368
        Height = 188
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
        Width = 753
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
        object labelRolesOfGroup: TLabel
          Left = 396
          Top = 3
          Width = 105
          Height = 16
          Caption = 'labelRolesOfGroup'
        end
      end
    end
    object tabPermissions: TTabSheet
      Caption = 'tabPermissions'
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 317
        Top = 25
        Height = 188
        ExplicitLeft = 336
        ExplicitTop = 72
        ExplicitHeight = 100
      end
      object grd: TJvDBGrid
        Left = 0
        Top = 25
        Width = 317
        Height = 188
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
        Height = 188
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
        Width = 371
        Height = 188
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
        Width = 753
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
  inherited JvFormStorage1: TJvFormStorage
    Left = 504
    Top = 40
  end
  inherited DataSource1: TDataSource
    Left = 472
    Top = 24
  end
  object dsCompany: TDataSource
    Left = 472
    Top = 64
  end
  object dsGroupTree: TDataSource
    Left = 536
    Top = 104
  end
  object dsUsersSource: TDataSource
    Left = 104
    Top = 218
  end
  object dsRolesSource: TDataSource
    Left = 104
    Top = 290
  end
  object dsPermissionsSource: TDataSource
    Left = 120
    Top = 258
  end
  object dsUsersTarget: TDataSource
    Left = 512
    Top = 208
  end
  object dsRolesTarget: TDataSource
    Left = 568
    Top = 306
  end
  object dsPermissionsTarget: TDataSource
    Left = 544
    Top = 258
  end
end
