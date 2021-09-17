unit GateRule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtCtrls, AdvCombo, Vcl.ComCtrls,
  AdvDateTimePicker, Data.DB, Data.Win.ADODB;

type
  TfrmGateRule = class(TForm)
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    Panel3: TPanel;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    btnDelete: TBitBtn;
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
    SmallintField1: TSmallintField;
    WordField1: TWordField;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    cmbParkNo: TAdvComboBox;
    qryGateRule: TADOQuery;
    dsGateRule: TDataSource;
    qryGateRuleParkNo: TSmallintField;
    qryGateRuleTKType: TWordField;
    qryGateRuleFeeNo: TWordField;
    qryGateRuleIoType: TIntegerField;
    qryGateRuleNormalSOpen: TStringField;
    qryGateRuleNormalEOpen: TStringField;
    qryGateRuleSatudaySOpen: TStringField;
    qryGateRuleSatudayEOpen: TStringField;
    qryGateRuleSundaySOpen: TStringField;
    qryGateRuleSundayEOpen: TStringField;
    qryGateRuleSpecialdaySOpen: TStringField;
    qryGateRuleSpecialdayEOpen: TStringField;
    qryGateRuleReserve1: TStringField;
    qryGateRuleReserve2: TStringField;
    qryGateRuleReserve3: TStringField;
    qryGateRuleReserve4: TStringField;
    qryGateRuleReserve5: TStringField;
    qryGateRuleUseYes: TIntegerField;
    qryGateRuleFeeName: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure qryGateRuleTKTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dg1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryGateRuleIoTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnDeleteClick(Sender: TObject);
    procedure frmClear();
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
  frmGateRule: TfrmGateRule;
  RFeeItem : Array[1..50] of RECFeeItem;
  nPrvTKType, nPrvFeeNo : Integer;

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmGateRule.frmClear();
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

  btnDelete.Enabled := false;
end;

procedure TfrmGateRule.btnCancelClick(Sender: TObject);
begin
  frmClear();
end;

procedure TfrmGateRule.btnCloseClick(Sender: TObject);
begin
  qryGateRule.Close;
  Close;
end;

procedure TfrmGateRule.btnDeleteClick(Sender: TObject);
var
  sSDate, sEDate : String;
begin
  try
    if MessageDlg('������ �׸��� �����ұ��?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryGateRule do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from GateRule  ');
        SQL.Add('Where ParkNo = :pParkNo and TKType = :pPrvTKType and FeeNo = :pPrvFeeNo ');
        Parameters.ParamByName('pParkNo').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByname('pPrvTKType').Value:= nPrvTKType;
        Parameters.ParamByName('pPrvFeeNo').Value:= nPrvFeeNo;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmGateRule.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('������ �����߻�! �����ڿ� ���ǹٶ��ϴ�.');
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('select * from gaterule');
      Open;
    end;

    ExceptLogging('����: ' + cmbTKType.Text + ', ' + cmbFeeNo.Text);
    frmClear();
  except
    on E: Exception do ExceptLogging('TfrmGateRule.btnDeleteClick: ' + aString(E.Message));
  end;
end;


procedure TfrmGateRule.btnSaveClick(Sender: TObject);
begin
  try
    with qryTemp do
    begin
       try
         dmTables.ADODB.BeginTrans;
         Close;
         SQL.Clear;
         SQL.Add('Update GateRule ');
         SQL.Add('Set  TKType = :pTKType , FeeNo = :pFeeNo  ');
         SQL.Add(', IoType = :pIoType, NormalSOpen = :pNormalSOpen, NormalEOpen = :pNormalEOpen, SatudaySOpen = :pSatudaySOpen, SatudayEOpen = :pSatudayEOpen ');
         SQL.Add(', SundaySOpen = :pSundaySOpen, SundayEOpen = :pSundayEOpen, SpecialdaySOpen = :pSpecialdaySOpen, SpecialdayEOpen = :pSpecialdayEOpen ');
         SQL.Add('Where ParkNo = :pParkNo and TKType = :pPrvTKType and FeeNo = :pPrvFeeNo ');
         Parameters.ParamByname('pTKType').Value:= cmbTKType.ItemIndex;  // ��������
         Parameters.ParamByName('pFeeNo').Value:= RFeeItem[cmbFeeNo.ItemIndex].nFeeNo;   // ��ݹ�ȣ
         Parameters.ParamByName('pIoType' ).Value:= cmbIOType.ItemIndex;   // ������ ����
         Parameters.ParamByName('pNormalSOpen' ).Value:= FormatDateTime('HH:NN', edtNormalSTime.Time); // ���Ͻ��۽ð�
         Parameters.ParamByName('pNormalEOpen' ).Value:= FormatDateTime('HH:NN', edtNormalETime.Time); // ��������ð�
         Parameters.ParamByName('pSatudaySOpen' ).Value:= FormatDateTime('HH:NN', edtSaturdaySTime.Time);
         Parameters.ParamByName('pSatudayEOpen' ).Value:= FormatDateTime('HH:NN', edtSaturdayETime.Time);
         Parameters.ParamByName('pSundaySOpen' ).Value:= FormatDateTime('HH:NN', edtSundaySTime.Time);
         Parameters.ParamByName('pSundayEOpen' ).Value:= FormatDateTime('HH:NN', edtSundayETime.Time);
         Parameters.ParamByName('pSpecialdaySOpen' ).Value:= FormatDateTime('HH:NN', edtSpecialSTime.Time);
         Parameters.ParamByName('pSpecialdayEOpen' ).Value:= FormatDateTime('HH:NN', edtSpecialETime.Time);

         Parameters.ParamByName('pParkNo').Value:= StrToInt(cmbParkNo.Text);  // �������ȣ
         Parameters.ParamByname('pPrvTKType').Value:= nPrvTKType;
         Parameters.ParamByName('pPrvFeeNo').Value:= nPrvFeeNo;
         ExecSql;
         dmTables.ADODB.CommitTrans;
       except
         on E: Exception do
         begin
           dmTables.ADODB.RollbackTrans;
           ExceptLogging('TfrmGateRule.btnSaveClick_1: ' + aString(E.Message));
           ShowMessage('���� �����߻�! �����ڿ� ���ǹٶ��ϴ�.');
         end;
       end;

    end;

    with qryGateRule do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from gaterule');
      Open;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmGateRule.btnSaveClick: ' + aString(E.Message));
      ShowMessage('���� ����! �����ڿ��� ���ǹٶ��ϴ�.');
    end;
  end;
end;

procedure TfrmGateRule.dg1Click(Sender: TObject);
begin
  try

    with qryGateRule do
    begin
      if RecordCount > 0 then
      begin
        cmbParkNo.Text := FieldByName('ParkNo').AsString;
        cmbTKType.ItemIndex := FieldByName('TKType').AsInteger;
        cmbFeeNo.Text := FieldByName('Reserve1').AsString;
        cmbFeeNo.ItemIndex := cmbFeeNo.Items.IndexOf(FieldByName('Reserve1').AsString);
        cmbIOType.ItemIndex := FieldByName('iotype').AsInteger;

        edtNormalSTime.time := StrToDateTime(FieldByName('NormalSOpen').AsString);
        edtNormalETime.time := StrToDateTime(FieldByName('NormalEOpen').AsString);
        edtSaturdaySTime.time := StrToDateTime(FieldByName('SatudaySOpen').AsString);
        edtSaturdayETime.time := StrToDateTime(FieldByName('SatudayEOpen').AsString);

        edtSundaySTime.time := StrToDateTime(FieldByName('SundaySOpen').AsString);
        edtSundayETime.time := StrToDateTime(FieldByName('SundayEOpen').AsString);
        edtSpecialSTime.time := StrToDateTime(FieldByName('SpecialdaySOpen').AsString);
        edtSpecialETime.time := StrToDateTime(FieldByName('SpecialdayEOpen').AsString);

        nPrvTKType :=  FieldByName('TKType').AsInteger;
        nPrvFeeNo := cmbFeeNo.Items.IndexOf(FieldByName('Reserve1').AsString);
      end;
    end;

    btnDelete.Enabled := True;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmGateRule.dg1Click: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmGateRule.FormShow(Sender: TObject);
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
        ShowMessage('�������� ���� �����Ͽ��ּ���!');
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

      if RecordCount > 0 then
      begin

        cmbFeeNo.Items.Add('�Ϲݿ��');
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


    with qryGateRule do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from gaterule');
      Open;
    end;

  except
    on E: Exception do
    begin
      ExceptLogging('TfrmGateRule.FormShow: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmGateRule.qryGateRuleIoTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryGateRuleIoType.Value of
    0: Text:= '����';
    1: Text:= '����';
  end;
end;

procedure TfrmGateRule.qryGateRuleTKTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryGateRuleTKType.Value of
    1: Text:= '�Ϲ�����';
    2: Text:= '��������';
  end;
end;

end.



