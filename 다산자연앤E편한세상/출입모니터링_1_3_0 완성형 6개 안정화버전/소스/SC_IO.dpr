program SC_IO;

uses
  Forms,
  Windows,
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
  IOAllData in 'IOAllData.pas' {frmIOAllData},
  NomalCar_Management in 'NomalCar_Management.pas' {frmNomalCar_Management};

{$R *.res}
	Var
  Mutex: THandle;

begin
  {Mutex := CreateMutex(nil, True, '정기차량출입관리');

  if (Mutex > 0) and (GetLastError = 0) then
  begin
    try
      Application.Initialize;
      //Application.MainFormOnTaskbar := True;
      Application.Title := '정기차량출입관리';
      Application.CreateForm(TfrmMain, frmMain);
      Application.CreateForm(TdmTables, dmTables);
      Application.Run;
    except
      Application.Terminate;
    end;

    if Mutex > 0 then
      CloseHandle(Mutex);
  end;}

  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '정기차량출입관리';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTables, dmTables);
  Application.CreateForm(TfrmIOAllData, frmIOAllData);
  Application.CreateForm(TfrmNomalCar_Management, frmNomalCar_Management);
  Application.Run;
end.
