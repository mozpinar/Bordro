inherited RelationshipTypeEditForm: TRelationshipTypeEditForm
  Caption = 'RelationshipTypeEditForm'
  ClientHeight = 126
  ClientWidth = 545
  ExplicitWidth = 561
  ExplicitHeight = 165
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel21: TPanel
    Width = 545
    Height = 85
    object labelRelationshipTypeName: TLabel
      Left = -10
      Top = 37
      Width = 157
      Height = 16
      Alignment = taRightJustify
      Caption = 'labelRelationshipTypeName'
    end
    object edRelationshipTypeName: TDBEdit
      Left = 153
      Top = 34
      Width = 347
      Height = 24
      DataField = 'RelationshipTypeName'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    Top = 85
    Width = 545
    inherited btnOk: TButton
      Left = 328
      Top = 6
      ExplicitLeft = 328
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 425
      Top = 6
      ExplicitLeft = 425
      ExplicitTop = 6
    end
  end
  inherited JvFormStorage1: TJvFormStorage
    Left = 416
    Top = 16
  end
  inherited DataSource1: TDataSource
    Left = 360
    Top = 16
  end
end
