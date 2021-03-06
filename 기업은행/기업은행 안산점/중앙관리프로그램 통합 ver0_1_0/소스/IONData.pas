unit IONData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj, sButton, sLabel, sPanel;

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
    pnImg: TPanel;
    imgIn: TImage;
    imgOut: TImage;
    qryIONDataParkNo: TSmallintField;
    qryTemp: TADOQuery;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
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
    Panel3: TPanel;
    Panel2: TPanel;
    Bevel14: TBevel;
    Label14: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel4: TBevel;
    Label5: TLabel;
    Bevel5: TBevel;
    Label6: TLabel;
    cmbSearch: TComboBox;
    cmbOutStatus: TComboBox;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    cmbIO: TComboBox;
    cmbType: TComboBox;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    edtTotal: TPanel;
    btnExcel: TBitBtn;
    btnDelete: TBitBtn;
    Label7: TLabel;
    Bevel6: TBevel;
    edtVisitTimeS: TEdit;
    Label8: TLabel;
    edtVisitTimeE: TEdit;
    pnIONDataIn: TsPanel;
    sLabel28: TsLabel;
    Label9: TLabel;
    edtIONDataInCar: TEdit;
    btnIONInOK: TsButton;
    Panel4: TPanel;
    imgIONDataIn: TImage;
    pnIONDataOut: TsPanel;
    sLabel1: TsLabel;
    Label10: TLabel;
    edtIONDataOutCar: TEdit;
    btnIONOutOK: TsButton;
    Panel5: TPanel;
    imgIONDataOut: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryIONDataOutChkGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure cmbSearchChange(Sender: TObject);
    procedure qryIONDataStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dg1Click(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure imgInDblClick(Sender: TObject);
    procedure imgOutDblClick(Sender: TObject);
    procedure btnIONOutOKClick(Sender: TObject);
    procedure btnIONInOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIONData: TfrmIONData;
  nDelUnitNo: Integer;
  sDelDate, sDelTime, sDelNo, sDelCarNo: String;
  bExcelSaving : Boolean = False;
  sLInfile,sLOutFile, sLInCarNo ,sLOutCarNo  : string;

implementation

uses Global, Tables;

{$R *.dfm}

procedure TfrmIONData.FormResize(Sender: TObject);
begin
//  pnImg.Width := Panel1.Width div 4;
//  imgIn.Width := Panel1.Width div 4;
//  imgOut.Width := Panel1.Width div 4;
  pnImg.Width := Panel1.Width div 6;
  imgIn.Width := Panel1.Width div 6;
  imgOut.Width := Panel1.Width div 6;
  imgIn.Height := pnImg.Height div 2;
  imgOut.Top := pnImg.Height div 2;
  imgOut.Height := pnImg.Height div 2;
end;

procedure TfrmIONData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
  bExcelSaving := false;
  if nVisitReason = 0 then
  begin
    dg1.Columns[10].Width := 0;
    dg1.Columns[11].Width := 0;
    dg1.Columns[12].Width := 0;
  end;
end;

procedure TfrmIONData.imgInDblClick(Sender: TObject);
var
 sTemp,sInfile: aString;
begin
  pnIONDataIn.Visible := True;
  try
    ExceptLogging('File: ' + sLInfile);
    edtIONDataInCar.Text := sLInCarNo;
    if FileExists(sLInfile) then
    begin
      imgIONDataIn.Picture.LoadFromFile(sLInfile);
    end
    else
    begin
      imgIONDataIn.Picture.Assign(Nil);
      ExceptLogging('File ????: ' + sLInfile);
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmIONData.imgOutDblClick(Sender: TObject);
var
 sTemp,sOutfile: aString;
begin
  pnIONDataOut.Visible := True;
  try
    ExceptLogging('File: ' + sLOutFile);
    edtIONDataOutCar.Text := sLOutCarNo;
    if FileExists(sLOutFile) then
    begin
      imgIONDataOut.Picture.LoadFromFile(sLOutFile);
    end
    else
    begin
      imgIONDataOut.Picture.Assign(Nil);
      ExceptLogging('File ????: ' + sLOutFile);
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
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

      if cmbSearch.ItemIndex = 0 then
      begin
        if cmbType.ItemIndex = 0 then
          SQL.Add('Select * from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ')
        else
        if cmbType.ItemIndex = 1 then
          SQL.Add('Select * from IONData where OutDate >= :N1 and OutDate <= :N2 and ');

        SQL.Add('(TKType = :N3 or TKType = :N4) ');
        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sEDate;
        Parameters.ParamByName('N3').Value:= 1;
        Parameters.ParamByName('N4').Value:= 9;
      end
      else
      if cmbSearch.ItemIndex = 1 then
      begin
        if cmbType.ItemIndex = 0 then
          SQL.Add('Select * from IONData where ProcDate = :N1 and ProcTime >= :N2 and ProcTime <= :N3 and ')
        else
        if cmbType.ItemIndex = 1 then
          SQL.Add('Select * from IONData where OutDate = :N1 and OutTime >= :N2 and OutTime <= :N3 and ');

        SQL.Add('(TKType = :N4 or TKType = :N5) ');
        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sSTime;
        Parameters.ParamByName('N3').Value:= sETime;
        Parameters.ParamByName('N4').Value:= 1;
        Parameters.ParamByName('N5').Value:= 9;
      end;

      if cmbOutStatus.ItemIndex <> 0 then SQL.Add('and OutChk = :N6 ');

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

      if (edtVisitTimeS.Text <> '') then
      begin
        if edtVisitTimeE.Text <> '' then
        begin
          SQL.Add(' and parkingMin >= :N7 and parkingMin <= :N8');
          Parameters.ParamByName('N7').Value:= edtVisitTimeS.Text;
          Parameters.ParamByName('N8').Value:= edtVisitTimeE.Text;
        end
        else
        begin
          SQL.Add(' and parkingMin >= :N7');
          Parameters.ParamByName('N7').Value:= edtVisitTimeS.Text;
        end;
      end
      else
      begin
        if edtVisitTimeE.Text <> '' then
        begin
          ShowMessage('?????????? ?????????? ??????.');
        end;
      end;

      if cmbType.ItemIndex = 0 then
        SQL.Add(' Order By UnitNo, ProcDate, ProcTime')
      else
      if cmbType.ItemIndex = 1 then
        SQL.Add(' Order By UnitNo, OutDate, OutTime');

      if cmbOutStatus.ItemIndex <> 0 then
        Parameters.ParamByName('N6').Value:= cmbOutStatus.ItemIndex - 1;

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
      SQL.Add('Select Count(*) nIn from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');
      //SQL.Add('and (UnitNo <> 1 and UnitNo <> 2)');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= 9;
      Open;

      nNIn:= FieldByName('nIn').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOut from IONData where ProcDate >= :N1 and ');
      SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

      //???????????? ???????? ????...
      SQL.Add('and OutUnitNo <> 0');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= 0;
      Parameters.ParamByName('N6').Value:= 9;
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

procedure TfrmIONData.cmbSearchChange(Sender: TObject);
begin
  if cmbSearch.ItemIndex = 0 then
  begin
    edtSTime.Enabled:= False;
    edtETime.Enabled:= False;
    edtEDate.Enabled:= True;
  end
  else
  begin
    edtSTime.Enabled:= True;
    edtETime.Enabled:= True;
    edtEDate.Enabled:= False;
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
    sLInfile := '';
    sLOutFile := '';
    sLInCarNo :='';
    sLOutCarNo :='';

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

        ExceptLogging('???????? ???? ???? ????1 File: ' + sInFile);

        if NOT bExcelSaving then
        begin
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
            sLInfile := sInFile;
            sLInCarNo :=  sInCarNo;
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

          if not DirectoryExists(sDir) then
          begin
            if not ForceDirectories(sDir) then
              ExceptLogging('?????????????? ????????: ' + sDir);
          end;

          ExceptLogging('???????? ???? ???? ????1 File: ' + sOutFile);

          if not bExcelSaving then
          begin
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
              sLOutFile :=  sOutFile;
              sLOutCarNo := FieldByName('OutCarNo1').AsString;
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
              on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
            end;
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
  sLInfile := '';
  sLOutFile := '';
  sLInCarNo :='';
  sLOutCarNo :='';
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

            if NOT bExcelSaving then
            begin
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
                sLInfile := sInFile;
                sLInCarNo :=  sInCarNo;
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

              if not DirectoryExists(sDir) then
              begin
                if not ForceDirectories(sDir) then
                  ExceptLogging('?????????????? ????????: ' + sDir);
              end;

              ExceptLogging('???????? ???? ???? ????1 File: ' + sOutFile);
    //          sLOutFile :=  sOutFile;
    //          sLOutCarNo := FieldByName('OutCarNo1').AsString;
              if not bExcelSaving then
              begin
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
                  sLOutFile :=  sOutFile;
                  sLOutCarNo := FieldByName('OutCarNo1').AsString;
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
                  on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
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
    on E: Exception do ExceptLogging('TfrmIONData.dg1KeyUp: ' + E.Message);
  end;
end;

procedure TfrmIONData.btnExcelClick(Sender: TObject);
begin
  try
    bExcelSaving := True;
    if savedialog1.Execute then
    begin
//      dg1.PageMode := false;      //??????
//      advgridexcelio1.Options.ExportCellFormats := True;
//      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
    bExcelSaving := False;
  except
    on E: Exception do ExceptLogging('TfrmIONData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmIONData.btnIONInOKClick(Sender: TObject);
begin
  pnIONDataIn.Visible := False;
end;

procedure TfrmIONData.btnIONOutOKClick(Sender: TObject);
begin
  pnIONDataOut.Visible := false;
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
