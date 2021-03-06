unit IONData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmIONData = class(TForm)
    qryIONData: TADOQuery;
    dsIONData: TDataSource;
    qryIONDataUnitNo: TWordField;
    qryIONDataProcDate: TStringField;
    qryIONDataProcTime: TStringField;
    qryIONDataTKNo: TStringField;
    qryIONDataTKType: TWordField;
    qryIONDataCarTypeNo: TWordField;
    qryIONDataInImage: TStringField;
    qryIONDataInCarNo: TStringField;
    qryIONDataStatus: TWordField;
    qryIONDataOutUnitNo: TWordField;
    qryIONDataOutDate: TStringField;
    qryIONDataOutTime: TStringField;
    qryIONDataOutChk: TWordField;
    qryIONDataOutImage: TStringField;
    qryIONDataOutCarNo: TStringField;
    qryIONDataReserve1: TStringField;
    qryIONDataReserve2: TStringField;
    qryIONDataReserve3: TStringField;
    qryIONDataReserve4: TStringField;
    qryIONDataReserve5: TStringField;
    sb1: TStatusBar;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    qryIONDataInRecog: TWordField;
    qryIONDataOutRecog: TWordField;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel4: TBevel;
    Label5: TLabel;
    cmbOutStatus: TComboBox;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    cmbIO: TComboBox;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    pnImg: TPanel;
    imgIn: TImage;
    imgOut: TImage;
    qryIONDataParkNo: TSmallintField;
    qryTemp: TADOQuery;
    edtTotal: TPanel;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    btnExcel: TBitBtn;
    btnDelete: TBitBtn;
    qryIONDataInImage2: TStringField;
    qryIONDataInCarNo2: TStringField;
    qryIONDataOutImage2: TStringField;
    qryIONDataOutCarNo2: TStringField;
    qryIONDataInRecog2: TWordField;
    qryIONDataOutRecog2: TWordField;
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
    qryIONDataInUnitName: TStringField;
    qryIONDataOutUnitName: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryIONDataOutChkGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure qryIONDataStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dg1Click(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIONData: TfrmIONData;
  nDelUnitNo: Integer;
  sDelDate, sDelTime, sDelNo, sDelCarNo: String;

implementation

uses Global, Tables;

{$R *.dfm}

procedure TfrmIONData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
end;

procedure TfrmIONData.btnCloseClick(Sender: TObject);
begin
  qryIONData.Close;
  Close;
end;

procedure TfrmIONData.qryIONDataOutChkGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryIONDataOutChk.Value of
    0: Text:= '??????';
    1: Text:= '????????';
    2: Text:= '????????';
    3: Text:= '????????';
    4: Text:= '????????';
    5: Text:= '????????????';
    6: Text:= '????????';
    7: Text:= '??????????';
  end;
end;

procedure TfrmIONData.qryIONDataStatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryIONDataStatus.Value of
    0: Text:= '????????';
    1: Text:= '????????';
    2: Text:= '??????????';
  end;
end;

procedure TfrmIONData.btnSearchClick(Sender: TObject);
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

    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and (TKType = :N3 or TKType = :N4) ');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 9;

      if cmbOutStatus.ItemIndex <> 0 then SQL.Add('and OutChk = :N5 ');

      if edtCarNo.Text <> '' then
      begin
        if cmbIO.ItemIndex = 0 then
        begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
        end
        else
        begin
          SQL.Add(' and ((OutCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (OutCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
        end;
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');

      if cmbOutStatus.ItemIndex <> 0 then
        Parameters.ParamByName('N5').Value:= cmbOutStatus.ItemIndex - 1;

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
      SQL.Add('Select Count(*) nIn from IONData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and (TKType = :N3 or TKType = :N4) and Status = :N5 ');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 9;
      Parameters.ParamByName('N5').Value:= 1;
      Open;

      nNIn:= FieldByName('nIn').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOut from IONData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and (TKType = :N3 or TKType = :N4) and Status = :N5 ');

      //???????????? ???????? ????...
      SQL.Add(' and OutChk > :N6 and OutUnitNo <> 0');
      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 9;
      Parameters.ParamByName('N5').Value:= 1;
      Parameters.ParamByName('N6').Value:= 0;
      Open;

      nNOut:= FieldByName('nOut').AsInteger;
      nMi:= nNIn - nNOut;

      edtTotal.Caption:= '  ??????: ' + IntToStr(nNIn) + '??   ' +
                         '??????: ' + IntToStr(nNOut) + '??   ' +
                         '??????: ' + IntToStr(nMi) + '??';
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIONData.dg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIONData do
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
            if nLprRecog1 = 1 then
            begin
              sInFile:= FieldByName('InImage1').AsString;
            end
            else
            if nLprRecog2 = 1 then
            begin
              sInFile:= FieldByName('InImage2').AsString;
            end
            else
            begin
              sInFile:= FieldByName('InImage1').AsString;
            end;
            ExceptLogging('File: ' + sInFile);
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
          on E: Exception do ExceptLogging('TfrmIONData_InImageLoad: ' + aString(E.Message));
        end;

        if FieldByName('OutChk').AsInteger > 0 then
        begin
          nOutUnitNo:= FieldByName('OutUnitNo').AsInteger;

          if nOutRecog1 = 1 then
          begin
            sOutFile:= FieldByName('OutImage1').AsString;
            sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
          end
          else
          if nOutRecog2 = 1 then
          begin
            sOutFile:= FieldByName('OutImage2').AsString;
            sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
          end
          else
          begin
            sOutFile:= FieldByName('OutImage1').AsString;
            sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
          end;

          sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nOutUnitNo);

          if not DirectoryExists(sDir) then
          begin
            if not ForceDirectories(sDir) then
              ExceptLogging('?????????????? ????????: ' + sDir);
          end;

          ExceptLogging('???????? ???? ???? ????: ' + sOutFile);

          try
            // sFile1?? http?? ??????
            if Copy(sOutFile, 1, 4) = 'http' then
            begin
              ExceptLogging('HTTP ????, ???????? ???? ???? ????: ' + sOutFile);
              sTemp:= Copy(sOutFile, 6, Length(sOutFile)-5);
              sOutFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
              sOutFile:= sOutFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
              sOutFile:= MG_StrConvert(sOutFile, '/', '\');
              ExceptLogging('File: ' + sOutFile);
            end
            // \\172.16.83.1 ???????? ???? ??????????????????.
            else
            begin
              ExceptLogging('IP ????, ???????? ???? ???? ????: ' + sOutFile);
              if nOutRecog1 = 1 then
              begin
                sOutFile:= FieldByName('OutImage1').AsString;
              end
              else
              if nOutRecog2 = 1 then
              begin
                sOutFile:= FieldByName('OutImage2').AsString;
              end
              else
              begin
                sOutFile:= FieldByName('OutImage1').AsString;
              end;
            end;

            if FileExists(sOutFile) then
            begin
              imgOut.Picture.LoadFromFile(sOutFile);
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              ExceptLogging('File ????: ' + sOutFile);
            end;
          except
            on E: Exception do ExceptLogging('TfrmIONData_OutImageLoad: ' + aString(E.Message));
          end;
        end
        else
          imgOut.Picture.Assign(Nil);
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.DBAdvGrid1Click: ' + E.Message);
  end;
end;
procedure TfrmIONData.dg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIONData do
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

          if FieldByName('OutChk').AsInteger > 0 then
          begin
            nOutUnitNo:= FieldByName('OutUnitNo').AsInteger;

            if nOutRecog1 = 1 then
            begin
              sOutFile:= FieldByName('OutImage1').AsString;
              sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
            end
            else
            if nOutRecog2 = 1 then
            begin
              sOutFile:= FieldByName('OutImage2').AsString;
              sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
            end
            else
            begin
              sOutFile:= FieldByName('OutImage1').AsString;
              sOutTime:= Copy(sOutFile, Pos('_', sOutFile)+1, 14);
            end;
            sOutDir:= sImageDir + '\' + Copy(sOutTime, 1, 4) + '\' + Copy(sOutTime, 5, 2) + '\' +
                   Copy(sOutTime, 7, 2) + '\' + IntToStr(nOutUnitNo);

            if not DirectoryExists(sOutDir) then
            begin
              if not ForceDirectories(sOutDir) then
                ExceptLogging('?????????????? ????????: ' + sOutDir);
            end;
            sOutLocalFile:= sOutDir + '\' + Copy(sOutFile, Pos('CH', sOutFile), Length(sOutFile)-(Pos('CH', sOutFile)-1));

            if FileExists(sOutLocalFile) then
              imgOut.Picture.LoadFromFile(sOutLocalFile)
            else
            begin
              imgOut.Picture.Assign(Nil);

              try
                sTemp:= Copy(sOutFile, 6, Length(sOutFile)-5);
                sOutFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
                sOutFile:= sOutFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
                sOutFile:= MG_StrConvert(sOutFile, '/', '\');
                ExceptLogging('File: ' + sOutFile);

                if FileExists(sOutFile) then
                begin
                  imgOut.Picture.LoadFromFile(sOutFile);
                  //if CopyFile(PChar(sOutFile), PChar(sOutLocalFile), False) then
                  //  imgOut.Picture.LoadFromFile(sOutLocalFile);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('File ????: ' + sOutFile);
                end;

                {
                if DownloadFileHTTP(sOutFile, sOutLocalFile) then
                begin
                  imgOut.Picture.LoadFromFile(sOutLocalFile);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('File Down ????: ' + sOutFile);
                end;
                }
              except
                on E: Exception do ExceptLogging('TfrmIONData_OutImageLoad: ' + aString(E.Message));
              end;
            end;
          end
          else
            imgOut.Picture.Assign(Nil);

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

procedure TfrmIONData.btnExcelClick(Sender: TObject);
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

procedure TfrmIONData.btnDeleteClick(Sender: TObject);
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from IONData where UnitNo = :N1 and ProcDate = :N2 and ProcTime = :N3 and TKNo = :N4');
      Parameters.ParamByName('N1').Value:= nDelUnitNo;
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
