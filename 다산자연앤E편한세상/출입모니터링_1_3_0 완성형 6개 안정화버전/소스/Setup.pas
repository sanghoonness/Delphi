unit Setup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvCombo, Lucombo,
  AdvEdit, advlued, AdvTabSet, AdvSmoothTabPager, Vcl.Mask, system.IniFiles, CodeSiteLogging;

type
  TfrmSetup = class(TForm)
    tbSetting: TAdvSmoothTabPager;
    stb1: TAdvSmoothTabPage;
    stb2: TAdvSmoothTabPage;
    stb3: TAdvSmoothTabPage;
    GroupBox3: TGroupBox;
    edt1_OP2: TLUCombo;
    edt1_OP1: TLUCombo;
    GroupBox1: TGroupBox;
    edt1_DB1: TAdvLUEdit;
    edt1_DB5: TAdvLUEdit;
    edt1_DB2: TAdvLUEdit;
    edt1_DB3: TAdvLUEdit;
    edt1_DB4: TAdvLUEdit;
    GroupBox5: TGroupBox;
    edt1_OP3: TLUCombo;
    edt1_OP5: TLUCombo;
    edt1_OP6: TLUCombo;
    edt1_OP7: TAdvMaskEdit;
    edt1_OP8: TAdvMaskEdit;
    edt1_OP9: TLUCombo;
    edt1_OP10: TLUCombo;
    edt1_Visit1: TLUCombo;
    edt1_Visit2: TLUCombo;
    edt1_Visit3: TAdvLUEdit;
    edt1_Visit4: TAdvLUEdit;
    edt1_Visit5: TAdvLUEdit;
    edt1_Visit6: TAdvLUEdit;
    edt1_Visit7: TAdvLUEdit;
    edt1_Visit8: TAdvLUEdit;
    edt1_Visit9: TAdvLUEdit;
    edt1_Visit10: TAdvLUEdit;
    edt1_Visit11: TAdvLUEdit;
    edt1_Visit12: TAdvLUEdit;
    edt1_Visit13: TAdvLUEdit;
    edt1_Visit14: TAdvLUEdit;
    GroupBox7: TGroupBox;
    edt1_LPR1: TLUCombo;
    edt1_LPR3: TLUCombo;
    edt1_LPR2: TLUCombo;
    edt1_OP11: TLUCombo;
    edt1_OP12: TLUCombo;
    edt1_OP13: TLUCombo;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    edt2_Default5: TLUCombo;
    edt2_Default1: TAdvLUEdit;
    edt2_Default2: TAdvLUEdit;
    edt2_Default3: TAdvLUEdit;
    edt2_Default4: TAdvLUEdit;
    edt2_Default6: TAdvLUEdit;
    edt2_Default7: TAdvLUEdit;
    edt2_Default8: TAdvLUEdit;
    edt2_Default9: TAdvLUEdit;
    edt2_Default10: TAdvLUEdit;
    edt2_Default11: TAdvLUEdit;
    GroupBox8: TGroupBox;
    edt2_DefStr1: TLUCombo;
    GroupBox9: TGroupBox;
    edt2_DefStr2: TAdvLUEdit;
    edt2_DefStr4: TAdvLUEdit;
    edt2_DefStr6: TAdvLUEdit;
    edt2_DefStr8: TAdvLUEdit;
    edt2_DefStr9: TAdvLUEdit;
    edt2_DefStr7: TAdvLUEdit;
    edt2_DefStr5: TAdvLUEdit;
    edt2_DefStr3: TAdvLUEdit;
    GroupBox10: TGroupBox;
    edt2_DefStr10: TAdvLUEdit;
    edt2_DefStr12: TAdvLUEdit;
    edt2_DefStr14: TAdvLUEdit;
    edt2_DefStr16: TAdvLUEdit;
    edt2_DefStr17: TAdvLUEdit;
    edt2_DefStr15: TAdvLUEdit;
    edt2_DefStr13: TAdvLUEdit;
    edt2_DefStr11: TAdvLUEdit;
    GroupBox11: TGroupBox;
    edt2_DefStr18: TAdvLUEdit;
    edt2_DefStr20: TAdvLUEdit;
    edt2_DefStr22: TAdvLUEdit;
    edt2_DefStr24: TAdvLUEdit;
    edt2_DefStr25: TAdvLUEdit;
    edt2_DefStr23: TAdvLUEdit;
    edt2_DefStr21: TAdvLUEdit;
    edt2_DefStr19: TAdvLUEdit;
    GroupBox12: TGroupBox;
    edt2_DefStr26: TAdvLUEdit;
    edt2_DefStr28: TAdvLUEdit;
    edt2_DefStr30: TAdvLUEdit;
    edt2_DefStr32: TAdvLUEdit;
    edt2_DefStr33: TAdvLUEdit;
    edt2_DefStr31: TAdvLUEdit;
    edt2_DefStr29: TAdvLUEdit;
    edt2_DefStr27: TAdvLUEdit;
    GroupBox13: TGroupBox;
    edt2_DefStr34: TAdvLUEdit;
    edt2_DefStr36: TAdvLUEdit;
    edt2_DefStr38: TAdvLUEdit;
    edt2_DefStr40: TAdvLUEdit;
    edt2_DefStr41: TAdvLUEdit;
    edt2_DefStr39: TAdvLUEdit;
    edt2_DefStr37: TAdvLUEdit;
    edt2_DefStr35: TAdvLUEdit;
    stb4: TAdvSmoothTabPage;
    GroupBox2: TGroupBox;
    edt4_home7: TAdvLUEdit;
    edt4_home5: TAdvLUEdit;
    edt4_home6: TAdvLUEdit;
    edt3_Black1: TLUCombo;
    edt3_Black6: TAdvLUEdit;
    edt3_Black3: TLUCombo;
    edt3_Black5: TAdvLUEdit;
    edt3_Black7: TLUCombo;
    edt3_Black8: TAdvLUEdit;
    edt3_Black9: TLUCombo;
    edt3_Black10: TLUCombo;
    edt3_Black2: TLUCombo;
    edt3_Black4: TAdvLUEdit;
    GroupBox14: TGroupBox;
    edt3_Sp1: TLUCombo;
    edt3_Sp2: TLUCombo;
    edt3_Sp3: TAdvLUEdit;
    edt3_Sp4: TLUCombo;
    edt3_Sp5: TLUCombo;
    edt3_Sp6: TLUCombo;
    edt3_Sp7: TLUCombo;
    edt3_Sp8: TLUCombo;
    edt3_Sp9: TAdvLUEdit;
    edt3_Sp10: TLUCombo;
    edt4_home1: TLUCombo;
    edt4_home3: TAdvLUEdit;
    edt4_home8: TLUCombo;
    edt4_home2: TLUCombo;
    edt4_home4: TAdvLUEdit;
    edt4_home9: TLUCombo;
    edt4_home10: TAdvLUEdit;
    edt4_home11: TAdvLUEdit;
    edt4_home12: TAdvLUEdit;
    edt4_home13: TAdvLUEdit;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    edt4_home14: TLUCombo;
    edt4_home15: TAdvLUEdit;
    edt4_home16: TAdvLUEdit;
    edt4_home17: TAdvLUEdit;
    edt4_home18: TAdvLUEdit;
    edt4_home19: TAdvLUEdit;
    edt4_home20: TLUCombo;
    edt4_home22: TAdvLUEdit;
    edt4_home23: TAdvLUEdit;
    edt4_home24: TAdvLUEdit;
    edt4_home25: TAdvLUEdit;
    edt4_home21: TAdvMaskEdit;
    GroupBox17: TGroupBox;
    edt4_home26: TAdvLUEdit;
    edt4_home27: TAdvLUEdit;
    stb5: TAdvSmoothTabPage;
    GroupBox18: TGroupBox;
    edt5_RecvConn1: TAdvLUEdit;
    edt5_RecvConn2: TAdvLUEdit;
    edt5_RecvConn3: TAdvLUEdit;
    GroupBox19: TGroupBox;
    edt5_Lamp1: TAdvLUEdit;
    edt5_Lamp2: TAdvLUEdit;
    edt5_Lamp3: TAdvLUEdit;
    edt5_RecvConn4: TAdvLUEdit;
    edt5_RecvConn5: TAdvLUEdit;
    btnSave: TButton;
    btnExit: TButton;
    edt1_OP4: TLUCombo;
    edt4_home28: TLUCombo;
    edt4_home29: TAdvLUEdit;
    Label1: TLabel;
    edt1_OP14: TLUCombo;
    edt1_Visit15: TLUCombo;
    edt1_Visit16: TAdvLUEdit;
    edt2_Default12: TLUCombo;
    edt1_OP15: TLUCombo;
    edt1_Visit17: TLUCombo;
    edt2_Default13: TLUCombo;
    edt1_Visit18: TLUCombo;
    edt2_Default14: TAdvLUEdit;
    edt2_Default15: TAdvLUEdit;
    edt2_Default16: TAdvLUEdit;
    edt1_OP16: TLUCombo;
    edt1_OP17: TLUCombo;
    edt4_home30: TLUCombo;
    edt2_Default17: TLUCombo;
    edt1_OP18: TLUCombo;
    edt4_home31: TAdvLUEdit;
    edt2_Default18: TAdvLUEdit;
    GroupBox20: TGroupBox;
    edt2_DefStr42: TAdvLUEdit;
    edt2_DefStr44: TAdvLUEdit;
    edt2_DefStr46: TAdvLUEdit;
    edt2_DefStr48: TAdvLUEdit;
    edt2_DefStr49: TAdvLUEdit;
    edt2_DefStr47: TAdvLUEdit;
    edt2_DefStr45: TAdvLUEdit;
    edt2_DefStr43: TAdvLUEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    function ReadINI(iSession, iKey, iValue: string; flag: Integer=0): Variant;
    procedure WriteINI(iSession, iKey, iValue: string; flag: Integer=0);
    procedure WriteINI2(iSession, iKey: string; iValue: Integer);
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;
  iSetup: TIniFile;
const
  PARK = 'PARKING';
  DSP = 'DISPLAY';
  HINTSTR = '?????????? ?????? ????';

implementation

uses
  Global;
{$R *.dfm}

procedure TfrmSetup.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.btnSaveClick(Sender: TObject);
begin
  try
    //????????
    WriteINI(PARK,'DB IP',                 edt1_DB1.Text);
    WriteINI(PARK,'DB ID',                 edt1_DB2.Text);
    WriteINI(PARK,'DB PW',                 edt1_DB3.Text);
    WriteINI(PARK,'DB Name',               edt1_DB4.Text);
    WriteINI(PARK,'UnitNo',                edt1_DB5.Text);
    WriteINI2(PARK,'????LPR??',             edt1_LPR1.ItemIndex);
    WriteINI2(PARK,'????LPR??',             edt1_LPR2.ItemIndex);
    WriteINI2(PARK,'??????',                edt1_LPR3.ItemIndex);
    WriteINI2(PARK,'?????? ????????',       edt1_OP1.ItemIndex);
    WriteINI2(PARK,'?????? ????',           edt1_OP2.ItemIndex);
    WriteINI2(PARK,'????????',              edt1_OP3.ItemIndex);
    WriteINI2(PARK,'LPR??????????????',     edt1_OP4.ItemIndex);
    WriteINI2(PARK,'???????? ????????????', edt1_OP5.ItemIndex);
    WriteINI2(PARK,'?????????? ????????????',edt1_OP17.ItemIndex);
    WriteINI2(PARK,'????????????????',      edt1_OP6.ItemIndex);
    WriteINI(PARK,'????????',              edt1_OP7.Text);
    WriteINI(PARK,'????????',              edt1_OP7.Text);
    WriteINI2(PARK,'MI_IN',                 edt1_OP9.ItemIndex);
    WriteINI2(PARK,'6Proc',                 edt1_OP10.ItemIndex);
    WriteINI2(PARK,'??????',                edt1_OP14.ItemIndex);
    WriteINI2(PARK,'??????',                edt1_OP11.ItemIndex);
    WriteINI2(PARK,'????????????',          edt1_OP12.ItemIndex);
    WriteINI2(PARK,'mMirrorDsp',            edt1_OP13.ItemIndex);
    WriteINI2(PARK,'????????',              edt1_OP15.ItemIndex);
    WriteINI2(PARK,'??????',                edt1_OP16.ItemIndex);
    WriteINI2(PARK,'????????',              edt1_OP18.ItemIndex);
    WriteINI2(PARK,'??????',                edt1_Visit1.ItemIndex);
    WriteINI2(PARK,'AutoVisitOpen',         edt1_Visit2.ItemIndex);
    WriteINI2(PARK,'??????????',            edt1_Visit15.ItemIndex);
    WriteINI(PARK,'????????????',           edt1_Visit16.Text);
    WriteINI2(PARK,'??????????',            edt1_Visit17.ItemIndex);
    WriteINI2(PARK,'??????????????',        edt1_Visit18.ItemIndex);
    WriteINI(PARK,'msg01',                 edt1_Visit3.Text);
    WriteINI(PARK,'msg02',                 edt1_Visit4.Text);
    WriteINI(PARK,'msg03',                 edt1_Visit5.Text);
    WriteINI(PARK,'msg04',                 edt1_Visit6.Text);
    WriteINI(PARK,'msg05',                 edt1_Visit7.Text);
    WriteINI(PARK,'msg06',                 edt1_Visit8.Text);
    WriteINI(PARK,'msg07',                 edt1_Visit9.Text);
    WriteINI(PARK,'msg08',                 edt1_Visit10.Text);
    WriteINI(PARK,'msg09',                 edt1_Visit11.Text);
    WriteINI(PARK,'msg10',                 edt1_Visit12.Text);
    WriteINI(PARK,'msg11',                 edt1_Visit13.Text);
    WriteINI(PARK,'msg12',                 edt1_Visit14.Text);

    //??????????
    WriteINI(DSP,'IN_DSP_SPEED',           edt2_Default1.Text           );
    WriteINI(DSP,'IN_DSP_TIME',            edt2_Default2.Text          );
    WriteINI(DSP,'DSP_SPEED',              edt2_Default3.Text           );
    WriteINI(DSP,'DSP_TIME',               edt2_Default4.Text       );
    WriteINI2(DSP,'????????????',          edt2_Default5.ItemIndex           );
    WriteINI(DSP,'????????????',           edt2_Default6.Text           );
    WriteINI(DSP,'????????????',           edt2_Default7.Text           );
    WriteINI(DSP,'RecvInDsp',              edt2_Default8.Text        );
    WriteINI(DSP,'RecvOutDsp',             edt2_Default9.Text         );
    WriteINI(DSP,'NomalInDsp',             edt2_Default10.Text         );
    WriteINI(DSP,'NomalOutDsp',            edt2_Default11.Text          );
    WriteINI2(DSP,'??????????',            edt2_Default12.ItemIndex       );
    WriteINI2(DSP,'??????????????',        edt2_Default17.ItemIndex       );

    WriteINI2(DSP,'??????????????',        edt2_Default13.ItemIndex       );
    WriteINI(DSP,'????????????????',       edt2_Default14.Text          );
    WriteINI(DSP,'????????????',           edt2_Default18.Text          );
    WriteINI(DSP,'VisitInDsp',             edt2_Default15.Text          );
    WriteINI(DSP,'VisitOutDsp',            edt2_Default16.Text          );

    WriteINI2(DSP,'AllDspStrUse',          edt2_DefStr1.ItemIndex           );
    WriteINI(DSP,'IN_DSP_1_1',             edt2_DefStr2.Text         );
    WriteINI(DSP,'IN_DSP_1_2',             edt2_DefStr3.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_1_1',       edt2_DefStr4.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_1_2',       edt2_DefStr5.Text               );
    WriteINI(DSP,'DSP_1_1',                edt2_DefStr6.Text      );
    WriteINI(DSP,'DSP_1_2',                edt2_DefStr7.Text      );
    WriteINI(DSP,'DSP_COLOR_1_1',          edt2_DefStr8.Text            );
    WriteINI(DSP,'DSP_COLOR_1_2',          edt2_DefStr9.Text            );

    WriteINI(DSP,'IN_DSP_2_1',             edt2_DefStr10.Text         );
    WriteINI(DSP,'IN_DSP_2_2',             edt2_DefStr11.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_2_1',       edt2_DefStr12.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_2_2',       edt2_DefStr13.Text               );
    WriteINI(DSP,'DSP_2_1',                edt2_DefStr14.Text      );
    WriteINI(DSP,'DSP_2_2',                edt2_DefStr15.Text      );
    WriteINI(DSP,'DSP_COLOR_2_1',          edt2_DefStr16.Text            );
    WriteINI(DSP,'DSP_COLOR_2_2',          edt2_DefStr17.Text            );

    WriteINI(DSP,'IN_DSP_3_1',             edt2_DefStr18.Text         );
    WriteINI(DSP,'IN_DSP_3_2',             edt2_DefStr19.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_3_1',       edt2_DefStr20.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_3_2',       edt2_DefStr21.Text               );
    WriteINI(DSP,'DSP_3_1',                edt2_DefStr22.Text      );
    WriteINI(DSP,'DSP_3_2',                edt2_DefStr23.Text      );
    WriteINI(DSP,'DSP_COLOR_3_1',          edt2_DefStr24.Text            );
    WriteINI(DSP,'DSP_COLOR_3_2',          edt2_DefStr25.Text            );

    WriteINI(DSP,'IN_DSP_4_1',             edt2_DefStr26.Text         );
    WriteINI(DSP,'IN_DSP_4_2',             edt2_DefStr27.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_4_1',       edt2_DefStr28.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_4_2',       edt2_DefStr29.Text               );
    WriteINI(DSP,'DSP_4_1',                edt2_DefStr30.Text      );
    WriteINI(DSP,'DSP_4_2',                edt2_DefStr31.Text      );
    WriteINI(DSP,'DSP_COLOR_4_1',          edt2_DefStr32.Text            );
    WriteINI(DSP,'DSP_COLOR_4_2',          edt2_DefStr33.Text            );

    WriteINI(DSP,'IN_DSP_5_1',             edt2_DefStr34.Text         );
    WriteINI(DSP,'IN_DSP_5_2',             edt2_DefStr35.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_5_1',       edt2_DefStr36.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_5_2',       edt2_DefStr37.Text               );
    WriteINI(DSP,'DSP_5_1',                edt2_DefStr38.Text      );
    WriteINI(DSP,'DSP_5_2',                edt2_DefStr39.Text      );
    WriteINI(DSP,'DSP_COLOR_5_1',          edt2_DefStr40.Text            );
    WriteINI(DSP,'DSP_COLOR_5_2',          edt2_DefStr41.Text            );

    WriteINI(DSP,'IN_DSP_6_1',             edt2_DefStr42.Text         );
    WriteINI(DSP,'IN_DSP_6_2',             edt2_DefStr43.Text         );
    WriteINI(DSP,'IN_DSP_COLOR_6_1',       edt2_DefStr44.Text               );
    WriteINI(DSP,'IN_DSP_COLOR_6_2',       edt2_DefStr45.Text               );
    WriteINI(DSP,'DSP_6_1',                edt2_DefStr46.Text      );
    WriteINI(DSP,'DSP_6_2',                edt2_DefStr47.Text      );
    WriteINI(DSP,'DSP_COLOR_6_1',          edt2_DefStr48.Text            );
    WriteINI(DSP,'DSP_COLOR_6_2',          edt2_DefStr48.Text            );

    //????????????
    WriteINI2(PARK,'??????????',                 edt3_Black1.ItemIndex     );
    WriteINI2(PARK,'??????????????????',         edt3_Black2.ItemIndex             );
    WriteINI2(PARK,'??????????????????',         edt3_Black3.ItemIndex             );
    WriteINI(PARK,'??????????????????????',     edt3_Black4.Text                 );
    WriteINI(PARK,'Alarm File',                 edt3_Black5.Text     );
    WriteINI(PARK,'????????????????????????',   edt3_Black6.Text                   );
    WriteINI2(PARK,'blContests',                 edt3_Black7.ItemIndex     );
    WriteINI(PARK,'Alarm Time',                 edt3_Black8.Text     );
    WriteINI2(PARK,'blMusicRepeat',              edt3_Black9.ItemIndex        );
    WriteINI2(PARK,'blScreenAutoClose',          edt3_Black10.ItemIndex            );
    WriteINI2(PARK,'ShowSalesCarPass',           edt3_Sp1.ItemIndex           );
    WriteINI2(PARK,'UseSalesCarPass',            edt3_Sp2.ItemIndex          );
    WriteINI(PARK,'SalesCarNumber',             edt3_Sp3.Text         );
    WriteINI2(PARK,'IncheonKepco',               edt3_Sp4.ItemIndex       );
    WriteINI2(PARK,'GroupBlockLPR',              edt3_Sp5.ItemIndex        );
    WriteINI2(PARK,'????????????',               edt3_Sp6.ItemIndex       );
    WriteINI2(PARK,'????????????',               edt3_Sp7.ItemIndex       );
    WriteINI2(PARK,'31??????????',               edt3_Sp8.ItemIndex       );
    WriteINI(PARK,'WestInLprUnitNo',            edt3_Sp9.Text          );
    WriteINI2(PARK,'???????? 4???? ????????',    edt3_Sp10.ItemIndex                  );

    //????????
    WriteINI2(PARK,'????',                        edt4_home1.ItemIndex);
    WriteINI2(PARK,'????????',                    edt4_home2.ItemIndex  );
    WriteINI(PARK,'Kocom Port',                  edt4_home3.Text    );
    WriteINI(PARK,'Kocom Baudrate',              edt4_home4.Text        );
    WriteINI(PARK,'HomeInfo IP',                 edt4_home5.Text     );
    WriteINI(PARK,'HomeInfo Port',               edt4_home6.Text       );
    WriteINI(PARK,'HomeInfo ICon IP',            edt4_home31.Text       );
    WriteINI(PARK,'noSnedhNet',                  edt4_home7.Text    );
    WriteINI2(PARK,'??????????',                  edt4_home8.ItemIndex    );
    WriteINI2(PARK,'????????',                    edt4_home28.ItemIndex   );
    WriteINI(PARK,'????????',                     edt4_home29.Text   );

    WriteINI2(PARK,'Gyeyoung Option',            edt4_home9.ItemIndex         );
    WriteINI(PARK,'Gyeyoung DB IP',              edt4_home10.Text        );
    WriteINI(PARK,'Gyeyoung DB ID',              edt4_home11.Text        );
    WriteINI(PARK,'Gyeyoung DB PW',              edt4_home12.Text        );
    WriteINI(PARK,'Gyeyoung DB Name',            edt4_home13.Text          );
    WriteINI2(PARK,'AptnerUse',                  edt4_home14.ItemIndex   );
    WriteINI2(PARK,'AptnerMonitorUse',           edt4_home30.ItemIndex   );
    WriteINI(PARK,'AptnerCode',                  edt4_home15.Text    );
    WriteINI(PARK,'AptnerVisitAddr',             edt4_home16.Text         );
    WriteINI(PARK,'AptnerInCarAddr',             edt4_home17.Text         );
    WriteINI(PARK,'AptnerOutCarAddr',            edt4_home18.Text          );
    WriteINI(PARK,'AptnerAuth',                  edt4_home19.Text    );
    WriteINI2(PARK,'smartVillageUse',             edt4_home20.ItemIndex         );
    WriteINI(PARK,'smartVillage_dbReload',       edt4_home21.Text               );
    WriteINI(PARK,'smartVillageID',              edt4_home22.Text        );
    WriteINI(PARK,'VILLAGE_ADDRESS_VISITCHECK',  edt4_home23.Text                    );
    WriteINI(PARK,'VILLAGE_ADDRESS_INOUTCAR',    edt4_home24.Text                  );
    WriteINI(PARK,'VILLAGE_ADDRESS_VISITLIST',   edt4_home25.Text                   );
    WriteINI(PARK,'homeAppIP',                   edt4_home26.Text   );
    WriteINI(PARK,'homeAppPort',                 edt4_home27.Text     );

    //????????????
    WriteINI(PARK,'lightIP',                      edt5_Lamp1.Text);
    WriteINI(PARK,'lightPort',                    edt5_Lamp2.Text  );
    WriteINI(PARK,'lightKeepTime',                edt5_Lamp3.Text      );
    WriteINI(PARK,'nitto_dbInfo',                 edt5_RecvConn1.Text     );
    WriteINI(PARK,'nitto_dbPort',                 edt5_RecvConn2.Text     );
    WriteINI(PARK,'nitto_dbName',                 edt5_RecvConn3.Text     );
    WriteINI(PARK,'nitto_dbId',                   edt5_RecvConn4.Text   );
    WriteINI(PARK,'nitto_dbPw',                   edt5_RecvConn5.Text   );
    bSetupChange := True;
    MessageBoxTimeOut(Application.Handle, '????????'+#13#10+'(1???? ?????? ????????.)', '', 0, 0, 1000);
  except on E: Exception do
  begin
    bSetupChange := False;
    MessageBoxTimeOut(Application.Handle, '????????!'+#13#10+'(2???? ?????? ????????.)', '', 0, 0, 2000);
  end;
  end;
end;

procedure TfrmSetup.FormShow(Sender: TObject);
var
  i,j:Integer;

  procedure HintSet(comp: TAdvLUEdit; hint: string);
  begin
    comp.Hint := hint;
    comp.ShowHint := True;
  end;
begin
  //INI
  iSetup := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');

  //????????
  edt1_DB1.Text := ReadINI(PARK,'DB IP','');
  edt1_DB2.Text := ReadINI(PARK,'DB ID','');
  edt1_DB3.Text := ReadINI(PARK,'DB PW','');
  edt1_DB4.Text := ReadINI(PARK,'DB Name','');
  edt1_DB5.Text := ReadINI(PARK,'UnitNo','');

  edt1_LPR1.ItemIndex := ReadINI(PARK,'????LPR??','');
  edt1_LPR2.ItemIndex := ReadINI(PARK,'????LPR??','');
  edt1_LPR3.ItemIndex := ReadINI(PARK,'??????','');

  edt1_OP1.ItemIndex := ReadINI(PARK,'?????? ????????','');
  edt1_OP2.ItemIndex := ReadINI(PARK,'?????? ????','');
  edt1_OP3.ItemIndex := ReadINI(PARK,'????????','');
  edt1_OP4.ItemIndex := ReadINI(PARK,'LPR??????????????','');
  edt1_OP5.ItemIndex := ReadINI(PARK,'???????? ????????????','');
  edt1_OP17.ItemIndex := ReadINI(PARK,'?????????? ????????????','');
  edt1_OP6.ItemIndex := ReadINI(PARK,'????????????????','');
  edt1_OP7.Text := ReadINI(PARK,'????????','');
  edt1_OP8.Text := ReadINI(PARK,'????????','');
  edt1_OP9.ItemIndex := ReadINI(PARK,'MI_IN','');
  edt1_OP10.ItemIndex := ReadINI(PARK,'6Proc','');
  edt1_OP11.ItemIndex := ReadINI(PARK,'??????','');
  edt1_OP12.ItemIndex := ReadINI(PARK,'????????????','');
  edt1_OP13.ItemIndex := ReadINI(PARK,'mMirrorDsp','');
  edt1_OP14.ItemIndex := ReadINI(PARK,'??????','');
  edt1_OP15.ItemIndex := ReadINI(PARK,'????????','');
  edt1_OP16.ItemIndex := ReadINI(PARK,'??????','');
  edt1_OP18.ItemIndex := ReadINI(PARK,'????????','');

  edt1_Visit1.ItemIndex := ReadINI(PARK,'??????','');
  edt1_Visit2.ItemIndex := ReadINI(PARK,'AutoVisitOpen','');
  edt1_Visit15.ItemIndex := ReadINI(PARK,'??????????','');
  edt1_Visit16.Text:= ReadINI(PARK,'????????????','');
  edt1_Visit17.ItemIndex := ReadINI(PARK,'??????????','');
  edt1_Visit18.ItemIndex := ReadINI(PARK,'??????????????','');
  edt1_Visit3.Text := ReadINI(PARK,'msg01','');
  edt1_Visit4.Text := ReadINI(PARK,'msg02','');
  edt1_Visit5.Text := ReadINI(PARK,'msg03','');
  edt1_Visit6.Text := ReadINI(PARK,'msg04','');
  edt1_Visit7.Text := ReadINI(PARK,'msg05','');
  edt1_Visit8.Text := ReadINI(PARK,'msg06','');
  edt1_Visit9.Text := ReadINI(PARK,'msg07','');
  edt1_Visit10.Text := ReadINI(PARK,'msg08','');
  edt1_Visit11.Text := ReadINI(PARK,'msg09','');
  edt1_Visit12.Text := ReadINI(PARK,'msg10','');
  edt1_Visit13.Text := ReadINI(PARK,'msg11','');
  edt1_Visit14.Text := ReadINI(PARK,'msg12','');

  //??????????
  edt2_Default1.Text := ReadINI(DSP,'IN_DSP_SPEED','');
  edt2_Default2.Text := ReadINI(DSP,'IN_DSP_TIME','');
  edt2_Default3.Text := ReadINI(DSP,'DSP_SPEED','');
  edt2_Default4.Text := ReadINI(DSP,'DSP_TIME','');
  edt2_Default5.ItemIndex := ReadINI(DSP,'????????????','');
  edt2_Default6.Text := ReadINI(DSP,'????????????','',1);
  edt2_Default7.Text := ReadINI(DSP,'????????????','',1);
  edt2_Default8.Text := ReadINI(DSP,'RecvInDsp','');
  edt2_Default9.Text := ReadINI(DSP,'RecvOutDsp','');
  edt2_Default10.Text := ReadINI(DSP,'NomalInDsp','');
  edt2_Default11.Text := ReadINI(DSP,'NomalOutDsp','');
  edt2_Default12.ItemIndex := ReadINI(DSP,'??????????','');
  edt2_Default17.ItemIndex := ReadINI(DSP,'??????????????','');
  edt2_Default13.ItemIndex := ReadINI(DSP,'??????????????','');
  edt2_Default14.Text := ReadINI(DSP,'????????????????','',1);
  edt2_Default18.Text := ReadINI(DSP,'????????????','',1);
  edt2_Default15.Text := ReadINI(DSP,'VisitInDsp','');
  edt2_Default16.Text := ReadINI(DSP,'VisitOutDsp','');


  edt2_DefStr1.ItemIndex := ReadINI(DSP,'AllDspStrUse','');
  edt2_DefStr2.Text := ReadINI(DSP,'IN_DSP_1_1','',1);
  edt2_DefStr3.Text := ReadINI(DSP,'IN_DSP_1_2','',1);
  edt2_DefStr4.Text := ReadINI(DSP,'IN_DSP_COLOR_1_1','');
  edt2_DefStr5.Text := ReadINI(DSP,'IN_DSP_COLOR_1_2','');
  edt2_DefStr6.Text := ReadINI(DSP,'DSP_1_1','',1);
  edt2_DefStr7.Text := ReadINI(DSP,'DSP_1_2','',1);
  edt2_DefStr8.Text := ReadINI(DSP,'DSP_COLOR_1_1','');
  edt2_DefStr9.Text := ReadINI(DSP,'DSP_COLOR_1_2','');

  edt2_DefStr10.Text := ReadINI(DSP,'IN_DSP_2_1','',1);
  edt2_DefStr11.Text := ReadINI(DSP,'IN_DSP_2_2','',1);
  edt2_DefStr12.Text := ReadINI(DSP,'IN_DSP_COLOR_2_1','');
  edt2_DefStr13.Text := ReadINI(DSP,'IN_DSP_COLOR_2_2','');
  edt2_DefStr14.Text := ReadINI(DSP,'DSP_2_1','',1);
  edt2_DefStr15.Text := ReadINI(DSP,'DSP_2_2','',1);
  edt2_DefStr16.Text := ReadINI(DSP,'DSP_COLOR_2_1','');
  edt2_DefStr17.Text := ReadINI(DSP,'DSP_COLOR_2_2','');

  edt2_DefStr18.Text := ReadINI(DSP,'IN_DSP_3_1','',1);
  edt2_DefStr19.Text := ReadINI(DSP,'IN_DSP_3_2','',1);
  edt2_DefStr20.Text := ReadINI(DSP,'IN_DSP_COLOR_3_1','');
  edt2_DefStr21.Text := ReadINI(DSP,'IN_DSP_COLOR_3_2','');
  edt2_DefStr22.Text := ReadINI(DSP,'DSP_3_1','',1);
  edt2_DefStr23.Text := ReadINI(DSP,'DSP_3_2','',1);
  edt2_DefStr24.Text := ReadINI(DSP,'DSP_COLOR_3_1','');
  edt2_DefStr25.Text := ReadINI(DSP,'DSP_COLOR_3_2','');

  edt2_DefStr26.Text := ReadINI(DSP,'IN_DSP_4_1','',1);
  edt2_DefStr27.Text := ReadINI(DSP,'IN_DSP_4_2','',1);
  edt2_DefStr28.Text := ReadINI(DSP,'IN_DSP_COLOR_4_1','');
  edt2_DefStr29.Text := ReadINI(DSP,'IN_DSP_COLOR_4_2','');
  edt2_DefStr30.Text := ReadINI(DSP,'DSP_4_1','',1);
  edt2_DefStr31.Text := ReadINI(DSP,'DSP_4_2','',1);
  edt2_DefStr32.Text := ReadINI(DSP,'DSP_COLOR_4_1','');
  edt2_DefStr33.Text := ReadINI(DSP,'DSP_COLOR_4_2','');

  edt2_DefStr34.Text := ReadINI(DSP,'IN_DSP_5_1','',1);
  edt2_DefStr35.Text := ReadINI(DSP,'IN_DSP_5_2','',1);
  edt2_DefStr36.Text := ReadINI(DSP,'IN_DSP_COLOR_5_1','');
  edt2_DefStr37.Text := ReadINI(DSP,'IN_DSP_COLOR_5_2','');
  edt2_DefStr38.Text := ReadINI(DSP,'DSP_5_1','',1);
  edt2_DefStr39.Text := ReadINI(DSP,'DSP_5_2','',1);
  edt2_DefStr40.Text := ReadINI(DSP,'DSP_COLOR_5_1','');
  edt2_DefStr41.Text := ReadINI(DSP,'DSP_COLOR_5_2','');

  edt2_DefStr42.Text := ReadINI(DSP,'IN_DSP_6_1','',1);
  edt2_DefStr43.Text := ReadINI(DSP,'IN_DSP_6_2','',1);
  edt2_DefStr44.Text := ReadINI(DSP,'IN_DSP_COLOR_6_1','');
  edt2_DefStr45.Text := ReadINI(DSP,'IN_DSP_COLOR_6_2','');
  edt2_DefStr46.Text := ReadINI(DSP,'DSP_6_1','',1);
  edt2_DefStr47.Text := ReadINI(DSP,'DSP_6_2','',1);
  edt2_DefStr48.Text := ReadINI(DSP,'DSP_COLOR_6_1','');
  edt2_DefStr49.Text := ReadINI(DSP,'DSP_COLOR_6_2','');


  //????????????
  edt3_Black1.ItemIndex := ReadINI(PARK,'??????????','');
  edt3_Black2.ItemIndex := ReadINI(PARK,'??????????????????','');
  edt3_Black3.ItemIndex := ReadINI(PARK,'??????????????????','');
  edt3_Black4.Text := ReadINI(PARK,'??????????????????????','');
  edt3_Black5.Text := ReadINI(PARK,'Alarm File','');
  edt3_Black6.Text := ReadINI(PARK,'????????????????????????','');
  edt3_Black7.ItemIndex := ReadINI(PARK,'blContests','');
  edt3_Black8.Text := ReadINI(PARK,'Alarm Time','');
  edt3_Black9.ItemIndex := ReadINI(PARK,'blMusicRepeat','');
  edt3_Black10.ItemIndex := ReadINI(PARK,'blScreenAutoClose','');

  edt3_Sp1.ItemIndex := ReadINI(PARK,'ShowSalesCarPass','');
  edt3_Sp2.ItemIndex := ReadINI(PARK,'UseSalesCarPass','');
  edt3_Sp3.Text := ReadINI(PARK,'SalesCarNumber','');
  edt3_Sp4.ItemIndex := ReadINI(PARK,'IncheonKepco','');
  edt3_Sp5.ItemIndex := ReadINI(PARK,'GroupBlockLPR','');
  edt3_Sp6.ItemIndex := ReadINI(PARK,'????????????','');
  edt3_Sp7.ItemIndex := ReadINI(PARK,'????????????','');
  edt3_Sp8.ItemIndex := ReadINI(PARK,'31??????????','');
  edt3_Sp9.Text := ReadINI(PARK,'WestInLprUnitNo','');
  edt3_Sp10.ItemIndex := ReadINI(PARK,'???????? 4???? ????????','');

  //????????
  edt4_home1.ItemIndex := ReadINI(PARK,'????','');
  edt4_home2.ItemIndex := ReadINI(PARK,'????????','');
  edt4_home28.ItemIndex := ReadINI(PARK,'????????','');
  edt4_home29.Text:= ReadINI(PARK,'????????','');
  edt4_home3.Text := ReadINI(PARK,'Kocom Port','');
  edt4_home4.Text := ReadINI(PARK,'Kocom Baudrate','');
  edt4_home5.Text := ReadINI(PARK,'HomeInfo IP','');
  edt4_home6.Text := ReadINI(PARK,'HomeInfo Port','');
  edt4_home31.Text:= ReadINI(PARK,'HomeInfo ICon IP','');
  edt4_home7.Text := ReadINI(PARK,'noSnedhNet','');
  edt4_home8.ItemIndex := ReadINI(PARK,'??????????','');
  edt4_home9.ItemIndex := ReadINI(PARK,'Gyeyoung Option','');
  edt4_home10.Text := ReadINI(PARK,'Gyeyoung DB IP','');
  edt4_home11.Text := ReadINI(PARK,'Gyeyoung DB ID','');
  edt4_home12.Text := ReadINI(PARK,'Gyeyoung DB PW','');
  edt4_home13.Text := ReadINI(PARK,'Gyeyoung DB Name','');
  edt4_home14.ItemIndex := ReadINI(PARK,'AptnerUse','');
  edt4_home30.ItemIndex := ReadINI(PARK,'AptnerMonitorUse','');
  edt4_home15.Text := ReadINI(PARK,'AptnerCode','');
  edt4_home16.Text := ReadINI(PARK,'AptnerVisitAddr','');
  edt4_home17.Text := ReadINI(PARK,'AptnerInCarAddr','');
  edt4_home18.Text := ReadINI(PARK,'AptnerOutCarAddr','');
  edt4_home19.Text := ReadINI(PARK,'AptnerAuth','');
  edt4_home20.ItemIndex := ReadINI(PARK,'smartVillageUse','');
  edt4_home21.Text := ReadINI(PARK,'smartVillage_dbReload','');
  edt4_home22.Text := ReadINI(PARK,'smartVillageID','');
  edt4_home23.Text := ReadINI(PARK,'VILLAGE_ADDRESS_VISITCHECK','');
  edt4_home24.Text := ReadINI(PARK,'VILLAGE_ADDRESS_INOUTCAR','');
  edt4_home25.Text := ReadINI(PARK,'VILLAGE_ADDRESS_VISITLIST','');
  edt4_home26.Text := ReadINI(PARK,'homeAppIP','');
  edt4_home27.Text := ReadINI(PARK,'homeAppPort','');

  //????????
  edt5_Lamp1.Text := ReadINI(PARK,'lightIP','');
  edt5_Lamp2.Text := ReadINI(PARK,'lightPort','');
  edt5_Lamp3.Text := ReadINI(PARK,'lightKeepTime','');
  edt5_RecvConn1.Text := ReadINI(PARK,'nitto_dbInfo','');
  edt5_RecvConn2.Text := ReadINI(PARK,'nitto_dbPort','');
  edt5_RecvConn3.Text := ReadINI(PARK,'nitto_dbName','');
  edt5_RecvConn4.Text := ReadINI(PARK,'nitto_dbId','');
  edt5_RecvConn5.Text := ReadINI(PARK,'nitto_dbPw','');

  //????????
  HintSet(edt4_home26,HINTSTR);
  HintSet(edt4_home27,HINTSTR);
  HintSet(edt5_Lamp1,HINTSTR);
  HintSet(edt5_Lamp2,HINTSTR);
  HintSet(edt5_Lamp3,HINTSTR);
  HintSet(edt5_RecvConn1,HINTSTR);
  HintSet(edt5_RecvConn2,HINTSTR);
  HintSet(edt5_RecvConn3,HINTSTR);
  HintSet(edt5_RecvConn4,HINTSTR);
  HintSet(edt5_RecvConn5,HINTSTR);

  tbSetting.ActivePageIndex := 0;

  for i := 0 to stb1.ControlCount -1 do begin
    if stb1.Controls[i] is TGroupBox then begin
      for j := 0 to TGroupBox(stb1.Controls[i]).ControlCount -1 do begin
        if TGroupBox(stb1.Controls[i]).Controls[j] is TAdvLUEdit then begin
         TAdvLUEdit(TGroupBox(stb1.Controls[i]).Controls[j]).Font.Size := 9;
         TAdvLUEdit(TGroupBox(stb1.Controls[i]).Controls[j]).Height := 22;
        end else if TGroupBox(stb1.Controls[i]).Controls[j] is TLUCombo then begin
         TLUCombo(TGroupBox(stb1.Controls[i]).Controls[j]).Height := 22;
         TLUCombo(TGroupBox(stb1.Controls[i]).Controls[j]).Style := csDropDown;
        end;
      end;
    end;
  end;
  for i := 0 to stb2.ControlCount -1 do begin
    if stb2.Controls[i] is TGroupBox then begin
      for j := 0 to TGroupBox(stb2.Controls[i]).ControlCount -1 do begin
        if TGroupBox(stb2.Controls[i]).Controls[j] is TAdvLUEdit then begin
         TAdvLUEdit(TGroupBox(stb2.Controls[i]).Controls[j]).Font.Size := 9;
         TAdvLUEdit(TGroupBox(stb2.Controls[i]).Controls[j]).Height := 22;
        end else if TGroupBox(stb2.Controls[i]).Controls[j] is TLUCombo then begin
         TLUCombo(TGroupBox(stb2.Controls[i]).Controls[j]).Height := 22;
         TLUCombo(TGroupBox(stb2.Controls[i]).Controls[j]).Style := csDropDown;
        end;
      end;
    end;
  end;
  for i := 0 to stb3.ControlCount -1 do begin
    if stb3.Controls[i] is TGroupBox then begin
      for j := 0 to TGroupBox(stb3.Controls[i]).ControlCount -1 do begin
        if TGroupBox(stb3.Controls[i]).Controls[j] is TAdvLUEdit then begin
         TAdvLUEdit(TGroupBox(stb3.Controls[i]).Controls[j]).Font.Size := 9;
         TAdvLUEdit(TGroupBox(stb3.Controls[i]).Controls[j]).Height := 22;
        end else if TGroupBox(stb3.Controls[i]).Controls[j] is TLUCombo then begin
         TLUCombo(TGroupBox(stb3.Controls[i]).Controls[j]).Height := 22;
         TLUCombo(TGroupBox(stb3.Controls[i]).Controls[j]).Style := csDropDown;
        end;
      end;
    end;
  end;
  for i := 0 to stb4.ControlCount -1 do begin
    if stb4.Controls[i] is TGroupBox then begin
      for j := 0 to TGroupBox(stb4.Controls[i]).ControlCount -1 do begin
        if TGroupBox(stb4.Controls[i]).Controls[j] is TAdvLUEdit then begin
         TAdvLUEdit(TGroupBox(stb4.Controls[i]).Controls[j]).Font.Size := 9;
         TAdvLUEdit(TGroupBox(stb4.Controls[i]).Controls[j]).Height := 22;
        end else if TGroupBox(stb4.Controls[i]).Controls[j] is TLUCombo then begin
         TLUCombo(TGroupBox(stb4.Controls[i]).Controls[j]).Height := 22;
         TLUCombo(TGroupBox(stb4.Controls[i]).Controls[j]).Style := csDropDown;
        end;
      end;
    end;
  end;
  for i := 0 to stb5.ControlCount -1 do begin
    if stb5.Controls[i] is TGroupBox then begin
      for j := 0 to TGroupBox(stb5.Controls[i]).ControlCount -1 do begin
        if TGroupBox(stb5.Controls[i]).Controls[j] is TAdvLUEdit then begin
         TAdvLUEdit(TGroupBox(stb5.Controls[i]).Controls[j]).Font.Size := 9;
         TAdvLUEdit(TGroupBox(stb5.Controls[i]).Controls[j]).Height := 22;
        end else if TGroupBox(stb5.Controls[i]).Controls[j] is TLUCombo then begin
         TLUCombo(TGroupBox(stb5.Controls[i]).Controls[j]).Height := 22;
         TLUCombo(TGroupBox(stb5.Controls[i]).Controls[j]).Style := csDropDown;
        end;
      end;
    end;
  end;
end;

function TfrmSetup.ReadINI(iSession, iKey, iValue: string; flag: Integer=0): Variant;
begin
  if flag = 0 then
    Result := (iSetup.ReadString(iSession, iKey, iValue))
  else
    Result := QuotedStr((iSetup.ReadString(iSession, iKey, QuotedStr(iValue))));
//  CodeSite.Send(Result);
end;

procedure TfrmSetup.WriteINI2(iSession, iKey: string; iValue: Integer);
begin
  iSetup.WriteInteger(iSession,iKey,iValue);
end;

procedure TfrmSetup.WriteINI(iSession, iKey, iValue: string; flag: Integer=0);
begin
  if flag = 0 then
    iSetup.WriteString(iSession,iKey,iValue)
  else
    iSetup.WriteString(iSession,iKey,QuotedStr(iValue));
end;

end.
