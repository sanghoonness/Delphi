unit CarNoModify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, DBAdvGrid, DB, ADODB, StdCtrls,
  AdvEdit, ComCtrls, Buttons, AdvDateTimePicker, AdvObj;

type
  TfrmCarNoModify = class(TForm)
    qryIONData: TADOQuery;
    qryIONDataParkNo: TSmallintField;
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
    qryIONDataInRecog: TWordField;
    qryIONDataOutRecog: TWordField;
    qryIONDataInImage2: TStringField;
    qryIONDataInCarNo2: TStringField;
    qryIONDataOutImage2: TStringField;
    qryIONDataOutCarNo2: TStringField;
    qryIONDataInRecog2: TWordField;
    qryIONDataOutRecog2: TWordField;
    qryIONDataInUnitName: TStringField;
    qryIONDataOutUnitName: TStringField;
    dsIONData: TDataSource;
    qryTemp: TADOQuery;
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
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    pnImg: TPanel;
    imgIn: TImage;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label3: TLabel;
    edtDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    btnSave: TBitBtn;
    Panel3: TPanel;
    edtCarNo1: TAdvEdit;
    edtCarNo2: TAdvEdit;
    Panel4: TPanel;
    edtMCarNo: TAdvEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarNoModify: TfrmCarNoModify;
  sInDate, sInTime, sCarNo1, sCarNo2, sFile1, sFile2: AnsiString;
  nUnitNo: Word;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmCarNoModify.btnCloseClick(Sender: TObject);
begin
  qryIONData.Close;
  Close;
end;

procedure TfrmCarNoModify.btnSaveClick(Sender: TObject);
var
  sCardNo, sName, sCompName, sDeptName, sGroupName: String;
  nGroupNo, i: Integer;
begin
  try
    if MG_StrTrim(edtMCarNo.Text, ' ') = '' then
    begin
      ShowMessage('?????????? ??????????????.');
      edtMCarNo.SetFocus;
      Exit;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1 and ');
      SQL.Add('ExpDateF <= :N2 and ExpDateT >= :N3 and TKType = :N4');
      Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
      Parameters.ParamByName('N2').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N4').Value := 2;
      Open;

      if RecordCount > 0 then
      begin
        // ???????? ????
        sCardNo := FieldByName('TKNo').AsString;
        nGroupNo := FieldByName('GroupNo').AsInteger;
        sName := FieldByName('Name').AsString;
        sCompName := FieldByName('CompName').AsString;
        sDeptName := FieldByName('DeptName').AsString;

        Close;
        SQL.Clear;
        SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2 and Reserve1 is null');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nGroupNo;
        Open;

        if RecordCount > 0 then
          sGroupName := FieldByName('GroupName').AsString;

        Close;
        SQL.Clear;
        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
        SQL.Add('where ParkNo = :N6 and TKType = :N7 and TKNo = :N8');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nUnitNo;
        Parameters.ParamByName('N3').Value := sInDate;
        Parameters.ParamByName('N4').Value := sInTime;
        Parameters.ParamByName('N5').Value := 1;
        Parameters.ParamByName('N6').Value := nCurrParkNo;
        Parameters.ParamByName('N7').Value := 2;
        Parameters.ParamByName('N8').Value := sCardNo;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('Select * from IOSData where ParkNo = :N1 and UnitNo = :N2 and ');
        SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nUnitNo;
        Parameters.ParamByName('N3').Value := sInDate;
        Parameters.ParamByName('N4').Value := sInTime;
        Parameters.ParamByName('N5').Value := sCardNo;
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, ');
          SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, InIOStatusNo, ');
          SQL.Add('InImage1, InRecog1, Reserve1, Reserve2) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18)');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nUnitNo;
          Parameters.ParamByName('N3').Value := sInDate;
          Parameters.ParamByName('N4').Value := sInTime;
          Parameters.ParamByName('N5').Value := sCardNo;
          Parameters.ParamByName('N6').Value := 2;
          Parameters.ParamByName('N7').Value := 2;
          Parameters.ParamByName('N8').Value := nGroupNo;
          Parameters.ParamByName('N9').Value := sGroupName;
          Parameters.ParamByName('N10').Value := sCompName;
          Parameters.ParamByName('N11').Value := sDeptName;
          Parameters.ParamByName('N12').Value := sName;
          Parameters.ParamByName('N13').Value := MG_StrTrim(edtMCarNo.Text, ' ');
          Parameters.ParamByName('N14').Value := 1;
          Parameters.ParamByName('N15').Value := sFile1;
          Parameters.ParamByName('N16').Value := 4;
          Parameters.ParamByName('N17').Value := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
          Parameters.ParamByName('N18').Value := IntToStr(nCurrMNo);
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Delete from IONData where ParkNo = :N1 and ProcDate = :N2 and ProcTime = :N3 and ');
        SQL.Add('((InCarNo1 = :N4) or (InCarNo2 = :N5))');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := sInDate;
        Parameters.ParamByName('N3').Value := sInTime;
        Parameters.ParamByName('N4').Value := sCarNo1;
        Parameters.ParamByName('N5').Value := sCarNo2;
        ExecSQL;
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update IONData Set InCarNo1 = :N1, Reserve5 = :N7, Reserve4 = :N8, Reserve3 = :N9, InRecog1 = 1 ');
        SQL.Add('Where ParkNo = :N2 and ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
        Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N2').Value := nCurrParkNo;
        Parameters.ParamByName('N3').Value := sInDate;
        Parameters.ParamByName('N4').Value := sInTime;
        Parameters.ParamByName('N5').Value := sCarNo1;
        Parameters.ParamByName('N7').Value := '????????????';
        Parameters.ParamByName('N8').Value := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        Parameters.ParamByName('N9').Value := IntToStr(nCurrMNo);
        ExecSQL;

        if sCarNo2 <> '' then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update IONData Set InCarNo2 = :N1, Reserve5 = :N7, Reserve4 = :N8, Reserve3 = :N9, InRecog2 = 1 ');
          SQL.Add('Where ParkNo = :N2 and ProcDate = :N3 and ProcTime = :N4 and InCarNo2 = :N5');
          Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
          Parameters.ParamByName('N2').Value := nCurrParkNo;
          Parameters.ParamByName('N3').Value := sInDate;
          Parameters.ParamByName('N4').Value := sInTime;
          Parameters.ParamByName('N5').Value := sCarNo2;
          Parameters.ParamByName('N7').Value := '????????????';
          Parameters.ParamByName('N8').Value := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
          Parameters.ParamByName('N9').Value := IntToStr(nCurrMNo);
          ExecSQL;
        end;
      end;
    end;

    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where OutChk = 0 and ProcDate = :N1 and ((InRecog1 > 1) or (InRecog2 > 1))');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtDate.Date);
      Open;

      if RecordCount > 0 then
      begin
        sb1.SimpleText:= '????????: ' + IntToStr(RecordCount);
      end;
    end;
    edtMCarNo.Text:= '';
    imgIn.Picture.Assign(Nil);
  except
    on E: Exception do ExceptLogging('TfrmCarNoModify.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmCarNoModify.btnSearchClick(Sender: TObject);
begin
  with qryIONData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from IONData where OutChk = 0 and ProcDate = :N1 and ((InRecog1 > 1) or (InRecog2 > 1))');
    Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtDate.Date);
    Open;

    if RecordCount > 0 then
    begin
      sb1.SimpleText:= '????????: ' + IntToStr(RecordCount);
    end;
  end;
end;

procedure TfrmCarNoModify.dg1Click(Sender: TObject);
var
  sTemp, sInFile: aString;
begin
  with qryIONData do
  begin
    if RecordCount > 0 then
    begin
      sInDate:= qryIONData.FieldByName('ProcDate').AsString;
      sInTime:= qryIONData.FieldByName('ProcTime').AsString;
      sCarNo1:= qryIONData.FieldByName('InCarNo1').AsString;
      sCarNo2:= qryIONData.FieldByName('InCarNo2').AsString;
      nUnitNo:= qryIONData.FieldByName('UnitNo').AsInteger;
      sFile1:= qryIONData.FieldByName('InImage1').AsString;
      sFile2:= qryIONData.FieldByName('InImage2').AsString;
      edtCarNo1.Text:= sCarNo1;
      edtCarNo2.Text:= sCarNo2;

      try
        if sFile1 <> '' then
        begin
          sTemp:= Copy(sFile1, 6, Length(sFile1)-5);
          sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
          sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
          sInFile:= MG_StrConvert(sInFile, '/', '\');

          if FileExists(sInFile) then
          begin
            imgIn.Picture.LoadFromFile(sInFile);
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            ExceptLogging('File ????: ' + sInFile);
          end;
        end;
        edtMCarNo.SetFocus;
        btnSave.Enabled:= True;
      except
        on E: Exception do ExceptLogging('TfrmCarNoModify.dg1Click: ' + aString(E.Message));
      end;
    end;
  end;
end;

procedure TfrmCarNoModify.dg1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sTemp, sInFile: aString;
begin
  with qryIONData do
  begin
    if (Key = VK_Up) or (Key = VK_Down) then
    begin
      if RecordCount > 0 then
      begin
        sInDate:= qryIONData.FieldByName('ProcDate').AsString;
        sInTime:= qryIONData.FieldByName('ProcTime').AsString;
        sCarNo1:= qryIONData.FieldByName('InCarNo1').AsString;
        sCarNo2:= qryIONData.FieldByName('InCarNo2').AsString;
        nUnitNo:= qryIONData.FieldByName('UnitNo').AsInteger;
        sFile1:= qryIONData.FieldByName('InImage1').AsString;
        sFile2:= qryIONData.FieldByName('InImage2').AsString;
        edtCarNo1.Text:= sCarNo1;
        edtCarNo2.Text:= sCarNo2;

        try
          if sFile1 <> '' then
          begin
            sTemp:= Copy(sFile1, 6, Length(sFile1)-5);
            sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sInFile:= MG_StrConvert(sInFile, '/', '\');

            if FileExists(sInFile) then
            begin
              imgIn.Picture.LoadFromFile(sInFile);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              ExceptLogging('File ????: ' + sInFile);
            end;
          end;
          edtMCarNo.SetFocus;
          btnSave.Enabled:= True;
        except
          on E: Exception do ExceptLogging('TfrmCarNoModify.dg1KeyUp: ' + aString(E.Message));
        end;
      end;
    end;
  end;
end;

procedure TfrmCarNoModify.FormShow(Sender: TObject);
begin
  edtDate.Date:= Now;
  pnImg.Visible:= True;
  qryUnitInfo.Active:= True;
end;

end.
