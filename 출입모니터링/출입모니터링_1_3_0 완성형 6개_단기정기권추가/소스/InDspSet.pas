unit InDspSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, AdvSpin, AdvOfficeButtons, AdvEdit,
  AdvCombo, ExtCtrls;

type
  TfrmInDspSet = class(TForm)
    Panel1: TPanel;
    cmb1_1_1: TAdvComboBox;
    cmb1_1_2: TAdvComboBox;
    cmb1_1_3: TAdvComboBox;
    cmb1_1_4: TAdvComboBox;
    cmb1_1_5: TAdvComboBox;
    cmb1_1_6: TAdvComboBox;
    cmb1_1_7: TAdvComboBox;
    cmb1_1_8: TAdvComboBox;
    cmb1_1_9: TAdvComboBox;
    cmb1_1_10: TAdvComboBox;
    cmb1_1_11: TAdvComboBox;
    cmb1_1_12: TAdvComboBox;
    edt1_2: TAdvEdit;
    edt1_1: TAdvEdit;
    cmb1_2_1: TAdvComboBox;
    cmb1_2_2: TAdvComboBox;
    cmb1_2_3: TAdvComboBox;
    cmb1_2_4: TAdvComboBox;
    cmb1_2_5: TAdvComboBox;
    cmb1_2_6: TAdvComboBox;
    cmb1_2_7: TAdvComboBox;
    cmb1_2_8: TAdvComboBox;
    cmb1_2_9: TAdvComboBox;
    cmb1_2_10: TAdvComboBox;
    cmb1_2_11: TAdvComboBox;
    cmb1_2_12: TAdvComboBox;
    cmb2_1_1: TAdvComboBox;
    cmb2_1_2: TAdvComboBox;
    cmb2_1_3: TAdvComboBox;
    cmb2_1_4: TAdvComboBox;
    cmb2_1_5: TAdvComboBox;
    cmb2_1_6: TAdvComboBox;
    cmb2_1_7: TAdvComboBox;
    cmb2_1_8: TAdvComboBox;
    cmb2_1_9: TAdvComboBox;
    cmb2_1_10: TAdvComboBox;
    cmb2_1_11: TAdvComboBox;
    cmb2_1_12: TAdvComboBox;
    edt2_2: TAdvEdit;
    edt2_1: TAdvEdit;
    cmb2_2_1: TAdvComboBox;
    cmb2_2_2: TAdvComboBox;
    cmb2_2_3: TAdvComboBox;
    cmb2_2_4: TAdvComboBox;
    cmb2_2_5: TAdvComboBox;
    cmb2_2_6: TAdvComboBox;
    cmb2_2_7: TAdvComboBox;
    cmb2_2_8: TAdvComboBox;
    cmb2_2_9: TAdvComboBox;
    cmb2_2_10: TAdvComboBox;
    cmb2_2_11: TAdvComboBox;
    cmb2_2_12: TAdvComboBox;
    cmb3_1_1: TAdvComboBox;
    cmb3_1_2: TAdvComboBox;
    cmb3_1_3: TAdvComboBox;
    cmb3_1_4: TAdvComboBox;
    cmb3_1_5: TAdvComboBox;
    cmb3_1_6: TAdvComboBox;
    cmb3_1_7: TAdvComboBox;
    cmb3_1_8: TAdvComboBox;
    cmb3_1_9: TAdvComboBox;
    cmb3_1_10: TAdvComboBox;
    cmb3_1_11: TAdvComboBox;
    cmb3_1_12: TAdvComboBox;
    edt3_2: TAdvEdit;
    edt3_1: TAdvEdit;
    cmb3_2_1: TAdvComboBox;
    cmb3_2_2: TAdvComboBox;
    cmb3_2_3: TAdvComboBox;
    cmb3_2_4: TAdvComboBox;
    cmb3_2_5: TAdvComboBox;
    cmb3_2_6: TAdvComboBox;
    cmb3_2_7: TAdvComboBox;
    cmb3_2_8: TAdvComboBox;
    cmb3_2_9: TAdvComboBox;
    cmb3_2_10: TAdvComboBox;
    cmb3_2_11: TAdvComboBox;
    cmb3_2_12: TAdvComboBox;
    cmb4_1_1: TAdvComboBox;
    cmb4_1_2: TAdvComboBox;
    cmb4_1_3: TAdvComboBox;
    cmb4_1_4: TAdvComboBox;
    cmb4_1_5: TAdvComboBox;
    cmb4_1_6: TAdvComboBox;
    cmb4_1_7: TAdvComboBox;
    cmb4_1_8: TAdvComboBox;
    cmb4_1_9: TAdvComboBox;
    cmb4_1_10: TAdvComboBox;
    cmb4_1_12: TAdvComboBox;
    edt4_2: TAdvEdit;
    edt4_1: TAdvEdit;
    cmb4_2_1: TAdvComboBox;
    cmb4_2_2: TAdvComboBox;
    cmb4_2_3: TAdvComboBox;
    cmb4_2_4: TAdvComboBox;
    cmb4_2_5: TAdvComboBox;
    cmb4_2_6: TAdvComboBox;
    cmb4_2_7: TAdvComboBox;
    cmb4_2_8: TAdvComboBox;
    cmb4_2_9: TAdvComboBox;
    cmb4_2_10: TAdvComboBox;
    cmb4_2_11: TAdvComboBox;
    cmb4_2_12: TAdvComboBox;
    chk1_1: TAdvOfficeCheckBox;
    chk1_2: TAdvOfficeCheckBox;
    chk2_1: TAdvOfficeCheckBox;
    chk2_2: TAdvOfficeCheckBox;
    chk3_1: TAdvOfficeCheckBox;
    chk3_2: TAdvOfficeCheckBox;
    chk4_1: TAdvOfficeCheckBox;
    chk4_2: TAdvOfficeCheckBox;
    cmb5_1_1: TAdvComboBox;
    cmb5_1_2: TAdvComboBox;
    cmb5_1_3: TAdvComboBox;
    cmb5_1_4: TAdvComboBox;
    cmb5_1_5: TAdvComboBox;
    cmb5_1_6: TAdvComboBox;
    cmb5_1_7: TAdvComboBox;
    cmb5_1_8: TAdvComboBox;
    cmb5_1_9: TAdvComboBox;
    cmb5_1_10: TAdvComboBox;
    cmb5_1_11: TAdvComboBox;
    cmb5_1_12: TAdvComboBox;
    edt5_2: TAdvEdit;
    edt5_1: TAdvEdit;
    cmb5_2_1: TAdvComboBox;
    cmb5_2_2: TAdvComboBox;
    cmb5_2_3: TAdvComboBox;
    cmb5_2_4: TAdvComboBox;
    cmb5_2_5: TAdvComboBox;
    cmb5_2_6: TAdvComboBox;
    cmb5_2_7: TAdvComboBox;
    cmb5_2_8: TAdvComboBox;
    cmb5_2_9: TAdvComboBox;
    cmb5_2_10: TAdvComboBox;
    cmb5_2_11: TAdvComboBox;
    cmb5_2_12: TAdvComboBox;
    chk5_1: TAdvOfficeCheckBox;
    chk5_2: TAdvOfficeCheckBox;
    cmb6_1_1: TAdvComboBox;
    cmb6_1_2: TAdvComboBox;
    cmb6_1_3: TAdvComboBox;
    cmb6_1_4: TAdvComboBox;
    cmb6_1_5: TAdvComboBox;
    cmb6_1_6: TAdvComboBox;
    cmb6_1_7: TAdvComboBox;
    cmb6_1_8: TAdvComboBox;
    cmb6_1_9: TAdvComboBox;
    cmb6_1_10: TAdvComboBox;
    cmb6_1_11: TAdvComboBox;
    cmb6_1_12: TAdvComboBox;
    edt6_2: TAdvEdit;
    edt6_1: TAdvEdit;
    cmb6_2_1: TAdvComboBox;
    cmb6_2_2: TAdvComboBox;
    cmb6_2_3: TAdvComboBox;
    cmb6_2_4: TAdvComboBox;
    cmb6_2_5: TAdvComboBox;
    cmb6_2_6: TAdvComboBox;
    cmb6_2_7: TAdvComboBox;
    cmb6_2_8: TAdvComboBox;
    cmb6_2_9: TAdvComboBox;
    cmb6_2_10: TAdvComboBox;
    cmb6_2_11: TAdvComboBox;
    cmb6_2_12: TAdvComboBox;
    chk6_1: TAdvOfficeCheckBox;
    chk6_2: TAdvOfficeCheckBox;
    cmb7_1_1: TAdvComboBox;
    cmb7_1_2: TAdvComboBox;
    cmb7_1_3: TAdvComboBox;
    cmb7_1_4: TAdvComboBox;
    cmb7_1_5: TAdvComboBox;
    cmb7_1_6: TAdvComboBox;
    cmb7_1_7: TAdvComboBox;
    cmb7_1_8: TAdvComboBox;
    cmb7_1_9: TAdvComboBox;
    cmb7_1_10: TAdvComboBox;
    cmb7_1_11: TAdvComboBox;
    cmb7_1_12: TAdvComboBox;
    edt7_2: TAdvEdit;
    edt7_1: TAdvEdit;
    cmb7_2_1: TAdvComboBox;
    cmb7_2_2: TAdvComboBox;
    cmb7_2_3: TAdvComboBox;
    cmb7_2_4: TAdvComboBox;
    cmb7_2_5: TAdvComboBox;
    cmb7_2_6: TAdvComboBox;
    cmb7_2_7: TAdvComboBox;
    cmb7_2_8: TAdvComboBox;
    cmb7_2_9: TAdvComboBox;
    cmb7_2_10: TAdvComboBox;
    cmb7_2_11: TAdvComboBox;
    cmb7_2_12: TAdvComboBox;
    chk7_1: TAdvOfficeCheckBox;
    chk7_2: TAdvOfficeCheckBox;
    cmb8_1_1: TAdvComboBox;
    cmb8_1_2: TAdvComboBox;
    cmb8_1_3: TAdvComboBox;
    cmb8_1_4: TAdvComboBox;
    cmb8_1_5: TAdvComboBox;
    cmb8_1_6: TAdvComboBox;
    cmb8_1_7: TAdvComboBox;
    cmb8_1_8: TAdvComboBox;
    cmb8_1_9: TAdvComboBox;
    cmb8_1_10: TAdvComboBox;
    cmb8_1_11: TAdvComboBox;
    cmb8_1_12: TAdvComboBox;
    edt8_2: TAdvEdit;
    edt8_1: TAdvEdit;
    cmb8_2_1: TAdvComboBox;
    cmb8_2_2: TAdvComboBox;
    cmb8_2_3: TAdvComboBox;
    cmb8_2_4: TAdvComboBox;
    cmb8_2_5: TAdvComboBox;
    cmb8_2_6: TAdvComboBox;
    cmb8_2_7: TAdvComboBox;
    cmb8_2_8: TAdvComboBox;
    cmb8_2_9: TAdvComboBox;
    cmb8_2_10: TAdvComboBox;
    cmb8_2_11: TAdvComboBox;
    cmb8_2_12: TAdvComboBox;
    chk8_1: TAdvOfficeCheckBox;
    chk8_2: TAdvOfficeCheckBox;
    cmb9_1_1: TAdvComboBox;
    cmb9_1_2: TAdvComboBox;
    cmb9_1_3: TAdvComboBox;
    cmb9_1_4: TAdvComboBox;
    cmb9_1_5: TAdvComboBox;
    cmb9_1_6: TAdvComboBox;
    cmb9_1_7: TAdvComboBox;
    cmb9_1_8: TAdvComboBox;
    cmb9_1_9: TAdvComboBox;
    cmb9_1_10: TAdvComboBox;
    cmb9_1_11: TAdvComboBox;
    cmb9_1_12: TAdvComboBox;
    edt9_2: TAdvEdit;
    edt9_1: TAdvEdit;
    cmb9_2_1: TAdvComboBox;
    cmb9_2_2: TAdvComboBox;
    cmb9_2_3: TAdvComboBox;
    cmb9_2_4: TAdvComboBox;
    cmb9_2_5: TAdvComboBox;
    cmb9_2_6: TAdvComboBox;
    cmb9_2_7: TAdvComboBox;
    cmb9_2_8: TAdvComboBox;
    cmb9_2_9: TAdvComboBox;
    cmb9_2_10: TAdvComboBox;
    cmb9_2_11: TAdvComboBox;
    cmb9_2_12: TAdvComboBox;
    chk9_1: TAdvOfficeCheckBox;
    chk9_2: TAdvOfficeCheckBox;
    cmb4_1_11: TAdvComboBox;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    edtTime: TAdvSpinEdit;
    chkDefault: TAdvOfficeCheckBox;
    edtSpeed: TAdvSpinEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure cmb1_1_1Change(Sender: TObject);
    procedure cmb1_2_1Change(Sender: TObject);
    procedure cmb2_1_1Change(Sender: TObject);
    procedure cmb2_2_1Change(Sender: TObject);
    procedure cmb3_1_1Change(Sender: TObject);
    procedure cmb3_2_1Change(Sender: TObject);
    procedure cmb4_1_1Change(Sender: TObject);
    procedure cmb4_2_1Change(Sender: TObject);
    procedure cmb5_1_1Change(Sender: TObject);
    procedure cmb5_2_1Change(Sender: TObject);
    procedure cmb6_1_1Change(Sender: TObject);
    procedure cmb6_2_1Change(Sender: TObject);
    procedure cmb7_1_1Change(Sender: TObject);
    procedure cmb7_2_1Change(Sender: TObject);
    procedure cmb8_1_1Change(Sender: TObject);
    procedure cmb8_2_1Change(Sender: TObject);
    procedure cmb9_1_1Change(Sender: TObject);
    procedure cmb9_2_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkDefaultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInDspSet: TfrmInDspSet;
  nType: Byte;

implementation
uses
  IniFiles,
  Global;

{$R *.dfm}

procedure TfrmInDspSet.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInDspSet.cmb1_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk1_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb1_1_' + IntToStr(i))).ItemIndex:= cmb1_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb1_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk1_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb1_2_' + IntToStr(i))).ItemIndex:= cmb1_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb2_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk2_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb2_1_' + IntToStr(i))).ItemIndex:= cmb2_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb2_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk2_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb2_2_' + IntToStr(i))).ItemIndex:= cmb2_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb3_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk3_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb3_1_' + IntToStr(i))).ItemIndex:= cmb3_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb3_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk3_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb3_2_' + IntToStr(i))).ItemIndex:= cmb3_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb4_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk4_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb4_1_' + IntToStr(i))).ItemIndex:= cmb4_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb4_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk4_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb4_2_' + IntToStr(i))).ItemIndex:= cmb4_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb5_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk5_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb5_1_' + IntToStr(i))).ItemIndex:= cmb5_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb5_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk5_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb5_2_' + IntToStr(i))).ItemIndex:= cmb5_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb6_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk6_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb6_1_' + IntToStr(i))).ItemIndex:= cmb6_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb6_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk6_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb6_2_' + IntToStr(i))).ItemIndex:= cmb6_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb7_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk7_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb7_1_' + IntToStr(i))).ItemIndex:= cmb7_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb7_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk7_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb7_2_' + IntToStr(i))).ItemIndex:= cmb7_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb8_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk8_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb8_1_' + IntToStr(i))).ItemIndex:= cmb8_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb8_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk8_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb8_2_' + IntToStr(i))).ItemIndex:= cmb8_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb9_1_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk9_1.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb9_1_' + IntToStr(i))).ItemIndex:= cmb9_1_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.cmb9_2_1Change(Sender: TObject);
var
  i: Byte;
begin
  if chk9_2.Checked then
  begin
    for i:= 2 to nType do
      TAdvComboBox(FindComponent('cmb9_2_' + IntToStr(i))).ItemIndex:= cmb9_2_1.ItemIndex;
  end;
end;

procedure TfrmInDspSet.FormShow(Sender: TObject);
var
  i       ,
  j       : Byte;
  sColor1 ,
  sColor2 : aString;
  asTemp1 : AnsiString;
  asTemp2 : AnsiString;
  sFull   : string;
  iSetup  : TIniFile;
begin

  sFull := ExtractFileDir(Application.ExeName) + '\ParkSet.ini';

  try
    try
      iSetup := TIniFile.Create( sFull );

      if( nDisplaySize = 0 )then //2?? 4??
      begin
        nType:= 8;

        for i:= nType to 12 do
        begin
          TAdvEdit(FindComponent('cmb1_1_' + IntToStr(i))).Visible:= False;
          TAdvEdit(FindComponent('cmb1_2_' + IntToStr(i))).Visible:= False
        end;

        asTemp1 := iSetup.ReadString('DISPLAY', '4_IN_DSP_1_1', ' ');
        asTemp2 := iSetup.ReadString('DISPLAY', '4_IN_DSP_1_2', ' ');

        asTemp1 := MG_StrTrim( aString( asTemp1 ), AnsiChar(39));
        asTemp2 := MG_StrTrim( aString( asTemp2 ), AnsiChar(39));

        TAdvEdit(FindComponent('edt1_1')).Text:= asTemp1;
        TAdvEdit(FindComponent('edt1_2')).Text:= asTemp2;

        sColor1:= iSetup.ReadString('DISPLAY', '4_IN_DSP_COLOR_1_1', '');
        sColor2:= iSetup.ReadString('DISPLAY', '4_IN_DSP_COLOR_1_2', '');
      end
      else
      begin
        nType:= 12;

        asTemp1 := iSetup.ReadString('DISPLAY', 'IN_DSP_1_1', ' ');
        asTemp2 := iSetup.ReadString('DISPLAY', 'IN_DSP_1_2', ' ');

        asTemp1 := MG_StrTrim( aString( asTemp1 ), AnsiChar(39));
        asTemp2 := MG_StrTrim( aString( asTemp2 ), AnsiChar(39));

        TAdvEdit(FindComponent('edt1_1')).Text:= asTemp1;
        TAdvEdit(FindComponent('edt1_2')).Text:= asTemp2;

        sColor1:= iSetup.ReadString('DISPLAY', 'IN_DSP_COLOR_1_1', '');
        sColor2:= iSetup.ReadString('DISPLAY', 'IN_DSP_COLOR_1_2', '');
      end;

      for i:= 1 to 1 do
      begin

        if Length(sColor1) = nType then
        begin
          for j:= 1 to nType do
            TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_1_' + IntToStr(j))).ItemIndex:= StrToInt(Copy(sColor1, j, 1));
        end
        else
        begin
          for j:= 1 to nType do
            TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_1_' + IntToStr(j))).ItemIndex:= 0;
        end;

        if Length(sColor2) = nType then
        begin
          for j:= 1 to nType do
            TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_2_' + IntToStr(j))).ItemIndex:= StrToInt(Copy(sColor2, j, 1));
        end
        else
        begin
          for j:= 1 to nType do
            TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_2_' + IntToStr(j))).ItemIndex:= 0;
        end;
      end;

      edtSpeed.Value:= iSetup.ReadInteger('DISPLAY', 'IN_DSP_SPEED', 0);
      edtTime.Value:= iSetup.ReadInteger('DISPLAY', 'IN_DSP_TIME', 0);

    except
      on E: Exception do
      begin
        Assert( false, E.Message );
      end;
    end;
  finally
    iSetup.Free;
  end;

end;

// ?????? ???????? ????
procedure TfrmInDspSet.btnSaveClick(Sender: TObject);
var
  i       ,
  j       : Byte;
  sDsp1   ,
  sDsp2   ,
  sColor1 ,
  sColor2 : aString;
  sFull   : string;
  iSetup  : TIniFile;
begin

  sFull := ExtractFileDir(Application.ExeName) + '\ParkSet.ini';

  try
    try
      iSetup := TIniFile.Create( sFull );

      for i:= 1 to 1 do
      begin
        if nDisplaySize = 0 then      //2?? 4??
        begin
          // ????????
          sDsp1:= MG_MakeStr(MG_InsSpace(TAdvEdit(FindComponent('edt' + IntToStr(i) + '_1')).Text, 8));

          // ???????? ???????? ini?????? ????
          iSetup.WriteString('DISPLAY', '4_IN_DSP_' + IntToStr(i) + '_1', sDsp1);

          // ??????????
          sDsp2:= MG_MakeStr(MG_InsSpace(TAdvEdit(FindComponent('edt' + IntToStr(i) + '_2')).Text, 8));

          // ?????????? ???????? ini?????? ????
          iSetup.WriteString('DISPLAY', '4_IN_DSP_' + IntToStr(i) + '_2', sDsp2);
        end
        else
        begin
          // ????????
          sDsp1:= MG_MakeStr(MG_InsSpace(TAdvEdit(FindComponent('edt' + IntToStr(i) + '_1')).Text, 12));

          // ???????? ???????? ini?????? ????
          iSetup.WriteString('DISPLAY', 'IN_DSP_' + IntToStr(i) + '_1', sDsp1);

          // ??????????
          sDsp2:= MG_MakeStr(MG_InsSpace(TAdvEdit(FindComponent('edt' + IntToStr(i) + '_2')).Text, 12));

          // ?????????? ???????? ini?????? ????
          iSetup.WriteString('DISPLAY', 'IN_DSP_' + IntToStr(i) + '_2', sDsp2);
        end;

        sColor1:= '';
        sColor2:= '';

        // ?????? ???? ???????? ????????
        for j:= 1 to nType do
        begin
          sColor1:= sColor1 + IntToStr(TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_1_' + IntToStr(j))).ItemIndex);
          sColor2:= sColor2 + IntToStr(TAdvComboBox(FindComponent('cmb' + IntToStr(i) + '_2_' + IntToStr(j))).ItemIndex);
        end;

        // ?????? ?????? ini?????? ????
        if nDisplaySize = 0 then      //2?? 4??
        begin
          iSetup.WriteString('DISPLAY', '4_IN_DSP_COLOR_' + IntToStr(i) + '_1', sColor1);
          iSetup.WriteString('DISPLAY', '4_IN_DSP_COLOR_' + IntToStr(i) + '_2', sColor2);
        end
        else
        begin
          iSetup.WriteString('DISPLAY', 'IN_DSP_COLOR_' + IntToStr(i) + '_1', sColor1);
          iSetup.WriteString('DISPLAY', 'IN_DSP_COLOR_' + IntToStr(i) + '_2', sColor2);
        end;
      end;

      // ?????? ????????, ???????? ini?????? ????
      iSetup.WriteInteger('DISPLAY', 'IN_DSP_SPEED', edtSpeed.Value);
      iSetup.WriteInteger('DISPLAY', 'IN_DSP_TIME', edtTime.Value);

      ShowMessage('?????????? ?????????? ??????????????????.');

    except
      on E: Exception do
      begin
        //ExceptLogging('TfrmDspSet.btnSaveClick: ' + E.Message);
        Assert( False, E.Message );
      end;
    end;

  finally
    iSetup.Free;
  end;

end;

procedure TfrmInDspSet.chkDefaultClick(Sender: TObject);
begin
  if chkDefault.Checked then
  begin
    edtTime.Value:= 6;
    edtSpeed.Value:= 20;
  end;
end;

end.
