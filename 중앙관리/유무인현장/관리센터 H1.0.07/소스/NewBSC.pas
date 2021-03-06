unit NewBSC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, AdvCombo, Vcl.ExtCtrls;

type
  TfrmNewBSC = class(TForm)
    Panel1: TPanel;
    Bevel11: TBevel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    edtBCarNo: TEdit;
    cmbParkNo: TAdvComboBox;
    sb1: TStatusBar;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    qryBlackList: TADOQuery;
    qryBlackListParkNo: TSmallintField;
    qryBlackListBCarNo: TStringField;
    qryBlackListReserve1: TStringField;
    qryBlackListReserve2: TStringField;
    qryBlackListReserve3: TStringField;
    dsBlackList: TDataSource;
    Label2: TLabel;
    Bevel2: TBevel;
    edtRegReason: TEdit;
    qryBlackListBRegDate: TStringField;
    qryBlackListBRegTime: TStringField;
    qryBlackListUnpaidAmt: TIntegerField;
    qryBlackListMNo: TSmallintField;
    qryBlackListRegReason: TStringField;
    qryBlackListReserve4: TStringField;
    qryBlackListReserve5: TStringField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewBSC: TfrmNewBSC;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmNewBSC.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
  //Close;
end;

procedure TfrmNewBSC.btnSaveClick(Sender: TObject);
begin
  try
    with qryBlackList do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from BlackList ' +
              'where BCarNo = :N1');
      Parameters.ParamByName('N1').Value := edtBCarNo.Text;
      Open;
      if RecordCount > 0 then
      begin
        ShowMessage('이미 등록된 블랙리스트 차량번호입니다');
        Exit;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Insert Into BlackList (ParkNo, BCarNo, BRegDate, BRegTime, RegReason) ' +
              'Values(:N1, :N2, :N3, :N4, :N5)' );
      Parameters.ParamByName('N1').Value := cmbParkNo.Text;
      Parameters.ParamByName('N2').Value := edtBCarNo.Text;
      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N5').Value := edtRegReason.Text;
      ExecSQL;
    end;
    ShowMessage('블랙리스트 차량 등록이 완료되었습니다');
    ExceptLogging('TfrmNewBSC.btnSaveClick: 블랙리스트 차량 등록 : ' + edtBCarNo.Text);

    edtBCarNo.Text    := '';
    edtRegReason.Text := '';
  except
    on E: Exception do ExceptLogging('TfrmNewBSC.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmNewBSC.FormShow(Sender: TObject);
begin
   with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('주차장을 먼저 설정하여주세요!');
        Exit;
      end
      else
      begin
        cmbParkNo.Items.Clear;

        while not Eof do
        begin
          cmbParkNo.Items.Add(IntToStr(FieldByName('ParkNo').AsInteger));
          Next;
        end;
        cmbParkNo.ItemIndex:= 0;
      end;
    end;
end;

end.
