object frmRFSeek: TfrmRFSeek
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #49324#50857#51088#44160#49353
  ClientHeight = 143
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rgSeek: TRadioGroup
    Left = 16
    Top = 8
    Width = 257
    Height = 89
    Caption = #44160#49353' '#51312#44148
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #49457'     '#47749
      #52264#47049#48264#54840
      'RF'#52852#46300#48264#54840)
    TabOrder = 0
  end
  object edtSeek: TEdit
    Left = 16
    Top = 109
    Width = 257
    Height = 21
    ImeMode = imSHanguel
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    TabOrder = 1
    OnKeyPress = edtSeekKeyPress
  end
end
