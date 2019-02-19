inherited TitleListForm: TTitleListForm
  ActiveControl = nil
  Caption = 'TitleListForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 201
    Width = 765
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 314
  end
  inherited Panel11: TPanel
    Height = 201
    Align = alTop
    Visible = False
    ExplicitHeight = 201
    inherited JvDBGrid1: TJvDBGrid
      Height = 193
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 204
    Width = 765
    Height = 311
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object JvDBTreeView1: TJvDBTreeView
      Left = 1
      Top = 1
      Width = 763
      Height = 309
      DataSource = DataSource1
      MasterField = 'TitleId'
      DetailField = 'ParentTitleId'
      ItemField = 'TitleName'
      StartMasterValue = '0'
      UseFilter = False
      PersistentNode = False
      BorderStyle = bsNone
      ReadOnly = True
      Indent = 19
      Align = alClient
      TabOrder = 0
      RowSelect = True
      Mirror = False
    end
  end
end
