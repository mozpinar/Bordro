inherited CompanySelectForm: TCompanySelectForm
  Caption = 'CompanySelectForm'
  ClientHeight = 462
  ClientWidth = 797
  ExplicitWidth = 813
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 421
    Width = 797
    ExplicitTop = 421
    ExplicitWidth = 797
    inherited btnOk: TButton
      Left = 544
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 544
      ExplicitTop = 6
    end
    inherited btnCancel: TButton
      Left = 657
      Top = 6
      Anchors = [akTop, akRight]
      ExplicitLeft = 657
      ExplicitTop = 6
    end
  end
  inherited Panel21: TPanel
    Width = 797
    Height = 372
    ExplicitWidth = 797
    ExplicitHeight = 372
    inherited JvDBUltimGrid1: TJvDBUltimGrid
      Width = 789
      Height = 364
      Columns = <
        item
          Expanded = False
          FieldName = 'CompanyCode'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ShortName'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CompanyName1'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CompanyName2'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Phone1'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fax'
          Width = 101
          Visible = True
        end>
    end
  end
  inherited Panel1: TPanel
    Width = 797
    Visible = False
    ExplicitWidth = 797
  end
  inherited JvFormStorage1: TJvFormStorage
    StoredProps.Strings = ()
  end
end
