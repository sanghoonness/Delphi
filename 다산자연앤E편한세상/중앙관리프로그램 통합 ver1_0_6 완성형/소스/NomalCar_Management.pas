unit NomalCar_Management;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.ComCtrls,
  AdvGroupBox, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  DBAdvEd, AdvDateTimePicker, CodeSiteLogging, Data.DB, System.DateUtils,
  Vcl.Buttons;

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
    procedure btnSearchClick(Sender: TObject);
    procedure grpDateCheckBoxClick(Sender: TObject);
    procedure grpInfoCheckBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
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
  Global, Tables;

procedure TfrmNomalCar_Management.btnClearClick(Sender: TObject);
begin
  edtCarNum.Clear;
end;

procedure TfrmNomalCar_Management.btnSaveClick(Sender: TObject);
begin
  if (dmTables.qryNomalCar.State = dsInsert) or (dmTables.qryNomalCar.State = dsEdit) then begin
    dmTables.qryNomalCar.Post;
  end;
end;

procedure TfrmNomalCar_Management.btnSearchClick(Sender: TObject);
var
  rowCnt: Integer;
begin
  try
    dgNomalCar.ColCount := 10;
    with dmTables.qryNomalCar do begin
      SQL.Clear;
      Close;
      SQL.Add('Select ProcDate, ProcTime, InCarNo1, OutDate, OutTime, OutCarNo1, Reserve2, Reserve3, Reserve1 From iondata');
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
//      Parameters.ParamByName('v4').Value := '입차';
//      Parameters.ParamByName('v5').Value := '';
//      Parameters.ParamByName('v6').Value := '';
//      Parameters.ParamByName('v7').Value := '';
//      Parameters.ParamByName('v8').Value := '입 차';

      SQL.Add(' Order by Procdate + Proctime desc');
//      CodeSite.Send(SQL.Text);
      Open;
      if dmTables.qryNomalCar.RecordCount > 0 then begin
        dgNomalCar.Columns[1].Header := '입차날짜';
        dgNomalCar.Columns[2].Header := '입차시간';
        dgNomalCar.Columns[3].Header := '입차차량번호';
        dgNomalCar.Columns[4].Header := '출차날짜';
        dgNomalCar.Columns[5].Header := '출차시간';
        dgNomalCar.Columns[6].Header := '출차차량번호';
        dgNomalCar.Columns[7].Header := '동';
        dgNomalCar.Columns[8].Header := '호';
        dgNomalCar.Columns[9].Header := '사유';
  //      dgNomalCar.AutoSizeColumns(True);
        dgNomalCar.AutoNumberCol(0);
        dgNomalCar.AutoFitColumns();
        dgNomalCar.Columns[0].Width := 50;
        rowCnt := dmTables.qryNomalCar.RecordCount;
      end else rowCnt := 0;
    end;
    stbInfo.Panels[0].Text := '검색된 데이터 개수: '+FormatFloat('0,', rowCnt);
  except

  end;
end;

procedure TfrmNomalCar_Management.FormShow(Sender: TObject);
begin
  dtFrom.Date := StartOfTheMonth(Now);
  dtTo.Date := now;
  dgNomalCar.ColCount := 10;
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
