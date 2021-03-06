unit IOSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, StdCtrls, Grids, ExtCtrls, BaseGrid,
  AdvGrid, DBAdvGrid, AdvToolBtn, AdvDateTimePicker, AdvPanel, AdvAppStyler,
  Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmIOSData = class(TForm)
    sb1: TStatusBar;
    qryIOSData: TADOQuery;
    dsIOSData: TDataSource;
    qryIOSDataParkNo: TSmallintField;
    qryIOSDataUnitNo: TWordField;
    qryIOSDataProcDate: TStringField;
    qryIOSDataProcTime: TStringField;
    qryIOSDataTKNo: TStringField;
    qryIOSDataTKType: TWordField;
    qryIOSDataCarTypeNo: TWordField;
    qryIOSDataGroupNo: TWordField;
    qryIOSDataGroupName: TStringField;
    qryIOSDataCompName: TStringField;
    qryIOSDataDeptName: TStringField;
    qryIOSDataName: TStringField;
    qryIOSDataInCarNo: TStringField;
    qryIOSDataInIOStatusNo: TWordField;
    qryIOSDataInImage: TStringField;
    qryIOSDataOutUnitNo: TWordField;
    qryIOSDataOutDate: TStringField;
    qryIOSDataOutTime: TStringField;
    qryIOSDataOutImage: TStringField;
    qryIOSDataOutCarNo: TStringField;
    qryIOSDataOutIOStatusNo: TWordField;
    qryIOSDataReserve1: TStringField;
    qryIOSDataReserve2: TStringField;
    qryIOSDataReserve3: TStringField;
    qryIOSDataReserve4: TStringField;
    qryIOSDataReserve5: TStringField;
    qryIOStatus: TADOQuery;
    qryIOStatusIOStatusNo: TWordField;
    qryIOStatusIOStatusName: TStringField;
    qryIOStatusReserve1: TStringField;
    qryIOStatusReserve2: TStringField;
    qryIOStatusReserve3: TStringField;
    qryIOStatusReserve4: TStringField;
    qryIOStatusReserve5: TStringField;
    qryIOSDataInIOName: TStringField;
    qryIOSDataOutIOName: TStringField;
    Panel1: TPanel;
    tdg1: TDBAdvGrid;
    pnImg: TAdvPanel;
    imgIn: TImage;
    imgOut: TImage;
    Panel2: TPanel;
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
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryIOSDataInImage2: TStringField;
    qryIOSDataInCarNo2: TStringField;
    qryIOSDataOutImage2: TStringField;
    qryIOSDataOutCarNo2: TStringField;
    qryIOSDataInRecog1: TWordField;
    qryIOSDataOutRecog1: TWordField;
    qryIOSDataInRecog2: TWordField;
    qryIOSDataOutRecog2: TWordField;
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
    qryIOSDataInUnitName: TStringField;
    qryIOSDataOutUnitName: TStringField;
    edtTotal: TPanel;
    qryTemp: TADOQuery;
    Bevel1: TBevel;
    Label2: TLabel;
    cmbGroupName: TComboBox;
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
    Bevel4: TBevel;
    Label3: TLabel;
    cmbIO: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tdg1GetRecordCount(Sender: TObject; var Count: Integer);
    procedure tdg1CanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure tdg1Click(Sender: TObject);
    procedure tdg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure cmbGroupNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOSData: TfrmIOSData;
  nGroupNo, nDelGroupNo: Integer;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIOSData.FormShow(Sender: TObject);
begin
  cmbGroupName.Items.Clear;
  cmbGroupName.Items.Add('????');

  with qryGroup do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from GGroup where Reserve1 is null Order by GroupNo');
    Open;

    if RecordCount > 0 then
    begin
      First;
      nGroupNo:= FieldByName('GroupNo').AsInteger;

      while not Eof do
      begin
        cmbGroupName.Items.Add(FieldByName('GroupName').AsString);
        Next;
      end;
    end
    else
      btnSearch.Enabled:= False;
  end;
  cmbGroupName.ItemIndex:= 0;

  qryIOStatus.Open;
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
end;

procedure TfrmIOSData.btnCloseClick(Sender: TObject);
begin
  qryIOSData.Close;
  qryIOStatus.Close;
  Close;
end;

procedure TfrmIOSData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nSIn, nSMiIn, nSOut, nSMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryIOSData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and TKType = :N3 ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N4 ');

      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N4').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      if cmbIO.ItemIndex > 0 then
      begin
        case cmbIO.ItemIndex of
          1: begin
               SQL.Add(' and InIOStatusNo = 1 and OutIOStatusNo = 0 ');
          end;

          2: begin
               SQL.Add(' and InIOStatusNo = 1 and OutIOStatusNo = 2 ');
          end;
        end;
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
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

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and TKType = :N3 ');
      SQL.Add('and OutIOStatusNo = 2 and (ProcTime = OutTime) ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N4 ');

      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N4').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
      Open;

      if RecordCount > 0 then
        nSMiIn:= RecordCount
      else
        nSMiIn:= 0;

      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and TKType = :N3 ');
      SQL.Add('and OutIOStatusNo = 2 ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N4 ');

      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N4').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((OutCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (OutCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
      Open;

      if RecordCount > 0  then
        nSOut:= RecordCount
      else
        nSOut:= 0;

      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and TKType = :N3 ');
      SQL.Add('and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N4 ');

      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N4').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
      Open;

      if RecordCount > 0  then
        nSIn:= RecordCount
      else
        nSIn:= 0;

      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData ');
      SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and TKType = :N3 ');
      SQL.Add('and InIOStatusNo = 1 and OutIOStatusNo = 0 ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N4 ');

      Parameters.ParamByName('N1').Value:= sSDate + sSTime;
      Parameters.ParamByName('N2').Value:= sEDate + sETime;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N4').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;
      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
      Open;

      if RecordCount > 0  then
        nSMi:= RecordCount
      else
        nSMi:= 0;

      edtTotal.Caption:= '  ??????: ' + IntToStr(nSIn) + '??   ' +  //'  ??????: ' + IntToStr(nSIn-nSMiIn) + '??   ' +
                         '??????: ' + IntToStr(nSOut) + '??   ' +
                         '??????: ' + IntToStr(nSMi) + '??';
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOSData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIOSData.cmbGroupNameChange(Sender: TObject);
begin
  if cmbGroupName.ItemIndex > 0 then
  begin
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where GroupName = :N1');
      Parameters.ParamByName('N1').Value:= cmbGroupName.Text;
      Open;

      if RecordCount > 0 then
        nGroupNo:= FieldByName('GroupNo').AsInteger
    end;
  end;
end;

procedure TfrmIOSData.tdg1GetRecordCount(Sender: TObject;
  var Count: Integer);
begin
  Count:= qryIOSData.RecordCount;
end;

procedure TfrmIOSData.tdg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOSData do
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
              on E: Exception do ExceptLogging('TfrmIOSData_InImageLoad: ' + aString(E.Message));
            end;
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
                on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
              end;
            end;
          end
          else
            imgOut.Picture.Assign(Nil);
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1KeyUp: ' + E.Message);
  end;
end;

procedure TfrmIOSData.tdg1CanSort(Sender: TObject; ACol: Integer;
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

  fdName:= qryIOSData.FieldList.Fields[ACol-1].FieldName;

  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime:= FormatDateTime('HH:NN', edtSTime.Time);
  sETime:= FormatDateTime('HH:NN', edtETime.Time);

  with qryIOSData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from IOSData where ProcDate >= :N1 and ProcDate <= :N2 and ');
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

procedure TfrmIOSData.tdg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  try
    sb1.SimpleText:= '';

    with qryIOSData do
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

        ExceptLogging('???????? ???? ???? ???? File: ' + sInFile);

        try
          // sFile1?? http?? ??????
          if Copy(sInFile, 1, 4) = 'http' then
          begin
            ExceptLogging('???????? ???? ???? ???? File: ' + sInFile);
            sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
            sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sInFile:= MG_StrConvert(sInFile, '/', '\');
            ExceptLogging('File: ' + sInFile);
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
            ExceptLogging('File: ' + sInFile);
          end;

          if FileExists(sInFile) then
            imgIn.Picture.LoadFromFile(sInFile)
          else
          begin
            imgIn.Picture.Assign(Nil);
          end;
        except
          on E: Exception do ExceptLogging('TfrmIOSData_InImageLoad: ' + aString(E.Message));
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
            ExceptLogging('File: ' + sOutFile);
          end
          // \\172.16.83.1 ???????? ???? ??????????????????.
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
          on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
        end;
        end
        else
          imgOut.Picture.Assign(Nil);
      end;
    end;

  except
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1Click: ' + E.Message);
  end;
end;
procedure TfrmIOSData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOSData.btnExcelClick: ' + E.Message);
  end;
end;

end.
