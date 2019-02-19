inherited DepartmentListForm: TDepartmentListForm
  ActiveControl = nil
  Caption = 'DepartmentListForm'
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel11: TPanel
    ExplicitHeight = 161
    inherited JvDBGrid1: TJvDBGrid
      Height = 141
      Align = alTop
      DataSource = nil
      Visible = False
    end
    object JvDBTreeView1: TJvDBTreeView
      Left = 4
      Top = 145
      Width = 757
      Height = 366
      DataSource = DataSource1
      MasterField = 'DepartmentId'
      DetailField = 'ParentId'
      ItemField = 'DepartmentName'
      StartMasterValue = '0'
      UseFilter = False
      PersistentNode = False
      BorderStyle = bsNone
      ReadOnly = True
      Indent = 19
      Align = alClient
      TabOrder = 1
      RowSelect = True
      Mirror = False
    end
  end
end
