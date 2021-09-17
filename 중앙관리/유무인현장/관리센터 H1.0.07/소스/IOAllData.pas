unit IOAllData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, StdCtrls, Grids, ExtCtrls, BaseGrid,
  AdvGrid, DBAdvGrid, AdvToolBtn, AdvDateTimePicker, AdvPanel, AdvAppStyler,
  Buttons, tmsAdvGridExcel, AdvObj, sButton, sLabel, sPanel, JPEG, Comobj,
  Vcl.DBGrids, ClipBrd;

type
  TfrmIOAllData = class(TForm)
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
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    tdg1: TDBAdvGrid;
    qryIOAll: TADOQuery;
    qryIOAllInUnitName: TStringField;
    qryIOAllProcDate: TStringField;
    qryIOAllProcTime: TStringField;
    qryIOAllGroupName: TStringField;
    qryIOAllname: TStringField;
    qryIOAllInCarNo1: TStringField;
    qryIOAllOutUnitName: TStringField;
    qryIOAllOutDate: TStringField;
    qryIOAllOutTime: TStringField;
    qryIOAllOutCarNo1: TStringField;
    qryIOAllCompName: TStringField;
    qryIOAllCarType2: TStringField;
    qryIOAllInImage1: TStringField;
    qryIOAllOutImage1: TStringField;
    dsIOAll: TDataSource;
    qryIOAllDeptName: TStringField;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tdg2GetRecordCount(Sender: TObject; var Count: Integer);
    procedure tdg2Click(Sender: TObject);
    procedure tdg2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure cmbGroupNameChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure imgInDblClick(Sender: TObject);
    procedure imgOutDblClick(Sender: TObject);
    procedure btnIOSInOKClick(Sender: TObject);
    procedure pnIOSDataOutClick(Sender: TObject);
    procedure btnIOSOutOKClick(Sender: TObject);
    procedure tdg1CanSort(Sender: TObject; ACol: Integer; var DoSort: Boolean);
    procedure tdg1Click(Sender: TObject);
    procedure tdg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure znSave_DBGridToExcel(vDBGrid: TDBGrid);//엑셀 변환
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOAllData: TfrmIOAllData;
  nGroupNo, nDelGroupNo: Integer;
  bExcelSaving : Boolean = False;
  sLInfile,sLOutFile, sLInCarNo ,sLOutCarNo  : string;


implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIOAllData.FormResize(Sender: TObject);
begin
  pnImg.Width := Panel1.Width div 6;
  imgIn.Width := Panel1.Width div 6;
  imgOut.Width := Panel1.Width div 6;
  imgIn.Height := pnImg.Height div 2;
  imgOut.Top := pnImg.Height div 2;
  imgOut.Height := pnImg.Height div 2;
end;

procedure TfrmIOAllData.FormShow(Sender: TObject);
begin
  cmbGroupName.Items.Clear;
  cmbGroupName.Items.Add('전체');

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
    tdg1.Columns[12].Header := '동';
    tdg1.Columns[13].Header := '호';
  end;
end;

procedure TfrmIOAllData.imgInDblClick(Sender: TObject);
var
 sTemp,sInfile: aString;
begin
  pnIOSDataIn.Visible := True;
  try
    ExceptLogging('File: ' + sLInfile);
    edtIOSDataInCar.Text := tdg1.cells[6, tdg1.row];//sLInCarNo;
    sLInfile := tdg1.cells[14, tdg1.row];
    if FileExists(sLInfile) then
    begin
      imgIOSDataIn.Picture.LoadFromFile(sLInfile);
    end
    else
    begin
      imgIOSDataIn.Picture.Assign(Nil);
      ExceptLogging('File 없음: ' + sLInfile);
    end;

    edtIOSDataInCar.SetFocus;
    edtIOSDataInCar.SelectAll;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmIOAllData.imgOutDblClick(Sender: TObject);
var
 sTemp,sOutfile: aString;
begin
  pnIOSDataOut.Visible := True;
  try
    sOutfile := sLOutFile;
    ExceptLogging('File: ' + sLOutFile);
    //edtIOSDataOutCar.Text := sLOutCarNo;
    edtIOSDataOutCar.Text := tdg1.cells[6, tdg1.row];//sLInCarNo;
    sLOutFile := tdg1.cells[15, tdg1.row];
    if FileExists(sLOutFile) then
    begin
      imgIOSDataOut.Picture.LoadFromFile(sLOutFile);
    end
    else
    begin
      imgIOSDataOut.Picture.Assign(Nil);
      ExceptLogging('File 없음: ' + sLOutFile);
    end;

    edtIOSDataOutCar.SetFocus;
    edtIOSDataOutCar.SelectAll;
  except
    on E: Exception do ExceptLogging('TfrmIONData_imgInDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmIOAllData.pnIOSDataOutClick(Sender: TObject);
begin
    pnIOSDataOut.Visible := false;
end;

procedure TfrmIOAllData.btnCloseClick(Sender: TObject);
begin
  qryIOSData.Close;
  qryIOStatus.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmIOAllData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nSIn, nSMiIn, nSOut, nSMi ,i: Integer;
  nNIn, nNOut, nMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    {with qryIOSData do
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
    end; }

    //tdg1.Clear;
    //tdg1.DataSource := DataSource1;
//
    //with ADOQuery1 do
    with qryIOAll do
    begin
       //DisableControls;
       Close;
       SQL.Clear;
       SQL.Add('	   select InUnitName, ProcDate, ProcTime, GroupName, name,  InCarNo1, OutUnitName, OutDate, OutTime,  OutCarNo1, CompName, DeptName, CarType2, InImage1, OutImage1   from (  ');
       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, a.GroupName, a.name,                                                                      ');
       SQL.Add('         a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, OutCarNo1,                                                                   ');
       SQL.Add('	  a.CompName, a.DeptName, ''정기차량''  as CarType2, InImage1, OutImage1                                                                         ');
       SQL.Add('  from IOSData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo                                                                                ');
       SQL.Add('                 Left outer join UnitInfo c ON a.outUnitNo = c.UnitNo                                                                              ');
       SQL.Add('  where (ProcDate >= :N1 and ProcDate <=  :N2 and                                                                                                  ');
       SQL.Add('  ProcTime >= :N3 and ProcTime <= :N4) and TKType = 2                                                                                              ');
       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;
       SQL.Add('  union                                                                                                                                            ');
       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, '''', '''',                                                                               ');
       SQL.Add('       a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, OutCarNo1,                                                                     ');
       SQL.Add('	  a.Reserve2, a.Reserve3, ''일반차량'' as CarType2, InImage1, OutImage1                                                                          ');
       SQL.Add('  from IONData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo                                                                                ');
       SQL.Add('                 Left outer join UnitInfo c ON a.outUnitNo = c.UnitNo                                                                              ');
       SQL.Add('  where (ProcDate >= :N5 and ProcDate <= :N6 and                                                                                                   ');
       SQL.Add('  ProcTime >= :N7 and ProcTime <=  :N8)                                                                                                            ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;

       SQL.Add(')IOS_N                                                                                                                                             ');
       SQL.Add('order by procdate desc, procTime desc                                                                                                              ');

       Parameters.ParamByName('N1').Value:= sSDate;
       Parameters.ParamByName('N2').Value:= sEDate;
       Parameters.ParamByName('N3').Value:= sSTime;
       Parameters.ParamByName('N4').Value:= sETime;

       Parameters.ParamByName('N5').Value:= sSDate;
       Parameters.ParamByName('N6').Value:= sEDate;
       Parameters.ParamByName('N7').Value:= sSTime;
       Parameters.ParamByName('N8').Value:= sETime;
       Open;
       {Close;
       SQL.Clear;
       SQL.Add('select InUnitName, ProcDate, ProcTime, InIONmae, GroupName, name,  InCarNo1, OutUnitName, OutDate, OutTime, IOStatusName, CompName, DeptName, CarType2 from ( ');
       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, d.IOStatusName as InIONmae, a.GroupName, a.name, ');
       SQL.Add('  a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, e.IOStatusName, a.CompName, a.DeptName, ''정기차량''  as CarType2  ');
       SQL.Add('from IOSData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo   ');
       SQL.Add('               Inner Merge join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('       Inner Merge join IOStatus d ON a.InIOStatusNo = d.IOStatusNo  ');
       SQL.Add('       Inner Merge join IOStatus e ON a.OutIOStatusNo = e.IOStatusNo ');
       SQL.Add('where (ProcDate >= :N1 and ProcDate <= :N2 and ');
       SQL.Add('  ProcTime >= :N3 and ProcTime <= :N4) and TKType = :N5  ');
       SQL.Add('  and OutIOStatusNo = 2 and (ProcTime = OutTime)    ');

       if cmbGroupName.ItemIndex > 0 then
          SQL.Add('and GroupNo = :N6 ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;

       SQL.Add('union                                               ');
       SQL.Add('Select  b.UnitName as InUnitName, a.ProcDate, a.ProcTime, '''' as InIONmae, '''', '''', a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, '''', a.Reserve2, a.Reserve3, ''일반차량'' as CarType2 ');
       SQL.Add('from IONData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo ');
       SQL.Add('             Inner Merge join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('where (ProcDate >= :N7 and ProcDate <= :N8 and ');
       SQL.Add('ProcTime >= :N9 and ProcTime <= :N10)   ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;
       SQL.Add(')IOS_N');
       Parameters.ParamByName('N1').Value:= sSDate;
       Parameters.ParamByName('N2').Value:= sEDate;
       Parameters.ParamByName('N3').Value:= sSTime;
       Parameters.ParamByName('N4').Value:= sETime;
       Parameters.ParamByName('N5').Value:= 2;

       Parameters.ParamByName('N7').Value:= sSDate;
       Parameters.ParamByName('N8').Value:= sEDate;
       Parameters.ParamByName('N9').Value:= sSTime;
       Parameters.ParamByName('N10').Value:= sETime;

       if cmbGroupName.ItemIndex > 0 then
          Parameters.ParamByName('N6').Value:= nGroupNo;

       if cmbType.ItemIndex = 0 then
       begin
          //SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
          SQL.Add(' Order By ProcDate, ProcTime');
       end
       else
       if cmbType.ItemIndex = 1 then
       begin
          //SQL.Add(' Order By UnitNo, OutDate, OutTime');
          SQL.Add(' Order By OutDate, OutTime ');
       end; }


       {if eof then
       begin
         ShowMessage('데이터가 없습니다.');
         Exit;
       end;

       i := 1;
       while not eof do
       begin
         with tdg1 do
         begin

            Cells[1, 0]  := '입차기기';
            Cells[2, 0] := '입차일자';
            Cells[3, 0] := '입차시각';
            Cells[4, 0] := '그룹명';
            Cells[5, 0] := '성명';
            Cells[6, 0] := '차량번호';
            Cells[7, 0] := '출차기기';
            Cells[8, 0] := '출차일자';
            Cells[9, 0] := '출차시각';
            Cells[10, 0] := '차량번호';
            Cells[11, 0] := '회사명';
            Cells[12, 0] := '부서명';
            Cells[13, 0] := '차량구분';

            Cells[1, i] := FieldByName('InUnitName').AsString;
            Cells[2, i] := FieldByName('ProcDate').AsString;
            Cells[3, i] := FieldByName('ProcTime').AsString;
            Cells[4, i] := FieldByName('GroupName').AsString;
            Cells[5, i] := FieldByName('Name').AsString;
            Cells[6, i] := FieldByName('InCarNo1').AsString;
            Cells[7, i] := FieldByName('OutUnitName').AsString;
            Cells[8, i] := FieldByName('OutDate').AsString;
            Cells[9, i] := FieldByName('OutTime').AsString;
            Cells[10, i] := FieldByName('OutCarNo1').AsString;
            Cells[11, i] := FieldByName('CompName').AsString;
            Cells[12, i] := FieldByName('DeptName').AsString;
            Cells[13, i] := FieldByName('CarType2').AsString;
            Cells[14, i] := FieldByName('InImage1').AsString;
            Cells[15, i] := FieldByName('OutImage1').AsString;
         end;
         inc(i);
         Next;
       end;

       with tdg1 do
       begin
          ColCount := 16;
          RowCount := i;
          btnPrint.Enabled:= True;
          btnExcel.Enabled:= True;
       end;}
       if RecordCount > 0 then
       begin
          btnPrint.Enabled:= True;
          btnExcel.Enabled:= True;
       end;
      //EnableControls;
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
      SQL.Add('Select Count(*) nOut from IONData where ProcDate >= :N1 and ');
      SQL.Add('ProcDate <= :N2 and (TKType = :N3 or TKType = :N6) and Status = :N4 and OutChk > :N5 ');

      //미출차정리된 리스트를 뺀다...
      SQL.Add('and OutUnitNo <> 0');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= 0;
      Parameters.ParamByName('N6').Value:= 9;
      Open;

      nNOut := FieldByName('nOut').AsInteger;
      nSOut:= nSOut + nNOut;

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
      SQL.Add('Select Count(*) nIn from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('(TKType = :N3 or TKType = :N5) and Status = :N4 ');

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
        SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
      end;

      //SQL.Add('and (UnitNo <> 1 and UnitNo <> 2)');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= 1;
      Parameters.ParamByName('N4').Value:= 1;
      Parameters.ParamByName('N5').Value:= 9;
      Open;

      nNIn := FieldByName('nIn').AsInteger;
      nSIn:= nSIn + nNIn;

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

      nMi:= nNIn - nNOut; //일반차량 미출차

      nSMi:= nSMi + nMi;  //총 미출차

      edtTotal.Caption:= '  총입차: ' + IntToStr(nSIn) + '건   ' +  //'  총입차: ' + IntToStr(nSIn-nSMiIn) + '건   ' +
                         '총출차: ' + IntToStr(nSOut) + '건   ' +
                         '미출차: ' + IntToStr(nSMi) + '건';
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOSData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIOAllData.cmbGroupNameChange(Sender: TObject);
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

procedure TfrmIOAllData.tdg2GetRecordCount(Sender: TObject;
  var Count: Integer);
begin
  Count:= qryIOSData.RecordCount;
end;

procedure TfrmIOAllData.tdg2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  {try
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
                ExceptLogging('File 없음: ' + sInFile);
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
                  ExceptLogging('File 없음: ' + sOutFile);
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
  end;}
end;

procedure TfrmIOAllData.znSave_DBGridToExcel(vDBGrid: TDBGrid);
var
  excelApp, // excel application
  WorkBook, // excel workbook
  WorkSheet : Variant ; // excel sheet in workbook
  SaveDialog : TSaveDialog ;
  XL: Variant;
  i,k: integer;
  sData: string;
  Format : OleVariant;
begin
  // Initialize
  excelApp := Unassigned ;
  SaveDialog := nil ;

  try

    // Create save dialog and set it options
    SaveDialog := TSaveDialog.Create(vDBGrid.Parent) ;
    with SaveDialog do
    begin
      Title := '저장할 Excel 파일명을 입력하세요.';
      Filter := 'Excel files (*.xlsx)|*.xlsx';
      DefaultExt := 'xlsx';
      Options := [ofOverwritePrompt, ofPathMustExist, ofNoReadOnlyReturn, ofHideReadOnly];
    end ;

    // Execute save dialog
    if SaveDialog.Execute then
    begin

      // Delete entered filename if it exists
      If FileExists(SaveDialog.FileName) then
        DeleteFile(SaveDialog.FileName) ;

      // Create instance of excel
      try
        excelApp := CreateOLEObject('excel.Application') ;
      except
        MessageDLG('엑셀프로그램 실행시 오류 발생',mtError,[mbOK],0) ;
        Raise ;
      end ;

      excelApp.Visible := false ;
      excelApp.WorkBooks.Add ;
      WorkBook := excelApp.ActiveWorkBook ;

      try
        sData := '';

        for i := 0 to vDBGrid.Columns.Count - 1 do
        begin

          sData := sData+vDBGrid.Columns[i].Title.Caption+#9;
          //if vDBGrid.Columns[i].Field.DataType in [ftString,ftMemo,ftWideString] then
          //begin
            excelApp.Workbooks[excelApp.Workbooks.Count].WorkSheets['Sheet1'].Columns[i+1].Select;
            excelApp.Selection.NumberFormatLocal := '@';
          //end;
        end;
        sData := sData+#$D#$A;

        with vDBGrid do
        begin
          k := 0;
          DataSource.DataSet.First;
          while not DataSource.DataSet.Eof do
          begin
            inc(k);
            for i := 0 to Columns.Count - 1 do
              sData := sData+Columns[i].Field.AsString+#9;
            sData := sData+#$D#$A;
            DataSource.DataSet.Next;
          end;
        end;

        Clipboard.SetTextBuf(PChar(sData));
        excelApp.Cells[1,1].Pastespecial;
        excelApp.Selection.Columns.AutoFit;
        excelApp.Range['A1', 'A1'].select;

      except on E: Exception do
        begin
          ShowMessage('Excel로 자료를 보내는 중 오류가 발생했습니다.'+E.Message);
          Exit;
        end;
      end;

      // Save excel spreadsheet
      WorkBook.SaveAs(SaveDialog.FileName) ;
      WorkBook.Close ;  // excel 메모리 해제

      // Status user
      ShowMessage('엑셀파일을 정상적으로 저장 하였습니다. '+SaveDialog.FileName) ;
    end;
    // 저장파일 실행
    //ShellExecute(Handle, PChar('OPEN'), PChar(SaveDialog.FileName), Nil, Nil, SW_SHOWMAXIMIZED);
    // Free save dialog
    SaveDialog.Free;

  except on E:Exception do // Exceptions
    begin
      // If excel was started, quit it.
      if (excelApp <> Unassigned) then
        excelApp.Quit ;

      if SaveDialog <> nil then
        SaveDialog.Free ;

      // Status user
      MessageDLG('엑셀저장시 오류 발생: '+E.Message, mtError,[mbOK],0) ;

      // Reraise exception
      raise;
    end;
  end; {try}
end;

procedure TfrmIOAllData.tdg1CanSort(Sender: TObject; ACol: Integer;
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

    sb1.SimpleText:= '조회 : ' + IntToStr(RecordCount) + '건';
  end;
  tdg1.SortSettings.Column:= ACol;
end;

procedure TfrmIOAllData.tdg1Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
  sSDate, sEDate, sSTime, sETime : aString;
  //JPG : TJPEGImage;
  //mStream: TMemoryStream;
begin

  try
     if FileExists(tdg1.Cells[14,tdg1.row]) then
     begin
        imgIn.Picture.LoadFromFile(tdg1.Cells[14,tdg1.row]);
     end
     else
     begin
        imgIn.Picture.Assign(Nil);
        ExceptLogging('입차 File 없음: ' + tdg1.Cells[14,tdg1.row]);
     end;

     if FileExists(tdg1.Cells[15,tdg1.row]) then
     begin
        imgOut.Picture.LoadFromFile(tdg1.Cells[15,tdg1.row]);
     end
     else
     begin
        imgOut.Picture.Assign(Nil);
        ExceptLogging('출차 File 없음: ' + tdg1.Cells[15,tdg1.row]);
     end;

    //mStream:= TMemoryStream.Create;
    //jpg := TJPEGImage.Create;

    {with ADOQuery1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('Select  TKNO, InCarNo1, InCarNo2, InRecog1, InRecog2, OutRecog1, OutRecog2, InImage1, InImage2, OutUnitNo, OutImage1, OutImage2, UnitNo, OutIOStatusNo, OUtCarNo1');
       SQL.Add('from IOSData  ');
       SQL.Add('where (ProcDate = :N1  and ');
       SQL.Add('  ProcTime = :N3 ) and TKType = :N5  ');
       SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ') or ');
       SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ')) ');
       SQL.Add('union                                               ');
       SQL.Add('Select TKNO, InCarNo1, InCarNo2, InRecog1, InRecog2, OutRecog1, OutRecog2, InImage1, InImage2, OutUnitNo, OutImage1, OutImage2, UnitNo, '''', OUtCarNo1 ');
       SQL.Add('from IONData ');
       SQL.Add('where (ProcDate = :N7  and ');
       SQL.Add('ProcTime = :N9)   ');
       SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ') or ');
       SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ')) ');


       Parameters.ParamByName('N1').Value:= tdg1.Cells[2,tdg1.row];
       Parameters.ParamByName('N3').Value:= tdg1.Cells[3,tdg1.row];
       Parameters.ParamByName('N5').Value:= 2;

       Parameters.ParamByName('N7').Value:= tdg1.Cells[2,tdg1.row];
       Parameters.ParamByName('N9').Value:= tdg1.Cells[3,tdg1.row];

       Open;

       if RecordCount > 0 then
       begin
          nLPRRecog1:= FieldByName('InRecog1').AsInteger;
          nLPRRecog2:= FieldByName('InRecog2').AsInteger;
          nOutRecog1:= FieldByName('OutRecog1').AsInteger;
          nOutRecog2:= FieldByName('OutRecog2').AsInteger;

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
              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
          end;

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
              sLInfile := sInFile;
              sLInCarNo :=  sInCarNo;
              if FileExists(sInFile) then
              begin
//                mStream.LoadFromFile(sInFile);
//                jpg.LoadFromStream(mStream);
//                jpg.Scale := jsQuarter;
//                imgIn.Picture.Bitmap.Assign(jpg);
                imgIn.Picture.LoadFromFile(sInFile);
              end
              else
              begin
                imgIn.Picture.Assign(Nil);
                ExceptLogging('입차 File 없음: ' + sInFile);
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
                ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
            end;

            ExceptLogging('정기차량 출차 파일 확인1 File: ' + sOutFile);
  //          sLOutFile :=  sOutFile;
  //          sLOutCarNo := FieldByName('OutCarNo1').AsString;
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
                sLOutFile :=  sOutFile;
                sLOutCarNo := FieldByName('OutCarNo1').AsString;

                if FileExists(sOutFile) then
                begin
//                  mStream.LoadFromFile(sOutFile);
//                  jpg.LoadFromStream(mStream);
//                  jpg.Scale := jsQuarter;
//                  imgOut.Picture.Bitmap.Assign(jpg);
                  imgOut.Picture.LoadFromFile(sOutFile);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('출차 File 없음: ' + sOutFile);
                end;
              except
                on E: Exception do ExceptLogging('TfrmIOSData_OutImageLoad: ' + aString(E.Message));
              end;
            end;
          end
          else
            imgOut.Picture.Assign(Nil);
       end;
    end; }

  except
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1Click: ' + E.Message);
  end;
end;

procedure TfrmIOAllData.tdg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
begin
  {try
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
                ExceptLogging('File 없음: ' + sInFile);
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
                  ExceptLogging('File 없음: ' + sOutFile);
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
  end;}
end;

procedure TfrmIOAllData.tdg2Click(Sender: TObject);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sOutLocalFile, sTime, sDir, sOutDir, sOutFile, sOutTime, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, nOutUnitNo, i, nLPRRecog1, nLPRRecog2, nOutRecog1, nOutRecog2: Word;
  sSDate, sEDate, sSTime, sETime : aString;
begin

  try
    with ADOQuery1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, d.IOStatusName, a.GroupName, a.name, ');
       SQL.Add('  a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, e.IOStatusName, a.CompName, a.DeptName, ''정기차량''  as CarType2,  ');
       SQL.Add('  a.InRecog1, a.InRecog2, a.OutRecog1, a.OutRecog2, a.InImage1, a.InImage2, a.OutUnitNo, a.OutImage1, a.OutImage2, a.UnitNo, a.TKNO, a.OutIOStatusNo, a.OUtCarNo1');
       SQL.Add('from IOSData a left join UnitInfo b ON a.UnitNo = b.UnitNo   ');
       SQL.Add('               left join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('       left join IOStatus d ON a.InIOStatusNo = d.IOStatusNo  ');
       SQL.Add('       left join IOStatus e ON a.OutIOStatusNo = e.IOStatusNo ');
       SQL.Add('where (ProcDate = :N1  and ');
       SQL.Add('  ProcTime = :N3 ) and TKType = :N5  ');
       SQL.Add('  and OutIOStatusNo = 2 and (ProcTime = OutTime)    ');


       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ')) ');
       end;

       SQL.Add('union                                               ');
       SQL.Add('Select  b.UnitName as InUnitName, a.ProcDate, a.ProcTime, '''' as InIONmae, '''', '''', a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, '''', a.Reserve2, a.Reserve3, ''일반차량'' as CarType2, ');
       SQL.Add('        a.InRecog1, a.InRecog2, a.OutRecog1, a.OutRecog2, a.InImage1, a.InImage2, a.OutUnitNo, a.OutImage1, a.OutImage2, a.UnitNo, '''', '''', a.OUtCarNo1 ');
       SQL.Add('from IONData a left join UnitInfo b ON a.UnitNo = b.UnitNo ');
       SQL.Add('             left join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('where (ProcDate = :N7  and ');
       SQL.Add('ProcTime = :N9)   ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + tdg1.Cells[7,tdg1.row] + '%') + ')) ');
       end;

       Parameters.ParamByName('N1').Value:= tdg1.Cells[2,tdg1.row];
       Parameters.ParamByName('N3').Value:= tdg1.Cells[3,tdg1.row];
       Parameters.ParamByName('N5').Value:= 2;

       Parameters.ParamByName('N7').Value:= tdg1.Cells[2,tdg1.row];
       Parameters.ParamByName('N9').Value:= tdg1.Cells[3,tdg1.row];

       Open;

       if RecordCount > 0 then
       begin
          nLPRRecog1:= FieldByName('InRecog1').AsInteger;
          nLPRRecog2:= FieldByName('InRecog2').AsInteger;
          nOutRecog1:= FieldByName('OutRecog1').AsInteger;
          nOutRecog2:= FieldByName('OutRecog2').AsInteger;

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
              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
          end;

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
              sLInfile := sInFile;
              sLInCarNo :=  sInCarNo;
              if FileExists(sInFile) then
              begin
                imgIn.Picture.LoadFromFile(sInFile);
              end
              else
              begin
                imgIn.Picture.Assign(Nil);
                ExceptLogging('입차 File 없음: ' + sInFile);
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
                ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
            end;

            ExceptLogging('정기차량 출차 파일 확인1 File: ' + sOutFile);
  //          sLOutFile :=  sOutFile;
  //          sLOutCarNo := FieldByName('OutCarNo1').AsString;
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
                sLOutFile :=  sOutFile;
                sLOutCarNo := FieldByName('OutCarNo1').AsString;
                if FileExists(sOutFile) then
                begin
                  imgOut.Picture.LoadFromFile(sOutFile);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('출차 File 없음: ' + sOutFile);
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
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1Click: ' + E.Message);
  end;

  {try
    if not bExcelSaving then
    begin
      sLInfile := '';
      sLOutFile := '';
      sLInCarNo :='';
      sLOutCarNo :='';
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
          sLInfile := sInFile;
          sLInCarNo :=  sInCarNo;
          sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
                 Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

          if not DirectoryExists(sDir) then
          begin
            if not ForceDirectories(sDir) then
              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
          end;

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
            sLInfile := sInFile;
            sLInCarNo :=  sInCarNo;
            if FileExists(sInFile) then
            begin
              imgIn.Picture.LoadFromFile(sInFile);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              ExceptLogging('입차 File 없음: ' + sInFile);
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
              ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
          end;

          ExceptLogging('정기차량 출차 파일 확인1 File: ' + sOutFile);
//          sLOutFile :=  sOutFile;
//          sLOutCarNo := FieldByName('OutCarNo1').AsString;
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
              sLOutFile :=  sOutFile;
              sLOutCarNo := FieldByName('OutCarNo1').AsString;
              if FileExists(sOutFile) then
              begin
                imgOut.Picture.LoadFromFile(sOutFile);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('출차 File 없음: ' + sOutFile);
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
  except
    on E: Exception do ExceptLogging('TfrmIOSData.tdg1Click: ' + E.Message);
  end;}
end;

procedure TfrmIOAllData.btnExcelClick(Sender: TObject);
begin
  {try
    bExcelSaving := True;

    if savedialog1.Execute then
    begin
      tdg1.PageMode := false;      //빨라짐
 //     advgridexcelio1.Options.ExportCellFormats := True;
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;

    bExcelSaving := False;

  except
    on E: Exception do ExceptLogging('TfrmIOSData.btnExcelClick: ' + E.Message);
  end;}
  znSave_DBGridToExcel(DBGrid1);
end;
// var
//  ExcelObj : OleVariant;
//  WorkBook : OleVariant;
//  WorkSheet : OleVariant;
//  sSDate, sEDate, sSTime, sETime: String;
//  i : Integer;
//begin
//   sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
//   sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
//   sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
//   sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);
//
//   Try
//      ExcelObj := CreateOLEObject('Excel.Application');
//   Except
//      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
//      Exit;
//   end;
//   ExcelObj.DisplayAlerts := False;
//
//   WorkBook := ExcelObj.Workbooks.Add; //통합문서를 생성합니다.
//   WorkSheet := WorkBook.WorkSheets[1]; //Sheet를 선택합니다.
//   i := 1;
//
//
//   WorkSheet.Cells[1, 1].Value := '입차기기' ;
//   WorkSheet.Cells[1, 2].Value := '입차일자' ;
//   WorkSheet.Cells[1, 3].Value := '입차일자' ;
//   WorkSheet.Cells[1, 4].Value := '그룹명' ;
//   WorkSheet.Cells[1, 5].Value := '성명' ;
//   WorkSheet.Cells[1, 6].Value := '차량번호' ;
//   WorkSheet.Cells[1, 7].Value := '출차기기' ;
//   WorkSheet.Cells[1, 8].Value := '출차일자' ;
//   WorkSheet.Cells[1, 9].Value := '출차시각' ;
//   //WorkSheet.Cells[1, 10].Value := '출차상태' ;
//   WorkSheet.Cells[1, 10].Value := '회사명' ;
//   WorkSheet.Cells[1, 11].Value := '부서명' ;
//   WorkSheet.Cells[1, 12].Value := '차량구분' ;
//
//
//   with qryTemp do
//   begin
//      DisableControls;
//       Close;
//       SQL.Clear;
//       SQL.Add('	   select InUnitName, ProcDate, ProcTime, GroupName, name,  InCarNo1, OutUnitName, OutDate, OutTime,  OutCarNo1, CompName, DeptName, CarType2, InImage1, OutImage1   from (  ');
//       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, a.GroupName, a.name,                                                                      ');
//       SQL.Add('         a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, OutCarNo1,                                                                   ');
//       SQL.Add('	  a.CompName, a.DeptName, ''정기차량''  as CarType2, InImage1, OutImage1                                                                         ');
//       SQL.Add('  from IOSData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo                                                                                ');
//       SQL.Add('                 Left outer join UnitInfo c ON a.outUnitNo = c.UnitNo                                                                              ');
//       SQL.Add('  where (ProcDate >= :N1 and ProcDate <=  :N2 and                                                                                                  ');
//       SQL.Add('  ProcTime >= :N3 and ProcTime <= :N4) and TKType = 2                                                                                              ');
//       if edtCarNo.Text <> '' then
//       begin
//          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
//          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
//       end;
//       SQL.Add('  union                                                                                                                                            ');
//       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, '''', '''',                                                                               ');
//       SQL.Add('       a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, OutCarNo1,                                                                     ');
//       SQL.Add('	  a.Reserve2, a.Reserve3, ''일반차량'' as CarType2, InImage1, OutImage1                                                                          ');
//       SQL.Add('  from IONData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo                                                                                ');
//       SQL.Add('                 Left outer join UnitInfo c ON a.outUnitNo = c.UnitNo                                                                              ');
//       SQL.Add('  where (ProcDate >= :N5 and ProcDate <= :N6 and                                                                                                   ');
//       SQL.Add('  ProcTime >= :N7 and ProcTime <=  :N8)                                                                                                            ');
//
//       if edtCarNo.Text <> '' then
//       begin
//          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
//          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
//       end;
//
//       SQL.Add(')IOS_N                                                                                                                                             ');
//       SQL.Add('order by procdate desc, procTime desc                                                                                                              ');
//
//       Parameters.ParamByName('N1').Value:= sSDate;
//       Parameters.ParamByName('N2').Value:= sEDate;
//       Parameters.ParamByName('N3').Value:= sSTime;
//       Parameters.ParamByName('N4').Value:= sETime;
//
//       Parameters.ParamByName('N5').Value:= sSDate;
//       Parameters.ParamByName('N6').Value:= sEDate;
//       Parameters.ParamByName('N7').Value:= sSTime;
//       Parameters.ParamByName('N8').Value:= sETime;
//       Open;
//
//      while not eof do
//      begin
//         //엑셀에 데이터를 입력합니다.
//         WorkSheet.Cells[i + 1, 1].Value :=    FieldByName('InUnitName').AsString;
//         WorkSheet.Cells[i + 1, 2].Value :=    FieldByName('ProcDate').AsString;
//         WorkSheet.Cells[i + 1, 3].Value :=    FieldByName('ProcTime').AsString;
//         //WorkSheet.Cells[i + 1, 4].Value :=    FieldByName('InIOName').AsString;
//         WorkSheet.Cells[i + 1, 4].Value :=    FieldByName('GroupName').AsString;
//         WorkSheet.Cells[i + 1, 5].Value :=    FieldByName('Name').AsString;
//         WorkSheet.Cells[i + 1, 6].Value :=    FieldByName('InCarNo1').AsString;
//         WorkSheet.Cells[i + 1, 7].Value :=    FieldByName('OutUnitName').AsString;
//         WorkSheet.Cells[i + 1, 8].Value :=    FieldByName('OutDate').AsString;
//         WorkSheet.Cells[i + 1, 9].Value :=    FieldByName('OutTime').AsString;
//         //WorkSheet.Cells[i + 1, 10].Value :=    FieldByName('IOStatusName').AsString;
//         WorkSheet.Cells[i + 1, 10].Value :=    FieldByName('CompName').AsString;
//         WorkSheet.Cells[i + 1, 11].Value :=    FieldByName('DeptName').AsString;
//         WorkSheet.Cells[i + 1, 12].Value :=    FieldByName('CarType2').AsString;
//
//       inc(i);
//       NExt;
//      end;
//      EnableControls;
//   end;
//
//   WorkSheet.Cells.Columns.AutoFit;
//
//   if SaveDialog1.Execute then
//   begin
//      WorkSheet.SaveAs(SaveDialog1.FileName+'.xls', 1, '', '', False, False);
//      showmessage('엑셀 저장 완료');
//   end;
//
//  ExcelObj.Quit; //종료
//  WorkSheet := unAssigned;
//  WorkBook := unAssigned;
//  ExcelObj := unAssigned;
//end;


{var
  //XL, XArr: Variant;
  i, j: Integer;
  Format : OleVariant;
  sSDate, sEDate, sSTime, sETime: String;

  k:Integer;
  xl,xlbook:variant;
  si,li_cnt:Integer; //
  sFilename:string;
  CarNo, PatrolCode, InCarNo1 : string;
  sCDate, sCDateS, sCDateE: String;
begin
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    Try
      xl := Createoleobject('excel.application');
    Except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
    end;

    sFilename:= 'Sheet1';
    XLBook := XL.WorkBooks.Add; // 새로운 페이지 생성
    XLBook.WorkSheets[1].Name := sFilename;


    XLBook.WorkSheets[sFilename].Range['A'+IntToStr(1)].Value := '입차기기' ;
    XLBook.WorkSheets[sFileName].Range['A'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['B'+IntToStr(1)].Value := '입차일자' ;
    XLBook.WorkSheets[sFileName].Range['B'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['C'+IntToStr(1)].Value := '입차일자' ;
    XLBook.WorkSheets[sFileName].Range['C'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['d'+IntToStr(1)].Value := '입차상태' ;
    XLBook.WorkSheets[sFileName].Range['d'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['e'+IntToStr(1)].Value := '그룹명' ;
    XLBook.WorkSheets[sFileName].Range['e'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['f'+IntToStr(1)].Value := '성명' ;
    XLBook.WorkSheets[sFileName].Range['f'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['g'+IntToStr(1)].Value := '차량번호' ;
    XLBook.WorkSheets[sFileName].Range['g'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['h'+IntToStr(1)].Value := '출차기기' ;
    XLBook.WorkSheets[sFileName].Range['h'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['i'+IntToStr(1)].Value := '출차일자' ;
    XLBook.WorkSheets[sFileName].Range['i'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['j'+IntToStr(1)].Value := '출차시각' ;
    XLBook.WorkSheets[sFileName].Range['j'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['k'+IntToStr(1)].Value := '출차상태' ;
    XLBook.WorkSheets[sFileName].Range['k'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['l'+IntToStr(1)].Value := '회사명' ;
    XLBook.WorkSheets[sFileName].Range['l'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['m'+IntToStr(1)].Value := '부서명' ;
    XLBook.WorkSheets[sFileName].Range['m'+IntToStr(1)].HorizontalAlignment := '3' ;
    XLBook.WorkSheets[sFileName].Range['n'+IntToStr(1)].Value := '차량구분' ;
    XLBook.WorkSheets[sFileName].Range['n'+IntToStr(1)].HorizontalAlignment := '3' ;

  try
   with ADOQuery1 do
    begin
       Close;
       SQL.Clear;
       SQL.Add('select InUnitName, ProcDate, ProcTime, InIONmae, GroupName, name,  InCarNo1, OutUnitName, OutDate, OutTime, IOStatusName, CompName, DeptName, CarType2 from ( ');
       SQL.Add('Select b.UnitName as InUnitName, a.ProcDate, a.ProcTime, d.IOStatusName as InIONmae, a.GroupName, a.name, ');
       SQL.Add('  a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, e.IOStatusName, a.CompName, a.DeptName, ''정기차량''  as CarType2  ');
       SQL.Add('from IOSData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo   ');
       SQL.Add('               Inner Merge join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('       Inner Merge join IOStatus d ON a.InIOStatusNo = d.IOStatusNo  ');
       SQL.Add('       Inner Merge join IOStatus e ON a.OutIOStatusNo = e.IOStatusNo ');
       SQL.Add('where (ProcDate >= :N1 and ProcDate <= :N2 and ');
       SQL.Add('  ProcTime >= :N3 and ProcTime <= :N4) and TKType = :N5  ');
       SQL.Add('  and OutIOStatusNo = 2 and (ProcTime = OutTime)    ');

       if cmbGroupName.ItemIndex > 0 then
          SQL.Add('and GroupNo = :N6 ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;

       SQL.Add('union                                               ');
       SQL.Add('Select  b.UnitName as InUnitName, a.ProcDate, a.ProcTime, '''' as InIONmae, '''', '''', a.InCarNo1, c.UnitName as OutUnitName, a.OutDate, a.OutTime, '''', a.Reserve2, a.Reserve3, ''일반차량'' as CarType2 ');
       SQL.Add('from IONData a Inner Merge join UnitInfo b ON a.UnitNo = b.UnitNo ');
       SQL.Add('             Inner Merge join UnitInfo c ON a.outUnitNo = c.UnitNo ');
       SQL.Add('where (ProcDate >= :N7 and ProcDate <= :N8 and ');
       SQL.Add('ProcTime >= :N9 and ProcTime <= :N10)   ');

       if edtCarNo.Text <> '' then
       begin
          SQL.Add(' and ((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ') or ');
          SQL.Add(' (InCarNo2 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') + ')) ');
       end;
       SQL.Add(')IOS_N');
       Parameters.ParamByName('N1').Value:= sSDate;
       Parameters.ParamByName('N2').Value:= sEDate;
       Parameters.ParamByName('N3').Value:= sSTime;
       Parameters.ParamByName('N4').Value:= sETime;
       Parameters.ParamByName('N5').Value:= 2;

       Parameters.ParamByName('N7').Value:= sSDate;
       Parameters.ParamByName('N8').Value:= sEDate;
       Parameters.ParamByName('N9').Value:= sSTime;
       Parameters.ParamByName('N10').Value:= sETime;

       if cmbGroupName.ItemIndex > 0 then
          Parameters.ParamByName('N6').Value:= nGroupNo;

       if cmbType.ItemIndex = 0 then
       begin
          //SQL.Add(' Order By UnitNo, ProcDate, ProcTime');
          SQL.Add(' Order By ProcDate, ProcTime');
       end
       else
       if cmbType.ItemIndex = 1 then
       begin
          //SQL.Add(' Order By UnitNo, OutDate, OutTime');
          SQL.Add(' Order By OutDate, OutTime ');
       end;
       Open;

      si:= 2;
      while not eof do
      begin
        XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si)].Value :=
        FieldByName('InUnitName').AsString;

        XLBook.WorkSheets[sFileName].Range['B'+IntToStr(si)].Value :=
        FieldByName('ProcDate').AsString;

        XLBook.WorkSheets[sFileName].Range['c'+IntToStr(si)].Value :=
        FieldByName('ProcTime').AsString;

        XLBook.WorkSheets[sFileName].Range['d'+IntToStr(si)].Value :=
        FieldByName('InIONmae').AsString;

        XLBook.WorkSheets[sFileName].Range['e'+IntToStr(si)].Value :=
        FieldByName('GroupName').AsString;

        XLBook.WorkSheets[sFileName].Range['f'+IntToStr(si)].Value :=
        FieldByName('Name').AsString;

        XLBook.WorkSheets[sFileName].Range['g'+IntToStr(si)].Value :=
        FieldByName('InCarNo1').AsString;

        XLBook.WorkSheets[sFileName].Range['h'+IntToStr(si)].Value :=
        FieldByName('OutUnitName').AsString;

        XLBook.WorkSheets[sFileName].Range['i'+IntToStr(si)].Value :=
        FieldByName('OutDate').AsString;

        XLBook.WorkSheets[sFileName].Range['j'+IntToStr(si)].Value :=
        FieldByName('OutTime').AsString;

        XLBook.WorkSheets[sFileName].Range['k'+IntToStr(si)].Value :=
        FieldByName('IOStatusName').AsString;

        XLBook.WorkSheets[sFileName].Range['l'+IntToStr(si)].Value :=
        FieldByName('CompName').AsString;

        XLBook.WorkSheets[sFileName].Range['m'+IntToStr(si)].Value :=
        FieldByName('DeptName').AsString;

        XLBook.WorkSheets[sFileName].Range['n'+IntToStr(si)].Value :=
        FieldByName('CarType2').AsString;

        Inc(si);
        Next;
      end;
    end;

    //XLBook.WorkSheets[sFilename].Cells.Columns.AutoFit;
    XLBook.WorkSheets[sFilename].Columns.AutoFit;
    //XLBook.WorkSheets[sFilename].Range['A'+IntToStr(8)].Value := '순찰일자 : ' + DateToStr(edtSDate.Date) + ' ' + FormatDateTime('hh:mm', now);
    Sleep(2); // 너무 빨리돌면 컴퓨터 자원을 다잡아 먹어서 잠시 잠재워요 ^^;
    //Excel 영역선택
    XL.Selection.Font.Size := '10';
    XL.Selection.Columns.AutoFit; // Excel 셀 크기 자동조절

    //엑셀을 보이게 한다...
    XL.Visible := False;
    //엑셀 저장 화면
    SaveDialog1.Title := '엑셀 내보내기 화면';
    SaveDialog1.InitialDir := GetCurrentDir;
    SaveDialog1.Filter := 'Excel files (*.xls)|*.xls';
    SaveDialog1.FilterIndex := 1;
    SaveDialog1.DefaultExt := 'xlsx';

    //엑셀 저장 화면
    if SaveDialog1.Execute then
    begin
      XLBook.WorkSheets[sFilename].SaveAs(SaveDialog1.FileName, 51); // or xlOpenXMLWorkbook (51)
      //MessageBoxTimeOut(Application.Handle, '엑셀파일로 저장완료!', '', 0, 0, 5000);
      ShowMessage('엑셀파일로 저장완료!');
      XLBook.Application.Quit;
    end;

  except
    on E: Exception do begin
      ExceptLogging(e.Message);
    end;
  end;
end;  }

procedure TfrmIOAllData.btnIOSInOKClick(Sender: TObject);
begin
    pnIOSDataIn.Visible := false;
end;

procedure TfrmIOAllData.btnIOSOutOKClick(Sender: TObject);
begin
  pnIOSDataOut.Visible := False;
end;

end.
