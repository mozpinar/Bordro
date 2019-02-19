unit Model.MosObjectDataset;

interface
uses
  Spring.Data.ObjectDataSet;

type
  TMosObjectDataset = class(TObjectDataSet)
    procedure DoDeleteRecord(Index: Integer); override;
    procedure DoPostRecord(Index: Integer; Append: Boolean); override;
  end;
implementation
uses
  MainDM;

{ TMosObjectDataset }

procedure TMosObjectDataset.DoDeleteRecord(Index: Integer);
var
  i : Integer;
begin
  i := IndexList.Indexes[Index].Index;
  DMMain.Session.Delete(DataList[i]);
  inherited;
end;

procedure TMosObjectDataset.DoPostRecord(Index: Integer; Append: Boolean);
begin
  inherited;
  DMMain.Session.Save(DataList[Current]);
end;

end.
