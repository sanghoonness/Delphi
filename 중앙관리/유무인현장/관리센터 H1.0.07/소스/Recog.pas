unit Recog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, AdvDateTimePicker, ExtCtrls, AdvEdit,
  DB, ADODB;

type
  TfrmRecog = class(TForm)
    Panel1: TPanel;
    edtTot: TAdvEdit;
    edtGood: TAdvEdit;
    edtPart: TAdvEdit;
    edtFail: TAdvEdit;
    edtRecog: TAdvEdit;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    cmbIO: TComboBox;
    qryTemp: TADOQuery;
    Bevel1: TBevel;
    Label2: TLabel;
    cmbData: TComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecog: TfrmRecog;

implementation
uses
  Tables;

{$R *.dfm}

procedure TfrmRecog.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
  //Close;
end;

procedure TfrmRecog.btnSearchClick(Sender: TObject);
var
  nTot, nGood, nPart, nFail: Cardinal;
begin
  with qryTemp do
  begin
    if cmbData.ItemIndex = 0 then
    begin
      //개방운영자료
      case cmbIO.ItemIndex of
        0: begin
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nTot:= FieldByName('Tot').AsInteger;

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and OutChk > 0');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nTot:= nTot + FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 1) or (InRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nGood:= FieldByName('Good').AsInteger;

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 1) or (OutRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nGood:= nGood + FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 2) or (InRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nPart:= FieldByName('Part').AsInteger;

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 2) or (OutRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nPart:= nPart + FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 3) or (InRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nFail:= FieldByName('Fail').AsInteger;

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 3) or (OutRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nFail:= nFail + FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;

        1: begin
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nTot:= FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 1) or (InRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nGood:= FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 2) or (InRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nPart:= FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from FreeIOData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 3) or (InRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nFail:= FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;

        2: begin
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and OutChk > 0');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nTot:= FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 1) or (OutRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nGood:= FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 2) or (OutRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nPart:= FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from FreeIOData where OutDate >= :N1 and ');
             SQL.Add('OutDate <= :N2 and ((OutRecog1 = 3) or (OutRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             nFail:= FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;
      end;
    end
    else
    begin
      //정상운영자료
      case cmbIO.ItemIndex of
        0: begin
             //일반차량 입차건수
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2)');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             nTot:= FieldByName('Tot').AsInteger;

             //일반차량 출차건수
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             nTot:= nTot + FieldByName('Tot').AsInteger;

             //정기차량 입차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 ');
             SQL.Add('and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nTot:= nTot + FieldByName('Tot').AsInteger;

             //정기차량 출차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 ');
             SQL.Add('and OutIOStatusNo = 2'); // and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nTot:= nTot + FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             //일반차량 입차건수 중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 1) or (InRecog2 = 1))');

             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 1) or (InRecog2 = 1))');
             }
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             nGood:= FieldByName('Good').AsInteger;

             //일반차량 출차건수 중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 1) or (OutRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;

             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((OutRecog1 = 1) or (OutRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             }
             nGood:= nGood + FieldByName('Good').AsInteger;

             //정기차량 입차건수 중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nGood:= nGood + FieldByName('Good').AsInteger;

             //정기차량 출차건수중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 and OutIOStatusNo = 2'); // and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nGood:= nGood + FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             //일반차량 입차건수중 부분인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 2) or (InRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;

             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 2) or (InRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             }
             nPart:= FieldByName('Part').AsInteger;

             //일반차량 출차건수중 부분인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 2) or (OutRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((OutRecog1 = 2) or (OutRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             }
             nPart:= nPart + FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             //일반차량 입차건수중 미인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 3) or (InRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((InRecog1 = 3) or (InRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             }
             nFail:= FieldByName('Fail').AsInteger;

             //일반차량 출차건수중 미인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 3) or (OutRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             {
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and ((OutRecog1 = 3) or (OutRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Open;
             }
             nFail:= nFail + FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;

        1: begin
             //일반차량 입차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2)');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             nTot:= FieldByName('Tot').AsInteger;

             //정기차량 입차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 ');
             SQL.Add('and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nTot:= nTot + FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             //일반차량 입차건중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 1) or (InRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;

             nGood:= FieldByName('Good').AsInteger;

             //정기차량 입차건수 중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nGood:= nGood + FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             //일반차량 입차건수 중 부분인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 2) or (InRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             nPart:= FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             //일반차량 입차건수 중 미인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
             SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
             SQL.Add('and (UnitNo <> 1 and UnitNo <> 2) and ((InRecog1 = 3) or (InRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 9;
             Open;
             nFail:= FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;

        2: begin
             //일반차량 출차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             nTot:= FieldByName('Tot').AsInteger;

             //정기차량 출차건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Tot from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 ');
             SQL.Add('and OutIOStatusNo = 2'); // and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nTot:= nTot + FieldByName('Tot').AsInteger;
             edtTot.Text:= IntToStr(nTot);

             //일반차량 출차건수 중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 1) or (OutRecog2 = 1))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             nGood:= FieldByName('Good').AsInteger;

             //정기차량 출차건수중 정상인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Good from IOSData where (ProcDate >= :N1 and ProcDate <= :N2) and ');
             SQL.Add('TKType = :N5 and OutIOStatusNo = 2 and (UnitNo <> OutUnitNo) ');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N5').Value:= 2;
             Open;

             nGood:= nGood + FieldByName('Good').AsInteger;
             edtGood.Text:= IntToStr(nGood);

             //일반차량 출차건수 중 부분인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Part from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 2) or (OutRecog2 = 2))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             nPart:= FieldByName('Part').AsInteger;
             edtPart.Text:= IntToStr(nPart);

             //일반차량 출차건수 중 미인식건수...
             Close;
             SQL.Clear;
             SQL.Add('Select Count(*) Fail from IONData where ProcDate >= :N1 and ');
             SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

             //미출차정리된 리스트를 뺀다...
             SQL.Add('and OutUnitNo <> 0 and ((OutRecog1 = 3) or (OutRecog2 = 3))');
             Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
             Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
             Parameters.ParamByName('N3').Value:= 1;
             Parameters.ParamByName('N4').Value:= 1;
             Parameters.ParamByName('N5').Value:= 0;
             Parameters.ParamByName('N6').Value:= 9;
             Open;
             nFail:= FieldByName('Fail').AsInteger;
             edtFail.Text:= IntToStr(nFail);

             if (nTot > 0) and (nGood > 0) then
               edtRecog.Text:= FloatTostr((nGood / nTot)*100);
        end;
      end;
    end;
  end;
end;

procedure TfrmRecog.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
end;

end.
