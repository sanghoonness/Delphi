unit FTYogum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls, AdvToolBtn, Grids, BaseGrid, AdvGrid;

type
  TfrmFTYogum = class(TForm)
    dg1: TAdvStringGrid;
    Panel1: TPanel;
    btnClose: TAdvToolButton;
    Bevel13: TBevel;
    Label13: TLabel;
    edtTot: TAdvEdit;
    edtCnt: TAdvEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    lbCarNo: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure GridClear;
  public
    { Public declarations }
  end;

var
  frmFTYogum: TfrmFTYogum;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmFTYogum.FormShow(Sender: TObject);
var
  i: Word;
begin
  try
    GridClear;
    lbCarNo.Caption:= '차량번호: ' + sFTCarNo;

    if nFTDataCnt > 0 then
    begin
      for i := 1 to nFTDataCnt do
      begin
        with dg1 do
        begin
          InsertRows(1, 1, True);
          Cells[0, 1] := RFTData[i].sFTInDate;
          Cells[1, 1] := RFTData[i].sFTInTime;
          Cells[2, 1] := RFTData[i].sFTOutDate;
          Cells[3, 1] := RFTData[i].sFTOutTime;
          Cells[4, 1] := FormatFloat('#,##0', RFTData[i].nFTParkingTime) + '분';
          Cells[5, 1] := FormatFloat('#,##0', RFTData[i].nFTYogum) + '원';
        end;
        dg1.Alignments[0, 1] := taCenter;
        dg1.Alignments[1, 1] := taCenter;
        dg1.Alignments[2, 1] := taCenter;
        dg1.Alignments[3, 1] := taCenter;
        dg1.Alignments[4, 1] := taRightJustify;
        dg1.Alignments[5, 1] := taRightJustify;
      end;
      edtCnt.Text:= FormatFloat('#,##0', nFTDataCnt);
      edtTot.Text:= FormatFloat('#,##0', nTotFTYogum);
    end;
  except
    on E: Exception do ExceptLogging('TfrmFTYogum.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmFTYogum.GridClear;
var
  i, j: Byte;
begin
  with dg1 do
  begin
    Cells[0, 0] := '입차일자';
    Cells[1, 0] := '입차시각';
    Cells[2, 0] := '출차일자';
    Cells[3, 0] := '출차시각';
    Cells[4, 0] := '주차시간';
    Cells[5, 0] := '주차요금';

    for i := 1 to RowCount - 1 do
    begin
      for j := 0 to ColCount - 1 do
      begin
        Cells[j, i] := '';
      end;
    end;
  end;
  dg1.Alignments[0, 0] := taCenter;
  dg1.Alignments[1, 0] := taCenter;
  dg1.Alignments[2, 0] := taCenter;
  dg1.Alignments[3, 0] := taCenter;
  dg1.Alignments[4, 0] := taCenter;
  dg1.Alignments[5, 0] := taCenter;
end;

procedure TfrmFTYogum.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
