unit GateRuleNew;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtCtrls, AdvCombo, Vcl.ComCtrls,
  AdvDateTimePicker, Data.DB, Data.Win.ADODB;

type
  TfrmGateRuleNew = class(TForm)
    Panel3: TPanel;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    cmbTKType: TAdvComboBox;
    cmbFeeNo: TAdvComboBox;
    cmbIOType: TAdvComboBox;
    edtNormalSTime: TAdvDateTimePicker;
    edtNormalETime: TAdvDateTimePicker;
    edtSaturdaySTime: TAdvDateTimePicker;
    edtSaturdayETime: TAdvDateTimePicker;
    edtSundaySTime: TAdvDateTimePicker;
    edtSundayETime: TAdvDateTimePicker;
    edtSpecialSTime: TAdvDateTimePicker;
    edtSpecialETime: TAdvDateTimePicker;
    qryFeeItem: TADOQuery;
    qryFeeItemParkNo: TSmallintField;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemItemMax: TIntegerField;
    qryFeeItemTotMax: TIntegerField;
    qryFeeItemReserve1: TStringField;
    qryFeeItemReserve2: TStringField;
    qryFeeItemReserve3: TStringField;
    qryFeeItemReserve4: TStringField;
    qryFeeItemReserve5: TStringField;
    qryTemp: TADOQuery;
    cmbParkNo: TAdvComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  RECFeeItem = record
    nFeeNo  : Integer;
    sFeeName: String;
  end;

var
  frmGateRuleNew: TfrmGateRuleNew;
  RFeeItem : Array[1..50] of RECFeeItem;
  nSelect: Byte = 0; //0:Add, 1:Modify

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmGateRuleNew.btnCancelClick(Sender: TObject);
begin
  cmbParkNo.ItemIndex := 0;
  cmbTKType.ItemIndex := 0;
  cmbFeeNo.ItemIndex := 0;
  edtNormalSTime.Time := StrToDateTime('00:00');
  edtNormalETime.Time := StrToDateTime('00:00');
  edtSaturdaySTime.Time := StrToDateTime('00:00');
  edtSaturdayETime.Time := StrToDateTime('00:00');
  edtSundaySTime.Time := StrToDateTime('00:00');
  edtSundayETime.Time := StrToDateTime('00:00');
  edtSpecialSTime.Time := StrToDateTime('00:00');
  edtSpecialETime.Time := StrToDateTime('00:00');
end;

procedure TfrmGateRuleNew.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
  //close;
end;

procedure TfrmGateRuleNew.btnSaveClick(Sender: TObject);
begin
  try

    if cmbTKType.ItemIndex = 0 then
    begin
      ShowMessage('?????????? ??????????.');
      Exit;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GateRule where parkno = :pParkno');
      SQL.Add('and TKType = :pTKType and FeeNo = :pFeeNo ');
      Parameters.ParamByName('pParkno').Value:= StrToInt(cmbParkNo.Text);  // ??????????
      Parameters.ParamByName('pTKType').Value:= cmbTKType.ItemIndex;  // ????????
      Parameters.ParamByName('pFeeNo').Value:= RFeeItem[cmbFeeNo.ItemIndex].nFeeNo;   // ????????
      Open;
      if RecordCount > 0 then
      begin
       ShowMessage('?????? ??????????. ???? ?????? ??????.');
       Exit;
      end;
    end;

    with qryTemp do
    begin
      // ????
      Close;
      SQL.Clear;
      SQL.Add('insert into GateRule(parkno, TKType, FeeNo, IoType, NormalSOpen, NormalEOpen ');
      SQL.Add(', SatudaySOpen, SatudayEOpen, SundaySOpen, SundayEOpen, SpecialdaySOpen, SpecialdayEOpen, reserve1) ');
      SQL.Add('values(:pParkNo, :pTKType, :pFeeNo, :pIOType, :pNormalSOpen, :pNormalEOpen  ');
      SQL.Add(' , :pSatudaySOpen, :pSatudayEOpen, :pSundaySOpen, :pSundayEOpen, :pSpecialdaySOpen, :pSpecialdayEOpen, :pReserve1)');

      Parameters.ParamByName('pParkNo').Value:= StrToInt(cmbParkNo.Text);  // ??????????
      Parameters.ParamByName('pTKType').Value:= cmbTKType.ItemIndex;  // ????????
      Parameters.ParamByName('pFeeNo').Value:= RFeeItem[cmbFeeNo.ItemIndex].nFeeNo;   // ????????
      Parameters.ParamByName('pIOType').Value:= cmbIOType.ItemIndex;   // ?????? ????
      Parameters.ParamByName('pNormalSOpen').Value:= FormatDateTime('HH:NN', edtNormalSTime.Time); // ????????????
      Parameters.ParamByName('pNormalEOpen').Value:= FormatDateTime('HH:NN', edtNormalETime.Time); // ????????????
      Parameters.ParamByName('pSatudaySOpen').Value:= FormatDateTime('HH:NN', edtSaturdaySTime.Time);
      Parameters.ParamByName('pSatudayEOpen').Value:= FormatDateTime('HH:NN', edtSaturdayETime.Time);
      Parameters.ParamByName('pSundaySOpen').Value:= FormatDateTime('HH:NN', edtSundaySTime.Time);
      Parameters.ParamByName('pSundayEOpen').Value:= FormatDateTime('HH:NN', edtSundayETime.Time);
      Parameters.ParamByName('pSpecialdaySOpen').Value:= FormatDateTime('HH:NN', edtSpecialSTime.Time);
      Parameters.ParamByName('pSpecialdayEOpen').Value:= FormatDateTime('HH:NN', edtSpecialETime.Time);
      Parameters.ParamByName('pReserve1').Value:= cmbFeeNo.Text;
      ExecSQL;
    end;

    ShowMessage('???????? ???? ????!');
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmGateRuleNew.btnSaveClick: ' + aString(E.Message));
      ShowMessage('???? ????! ?????????? ????????????.');
    end;
  end;
end;

procedure TfrmGateRuleNew.FormShow(Sender: TObject);
var
  i : Byte;
begin
  try

    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('???????? ???? ??????????????!');
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

    with qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from feeitem order by feeno');
      Open;

      cmbFeeNo.Items.Add('????????');

      if RecordCount > 0 then
      begin
        i := 1;
        while not Eof do
        begin
          cmbFeeNo.Items.Add(FieldByName('FeeName').AsString);
          RFeeItem[i].nFeeNo := FieldByName('FeeNo').AsInteger;
          RFeeItem[i].sFeeName:= FieldByName('FeeName').AsString;
          i:= i+1;
          Next;
        end;
      end;

      cmbFeeNo.ItemIndex := 0;
    end;

    nSelect:= 0;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmGateRule.FormShow: ' + aString(E.Message));
    end;
  end;
end;

end.
