unit IOBData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, StdCtrls, Grids, ExtCtrls, BaseGrid,
  AdvGrid, DBAdvGrid, AdvToolBtn, AdvDateTimePicker, AdvPanel, AdvAppStyler,
  Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmIOBData = class(TForm)
    sb1: TStatusBar;
    qryIOBData: TADOQuery;
    dsIOBData: TDataSource;
    qryIOBDataParkNo: TSmallintField;
    qryIOBDataUnitNo: TWordField;
    qryIOBDataProcDate: TStringField;
    qryIOBDataProcTime: TStringField;
    qryIOBDataTKNo: TStringField;
    qryIOBDataTKType: TWordField;
    qryIOBDataCarTypeNo: TWordField;
    qryIOBDataGroupNo: TWordField;
    qryIOBDataGroupName: TStringField;
    qryIOBDataCompName: TStringField;
    qryIOBDataDeptName: TStringField;
    qryIOBDataName: TStringField;
    qryIOBDataInCarNo: TStringField;
    qryIOBDataInIOStatusNo: TWordField;
    qryIOBDataInImage: TStringField;
    qryIOBDataOutUnitNo: TWordField;
    qryIOBDataOutDate: TStringField;
    qryIOBDataOutTime: TStringField;
    qryIOBDataOutImage: TStringField;
    qryIOBDataOutCarNo: TStringField;
    qryIOBDataOutIOStatusNo: TWordField;
    qryIOBDataReserve1: TStringField;
    qryIOBDataReserve2: TStringField;
    qryIOBDataReserve3: TStringField;
    qryIOBDataReserve4: TStringField;
    qryIOBDataReserve5: TStringField;
    qryIOStatus: TADOQuery;
    qryIOStatusIOStatusNo: TWordField;
    qryIOStatusIOStatusName: TStringField;
    qryIOStatusReserve1: TStringField;
    qryIOStatusReserve2: TStringField;
    qryIOStatusReserve3: TStringField;
    qryIOStatusReserve4: TStringField;
    qryIOStatusReserve5: TStringField;
    qryIOBDataInIOName: TStringField;
    qryIOBDataOutIOName: TStringField;
    Panel1: TPanel;
    tdg1: TDBAdvGrid;
    pnImg: TAdvPanel;
    imgIn: TImage;
    imgOut: TImage;
    btnPrint: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryIOBDataInImage2: TStringField;
    qryIOBDataInCarNo2: TStringField;
    qryIOBDataOutImage2: TStringField;
    qryIOBDataOutCarNo2: TStringField;
    qryIOBDataInRecog1: TWordField;
    qryIOBDataOutRecog1: TWordField;
    qryIOBDataInRecog2: TWordField;
    qryIOBDataOutRecog2: TWordField;
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
    qryIOBDataInUnitName: TStringField;
    qryIOBDataOutUnitName: TStringField;
    qryTemp: TADOQuery;
    qryGroup: TADOQuery;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TWordField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryGroupRemark: TStringField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tdg1GetRecordCount(Sender: TObject; var Count: Integer);
    procedure tdg1CanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure tdg1Click(Sender: TObject);
    procedure tdg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOBData: TfrmIOBData;
  nGroupNo, nDelGroupNo: Integer;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIOBData.FormResize(Sender: TObject);
begin
  pnImg.Width := Panel1.Width div 6;
  imgIn.Width := Panel1.Width div 6;
  imgOut.Width := Panel1.Width div 6;
  imgIn.Height := pnImg.Height div 2;
  imgOut.Top := pnImg.Height div 2;
  imgOut.Height := pnImg.Height div 2;
end;

procedure TfrmIOBData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
end;

procedure TfrmIOBData.btnCloseClick(Sender: TObject);
begin
  qryIOBData.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmIOBData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nSIn, nSMiIn, nSOut, nSMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryIOBData do
    begin
      Close;
      SQL.Clear;

      SQL.Add('Select * from IOBData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4)');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;


      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOBData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIOBData.tdg1GetRecordCount(Sender: TObject;
  var Count: Integer);
begin
  Count:= qryIOBData.RecordCount;
end;

procedure TfrmIOBData.tdg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOBData do
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

          if FileExists(sInFile) then
            imgIn.Picture.LoadFromFile(sInFile)
          else
          begin
            imgIn.Picture.Assign(Nil);
          end;

          if FieldByName('OutIOStatusNo').AsInteger > 0 then
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

            if FileExists(sOutFile) then
              imgOut.Picture.LoadFromFile(sOutFile)
            else
            begin
              imgIn.Picture.Assign(Nil);
            end;
          end
          else
            imgOut.Picture.Assign(Nil);
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOBData.tdg1KeyUp: ' + E.Message);
  end;
end;

procedure TfrmIOBData.tdg1CanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
var
  fdName, sSort: String;
  sSDate, sEDate, sSTime, sETime: String;
begin
  DoSort:= False;

  if tdg1.SortSettings.Direction = sdAscending then
  begin
    tdg1.SortSettings.Direction:= sdDescending;
    sSort:= ' Desc';
  end
  else
  begin
    tdg1.SortSettings.Direction:= sdAscending;
    sSort:= '';
  end;

  fdName:= qryIOBData.FieldList.Fields[ACol-1].FieldName;

  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime:= FormatDateTime('HH:NN', edtSTime.Time);
  sETime:= FormatDateTime('HH:NN', edtETime.Time);

  with qryIOBData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from IOBData where ProcDate >= :N1 and ProcDate <= :N2 and ');
    SQL.Add('ProcTime >= :N3 and ProcTime <= :N4 and TKType = :N5 ');
    Parameters.ParamByName('N1').Value:= sSDate;
    Parameters.ParamByName('N2').Value:= sEDate;
    Parameters.ParamByName('N3').Value:= sSTime;
    Parameters.ParamByName('N4').Value:= sETime;
    Parameters.ParamByName('N5').Value:= 2;
    SQL.Add('Order By ' + fdName + sSort);

    Open;

    if RecordCount > 0 then
    begin
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
  tdg1.SortSettings.Column:= ACol;
end;

procedure TfrmIOBData.tdg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOBData do
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
            ExceptLogging('IP ???? ???? File: ' + sInFile);
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
          on E: Exception do ExceptLogging('TfrmIOBData_InImageLoad: ' + aString(E.Message));
        end;

        if FieldByName('OutIOStatusNo').AsInteger > 0 then
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

          if not DirectoryExists(sDir) then
          begin
            if not ForceDirectories(sDir) then
              ExceptLogging('?????????????? ????????: ' + sDir);
          end;

          ExceptLogging('???????? ???? ???? ????1 File: ' + sOutFile);
          try
            // sFile1?? http?? ??????
            if Copy(sOutFile, 1, 4) = 'http' then
            begin
              ExceptLogging('???????? ???? ???? ????2 File: ' + sOutFile);
              sTemp:= Copy(sOutFile, 6, Length(sOutFile)-5);
              sOutFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
              sOutFile:= sOutFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
              sOutFile:= MG_StrConvert(sOutFile, '/', '\');
              ExceptLogging('HTTP ???? ???? File: ' + sOutFile);
            end
            // \\172.16.83.1 ???????? ???? ?????? ????????????.
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
              ExceptLogging('IP ???? ???? File: ' + sInFile);
            end;

            if FileExists(sOutFile) then
            begin
              imgOut.Picture.LoadFromFile(sOutFile);
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              ExceptLogging('???? File ????: ' + sOutFile);
            end;
          except
            on E: Exception do ExceptLogging('TfrmIOBData_OutImageLoad: ' + aString(E.Message));
          end;
        end
        else
          imgOut.Picture.Assign(Nil);
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOBData.tdg1Click: ' + E.Message);
  end;
end;

procedure TfrmIOBData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOBData.btnExcelClick: ' + E.Message);
  end;
end;

end.
