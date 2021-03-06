unit VanList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, tmsAdvGridExcel, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  AdvCombo, AdvObj, AdvEdit;

type
  TfrmVanList = class(TForm)
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TSmallintField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    qryVanList: TADOQuery;
    dsVanList: TDataSource;
    qryVanListParkNo: TSmallintField;
    qryVanListUnitNo: TSmallintField;
    qryVanListProcDate: TStringField;
    qryVanListProcTime: TStringField;
    qryVanListMNo: TSmallintField;
    qryVanListVanCheck: TWordField;
    qryVanListCardNo: TStringField;
    qryVanListVanAmt: TIntegerField;
    qryVanListVanDate: TStringField;
    qryVanListVanTime: TStringField;
    qryVanListVanRegNo: TStringField;
    qryVanListCardType: TStringField;
    qryVanListVanStatus: TStringField;
    qryVanListCarNo: TStringField;
    qryVanListReserve1: TStringField;
    qryVanListReserve2: TStringField;
    qryVanListReserve3: TStringField;
    qryVanListReserve4: TStringField;
    qryVanListReserve5: TStringField;
    qryVanListMName: TStringField;
    dgVanList: TDBAdvGrid;
    cmbYN: TAdvComboBox;
    sb1: TStatusBar;
    edtETime: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtCarNo: TAdvEdit;
    qryTemp: TADOQuery;
    qryVanListUnitName: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryVanListVanCheckGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVanList: TfrmVanList;
   nTotalCount, nParkMoney : Cardinal;
implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TfrmVanList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVanList.btnExcelClick(Sender: TObject);
begin
  try
    if SaveDialog1.Execute then
    begin
      AdvGridExcelIO1.XLSExport(SaveDialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmVanList.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmVanList.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate,sSTime,sETime: String;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
  sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);
  with qryVanList do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' Select a.ParkNo, a.UnitNo, b.UnitName as UnitName, ProcDate, ProcTime, a.MNo, c.MName as MName, VanCheck, CardNo, VanAmt, VanDate');
    SQL.Add('        ,VanTime, VanRegNo, CarNo, a.Reserve1, a.Reserve2, a.Reserve3, a.Reserve4, a.Reserve5, a.Reserve6');
    SQL.Add('        ,CardType, VanStatus from VanList  a left join UnitInfo b on a.UnitNo = b.UnitNo ');
    SQL.Add('                                             left join Manager c on a.Mno = c.Mno ');
    SQL.Add(' where (ProcDate+proctime between :N1 and :N2) ');
    sql.Add(' and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

    //SQL.Add('Select * from VanList where (ProcDate+proctime between :N1 and :N2) ');
    //sql.Add(' and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

    if cmbYN.ItemIndex > 0 then
      SQL.Add('and VanCheck = :N3');

    Parameters.ParamByName('N1').Value := sSDate+sSTime;
    Parameters.ParamByName('N2').Value := sEDate+sETime;

    if cmbYN.ItemIndex > 0 then
      Parameters.ParamByName('N3').Value := cmbYN.ItemIndex;
    Open;

    if RecordCount > 0 then
    begin
      btnExcel.Enabled := True;
      //sb1.SimpleText := '????????: ' + IntToStr(RecordCount) + '??';
    end
    else
    begin

      sb1.SimpleText := '????????: 0??';
            btnExcel.Enabled := False;
    end;
  end;

    // ???? ??????
    with qryTemp do
    begin
      Close;
      SQL.Clear;



    SQL.Add('Select COUNT(*) cnt, SUM(Vanamt) totfee from VanList where (ProcDate+proctime between :N1 and :N2) ');
    sql.Add(' and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

      if cmbYN.ItemIndex > 0 then
        SQL.Add('and VanCheck = :N3');

        Parameters.ParamByName('N1').Value := sSDate+sSTime;
         Parameters.ParamByName('N2').Value := sEDate+sETime;

    if cmbYN.ItemIndex > 0 then
      Parameters.ParamByName('N3').Value := cmbYN.ItemIndex;
    Open;


      if RecordCount > 0 then
      begin
        nTotalCount  := FieldByName('cnt').AsInteger;
        nParkMoney := FieldByName('totfee').AsInteger;

        sb1.SimpleText := '????????: ' + IntToStr(nTotalCount) + '?? ????????:'+IntToStr(nParkMoney);


      end
      else
      begin
           sb1.SimpleText := '????????:0 ' + '?? ????????:0';

      end;
    end;


end;

procedure TfrmVanList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSearchClick(Self);
end;

procedure TfrmVanList.FormShow(Sender: TObject);
begin
  edtSDate.Date := Now;
  edtEDate.Date := Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  qryManager.Active := True;
end;

procedure TfrmVanList.qryVanListVanCheckGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryVanListVanCheck.Value of
    1:
      Text := '????????';
    2:
      Text := '????????';
    3:
      Text := '????????';
  End;
end;

end.
