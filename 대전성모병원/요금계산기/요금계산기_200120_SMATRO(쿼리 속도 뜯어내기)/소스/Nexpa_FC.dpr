program Nexpa_FC;

uses
  Forms,
  Tables in 'Tables.pas' {dmTables: TDataModule},
  Global in 'Global.pas',
  Login in 'Login.pas' {frmLogin},
  Progress in 'Progress.pas' {frmProgress},
  Setup in 'Setup.pas' {frmSetup},
  UnitInfo in 'UnitInfo.pas' {frmUnitInfo},
  Closing in 'Closing.pas' {frmClosing},
  FeeDetail in 'FeeDetail.pas' {frmFeeDetail},
  InDspSet in 'InDspSet.pas' {frmInDspSet},
  DspSet in 'DspSet.pas' {frmDspSet},
  MainNew in 'MainNew.pas' {frmMainNew},
  PaySelect in 'PaySelect.pas' {frmPaySelect},
  ClosingPrint in 'ClosingPrint.pas' {frmClosingPrint},
  ReceiptPrt in 'ReceiptPrt.pas' {frmReceiptPrt},
  Msg in 'Msg.pas' {frmMessage},
  CashOption in 'CashOption.pas' {frmCashOption},
  Cancel_SMT in 'Cancel_SMT.pas' {frmCancel_SMT},
  Cash_SMT in 'Cash_SMT.pas' {frmCash_SMT},
  Credit_SMT in 'Credit_SMT.pas' {frmCredit_SMT};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '요금계산기';
  Application.CreateForm(TfrmMainNew, frmMainNew);
  Application.CreateForm(TdmTables, dmTables);
  Application.Run;
end.
