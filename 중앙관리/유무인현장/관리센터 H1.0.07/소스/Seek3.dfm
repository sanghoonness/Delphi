object frmSeek3: TfrmSeek3
  Left = 0
  Top = 0
  Caption = #49324#50857#51088#44160#49353
  ClientHeight = 147
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rgSeek: TRadioGroup
    Left = 16
    Top = 8
    Width = 304
    Height = 89
    Caption = #44160#49353' '#51312#44148
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #49457'     '#47749
      #52264#47049#48264#54840)
    ParentFont = False
    TabOrder = 0
  end
  object edtSeek: TEdit
    Left = 16
    Top = 109
    Width = 257
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImeMode = imSHanguel
    ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edtSeekKeyPress
  end
end
