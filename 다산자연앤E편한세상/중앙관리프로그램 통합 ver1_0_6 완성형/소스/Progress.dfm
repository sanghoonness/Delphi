object frmProgress: TfrmProgress
  Left = 323
  Top = 285
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #47560#44048#52376#47532#51473'...'
  ClientHeight = 76
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Gauge1: TGauge
    Left = 23
    Top = 16
    Width = 209
    Height = 20
    ForeColor = clFuchsia
    Progress = 70
  end
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 207
    Height = 15
    Caption = #47560#44048#52376#47532#51473#51077#45768#45796'.  '#51104#49884' '#44592#45796#47140#51452#49464#50836'!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
end
