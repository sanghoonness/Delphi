unit IONData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.ImgList, mzClientSocket, GradientLabel, AdvEdit, advlued, Vcl.ComCtrls;

type
  TfrmIONData = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
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
    dsIONData: TDataSource;
    Button11: TButton;
    Button12: TButton;
    ImageList1: TImageList;
    dg1: TDBAdvGrid;
    lbGate: TGradientLabel;
    GradientLabel2: TGradientLabel;
    edtDong: TAdvLUEdit;
    edtHo: TAdvLUEdit;
    edtmemo1: TAdvLUEdit;
    button100: TButton;
    GradientLabel1: TGradientLabel;
    Label1: TLabel;
    edtCloseTime: TEdit;
    Timer1: TTimer;
    sDate: TDateTimePicker;
    eDate: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    edtCarNo: TAdvLUEdit;
    btn_search: TButton;
    btnClear: TButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure Button100Click(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
    FisAPT: Integer;
  public
    { Public declarations }
    recvClt: TmzClientSocket;

    property isAPT: Integer read FisAPT write FisAPT;
  end;

var
  frmIONData: TfrmIONData;
  nTimeClose : Integer;
implementation
uses
  Global;
{$R *.dfm}

procedure TfrmIONData.btnClearClick(Sender: TObject);
begin
   edtDong.Text  :='';
   edtHo.Text    :='';
   edtmemo1.Text :='';
   nLprDate :='';
   nLprTime :='';
end;

procedure TfrmIONData.btn_searchClick(Sender: TObject);
begin
  with qryIONData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select top(5) * from IONData where  ');
    //SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
    SQL.Add('((InCarNo1 like :N2) or (InCarNo2 like :N3)) ');
    SQL.Add('ORDER by ProcDate + ProcTime DESC');
    Parameters.ParamByName('N2').Value := '%'+Trim(edtCarNo.Text)+'%';
    Parameters.ParamByName('N3').Value := '%'+Trim(edtCarNo.Text)+'%';
    Open;
  end;
end;

procedure TfrmIONData.Button100Click(Sender: TObject);
begin
  sTDate := DateToStr(sDate.Date);
  eTDate := DateToStr(eDate.Date);
  qryIONData.Close;
  qryUnitInfo.Close;
  ModalResult := mrOK;
end;

procedure TfrmIONData.ButtonClick(Sender: TObject);
begin
  edtMemo1.Text :=(Sender as TButton).Caption;
end;

procedure TfrmIONData.dg1Click(Sender: TObject);
var
  i: Byte;
begin
  try
//    if qryIONData.RecordCount <= 0 then
//      Exit;
//
//    with qryIONData do
//    begin
//      edtmemo1       .Text:= FieldByName('Reserve1').AsString;
//      edtDong       .Text:= FieldByName('Reserve2').AsString;
//      edtHo      .Text:= FieldByName('Reserve3').AsString;
//    end;

//    if not ((dg1.Cells[5,dg1.Row] = '') or (dg1.Cells[6,dg1.Row] = '') or (dg1.Cells[7,dg1.Row] = '')) then
    nLprDate := dg1.Cells[2,dg1.Row];
    nLprTime := dg1.Cells[3,dg1.Row];

    edtDong.Text := dg1.Cells[4,dg1.Row];
    edtHo.Text := dg1.Cells[5,dg1.Row];
    edtmemo1.Text := dg1.Cells[6,dg1.Row];
    edtCarNo.Text := dg1.Cells[7,dg1.Row];

  except
    on E: Exception do ExceptLogging('TfrmIONData.dg1Click: ' + aString(E.Message));
  end;
end;

procedure TfrmIONData.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
var
  sender: TObject;
begin
  if Msg.CharCode = VK_F1 then
    Button1.OnClick(Button1)
  else if Msg.CharCode = VK_F2 then
    Button2.OnClick(Button2)
  else if Msg.CharCode = VK_F3 then
    Button3.OnClick(Button3)
  else if Msg.CharCode = VK_F4 then
    Button4.OnClick(Button4)
  else if Msg.CharCode = VK_F5 then
    Button5.OnClick(Button5)
  else if Msg.CharCode = VK_F6 then
    Button6.OnClick(Button6)
  else if Msg.CharCode = VK_F7 then
    Button7.OnClick(Button7)
  else if Msg.CharCode = VK_F8 then
    Button8.OnClick(Button8)
  else if Msg.CharCode = VK_F9 then
    Button9.OnClick(Button9)
  else if Msg.CharCode = VK_F10 then
    Button10.OnClick(Button10)
  else if Msg.CharCode = VK_F11 then
    Button11.OnClick(Button11)
  else if Msg.CharCode = VK_F12 then
    Button12.OnClick(Button12)
end;

procedure TfrmIONData.FormShow(Sender: TObject);
var
  i: Integer;
  iniMsg: TIniFile;
begin
  sTDate := '';
  eTDate := '';

  iniMsg := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
  Button1.Caption   := iniMsg.ReadString('PARKING', 'msg01', '');
  Button2.Caption   := iniMsg.ReadString('PARKING', 'msg02', '');
  Button3.Caption   := iniMsg.ReadString('PARKING', 'msg03', '');
  Button4.Caption   := iniMsg.ReadString('PARKING', 'msg04', '');
  Button5.Caption   := iniMsg.ReadString('PARKING', 'msg05', '');
  Button6.Caption   := iniMsg.ReadString('PARKING', 'msg06', '');
  Button7.Caption   := iniMsg.ReadString('PARKING', 'msg07', '');
  Button8.Caption   := iniMsg.ReadString('PARKING', 'msg08', '');
  Button9.Caption   := iniMsg.ReadString('PARKING', 'msg09', '');
  Button10.Caption  := iniMsg.ReadString('PARKING', 'msg10', '');
  Button11.Caption  := iniMsg.ReadString('PARKING', 'msg11', '');
  Button12.Caption  := iniMsg.ReadString('PARKING', 'msg12', '');
  if nNowLprRecog1 <> 1 then   //???????? ???? ???? ???? ???? ????
  begin
     lbGate.Caption := '';
     edtCarNo.SetFocus;
  end
  else
  begin
     lbGate.Caption := recvClt.LprName + ' - ' + recvClt.LprCarNo;
     edtDong.SetFocus;
  end;

  if sAutoVisit = 1 then
  begin
     btnClear.Visible := true;
  end
  else
  begin
     btnClear.Visible := False;
  end;

  if isAPT = 0 then begin
    edtDong.LabelCaption := '????:';
    edtHo.LabelCaption := '????:';
    dg1.Columns[4].Header := '????';
    dg1.Columns[5].Header := '????';
  end else begin
    edtDong.LabelCaption := '??:';
    edtHo.LabelCaption := '??:';
    dg1.Columns[4].Header := '??';
    dg1.Columns[5].Header := '??';
  end;

  if sNowCarNo = '' then
  begin
     edtCarNo.SetFocus;
  end
  else
  begin
    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select top(5) * from IONData where  ');
      SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
      SQL.Add('ORDER by ProcDate + ProcTime DESC');
      Parameters.ParamByName('N2').Value := sNowCarNo;
      Parameters.ParamByName('N3').Value := sNowCarNo;
      Open;
    end;
    for i := dg1.FixedRows to dg1.RowCount do begin
      dg1.Cells[0,i] := IntToStr(i);
    end;
    dg1.AutoSize := True;
    dg1.AutoFitColumns();
  end;


  {with qryIONData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select top(5) * from IONData where  ');
    SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
    SQL.Add('ORDER by ProcDate + ProcTime DESC');
    Parameters.ParamByName('N2').Value := sNowCarNo;
    Parameters.ParamByName('N3').Value := sNowCarNo;
    Open;
  end;
  for i := dg1.FixedRows to dg1.RowCount do begin
    dg1.Cells[0,i] := IntToStr(i);
  end;
  dg1.AutoSize := True;
  dg1.AutoFitColumns();}

  //edtDong.SetFocus;

  if nDafaultPrint = 0 then
  begin
    sDate.Visible := True;
    eDate.Visible := True;
    Label2.Visible:= True;
    Label3.Visible:= True;
    sDate.Date := Now;
    eDate.Date := Now;
  end
  else
  begin
    sDate.Visible := false;
    eDate.Visible := false;
    Label2.Visible:= False;
    Label3.Visible:= False;
    sDate.Date := Now;
    eDate.Date := Now;
  end;

  if nDafaultPrintTime <> 0 then
  begin
    edtCloseTime.Text := IntToStr(nDafaultPrintTime);
    Timer1.Enabled := True;
  end;
end;

procedure TfrmIONData.Timer1Timer(Sender: TObject);
begin
   nTimeClose := strtoint(edtCloseTime.Text) - 1;
   edtCloseTime.Text := IntToStr(nTimeClose);
   if edtCloseTime.Text = '0' then
   begin
      Timer1.Enabled := False;
      ModalResult := mrCancel;
   end;

end;

end.
