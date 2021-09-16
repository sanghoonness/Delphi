unit FreeIOData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, tmsAdvGridExcel, DB, ADODB, ComCtrls, StdCtrls, Buttons,
  AdvDateTimePicker, ExtCtrls, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvObj;

type
  TfrmFreeIOData = class(TForm)
    qryFreeIOData: TADOQuery;
    qryTemp: TADOQuery;
    dsFreeIOData: TDataSource;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    pnImg: TPanel;
    imgIn: TImage;
    imgOut: TImage;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    cmbOutStatus: TComboBox;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    edtTotal: TPanel;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    qryFreeIODataParkNo: TSmallintField;
    qryFreeIODataUnitNo: TSmallintField;
    qryFreeIODataProcDate: TStringField;
    qryFreeIODataProcTime: TStringField;
    qryFreeIODataTKType: TWordField;
    qryFreeIODataCarType: TWordField;
    qryFreeIODataInImage1: TStringField;
    qryFreeIODataInCarNo1: TStringField;
    qryFreeIODataInImage2: TStringField;
    qryFreeIODataInCarNo2: TStringField;
    qryFreeIODataOutUnitNo: TSmallintField;
    qryFreeIODataOutDate: TStringField;
    qryFreeIODataOutTime: TStringField;
    qryFreeIODataOutChk: TWordField;
    qryFreeIODataOutImage1: TStringField;
    qryFreeIODataOutCarNo1: TStringField;
    qryFreeIODataOutImage2: TStringField;
    qryFreeIODataOutCarNo2: TStringField;
    qryFreeIODataInRecog1: TWordField;
    qryFreeIODataOutRecog1: TWordField;
    qryFreeIODataInRecog2: TWordField;
    qryFreeIODataOutRecog2: TWordField;
    qryFreeIODataParkingMin: TIntegerField;
    qryFreeIODataParkingamt: TIntegerField;
    qryFreeIODataReserve1: TStringField;
    qryFreeIODataReserve2: TStringField;
    qryFreeIODataReserve3: TStringField;
    qryFreeIODataReserve4: TStringField;
    qryFreeIODataReserve5: TStringField;
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
    qryFreeIODataInUnitName: TStringField;
    qryFreeIODataOutUnitName: TStringField;
    procedure qryFreeIODataOutChkGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryFreeIODataParkingMinGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryFreeIODataParkingamtGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFreeIOData: TfrmFreeIOData;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmFreeIOData.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFreeIOData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmFreeIOData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmFreeIOData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nNIn, nNOut, nMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN', edtETime.Time);
    nNIn:= 0;
    nNOut:= 0;
    nMi:= 0;

    with qryFreeIOData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from FreeIOData where ProcDate >= :N1 and ProcDate <= :N5 ');
      SQL.Add('and ProcTime >= :N2 and ProcTime <= :N3 and TKType = :N4');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sSTime;
      Parameters.ParamByName('N3').Value:= sETime;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= sEDate;

      if cmbOutStatus.ItemIndex > 0 then
      begin
        if cmbOutStatus.ItemIndex = 1 then
          SQL.Add('and OutChk = :N6 ')
        else
          SQL.Add('and OutChk > :N6 ');
      end;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ''%' + Trim(edtCarNo.Text) + '%'' ) or ');
        SQL.Add(' (InCarNo2 like ''%' + Trim(edtCarNo.Text) + '%'' )) ');
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');

      if cmbOutStatus.ItemIndex > 0 then
      begin
        Parameters.ParamByName('N6').Value:= 0;
      end;

      Open;

      if RecordCount > 0 then
      begin
        sb1.SimpleText:= '조회건수: ' + IntToStr(RecordCount);
        //btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
      end
      else
      begin
        //btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
      end;

      sb1.SimpleText:= '조회 : ' + IntToStr(RecordCount) + '건';
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nIn from FreeIOData where ProcDate >= :N1 and ');
      SQL.Add('ProcDate <= :N5 and ProcTime >= :N2 and ProcTime <= :N3 and TKType = :N4');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sSTime;
      Parameters.ParamByName('N3').Value:= sETime;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= sEDate;
      Open;

      nNIn:= FieldByName('nIn').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOut from FreeIOData where ProcDate >= :N1 and ');
      SQL.Add('ProcDate <= :N6 and ProcTime >= :N2 and ProcTime <= :N3 and ');
      SQL.Add('TKType = :N4 and OutChk > :N5');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sSTime;
      Parameters.ParamByName('N3').Value:= sETime;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= 0;
      Parameters.ParamByName('N6').Value:= sEDate;
      Open;

      nNOut:= FieldByName('nOut').AsInteger;
      nMi:= nNIn - nNOut;

      edtTotal.Caption:= '  총입차: ' + IntToStr(nNIn) + '건   ' +
                         '총출차: ' + IntToStr(nNOut) + '건   ' +
                         '미출차: ' + IntToStr(nMi) + '건';
    end;
  except
    on E: Exception do ExceptLogging('TfrmFreeIOData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmFreeIOData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
end;

procedure TfrmFreeIOData.qryFreeIODataOutChkGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryFreeIODataOutChk.Value = 0 then
    Text:= '미출차'
  else
  if qryFreeIODataOutChk.Value > 0 then
    Text:= '정상출차';
end;

procedure TfrmFreeIOData.qryFreeIODataParkingamtGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:= IntToStr(qryFreeIODataParkingAmt.Value) + '원';
end;

procedure TfrmFreeIOData.qryFreeIODataParkingMinGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:= IntToStr(qryFreeIODataParkingMin.Value) + '분';
end;

procedure TfrmFreeIOData.dg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryFreeIOData do
    begin
      nLPRRecog1:= FieldByName('InRecog1').AsInteger;
      nLPRRecog2:= FieldByName('InRecog2').AsInteger;
      nOutRecog1:= FieldByName('OutRecog1').AsInteger;
      nOutRecog2:= FieldByName('OutRecog2').AsInteger;

      if RecordCount > 0 then
      begin
        nInUnitNo:= FieldByName('UnitNo').AsInteger;

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
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
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
            ExceptLogging('File: ' + sLocalFile);

            if FileExists(sInFile) then
            begin
              imgIn.Picture.LoadFromFile(sInFile);
              //if CopyFile(PChar(sInfile), PChar(sLocalFile), False) then
              //  imgIn.Picture.LoadFromFile(sLocalFile);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              ExceptLogging('File 없음: ' + sInFile);
            end;

            {
            if DownloadFileHTTP(sInFile, sLocalFile) then
            begin
              imgIn.Picture.LoadFromFile(sLocalFile);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              ExceptLogging('File Down 실패: ' + sInFile);
            end;
            }
          except
            on E: Exception do ExceptLogging('TfrmFreeIOData_InImageLoad: ' + aString(E.Message));
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
              ExceptLogging('이미지저장폴더 생성실패: ' + sOutDir);
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
                ExceptLogging('File 없음: ' + sOutFile);
              end;

              {
              if DownloadFileHTTP(sOutFile, sOutLocalFile) then
              begin
                imgOut.Picture.LoadFromFile(sOutLocalFile);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('File Down 실패: ' + sOutFile);
              end;
              }
            except
              on E: Exception do ExceptLogging('TfrmFreeIOData_OutImageLoad: ' + aString(E.Message));
            end;
          end;
        end
        else
          imgOut.Picture.Assign(Nil);
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmFreeIOData.dg1Click: ' + E.Message);
  end;
end;

procedure TfrmFreeIOData.dg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryFreeIOData do
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
              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
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
                ExceptLogging('File 없음: ' + sInFile);
              end;

              {
              if DownloadFileHTTP(sInFile, sLocalFile) then
              begin
                imgIn.Picture.LoadFromFile(sLocalFile);
              end
              else
              begin
                imgIn.Picture.Assign(Nil);
                ExceptLogging('File Down 실패: ' + sInFile);
              end;
              }
            except
              on E: Exception do ExceptLogging('TfrmFreeIOData_InImageLoad: ' + aString(E.Message));
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
                ExceptLogging('이미지저장폴더 생성실패: ' + sOutDir);
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
                  ExceptLogging('File 없음: ' + sOutFile);
                end;

                {
                if DownloadFileHTTP(sOutFile, sOutLocalFile) then
                begin
                  imgOut.Picture.LoadFromFile(sOutLocalFile);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('File Down 실패: ' + sOutFile);
                end;
                }
              except
                on E: Exception do ExceptLogging('TfrmFreeIOData_OutImageLoad: ' + aString(E.Message));
              end;
            end;
          end
          else
            imgOut.Picture.Assign(Nil);
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmFreeIOData.dg1KeyUp: ' + E.Message);
  end;
end;

end.
