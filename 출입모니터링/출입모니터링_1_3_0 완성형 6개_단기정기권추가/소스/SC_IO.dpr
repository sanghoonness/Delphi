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
  DspSet in 'DspSet.pas' {frmDspSet},
  Msg in 'Msg.pas' {frmMessage},
  Alarm in 'Alarm.pas' {frmAlarm},
  IONData in 'IONData.pas' {frmIONData},
  kdOneHomeInfo in 'kdOneHomeInfo.pas',
  AptnerThd in 'AptnerThd.pas',
  mzClientSocket in 'mzClientSocket.pas',
  VillageThd in 'VillageThd.pas',
  LightThd in 'LightThd.pas',
  HwlHomeNet in 'HwlHomeNet.pas',
  EasyOnHomeInfo in 'EasyOnHomeInfo.pas',
  XSuperJSON in 'JSON_LIB\XSuperJSON.pas',
  XSuperObject in 'JSON_LIB\XSuperObject.pas',
  uUtils in 'COMMON\uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '정기차량출입관리';
  Application.CreateForm(TdmTables, dmTables);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
