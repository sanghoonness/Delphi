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
  PaySelect in 'PaySelect.pas' {frmPaySelect};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '요금계산기';
  Application.CreateForm(TfrmMainNew, frmMainNew);
  Application.CreateForm(TdmTables, dmTables);
  Application.Run;
end.
