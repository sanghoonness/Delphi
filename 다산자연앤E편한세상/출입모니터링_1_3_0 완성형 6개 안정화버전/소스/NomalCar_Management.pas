unit NomalCar_Management;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.ComCtrls,
  AdvGroupBox, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  DBAdvEd, AdvDateTimePicker, CodeSiteLogging, Data.DB, System.DateUtils,
  Vcl.Buttons, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, AdvPanel;

type
  TfrmNomalCar_Management = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grpDate: TAdvGroupBox;
    grpInfo: TAdvGroupBox;
    edtCarNum: TAdvEdit;
    btnSearch: TButton;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    dgNomalCar: TDBAdvGrid;
    edtHo: TDBAdvEdit;
    edtDong: TDBAdvEdit;
    btnSave: TButton;
    dtTo: TAdvDateTimePicker;
    dtFrom: TAdvDateTimePicker;
    stbInfo: TStatusBar;
    DBAdvEdit1: TDBAdvEdit;
    chkJunk: TCheckBox;
    btnClear: TBitBtn;
    edtInCarNo1: TDBAdvEdit;
    edtOutCarNo1: TDBAdvEdit;
    aptnHttp: TIdHTTP;
    aptnHandler: TIdSSLIOHandlerSocketOpenSSL;
    pnImg: TAdvPanel;
    imgIn: TImage;
    imgOut: TImage;
    procedure btnSearchClick(Sender: TObject);
    procedure grpDateCheckBoxClick(Sender: TObject);
    procedure grpInfoCheckBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dgNomalCarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNomalCar_Management: TfrmNomalCar_Management;

  sqlStr: string;

implementation

{$R *.dfm}

uses
  Global, Tables, AptnerThd;

var
  aptnThd: TAptnerThread;
  nInCarNo1, nOutCarNo1 : string;

procedure TfrmNomalCar_Management.btnClearClick(Sender: TObject);
begin
  edtCarNum.Clear;
end;

procedure TfrmNomalCar_Management.btnSaveClick(Sender: TObject);
var
  j : Integer;
begin
  if (dmTables.qryNomalCar.State = dsInsert) or (dmTables.qryNomalCar.State = dsEdit) then begin
    dmTables.qryNomalCar.Post;
  end;
  //21.04.29 ???????? ?????? ???? ?????? ???? ???? ????
  //?????? ???????? ???? ?? ????????
  if AptnerMonitorUse = 1 then begin
    ExceptLogging('???????????????? : '+ nInCarNo1 +' '+ dgNomalCar.Cells[3, dgNomalCar.Row]);
    ExceptLogging('???????????????? : '+ nOutCarNo1+' '+ dgNomalCar.Cells[6, dgNomalCar.Row]);
    //????????
    if nInCarNo1 <> dgNomalCar.Cells[3, dgNomalCar.Row] then
    begin
      if (TryStrToInt(edtDong.Text, j)) and (TryStrToInt(edtHo.Text, j)) then
      begin
        aptnThd.aptnInfo.exeTag := 1;
        aptnThd.aptnInfo.aptner_Aptcode := AptnerCode;
        aptnThd.aptnInfo.aptner_Carno := edtInCarNo1.Text;
        aptnThd.aptnInfo.aptner_Dong := edtDong.Text;
        aptnThd.aptnInfo.aptner_Ho := edtho.Text;
        aptnThd.aptnInfo.aptner_IsResident := 'N';
        aptnThd.AptnPush;
        HomeInfoLogging('???????? ???? ???????? ???? ???????? ???????? ????: '+ edtInCarNo1.Text + '/' + edtDong.Text + '/' + edtho.Text + aptnThd.aptnInfo.aptner_IsResident);
      end;
    end;
    //????????
    if nOutCarNo1 <> dgNomalCar.Cells[6, dgNomalCar.Row] then
    begin
      if (TryStrToInt(edtDong.Text, j)) and (TryStrToInt(edtHo.Text, j)) then
      begin
        aptnThd.aptnInfo.exeTag := 2;
        aptnThd.aptnInfo.aptner_Aptcode := AptnerCode;
        aptnThd.aptnInfo.aptner_Carno := edtOutCarNo1.Text;
        aptnThd.aptnInfo.aptner_Dong := edtDong.Text;
        aptnThd.aptnInfo.aptner_Ho := edtho.Text;
        aptnThd.aptnInfo.aptner_IsResident := 'N';
        aptnThd.AptnPush;
        HomeInfoLogging('???????? ???? ???????? ???? ???????? ???????? ????: '+ edtInCarNo1.Text + '/' + edtDong.Text + '/' + edtho.Text + aptnThd.aptnInfo.aptner_IsResident);
      end;
    end;
  end;
end;

procedure TfrmNomalCar_Management.btnSearchClick(Sender: TObject);
var
  rowCnt: Integer;
begin
  try
    dgNomalCar.ColCount := 10;
    with dmTables.qryNomalCar do begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, ProcTime, InCarNo1, OutDate, OutTime, OutCarNo1, Reserve2, Reserve3, Reserve1, InImage1, OutImage1 From iondata');
      if grpDate.CheckBox.Checked = true then begin
        SQL.Add(' Where');
        SQL.Add(' ProcDate between :v1 And :v2');
        Parameters.ParamByName('v1').Value := FormatDateTime('yyyy-mm-dd',dtFrom.Date);
        Parameters.ParamByName('v2').Value := FormatDateTime('yyyy-mm-dd',dtTo.Date);
      end;
      if (grpInfo.CheckBox.Checked = true) and (Length(edtCarNum.Text)>0) then begin
        if Pos('Where',SQL.Text) > 1 then begin
          SQL.Add('And InCarNo1 Like :v3');
        end else begin
          SQL.Add(' Where');
          SQL.Add('InCarNo1 Like :v3');
        end;
        Parameters.ParamByName('v3').Value := '%'+ Trim(edtCarNum.Text);
      end;

      if chkJunk.Checked = True then begin
        if Pos('Where',SQL.Text) > 1 then begin
          SQL.Add(' and InRecog1 = 1 and InCarNo1 <> '+QuotedStr('0000000000'));
        end else begin
          SQL.Add(' Where');
          SQL.Add(' and InRecog1 = 1 and InCarNo1 <> '+QuotedStr('0000000000'));
        end;
      end;

//      SQL.Add(' And ((Reserve1 is null and Reserve2 is null and Reserve3 is null) or ((Reserve1 = :v4 or Reserve1 = :v8) and Reserve2 = :v5 and Reserve3 = :v6)) and (InCarNo1 <> :v7)');
//      Parameters.ParamByName('v4').Value := '????';
//      Parameters.ParamByName('v5').Value := '';
//      Parameters.ParamByName('v6').Value := '';
//      Parameters.ParamByName('v7').Value := '';
//      Parameters.ParamByName('v8').Value := '?? ??';

      SQL.Add(' Order by Procdate + Proctime desc');
//      CodeSite.Send(SQL.Text);
      Open;
      if dmTables.qryNomalCar.RecordCount > 0 then begin
        dgNomalCar.Columns[1].Header := '????????';
        dgNomalCar.Columns[2].Header := '????????';
        dgNomalCar.Columns[3].Header := '????????????';
        dgNomalCar.Columns[4].Header := '????????';
        dgNomalCar.Columns[5].Header := '????????';
        dgNomalCar.Columns[6].Header := '????????????';
        dgNomalCar.Columns[7].Header := '??';
        dgNomalCar.Columns[8].Header := '??';
        dgNomalCar.Columns[9].Header := '????';
  //      dgNomalCar.AutoSizeColumns(True);
        dgNomalCar.AutoNumberCol(0);
        //dgNomalCar.AutoFitColumns();
        dgNomalCar.Columns[0].Width := 50;
        dgNomalCar.Columns[1].Width := 80;
        dgNomalCar.Columns[2].Width := 80;
        dgNomalCar.Columns[3].Width := 90;
        dgNomalCar.Columns[4].Width := 80;
        dgNomalCar.Columns[5].Width := 80;
        dgNomalCar.Columns[6].Width := 90;
        dgNomalCar.Columns[7].Width := 70;
        dgNomalCar.Columns[8].Width := 70;
        dgNomalCar.Columns[9].Width := 100;
        dgNomalCar.Columns[10].Width := 0;
        dgNomalCar.Columns[11].Width := 0;
        rowCnt := dmTables.qryNomalCar.RecordCount;
      end else rowCnt := 0;
    end;
    stbInfo.Panels[0].Text := '?????? ?????? ????: '+FormatFloat('0,', rowCnt);
  except

  end;
end;

procedure TfrmNomalCar_Management.dgNomalCarClick(Sender: TObject);
begin
   nInCarNo1 := edtInCarNo1.Text;
   nOutCarNo1:= edtInCarNo1.Text;
   ExceptLogging('???????????? : '+ nInCarNo1);
   ExceptLogging('???????????? : '+ nOutCarNo1);

   if FileExists(dgNomalCar.Cells[10,dgNomalCar.row]) then
   begin
      imgIn.Picture.LoadFromFile(dgNomalCar.Cells[10,dgNomalCar.row]);
   end
   else
   begin
      imgIn.Picture.Assign(Nil);
      ExceptLogging('???? File ????: ' + dgNomalCar.Cells[10,dgNomalCar.row]);
   end;

   if FileExists(dgNomalCar.Cells[11,dgNomalCar.row]) then
   begin
      imgOut.Picture.LoadFromFile(dgNomalCar.Cells[11,dgNomalCar.row]);
   end
   else
   begin
      imgOut.Picture.Assign(Nil);
      ExceptLogging('???? File ????: ' + dgNomalCar.Cells[11,dgNomalCar.row]);
   end;
end;

procedure TfrmNomalCar_Management.FormShow(Sender: TObject);
begin
  dtFrom.Date := StartOfTheMonth(Now);
  dtTo.Date := now;
  dgNomalCar.ColCount := 10;
  dgNomalCar.Columns.Clear;
  edtInCarNo1.Text  := '';
  edtOutCarNo1.Text := '';
  edtdong.Text := '';
  edtho.Text   := '';
  DBAdvEdit1.Text:= '';

  if AptnerMonitorUse = 1 then begin
      aptnThd := TAptnerThread.Create(AptnerVisitAuth,AptnerVisitAddr,AptnerInCarAddr,AptnerOutCarAddr);
      aptnHttp.Request.ContentType := 'application/json';
      aptnHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + AptnerVisitAuth;
      HomeInfoLogging('???????? ???? ???? ????(????) ???????? ???????? ????');
  end;
end;

procedure TfrmNomalCar_Management.grpDateCheckBoxClick(Sender: TObject);
begin
  if TAdvGroupBox(Sender).CheckBox.Checked = True then begin
    dtFrom.Enabled := True;
    dtTo.Enabled := True;
  end else begin
    dtFrom.Enabled := False;
    dtTo.Enabled := False;
  end;
end;

procedure TfrmNomalCar_Management.grpInfoCheckBoxClick(
  Sender: TObject);
begin
  if TAdvGroupBox(Sender).CheckBox.Checked = True then begin
    edtCarNum.Enabled := True;
    chkJunk.Enabled := True;
  end else begin
    edtCarNum.Enabled := False;
    chkJunk.Checked := False;
    chkJunk.Enabled := False;
  end;
end;

end.
