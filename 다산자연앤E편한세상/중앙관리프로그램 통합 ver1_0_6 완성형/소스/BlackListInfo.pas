unit BlackListInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, AdvEdit, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, tmsAdvGridExcel;

type
  TfrmBlackListInfo = class(TForm)
    dg1: TDBAdvGrid;
    Panel1: TPanel;
    Bevel4: TBevel;
    Label5: TLabel;
    edtBCarNo: TAdvEdit;
    btnSeek: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    btnCancel: TBitBtn;
    dsBlackListInfo: TDataSource;
    qryTemp: TADOQuery;
    qryBlackList: TADOQuery;
    qryBlackListParkNo: TSmallintField;
    qryBlackListBCarNo: TStringField;
    qryBlackListBRegDate: TStringField;
    qryBlackListBRegTime: TStringField;
    qryBlackListUnpaidAmt: TIntegerField;
    qryBlackListMNo: TSmallintField;
    qryBlackListRegReason: TStringField;
    qryBlackListReserve1: TStringField;
    qryBlackListReserve2: TStringField;
    qryBlackListReserve3: TStringField;
    qryBlackListReserve4: TStringField;
    qryBlackListReserve5: TStringField;
    btnExcel: TBitBtn;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlackListInfo: TfrmBlackListInfo;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmBlackListInfo.btnCancelClick(Sender: TObject);
begin
  edtBCarNo.Text := '';
  btnCancel.Enabled := False;
  btnDelete.Enabled:= False;
end;

procedure TfrmBlackListInfo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBlackListInfo.btnDeleteClick(Sender: TObject);
var
  sParkNo, sBCarNo : String;

begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryBlackList do
    begin
      sParkNo := FieldByName('ParkNo').AsString;
      sBCarNo := FieldByName('BCarNo').AsString;

      Close;
      SQL.Clear;
      SQL.Add('Delete from BlackList where ParkNo = :N1 and BCarNo = :N2');
      Parameters.ParamByName('N1').Value := sParkNo;
      Parameters.ParamByName('N2').Value := sBCarNo;
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('update IONData set delyn = :N1 where InCarNo1 = :N2 ');
      Parameters.ParamByName('N1').Value := 'Y';
      Parameters.ParamByName('N2').Value := sBCarNo;
      ExecSQL;

      ShowMessage(sBCarNo + '???? ???? ????');
    end;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmBlackListInfo.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      dg1.PageMode := false;      //??????
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmBlackListInfo.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmBlackListInfo.btnSeekClick(Sender: TObject);
begin
  with qryBlackList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from BlackList ');

    if edtBCarNo.Text <> '' then
    begin
      SQL.Add('where BCarNo like ' + MG_MakeStr('%' + Trim(edtBCarNo.Text) + '%'));
    end;
    Open;
    ShowMessage('?????????? ???? ????????');
    if RecordCount > 0 then
    begin
      btnExcel.Enabled  := True;
    end;
  end;
end;

procedure TfrmBlackListInfo.dg1Click(Sender: TObject);
begin
    btnCancel.Enabled := True;
    btnDelete.Enabled := True;
    btnExcel.Enabled  := True;
end;

end.
