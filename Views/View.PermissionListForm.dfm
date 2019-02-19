inherited PermissionListForm: TPermissionListForm
  ActiveControl = nil
  Caption = 'PermissionListForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel11: TPanel
    object Splitter1: TSplitter [0]
      Left = 4
      Top = 109
      Width = 757
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = -12
      ExplicitTop = 119
    end
    inherited JvDBGrid1: TJvDBGrid
      Height = 105
      Align = alTop
      Visible = False
    end
    object JvDBTreeView1: TJvDBTreeView
      Left = 4
      Top = 112
      Width = 757
      Height = 399
      DataSource = DataSource1
      MasterField = 'PermissionId'
      DetailField = 'ParentId'
      ItemField = 'PermissionName'
      StartMasterValue = '0'
      UseFilter = False
      PersistentNode = False
      ReadOnly = True
      Indent = 19
      Align = alClient
      TabOrder = 1
      OnMouseMove = JvDBTreeView1MouseMove
      OnKeyDown = JvDBTreeView1KeyDown
      Mirror = False
    end
  end
end
