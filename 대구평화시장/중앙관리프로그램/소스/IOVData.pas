unit IOVData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmIOVData = class(TForm)
    qryIOVData: TADOQuery;
    dsIOVData: TDataSource;
    sb1: TStatusBar;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    cmbValStatus: TComboBox;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnImg: TPanel;
    imgIn: TImage;
    qryTemp: TADOQuery;
    edtTotal: TPanel;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    btnExcel: TBitBtn;
    btnDelete: TBitBtn;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryIOVDataParkNo: TSmallintField;
    qryIOVDataUnitNo: TSmallintField;
    qryIOVDataProcDate: TStringField;
    qryIOVDataProcTime: TStringField;
    qryIOVDataTKNo: TStringField;
    qryIOVDataName: TStringField;
    qryIOVDataInCarNo: TStringField;
    qryIOVDataOutDate: TStringField;
    qryIOVDataOutTime: TStringField;
    qryIOVDataCardNo: TStringField;
    qryIOVDataValetChk: TWordField;
    qryIOVDataValetStatus: TWordField;
    qryIOVDataUpdateDate: TStringField;
    qryIOVDataUpdateTime: TStringField;
    qryIOVDataReserve1: TStringField;
    qryIOVDataReserve2: TStringField;
    qryIOVDataReserve3: TStringField;
    qryIOVDataReserve4: TStringField;
    qryIOVDataReserve5: TStringField;
    qryIOVDataUpdateManager: TStringField;
    Bevel4: TBevel;
    Label5: TLabel;
    edtCardNo: TEdit;
    Bevel5: TBevel;
    Label6: TLabel;
    cmbValetChk: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure qryIOVDataValetChkGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryIOVDataValetStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOVData: TfrmIOVData;
  nDelUnitNo: Integer;
  sDelDate, sDelTime, sDelNo, sDelCarNo: String;

implementation

uses Global, Tables;

{$R *.dfm}

procedure TfrmIOVData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
end;

procedure TfrmIOVData.qryIOVDataValetChkGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Case qryIOVDataValetChk.Value of
    0: Text:= '????????';
    1: Text:= '????????';
  end;
end;

procedure TfrmIOVData.qryIOVDataValetStatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Case qryIOVDataValetStatus.Value of
    1: Text:= '????????';
    2: Text:= '????????';
    3: Text:= '????????';
    4: Text:= '????????';
    5: Text:= '????????';
  end;
end;

procedure TfrmIOVData.btnCloseClick(Sender: TObject);
begin
  qryIOVData.Close;
  Close;
end;

procedure TfrmIOVData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nNIn, nNOut, nMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);
    nNIn:= 0;
    nNOut:= 0;
    nMi:= 0;

    with qryIOVData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ValDataProc ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2)');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;

      if cmbValStatus.ItemIndex <> 0 then SQL.Add('And ValetStatus = :pValetStatus');
      if cmbValetChk.ItemIndex <> 0 then SQL.Add('And ValetChk = :ValetChk');

      if edtCarNo.Text <> '' then
      begin
          SQL.Add(' and InCarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%'));
      end;

      if edtCardNo.Text <> '' then
      begin
          SQL.Add(' and CardNo like ' + MG_MakeStr(Trim(edtCardNo.Text)));
      end;

      SQL.Add(' Order By ProcDate, ProcTime');

      if cmbValStatus.ItemIndex <> 0 then
        Parameters.ParamByName('pValetStatus').Value:= cmbValStatus.ItemIndex;
      if cmbValetChk.ItemIndex <> 0 then
        Parameters.ParamByName('ValetChk').Value:= cmbValetChk.ItemIndex - 1;

      ExceptLogging('ValDataProc SQL: ' + SQL.Text);
      Open; 

      if RecordCount > 0 then
      begin
        sb1.SimpleText:= '????????: ' + IntToStr(RecordCount);
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
      end;

      sb1.SimpleText:= '???? : ' + IntToStr(RecordCount) + '??';
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nIn from ValDataProc ');     // ??????
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2)  ');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Open;

      nNIn:= FieldByName('nIn').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOut from ValDataProc ');       // ??????(????????)
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and ValetStatus =  5 ');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Open;

      nNOut:= FieldByName('nOut').AsInteger;

      edtTotal.Caption:= '  ??????: ' + IntToStr(nNIn) + '??   ' +
                         '??????????: ' + IntToStr(nNOut) + '??   '
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOVData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIOVData.dg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sTemp, sValProcDate, sValProcTime, sValTKNo, sValCarNo, sTime, sDir: aString;
  nDay, nHour: Cardinal;
  nInUnitNo, nOutUnitNo, i: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOVData do
    begin
      sValProcDate:= FieldByName('ProcDate').AsString;
      sValProcTime:= FieldByName('ProcTime').AsString;
      sValTKNo:= FieldByName('TKNo').AsString;
      sValCarNo:= FieldByName('InCarNo').AsString;

      // ?????????? ?????? ???? ????
      //if FieldByName('ValetStatus').ASInteger = 1 then
        //btnDelete.Enabled := True;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * From IOValData ');
      SQL.Add('Where InCarNo = :pInCarNo and TKNo = :pTKNo');
      SQL.Add('And ProcDate = :pProcDate and ProcTime = :pProcTime');
      Parameters.ParamByName('pInCarNo').Value := sValCarNo;
      Parameters.ParamByName('pTKNo').Value := sValTKNo;
      Parameters.ParamByName('pProcDate').Value := sValProcDate;
      Parameters.ParamByName('pProcTime').Value := sValProcTime;
      Open;

      if RecordCount > 0 then
      begin
        sInCarNo:= FieldByName('InCarNo').AsString;
        sInFile:= FieldByName('InImage').AsString;
        sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);

        sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('?????????????? ????????: ' + sDir);
        end;

        ExceptLogging('???????? ???? ???? ????: ' + sInFile);

        try
          // sFile1?? http?? ??????
          if Copy(sInFile, 1, 4) = 'http' then
          begin
            ExceptLogging('HTTP ????, ???????? ???? ???? ????: ' + sInFile);
            sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
            sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sInFile:= MG_StrConvert(sInFile, '/', '\');
            ExceptLogging('File: ' + sInFile);
          end
          // \\172.16.83.1 ???????? ???? ??????????????????.
          else
          begin
            ExceptLogging('IP ????, ???????? ???? ???? ????: ' + sInFile);
            sInFile:= FieldByName('InImage').AsString;
          end;

          if FileExists(sInFile) then
          begin
            imgIn.Picture.LoadFromFile(sInFile);
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            ExceptLogging('File ????: ' + sInFile);
          end;
        except
          on E: Exception do ExceptLogging('TfrmIOVData_InImageLoad: ' + aString(E.Message));
        end;

      end;
    end;


  except
    on E: Exception do ExceptLogging('TfrmIOVData.DBAdvGrid1Click: ' + E.Message);
  end;
end;
procedure TfrmIOVData.dg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOVData do
    begin
      if (Key = VK_Up) or (Key = VK_Down) then
      begin
        nLPRRecog1:= FieldByName('InRecog1').AsInteger;
        nLPRRecog2:= FieldByName('InRecog2').AsInteger;
        nOutRecog1:= FieldByName('OutRecog1').AsInteger;
        nOutRecog2:= FieldByName('OutRecog2').AsInteger;

        if RecordCount > 0 then
        begin
          nInUnitNo:= FieldByName('UnitNo').AsInteger;
          sInTKNo:= FieldByName('TKNo').AsString;

          if nLprRecog1 = 1 then
          begin
            sInCarNo:= FieldByName('InCarNo1').AsString;
            sInFile:= FieldByName('InImage1').AsString;
            sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
          end
          else
          if nLprRecog2 = 1 then
          begin
            sInCarNo:= FieldByName('InCarNo2').AsString;
            sInFile:= FieldByName('InImage2').AsString;
            sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
          end
          else
          begin
            sInCarNo:= FieldByName('InCarNo1').AsString;
            sInFile:= FieldByName('InImage1').AsString;
            sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
          end;

          sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
                 Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

          if not DirectoryExists(sDir) then
          begin
            if not ForceDirectories(sDir) then
              ExceptLogging('?????????????? ????????: ' + sDir);
          end;

          sLocalFile:= sDir + '\' + Copy(sInFile, Pos('CH', sInFile), Length(sInFile)-(Pos('CH', sInFile)-1));

          if FileExists(sLocalFile) then
            imgIn.Picture.LoadFromFile(sLocalFile)
          else
          begin
            imgIn.Picture.Assign(Nil);

            try
              sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
              sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
              sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
              sInFile:= MG_StrConvert(sInFile, '/', '\');
              ExceptLogging('File: ' + sInFile);

              if FileExists(sInFile) then
              begin
                imgIn.Picture.LoadFromFile(sInFile);
                //if CopyFile(PChar(sInfile), PChar(sLocalFile), False) then
                //  imgIn.Picture.LoadFromFile(sLocalFile);
              end
              else
              begin
                imgIn.Picture.Assign(Nil);
                ExceptLogging('File ????: ' + sInFile);
              end;

              {
              if DownloadFileHTTP(sInFile, sLocalFile) then
              begin
                imgIn.Picture.LoadFromFile(sLocalFile);
              end
              else
              begin
                imgIn.Picture.Assign(Nil);
                ExceptLogging('File Down ????: ' + sInFile);
              end;
              }
            except
              on E: Exception do ExceptLogging('TfrmIONData_InImageLoad: ' + aString(E.Message));
            end;
          end;

          if FieldByName('OutChk').AsInteger = 0 then
          begin
            nDelUnitNo:= FieldByName('UnitNo').AsInteger;
            sDelDate:= FieldByName('ProcDate').AsString;
            sDelTime:= FieldByName('ProcTime').AsString;
            sDelNo:= FieldByName('TKNo').AsString;
            sDelCarNo:= FieldByName('InCarNo1').AsString;
            btnDelete.Enabled:= True;
          end
          else
          begin
            nDelUnitNo:= 0;
            sDelDate:= '';
            sDelTime:= '';
            sDelNo:= '';
            sDelCarNo:= '';
            btnDelete.Enabled:= False;
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.DBAdvGrid1KeyUp: ' + E.Message);
  end;
end;

procedure TfrmIOVData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmIOVData.btnDeleteClick(Sender: TObject);
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from ValDataProc where and ProcDate = :N2 and ProcTime = :N3 and TKNo = :N4');
      Parameters.ParamByName('N2').Value:= sDelDate;
      Parameters.ParamByName('N3').Value:= sDelTime;
      Parameters.ParamByName('N4').Value:= sDelNo;
      ExecSQL;
    end;
    ShowMessage('???????? ' + sDelCarNo + '?? ??????????????.');
    nDelUnitNo:= 0;
    sDelDate:= '';
    sDelTime:= '';
    sDelNo:= '';
    sDelCarNo:= '';
    btnDelete.Enabled:= False;
    btnSearch.Click;
  except
    on E: Exception do ExceptLogging('TfrmIONData.btnDeleteClick: ' + E.Message);
  end;
end;

end.
