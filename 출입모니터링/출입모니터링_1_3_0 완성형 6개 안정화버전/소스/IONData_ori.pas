unit IONData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj, AdvEdit;

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
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    qryIONDataInRecog: TWordField;
    qryIONDataOutRecog: TWordField;
    pnImg: TPanel;
    imgIn: TImage;
    qryIONDataParkNo: TSmallintField;
    qryTemp: TADOQuery;
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
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    edtCarNo: TAdvEdit;
    btnSearch: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryIONDataOutChkGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryIONDataStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dg1Click(Sender: TObject);
    procedure dg1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmIONData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryIONData.Close;
  qryUnitInfo.Close;
  qryTemp.Close;
end;

procedure TfrmIONData.FormShow(Sender: TObject);
var
  sDate : aString;
begin
  // ������ɶ� �ٷ� ��ȸ �ϵ���, �������������ϱ�(����,����)
  try
    sDate := FormatDateTime('YYYY-MM-DD', Now-1);

    // ������ ������ ��ȸ
    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where ProcDate >= :pProcDate ');
      SQL.Add('and (TKType = :pTKType1 or TKType = :pTKType2) ');
      SQL.Add('and OutChk = :pOutChk ');
      SQL.Add('Order By UnitNo, ProcDate desc, ProcTime desc' );
      Parameters.ParamByName('pProcDate').Value:= sDate;
      Parameters.ParamByName('pTKType1').Value:= 1;
      Parameters.ParamByName('pTKType2').Value:= 9;
      Parameters.ParamByName('pOutChk').Value:= 0;   // ������
      Open;

      if RecordCount > 0 then
      begin
        panel4.Caption := ' ��ȸ�Ǽ� : ' + IntToStr(RecordCount) + '��';
      end
      else
      begin
        panel4.Caption := ' ��ȸ�Ǽ� : 0��';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.FormShow: ' + E.Message);
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
    0: Text:= '������';
    1: Text:= '��������';
    2: Text:= '��������';
    3: Text:= '��������';
    4: Text:= '�������';
    5: Text:= '����ð�����';
    6: Text:= '�ο�����';
    7: Text:= '����������';
  end;
end;

procedure TfrmIONData.qryIONDataStatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryIONDataStatus.Value of
    0: Text:= 'ȸ�����';
    1: Text:= '����߱�';
    2: Text:= '��ȸ�����';
  end;
end;


procedure TfrmIONData.btnSearchClick(Sender: TObject);
var
  sDate : aString;
begin
  // ������ɶ� �ٷ� ��ȸ �ϵ���, �������������ϱ�(����,����)
  try
    sDate := FormatDateTime('YYYY-MM-DD', Now-1);

    // ������ ������ ��ȸ
    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where ProcDate >= :pProcDate ');
      SQL.Add('and (TKType = :pTKType1 or TKType = :pTKType2) ');
      SQL.Add('and OutChk = :pOutChk ');
      SQL.Add('and InCarNo1 like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%'));
      SQL.Add('Order By UnitNo, ProcDate desc, ProcTime desc');
      Parameters.ParamByName('pProcDate').Value:= sDate;
      Parameters.ParamByName('pTKType1').Value:= 1;
      Parameters.ParamByName('pTKType2').Value:= 9;
      Parameters.ParamByName('pOutChk').Value:= 0;   // ������
      Open;

      if RecordCount > 0 then
      begin
        panel4.Caption := ' ��ȸ�Ǽ� : ' + IntToStr(RecordCount) + '��';
      end
      else
      begin
        panel4.Caption := ' ��ȸ�Ǽ� : 0��';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.FormShow: ' + E.Message);
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
            ExceptLogging('�̹����������� ��������: ' + sDir);
        end;

        ExceptLogging('�������� ���� ���� Ȯ��1 File: ' + sInFile);

        try
          // sFile1�� http�� ������
          if Copy(sInFile, 1, 4) = 'http' then
          begin
            ExceptLogging('�������� ���� ���� Ȯ��2 File: ' + sInFile);
            sTemp:= Copy(sInFile, 6, Length(sInFile)-5);
            sInFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sInFile:= sInFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sInFile:= MG_StrConvert(sInFile, '/', '\');
            ExceptLogging('HTTP ���� ���� File: ' + sInFile);
          end
          // \\172.16.83.1 �������� �ö� �������Ľ���������.
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
            ExceptLogging('IP ���� ���� File: ' + sInFile);
          end;

          if FileExists(sInFile) then
          begin
            imgIn.Picture.LoadFromFile(sInFile);
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            ExceptLogging('���� File ����: ' + sInFile);
          end;
        except
          on E: Exception do ExceptLogging('TfrmIOSData_InImageLoad: ' + aString(E.Message));
        end;
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

          try
            if FileExists(sInFile) then
            begin
              imgIn.Picture.LoadFromFile(sInFile);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              ExceptLogging('File ����: ' + sInFile);
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
          end;

          if FieldByName('OutChk').AsInteger = 0 then
          begin
            nDelUnitNo:= FieldByName('UnitNo').AsInteger;
            sDelDate:= FieldByName('ProcDate').AsString;
            sDelTime:= FieldByName('ProcTime').AsString;
            sDelNo:= FieldByName('TKNo').AsString;
            sDelCarNo:= FieldByName('InCarNo1').AsString;
            //btnDelete.Enabled:= True;
          end
          else
          begin
            nDelUnitNo:= 0;
            sDelDate:= '';
            sDelTime:= '';
            sDelNo:= '';
            sDelCarNo:= '';
            //btnDelete.Enabled:= False;
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.DBAdvGrid1KeyUp: ' + E.Message);
  end;
end;


end.
