program SC_IO;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Tables in 'Tables.pas' {dmTables: TDataModule},
  Setup in 'Setup.pas' {frmSetup},
  UnitInfo in 'UnitInfo.pas' {frmUnitInfo},
  Global in 'Global.pas',
  Login in 'Login.pas' {frmLogin},
  InDspSet in 'InDspSet.pas' {frmInDspSet},
  DspSet in 'DspSet.pas' {frmDspSet};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '�����������԰���';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTables, dmTables);
  Application.Run;
end.
