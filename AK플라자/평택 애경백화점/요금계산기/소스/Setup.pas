unit Setup;

interface

uses
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, AdvGlowButton, Mask, AdvEdit, StdCtrls, AdvCombo, ExtCtrls,
//  AdvPanel, DB, ADODB, Buttons, AdvSpin, sMaskEdit, sCustomComboEdit,
//  sTooledit, sAlphaListBox, Menus, Spin, AdvOfficeButtons;
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, Data.DB,
  Data.Win.ADODB, Vcl.Buttons, Vcl.StdCtrls, AdvSpin, Vcl.Mask, AdvEdit,
  AdvCombo, Vcl.ExtCtrls, AdvPanel;

type
  TfrmSetup = class(TForm)
    AdvPanel1: TAdvPanel;
    Bevel4: TBevel;
    Label99: TLabel;
    Bevel13: TBevel;
    Label13: TLabel;
    cmbUnitNo: TAdvComboBox;
    cmbParkNo: TAdvComboBox;
    edtParkName: TAdvEdit;
    edtUnitName: TAdvEdit;
    Bevel2: TBevel;
    Label2: TLabel;
    qryUnitNo: TADOQuery;
    qryUnitNoParkNo: TSmallintField;
    qryUnitNoUnitNo: TWordField;
    qryUnitNoUnitName: TStringField;
    qryUnitNoUnitKind: TWordField;
    qryUnitNoMyNo: TWordField;
    qryUnitNoComPort: TWordField;
    qryUnitNoBaudrate: TWordField;
    qryUnitNoIPNo: TStringField;
    qryUnitNoPortNo: TIntegerField;
    qryUnitNoReserve1: TStringField;
    qryUnitNoReserve2: TStringField;
    qryUnitNoReserve3: TStringField;
    qryUnitNoReserve4: TStringField;
    qryUnitNoReserve5: TStringField;
    qryParkNo: TADOQuery;
    qry1: TADOQuery;
    qryUnitKind: TADOQuery;
    qryUnitKindUnitKind: TWordField;
    qryUnitKindKindName: TStringField;
    qryUnitKindReserve1: TStringField;
    qryUnitKindReserve2: TStringField;
    qryUnitKindReserve3: TStringField;
    qryUnitKindReserve4: TStringField;
    qryUnitKindReserve5: TStringField;
    qryUnitNoKindName: TStringField;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    qryParkNoParkNo: TSmallintField;
    qryParkNoParkName: TStringField;
    qryParkNoParkAddr: TStringField;
    qryParkNoRegNo: TStringField;
    qryParkNoAdmin: TStringField;
    qryParkNoTelephone: TStringField;
    qryParkNoReceipt: TStringField;
    qryParkNoDayMax: TIntegerField;
    qryParkNoTotMax: TIntegerField;
    qryParkNoCalcType: TWordField;
    qryParkNoClosingTime: TStringField;
    qryParkNoAutoClosing: TWordField;
    qryParkNoHolidayProc: TWordField;
    qryParkNoReceiptAuto: TWordField;
    qryParkNoReceiptZero: TWordField;
    qryParkNoTaxType: TWordField;
    qryParkNoJunkType: TWordField;
    qryParkNoRoundType: TWordField;
    qryParkNoTimeDCType: TWordField;
    qryParkNoCurrencyType: TWordField;
    qryParkNoDCReason: TWordField;
    qryParkNoLostCalc: TWordField;
    qryParkNoLostAmount: TIntegerField;
    qryParkNoSpecialTariff: TWordField;
    qryParkNoCommercialCar: TWordField;
    qryParkNoParkingDayMax: TWordField;
    qryParkNoDCCntMax: TWordField;
    qryParkNoVanIP: TStringField;
    qryParkNoVanPort: TIntegerField;
    qryParkNoReserve1: TStringField;
    qryParkNoReserve2: TStringField;
    qryParkNoReserve3: TStringField;
    qryParkNoReserve4: TStringField;
    qryParkNoReserve5: TStringField;
    Bevel1: TBevel;
    Label1: TLabel;
    edtImage: TAdvEdit;
    edtDBIp: TAdvEdit;
    Bevel3: TBevel;
    Label3: TLabel;
    edtDBID: TAdvEdit;
    Bevel5: TBevel;
    Label4: TLabel;
    edtDBPW: TAdvEdit;
    Bevel6: TBevel;
    Label5: TLabel;
    cmbAutoCalc: TAdvComboBox;
    Bevel7: TBevel;
    Label6: TLabel;
    cmbZeroOpen: TAdvComboBox;
    Bevel8: TBevel;
    Label7: TLabel;
    cmbCancelCheck: TAdvComboBox;
    Bevel9: TBevel;
    Label8: TLabel;
    cmbCancelLog: TAdvComboBox;
    Bevel10: TBevel;
    Label9: TLabel;
    cmbClosingText: TAdvComboBox;
    Bevel11: TBevel;
    Label10: TLabel;
    cmbClosingReprint: TAdvComboBox;
    Bevel12: TBevel;
    Label11: TLabel;
    cmbReceipt: TAdvComboBox;
    Bevel14: TBevel;
    Label12: TLabel;
    cmbCalcType: TAdvComboBox;
    Bevel15: TBevel;
    Label14: TLabel;
    cmbManualIn: TAdvComboBox;
    Bevel16: TBevel;
    Label15: TLabel;
    cmbCancel: TAdvComboBox;
    Bevel17: TBevel;
    Label16: TLabel;
    cmbCarSearch: TAdvComboBox;
    Bevel18: TBevel;
    Label17: TLabel;
    cmbCancelReason: TAdvComboBox;
    Bevel19: TBevel;
    Label18: TLabel;
    cmbManualOpen: TAdvComboBox;
    Bevel20: TBevel;
    Label19: TLabel;
    cmbCredit: TAdvComboBox;
    Bevel21: TBevel;
    Label20: TLabel;
    cmbCashReceipt: TAdvComboBox;
    Bevel22: TBevel;
    Label21: TLabel;
    cmbBarcodeDC: TAdvComboBox;
    Bevel23: TBevel;
    Label22: TLabel;
    cmbInterimClosing: TAdvComboBox;
    Bevel24: TBevel;
    Label23: TLabel;
    cmbInterimPrint: TAdvComboBox;
    Bevel25: TBevel;
    Label24: TLabel;
    edtHostIP: TAdvMaskEdit;
    Bevel26: TBevel;
    Label25: TLabel;
    edtHostPort: TAdvSpinEdit;
    Bevel27: TBevel;
    Label26: TLabel;
    edtLogo: TAdvEdit;
    btnOd: TButton;
    od1: TOpenDialog;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cmbParkNoChange(Sender: TObject);
    procedure cmbUnitNoChange(Sender: TObject);
    procedure btnOdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmSetup.btnOdClick(Sender: TObject);
begin
  if od1.Execute = True then
  begin
    edtLogo.Text:= od1.FileName;
  end;
end;

procedure TfrmSetup.btnSaveClick(Sender: TObject);
begin
  try
    iSetup.WriteInteger('PARKING', 'ParkNo', StrToInt(cmbParkNo.Text));
    iSetup.WriteInteger('PARKING', 'UnitNo', StrToInt(cmbUnitNo.Text));
    iSetup.WriteString('PARKING', 'LPRImage', edtImage.Text);
    iSetup.WriteString('PARKING', 'Logo File', edtLogo.Text);

    if MG_StrTrim(aString(edtDBIP.Text), ' ') <> '' then
      iSetup.WriteString('PARKING', 'DB IP', edtDBIP.Text)
    else
    begin
      ShowMessage('DB IP�� �Է��Ͽ��ּ���!');
      edtDBIP.SetFocus;
      Exit;
    end;

    if MG_StrTrim(aString(edtDBID.Text), ' ') <> '' then
      iSetup.WriteString('PARKING', 'DB ID', edtDBID.Text)
    else
    begin
      ShowMessage('DB ID�� �Է��Ͽ��ּ���!');
      edtDBID.SetFocus;
      Exit;
    end;

    if MG_StrTrim(aString(edtDBPW.Text), ' ') <> '' then
      iSetup.WriteString('PARKING', 'DB PW', edtDBPW.Text)
    else
    begin
      ShowMessage('DB PW�� �Է��Ͽ��ּ���!');
      edtDBPW.SetFocus;
      Exit;
    end;

    iSetup.WriteInteger('PARKING', '�ڵ���ݰ��', cmbAutoCalc.ItemIndex);
    iSetup.WriteInteger('PARKING', '0���ڵ�����', cmbZeroOpen.ItemIndex);
    iSetup.WriteInteger('PARKING', '����������������', cmbClosingText.ItemIndex);
    iSetup.WriteInteger('PARKING', '���������', cmbClosingReprint.ItemIndex);
    iSetup.WriteInteger('PARKING', '�����������', cmbReceipt.ItemIndex);
    iSetup.WriteInteger('PARKING', '�����˻�', cmbCarSearch.ItemIndex);
    iSetup.WriteInteger('PARKING', '��������', cmbManualIn.ItemIndex);
    iSetup.WriteInteger('PARKING', '������', cmbCalcType.ItemIndex);
    iSetup.WriteInteger('PARKING', '�������', cmbCancel.ItemIndex);
    iSetup.WriteInteger('PARKING', '������һ����Է�', cmbCancelReason.ItemIndex);
    iSetup.WriteInteger('PARKING', '�������Ȯ��', cmbCancelCheck.ItemIndex);
    iSetup.WriteInteger('PARKING', '������ҷα�����', cmbCancelLog.ItemIndex);
    iSetup.WriteInteger('PARKING', '������������Է�', cmbManualOpen.ItemIndex);
    iSetup.WriteInteger('PARKING', '�ſ�ī�����', cmbCredit.ItemIndex);
    iSetup.WriteInteger('PARKING', '���ݿ���������', cmbCashReceipt.ItemIndex);
    iSetup.WriteInteger('PARKING', '���ڵ����αǻ��', cmbBarcodeDC.ItemIndex);
    iSetup.WriteInteger('PARKING', '�߰�����', cmbInterimClosing.ItemIndex);
    iSetup.WriteInteger('PARKING', '�߰��������', cmbInterimPrint.ItemIndex);
    iSetup.WriteString('PARKING', 'Host IP', MG_StrTrim(edtHostIP.Text, ' '));
    iSetup.WriteInteger('PARKING', 'Host Port', edtHostPort.Value);

    nCurrParkNo:= StrToInt(cmbParkNo.Text);
    nCurrUnitNo:= StrToInt(cmbUnitNo.Text);
    bSetupChange:= True;
    ShowMessage('����� ����!!');
  except
    on E: Exception do ExceptLogging('TfrmSetup.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmSetup.FormShow(Sender: TObject);
var
  nParkNo: Integer;
begin
  try
    if dmTables.ADODB.Connected then
    begin
      qryUnitKind.Open;

      with qryParkNo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from ParkInfo');
        Open;
        cmbParkNo.Items.Clear;

        if RecordCount > 0 then
        begin
          nParkNo:= FieldByName('ParkNo').AsInteger;
          edtParkName.Text:= FieldByName('ParkName').AsString;

          while not Eof do
          begin
            cmbParkNo.Items.Add(IntToStr(FieldByName('ParkNo').AsInteger));
            Next;
          end;

          if nCurrParkNo <> 0 then
          begin
            with qry1 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Select * from ParkInfo where ParkNo = :N1');
              Parameters.ParamByName('N1').Value:= nCurrParkNo;
              Open;

              if RecordCount > 0 then
              begin
                edtParkName.Text:= FieldByName('ParkName').AsString;
                cmbParkNo.Text:= IntToStr(nCurrParkNo);
              end
              else
              begin
                ShowMessage(IntToStr(nCurrParkNo) + '�� �������� HOST���� �����Ǿ����ϴ�.'#13#13#10 +
                            'Ȯ���Ͽ��ּ���');
                btnSave.Enabled:= False;
                Exit;
              end;
            end;
          end
          else
            cmbParkNo.ItemIndex:= 0;

          with qryUnitNo do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from UnitInfo ');
            SQL.Add('Where ParkNo = :N1 and UnitKind = :N2 Order By ParkNo, UnitNo');
            Parameters.ParamByName('N1').Value:= nParkNo;
            Parameters.ParamByName('N2').Value:= 3;
            Open;
            cmbUnitNo.Items.Clear;

            if RecordCount > 0 then
            begin
              edtUnitName.Text:= FieldByName('UnitName').AsString;

              while not Eof do
              begin
                cmbUnitNo.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
                Next;
              end;

              if nCurrUnitNo <> 0 then
              begin
                with qry1 do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Add('Select * from UnitInfo where UnitNo = :N1');
                  Parameters.ParamByName('N1').Value:= nCurrUnitNo;
                  Open;

                  if RecordCount > 0 then
                  begin
                    edtUnitName.Text:= FieldByName('UnitName').AsString;
                    cmbUnitNo.Text:= IntToStr(nCurrUnitNo);
                  end
                  else
                  begin
                    ShowMessage(IntToStr(nCurrParkNo) + '�� ��Ⱑ HOST���� �����Ǿ����ϴ�.'#13#13#10 +
                                'Ȯ���Ͽ��ּ���');
                    btnSave.Enabled:= True;
                    Exit;
                  end;
                end;
              end
              else
                cmbUnitNo.ItemIndex:= 0;
            end
            else
            begin
              ShowMessage('HOST�� ��⼳������ ��ݰ��⸦ ����Ͽ��ּ���!!!');
              btnSave.Enabled:= True;
              Exit;
            end;
          end;
        end
        else
        begin
          ShowMessage('HOST���� �������� ���� �����Ͽ��ּ���!!!');
          btnSave.Enabled:= False;
          Exit;
        end;
      end;
    end;
    cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(iSetup.ReadInteger('PARKING', 'ParkNo', 0)));
    cmbUnitNo.ItemIndex:= cmbUnitNo.Items.IndexOf(IntToStr(iSetup.ReadInteger('PARKING', 'UnitNo', 0)));
    edtImage.Text:= aString(iSetup.ReadString('PARKING', 'LPRImage', 'C:\LPRImage'));

    if sDBIP <> '' then edtDBIP.Text:= sDBIP;
    if sDBID <> '' then edtDBID.Text:= sDBID;
    if sDBPW <> '' then edtDBPW.Text:= sDBPW;

    cmbAutoCalc.ItemIndex      := iSetup.ReadInteger('PARKING', '�ڵ���ݰ��', 1);
    cmbZeroOpen.ItemIndex      := iSetup.ReadInteger('PARKING', '0���ڵ�����', 1);
    cmbClosingText.ItemIndex   := iSetup.ReadInteger('PARKING', '����������������', 0);
    cmbClosingReprint.ItemIndex:= iSetup.ReadInteger('PARKING', '���������', 0);
    cmbReceipt.ItemIndex       := iSetup.ReadInteger('PARKING', '�����������', 0);
    cmbCarSearch.ItemIndex     := iSetup.ReadInteger('PARKING', '�����˻�', 1);
    cmbManualIn.ItemIndex      := iSetup.ReadInteger('PARKING', '��������', 0);
    cmbCalcType.ItemIndex      := iSetup.ReadInteger('PARKING', '������', 0);
    cmbCancel.ItemIndex        := iSetup.ReadInteger('PARKING', '�������', 1);
    cmbCancelReason.ItemIndex  := iSetup.ReadInteger('PARKING', '������һ����Է�', 0);
    cmbCancelCheck.ItemIndex   := iSetup.ReadInteger('PARKING', '�������Ȯ��', 0);
    cmbCancelLog.ItemIndex     := iSetup.ReadInteger('PARKING', '������ҷα�����', 0);
    cmbManualOpen.ItemIndex    := iSetup.ReadInteger('PARKING', '������������Է�', 0);
    cmbCredit.ItemIndex        := iSetup.ReadInteger('PARKING', '�ſ�ī�����', 0);
    cmbCashReceipt.ItemIndex   := iSetup.ReadInteger('PARKING', '���ݿ���������', 0);
    cmbBarcodeDC.ItemIndex     := iSetup.ReadInteger('PARKING', '���ڵ����αǻ��', 0);
    cmbInterimClosing.ItemIndex:= iSetup.ReadInteger('PARKING', '�߰�����', 0);
    cmbInterimPrint.ItemIndex  := iSetup.ReadInteger('PARKING', '�߰��������', 0);
    edtHostIP.Text             := MG_StrTrim(iSetup.ReadString('PARKING', 'Host IP', ''), ' ');
    edtHostPort.Value          := iSetup.ReadInteger('PARKING', 'Host Port', 0);
    edtLogo.Text               := aString(iSetup.ReadString('PARKING', 'Logo File', ''));
  except
    on E: Exception do ExceptLogging('TfrmSetup.FormShow: ' + E.Message);
  end;
end;

procedure TfrmSetup.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.cmbParkNoChange(Sender: TObject);
begin
  try
    if cmbParkNo.ItemIndex > -1 then
    begin
      cmbUnitNo.Items.Clear;
      edtUnitName.Text:= '';

      with dmTables do
      begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from ParkInfo where ParkNo = :N1');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Open;

          if RecordCount > 0 then edtParkName.Text:= FieldByName('ParkName').AsString;

          Close;
          SQL.Clear;
          SQL.Add('Select * from UnitInfo ');
          SQL.Add('Where ParkNo = :N1 and UnitKind = :N2 Order By ParkNo, UnitNo');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= 3;
          Open;

          if RecordCount > 0 then
          begin
            btnSave.Enabled:= True;
            edtUnitName.Text:= FieldByName('UnitName').AsString;

            while not Eof do
            begin
              cmbUnitNo.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
              Next;
            end;
            cmbUnitNo.ItemIndex:= 0;
          end
          else
          begin
            ShowMessage(cmbParkNo.Text + ' �� �����忡�� ��ݰ��Ⱑ ��ϵǾ����� �ʽ��ϴ�. '#13#13#10 +
                        'HOST�� ��⼳������ ��ݰ��⸦ ����Ͽ��ּ���!!!');
            btnSave.Enabled:= False;
            Exit;
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmSetup.cmbParkNoChange: ' + E.Message);
  end;
end;

procedure TfrmSetup.cmbUnitNoChange(Sender: TObject);
begin
  try
    if cmbUnitNo.ItemIndex > -1 then
    begin
      edtUnitName.Text:= '';

      with dmTables.qryTemp do
      begin
        Close;
        SQL.Add('Select * from UnitInfo ');
        SQL.Add('Where ParkNo = :N1 and UnitNo = :N2 and UnitKind = :N3');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= StrToInt(cmbUnitNo.Text);
        Parameters.ParamByName('N3').Value:= 3;
        Open;

        if RecordCount > 0 then edtUnitName.Text:= FieldByName('UnitName').AsString;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmSetup.cmbUnitNoChange: ' + E.Message);
  end;
end;

end.
