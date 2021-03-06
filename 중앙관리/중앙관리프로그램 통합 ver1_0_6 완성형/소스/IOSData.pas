unit IOSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, StdCtrls, Grids, ExtCtrls, BaseGrid,
  AdvGrid, DBAdvGrid, AdvToolBtn, AdvDateTimePicker, AdvPanel, AdvAppStyler,
  Buttons, tmsAdvGridExcel, AdvObj, sButton, sLabel, sPanel;

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
    btnPrint: TBitBtn;
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
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    cmbGroupName: TComboBox;
    cmbType: TComboBox;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    edtTotal: TPanel;
    pnIOSDataIn: TsPanel;
    sLabel28: TsLabel;
    Label5: TLabel;
    edtIOSDataInCar: TEdit;
    btnIOSInOK: TsButton;
    Panel4: TPanel;
    imgIOSDataIn: TImage;
    pnIOSDataOut: TsPanel;
    sLabel1: TsLabel;
    Label4: TLabel;
    edtIOSDataOutCar: TEdit;
    btnIOSOutOK: TsButton;
    Panel5: TPanel;
    imgIOSDataOut: TImage;
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
    procedure FormResize(Sender: TObject);
    procedure imgInDblClick(Sender: TObject);
    procedure imgOutDblClick(Sender: TObject);
    procedure btnIOSInOKClick(Sender: TObject);
    procedure pnIOSDataOutClick(Sender: TObject);
    procedure btnIOSOutOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOSData: TfrmIOSData;
  nGroupNo, nDelGroupNo: Integer;
  bExcelSaving : Boolean = False;
  sLInfile,sLOutFile, sLInCarNo ,sLOutCarNo  : string;


implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIOSData.FormResize(Sender: TObject);
begin
  pnImg.Width := Panel1.Width div 6;
  imgIn.Width := Panel1.Width div 6;
  imgOut.Width := Panel1.Width div 6;
  imgIn.Height := pnImg.Height div 2;
  imgOut.Top := pnImg.Height div 2;
  imgOut.Height := pnImg.Height div 2;
end;

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
  bExcelSaving := false;

  if nApt = 1 then
  begin
    tdg1.Columns[12].Header := '??';
    tdg1.Columns[13].Header := '??';
  end;
end;

procedure TfrmIOSData.imgInDblClick(Sender: TObject);
var
 sTemp,sInfile: aString;
begin
  pnIOSDataIn.Visible := True;
  try
    ExceptLogging('File: ' + sLInfile);
    edtIOSDataInCar.Text := sLInCarNo;
    if FileExists(sLInfile) then
    begin
      imgIOSDataIn.Picture.LoadFromFile(sLInfile);
    end
    else
    begin
      imgIOSDataIn.Picture.Assign(Nil);
      ExceptLogging('File ????: ' + sLInfile);
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmIOSData.imgOutDblClick(Sender: TObject);
var
 sTemp,sOutfile: aString;
begin
  pnIOSDataOut.Visible := True;
  try
    sOutfile := sLOutFile;
    ExceptLogging('File: ' + sLOutFile);
    edtIOSDataOutCar.Text := sLOutCarNo;
    if FileExists(sLOutFile) then
    begin
      imgIOSDataOut.Picture.LoadFromFile(sLOutFile);
    end
    else
    begin
      imgIOSDataOut.Picture.Assign(Nil);
      ExceptLogging('File ????: ' + sLOutFile);
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmIOSData.pnIOSDataOutClick(Sender: TObject);
begin
    pnIOSDataOut.Visible := false;
end;

procedure TfrmIOSData.btnCloseClick(Sender: TObject);
begin
  qryIOSData.Close;
  qryIOStatus.Close;
  ModalResult := mrCancel;
  //Close;
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

      if cmbType.ItemIndex = 0 then
      begin
        SQL.Add('Select * from IOSData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
        SQL.Add('ProcTime >= :N3 and ProcTime <= :N4) and TKType = :N5 ');
      end
      else
      if cmbType.ItemIndex = 1 then
      begin
        SQL.Add('Select * from IOSData where (OutDate >= :N1 and OutDate <= :N2 and ');
        SQL.Add('OutTime >= :N3 and OutTime <= :N4) and TKType = :N5 ');
      end;

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N6 ');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N6').Value:= nGroupNo;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      if cmbType.ItemIndex = 0 then
      begin
        SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
      end
      else
      if cmbType.ItemIndex = 1 then
      begin
        SQL.Add(' Order By UnitNo, OutDate, OutTime');
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

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4) and TKType = :N5 ');
      SQL.Add('and OutIOStatusNo = 2 and (ProcTime = OutTime) ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N6 ');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N6').Value:= nGroupNo;

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
      SQL.Add('Select * from IOSData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4 and TKType = :N5) ');
      SQL.Add('and OutIOStatusNo = 2 ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N6 ');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N6').Value:= nGroupNo;

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
      SQL.Add('Select * from IOSData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4) and TKType = :N5 ');
      SQL.Add('and InIOStatusNo = 1 and (UnitNo <> OutUnitNo) ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N6 ');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N6').Value:= nGroupNo;

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
      SQL.Add('Select * from IOSData where (ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4 and TKType = :N5) ');
      SQL.Add('and InIOStatusNo = 1 and OutIOStatusNo = 0 ');

      if cmbGroupName.ItemIndex > 0 then
        SQL.Add('and GroupNo = :N6 ');

      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 2;

      if cmbGroupName.ItemIndex > 0 then
        Parameters.ParamByName('N6').Value:= nGroupNo;

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
    if not bExcelSaving then
    begin
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

            try
              sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
              sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
              sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
              sInFile:= MG_StrConvert(sInFile, '/', '\');
              ExceptLogging('File: ' + sInFile);

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
              imgOut.Picture.Assign(Nil);

              try
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
    if bIMageUse = 1 then
    begin
      if not bExcelSaving then
      begin
        sLInfile := '';
        sLOutFile := '';
        sLInCarNo :='';
        sLOutCarNo :='';
        sb1.SimpleText:= '';

        tdg1.DataSource.DataSet.RecNo := tdg1.Row;
  //      ShowMessage(tdg1.DataSource.DataSet.FieldByName('TkNo').AsString);

        //with qryIOSData do
        //begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from IOSData where ProcDate = :N1 and ProcTime = :N2 ');
          Parameters.ParamByName('N1').Value:= tdg1.Cells[2, tdg1.Row];
          Parameters.ParamByName('N2').Value:= tdg1.Cells[3, tdg1.Row];
          Open;

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
            sLInfile := sInFile;
            sLInCarNo :=  sInCarNo;
            sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
                   Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

            if not DirectoryExists(sDir) then
            begin
              if not ForceDirectories(sDir) then
                ExceptLogging('?????????????? ????????: ' + sDir);
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
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1Click: ' + E.Message);
  end;
end;

procedure TfrmIOSData.btnExcelClick(Sender: TObject);
begin
  //mzExcelExport(tdg1,tdg1.ColCount-1);
  try
    bExcelSaving := True;

    if savedialog1.Execute then
    begin
      tdg1.PageMode := false;      //??????
//      advgridexcelio1.Options.ExportCellFormats := True;
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;

    bExcelSaving := False;

  except
    on E: Exception do ExceptLogging('TfrmIOSData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmIOSData.btnIOSInOKClick(Sender: TObject);
begin
    pnIOSDataIn.Visible := false;
end;

procedure TfrmIOSData.btnIOSOutOKClick(Sender: TObject);
begin
  pnIOSDataOut.Visible := False;
end;

end.
