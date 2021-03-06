unit IONCount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, AdvDateTimePicker, Vcl.ExtCtrls, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmIONCount = class(TForm)
    dg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel5: TBevel;
    Label6: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtCarNo: TEdit;
    cmbType: TComboBox;
    btnSearch: TBitBtn;
    BitBtn3: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    Panel1: TPanel;
    dg2: TDBAdvGrid;
    BitBtn1: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dg1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIONCount: TfrmIONCount;

implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIONCount.BitBtn1Click(Sender: TObject);
begin
  Panel1.Visible := False;
end;

procedure TfrmIONCount.BitBtn3Click(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmIONCount.btnSearchClick(Sender: TObject);
var
  i : Integer;
  CarNo1 : string;
begin
   i := 0;
   dg1.Cells[1,0] := '차량번호';
   dg1.Cells[2,0] := '입차횟수';
   dg1.Cells[3,0] := '입차일자';
   dg1.Cells[4,0] := '입차시간';
   dg1.Cells[5,0] := '출차일자';
   dg1.Cells[6,0] := '출차시간';
   Refresh;


   with ADOQuery1 do
   begin
      Close;
      SQL.Clear;
      SQL.Add('select count(*) as inoutCount, InCarNo1 ');
      SQL.Add('FROM IONData    ');
      if cmbType.ItemIndex = 0 then
      begin
        SQL.Add('where ProcDate between :N1 and :N2 ');
        SQL.Add(' and InCarNo1 like :N3 ');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNO.Text+'%';
      end
      else  if cmbType.ItemIndex = 1 then
      begin
        SQL.Add('where ProcDate between :N1 and :N2 and InCarNo1 = OutCarNo1 ');
        SQL.Add(' and OutCarNo1 like :N3 ');
        Parameters.ParamByName('N3').Value:= '%'+edtCarNO.Text+'%';
      end;
      SQL.Add('group by InCarNo1        ');
      SQL.Add('order by inoutCount desc ');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
      Open;

      if Eof then
      begin
        ShowMessage('데이터가 없습니다.');
        Exit;
      end;
      StartProgress('일괄처리중...', '일괄처리중입니다.  잠시 기다려주세요!', RecordCount -1);
      while not eof do
      begin

         with dg1 do
         begin
            Cells[1, i + 1] := FieldByName('InCarNo1').AsString;
            Cells[2, i + 1] := FieldByName('inoutCount').AsString;

            CarNo1 := FieldByName('InCarNo1').AsString;

            with ADOQuery2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add(' select  ProcDate, ProcTime, InCarNo1, OutDate, OutTime  ');
              SQL.Add(' FROM IONData                  ');
              if cmbType.ItemIndex = 0 then
              begin
                SQL.Add('where ProcDate between :N1 and :N2 ');
                SQL.Add(' and InCarNo1 like :N3 ');
                Parameters.ParamByName('N3').Value:= '%'+CarNo1+'%';
              end
              else  if cmbType.ItemIndex = 1 then
              begin
                SQL.Add('where ProcDate between :N1 and :N2 and InCarNo1 = OutCarNo1 ');
                SQL.Add(' and OutCarNo1 like :N3 ');
                Parameters.ParamByName('N3').Value:= '%'+CarNo1+'%';
              end;

             // SQL.Add(' group by InCarNo1, ProcDate, ProcTime, OutDate, OutTime ');
              SQL.Add(' order by ProcDate desc, ProcTime desc                   ');
              Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
              Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
              Open;

              if RecordCount > 0  then
              begin
                  Cells[3, i + 1] := FieldByName('ProcDate').AsString;
                  Cells[4, i + 1] := FieldByName('ProcTime').AsString;
                  Cells[5, i + 1] := FieldByName('OutDate').AsString;
                  Cells[6, i + 1] := FieldByName('OutTime').AsString;
              end;
            end;
         end;
         Inc(i);
         Next;
         SetProgress(1);
      end;
      dg1.ColCount := 7;
      dg1.RowCount := i + 1;
      EndProgress;
   end;
end;

procedure TfrmIONCount.dg1DblClick(Sender: TObject);
var
  i : Integer;
begin
    Panel1.Visible := True;
    i := 0;
    with ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select *  ');
      SQL.Add(' FROM IONData  ');
      SQL.Add(' where ProcDate between :N1 and :N2 and InCarNo1 = :N3  ');
      SQL.Add(' order by ProcDate desc, ProcTime desc                   ');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
      Parameters.ParamByName('N3').Value:= dg1.Cells[1, dg1.row];
      Open;

      if Eof then
      begin
        ShowMessage('데이터가 없습니다.');
        Exit;
      end;

      while not eof do
      begin
          dg2.Cells[1, i + 1] := FieldByName('InCarNo1').AsString;
          dg2.Cells[2, i + 1] := FieldByName('Procdate').AsString;
          dg2.Cells[3, i + 1] := FieldByName('ProcTime').AsString;
          dg2.Cells[4, i + 1] := FieldByName('Outdate').AsString;
          dg2.Cells[5, i + 1] := FieldByName('OutTime').AsString;
          Inc(i);
          Next;
      end;
      dg2.ColCount := 6;
      dg2.RowCount := i + 1;

      dg2.Cells[1,0] := '차량번호';
      dg2.Cells[2,0] := '입차일자';
      dg2.Cells[3,0] := '입차시간';
      dg2.Cells[4,0] := '출차일자';
      dg2.Cells[5,0] := '출차시간';

    end;


end;

procedure TfrmIONCount.FormShow(Sender: TObject);
begin
    edtSDate.date := now;
    edtEDate.date := now;
end;

end.
