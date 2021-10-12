unit BlackSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, tmsAdvGridExcel, Data.DB,
  Data.Win.ADODB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, Vcl.ComCtrls;

type
  TfrmBlackSearch = class(TForm)
    sb1: TStatusBar;
    pn1: TPanel;
    grddg1: TDBAdvGrid;
    pn2: TPanel;
    pn3: TPanel;
    bvl7: TBevel;
    l7: TLabel;
    bvl8: TBevel;
    l8: TLabel;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    qryIONData: TADOQuery;
    qryIONDataParkNo: TSmallintField;
    wrdfldIONDataUnitNo: TWordField;
    strngfldIONDataProcDate: TStringField;
    strngfldIONDataProcTime: TStringField;
    strngfldIONDataTKNo: TStringField;
    wrdfldIONDataTKType: TWordField;
    wrdfldIONDataCarTypeNo: TWordField;
    strngfldIONDataInImage: TStringField;
    strngfldIONDataInCarNo: TStringField;
    wrdfldIONDataStatus: TWordField;
    wrdfldIONDataOutUnitNo: TWordField;
    strngfldIONDataOutDate: TStringField;
    strngfldIONDataOutTime: TStringField;
    wrdfldIONDataOutChk: TWordField;
    strngfldIONDataOutImage: TStringField;
    strngfldIONDataOutCarNo: TStringField;
    strngfldIONDataReserve1: TStringField;
    strngfldIONDataReserve2: TStringField;
    strngfldIONDataReserve3: TStringField;
    strngfldIONDataReserve4: TStringField;
    strngfldIONDataReserve5: TStringField;
    wrdfldIONDataInRecog: TWordField;
    wrdfldIONDataOutRecog: TWordField;
    strngfldIONDataInImage2: TStringField;
    strngfldIONDataInCarNo2: TStringField;
    strngfldIONDataOutImage2: TStringField;
    strngfldIONDataOutCarNo2: TStringField;
    wrdfldIONDataInRecog2: TWordField;
    wrdfldIONDataOutRecog2: TWordField;
    strngfldIONDataInUnitName: TStringField;
    strngfldIONDataOutUnitName: TStringField;
    dsIONData: TDataSource;
    qryTemp: TADOQuery;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    strngfldUnitInfoUnitName: TStringField;
    wrdfldUnitInfoUnitKind: TWordField;
    wrdfldUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    strngfldUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    strngfldUnitInfoReserve1: TStringField;
    strngfldUnitInfoReserve2: TStringField;
    strngfldUnitInfoReserve3: TStringField;
    strngfldUnitInfoReserve4: TStringField;
    strngfldUnitInfoReserve5: TStringField;
    cbbSearchDate: TComboBox;
    l2: TLabel;
    bvl1: TBevel;
    edtCnt: TEdit;
    btnSave: TBitBtn;
    qryBlackList: TADOQuery;
    qryBlackListParkNo: TSmallintField;
    strngfldBlackListBCarNo: TStringField;
    strngfldBlackListBRegDate: TStringField;
    strngfldBlackListBRegTime: TStringField;
    qryBlackListUnpaidAmt: TIntegerField;
    qryBlackListMNo: TSmallintField;
    strngfldBlackListRegReason: TStringField;
    strngfldBlackListReserve1: TStringField;
    strngfldBlackListReserve2: TStringField;
    strngfldBlackListReserve3: TStringField;
    strngfldBlackListReserve4: TStringField;
    strngfldBlackListReserve5: TStringField;
    edtReason: TEdit;
    l1: TLabel;
    bvl2: TBevel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure grddg1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlackSearch: TfrmBlackSearch;
  bExcelSaving : Boolean = False;

implementation

{$R *.dfm}

uses
  Global, Tables;

procedure TfrmBlackSearch.btnCloseClick(Sender: TObject);
begin
  qryIONData.Close;
  Close;
end;

procedure TfrmBlackSearch.btnExcelClick(Sender: TObject);
begin
  try
    bExcelSaving := True;
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
    bExcelSaving := False;
  except
    on E: Exception do ExceptLogging('TfrmBlackSearch.btnExcelClick: ' + E.Message);
  end;
end;



procedure TfrmBlackSearch.btnSaveClick(Sender: TObject);
var
  sSelectCarNo : String;
begin
  try
    sSelectCarNo := qryIONData.FieldByName('InCarNo1').AsString;
    if sSelectCarNo = '' then
    begin
      ShowMessage('차량을 선택해 주세요');
      Exit;
    end;

    with qryBlackList do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from BlackList ' +
              'where BCarNo = :N1');
      Parameters.ParamByName('N1').Value := sSelectCarNo;
      Open;
      if RecordCount > 0 then
      begin
        ShowMessage('이미 등록된 블랙리스트 차량번호입니다');
        Exit;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Insert Into BlackList (ParkNo, BCarNo, BRegDate, BRegTime, RegReason) ' +
              'Values(:N1, :N2, :N3, :N4, :N5)' );
      Parameters.ParamByName('N1').Value := 1;
      Parameters.ParamByName('N2').Value := sSelectCarNo;
      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N5').Value := edtReason.Text;
      ExecSQL;
    end;
    ShowMessage('블랙리스트 차량 등록이 완료되었습니다');
    ExceptLogging('TfrmNewBSC.btnSaveClick: 블랙리스트 차량 등록 : ' + sSelectCarNo);

    edtReason.Text  := '';
  except
    on E: Exception do ExceptLogging('TfrmBlackSearch.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmBlackSearch.btnSearchClick(Sender: TObject);
var
  sNowDate, sBeforeDate : String;
begin
try
    sNowDate    := FormatDateTime('YYYY-MM-DD', Now);
    if cbbSearchDate.ItemIndex = 0 then
    begin
      sBeforeDate := FormatDateTime('YYYY-MM-DD', Now-7);
    end
    else
    begin
      sBeforeDate := FormatDateTime('YYYY-MM-DD', Now-30);
    end;

    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from iondata ion where ion.InCarNo1 in ( ' +
                'select b.InCarNo1 from ( ' +
                  'select sum(case when a.ProcDate between :N1 and :N2 then 1 else 0 end) as cnt, a.InCarNo1 ' +
                  'from (select InCarNo1,ProcDate from iondata group by incarno1, procdate)as a ' +
                  'group by a.InCarNo1) as b ' +
              'where b.cnt >= :N3) and ProcDate between :N4 and :N5 ');
      if edtCarno.Text <> '' then
      begin
        SQL.Add(' and IncarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%'));
      end;
      Sql.Add(' and InRecog1 = 1 ');
      SQL.Add(' order by incarno1, ProcDate asc');

      Parameters.ParamByName('N1').Value := sBeforeDate;
      Parameters.ParamByName('N2').Value := sNowDate;
      Parameters.ParamByName('N3').Value := edtCnt.Text;
      Parameters.ParamByName('N4').Value := sBeforeDate;
      Parameters.ParamByName('N5').Value := sNowDate;
      Open;
      if RecordCount > 0 then
      begin
        btnExcel.Enabled := True;
      end
      else
      begin
        btnExcel.Enabled := False;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmBlackSearch.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmBlackSearch.grddg1Click(Sender: TObject);
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

//        if not DirectoryExists(sDir) then
//        begin
//          if not ForceDirectories(sDir) then
//            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
//        end;

        ExceptLogging('일반차량 입차 파일 확인1 File: ' + sInFile);

        if NOT bExcelSaving then
        begin
          try
            // sFile1에 http가 붙을때
            if Copy(sInFile, 1, 4) = 'http' then
            begin
              ExceptLogging('일반차량 입차 파일 확인2 File: ' + sInFile);
              sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
              sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
              sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
              sInFile:= MG_StrConvert(sInFile, '/', '\');
              ExceptLogging('HTTP 형식 입차 File: ' + sInFile);
            end
            // \\172.16.83.1 형식으로 올때 데이터파싱하지않음.
            else
            begin
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
              ExceptLogging('IP 형식 입차 File: ' + sInFile);
            end;

//            if FileExists(sInFile) then
//            begin
//              imgIn.Picture.LoadFromFile(sInFile);
//            end
//            else
//            begin
//              imgIn.Picture.Assign(Nil);
//              ExceptLogging('입차 File 없음: ' + sInFile);
//            end;
          except
            on E: Exception do ExceptLogging('TfrmIOSData_InImageLoad: ' + aString(E.Message));
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

          sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

//          if not DirectoryExists(sDir) then
//          begin
//            if not ForceDirectories(sDir) then
//              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
//          end;

          ExceptLogging('일반차량 출차 파일 확인1 File: ' + sOutFile);

          if not bExcelSaving then
          begin
            try
              // sFile1에 http가 붙을때
              if Copy(sOutFile, 1, 4) = 'http' then
              begin
                ExceptLogging('일반차량 출차 파일 확인2 File: ' + sOutFile);
                sTemp:= Copy(sOutFile, 6, Length(sOutFile)-5);
                sOutFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
                sOutFile:= sOutFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
                sOutFile:= MG_StrConvert(sOutFile, '/', '\');
                ExceptLogging('HTTP 형식 출차 File: ' + sOutFile);
              end
              // \\172.16.83.1 형식으로 올때 데이터 파싱하지않음.
              else
              begin
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
                ExceptLogging('IP 형식 출차 File: ' + sInFile);
              end;

//              if FileExists(sOutFile) then
//              begin
//                imgOut.Picture.LoadFromFile(sOutFile);
//              end
//              else
//              begin
//                imgOut.Picture.Assign(Nil);
//                ExceptLogging('출차 File 없음: ' + sOutFile);
//              end;
            except
              on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
            end;
          end;
        end;
//        else
//          imgOut.Picture.Assign(Nil);
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.DBAdvGrid1Click: ' + E.Message);
  end;
end;

end.
