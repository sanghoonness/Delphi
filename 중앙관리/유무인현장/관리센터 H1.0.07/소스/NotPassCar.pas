unit NotPassCar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmNotPassCar = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    edtTotal: TPanel;
    btnExcel: TBitBtn;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    pnImg: TPanel;
    imgIn: TImage;
    qryNotPassCar: TADOQuery;
    dsNotPassCar: TDataSource;
    DBAdvGrid1: TDBAdvGrid;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryTemp: TADOQuery;
    sb1: TStatusBar;
    qryNotPassCarUnitNo: TSmallintField;
    qryNotPassCarUnitName: TStringField;
    qryNotPassCarProcDate: TStringField;
    qryNotPassCarProcTime: TStringField;
    qryNotPassCarCarNo: TStringField;
    qryNotPassCarImage: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotPassCar: TfrmNotPassCar;

implementation

 uses Global, Tables;
{$R *.dfm}

procedure TfrmNotPassCar.btnCloseClick(Sender: TObject);
begin
  qryNotPassCar.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmNotPassCar.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nNIn, nNOut, nMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    nNIn:= 0;
    nNOut:= 0;
    nMi:= 0;

    with qryNotPassCar do
    begin
      Close;
      SQL.Clear;
        SQL.Add('select A.ParkNo,A.UnitNo,B.UnitName, ProcDate,ProcTime,CarNo,Image from notpasscar A,UnitInfo B where A.unitNo=B.unitNO and (ProcDate between  :N1 and  :N2 )');
        SQL.Add(' and (CARNO like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') ');

        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sEDate;

        Open;

      if RecordCount > 0 then
      begin
        sb1.SimpleText:= '????????: ' + IntToStr(RecordCount);
        btnExcel.Enabled:= True;
      end
      else
      begin
        btnExcel.Enabled:= False;
      end;

      sb1.SimpleText:= '???? : ' + IntToStr(RecordCount) + '??';
    end;


  except
  //  on E: Exception do ExceptLogging('TfrmIONData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmNotPassCar.DBAdvGrid1Click(Sender: TObject);

var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryNotPassCar do
    begin

      if RecordCount > 0 then
      begin
        nInUnitNo:= FieldByName('UnitNo').AsInteger;
        nLprRecog1 := 1;
        if nLprRecog1 = 1 then
        begin
          sInCarNo:= FieldByName('CarNo').AsString;
          sInFile:= FieldByName('Image').AsString;
          sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
        end;

        sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('?????????????? ????????: ' + sDir);
        end;

        ExceptLogging('???????? ???? ???? ????1 File: ' + sInFile);

        try
          // sFile1?? http?? ??????
          if Copy(sInFile, 1, 4) = 'http' then
          begin
            ExceptLogging('???????? ???? ???? ????2 File: ' + sInFile);
            sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
            sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sInFile:= MG_StrConvert(sInFile, '/', '\');
            ExceptLogging('HTTP ???? ???? File: ' + sInFile);
          end
          // \\172.16.83.1 ???????? ???? ??????????????????.
          else
          begin
            if nLprRecog1 = 1 then
            begin
              sInFile:= FieldByName('Image').AsString;
            ExceptLogging('IP ???? ???? File: ' + sInFile);
            end
          end;

          if FileExists(sInFile) then
          begin
            imgIn.Picture.LoadFromFile(sInFile);
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            ExceptLogging('???? File ????: ' + sInFile);
          end;
        except
          on E: Exception do ExceptLogging('TfrmIOSData_InImageLoad: ' + aString(E.Message));
        end;
      end;
    end;
  finally




  end;
  end;



procedure TfrmNotPassCar.FormResize(Sender: TObject);
begin
  pnImg.Width := Panel1.Width div 6;
  imgIn.Width := Panel1.Width div 6;
end;

procedure TfrmNotPassCar.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  pnImg.Visible:= True;
end;

end.
