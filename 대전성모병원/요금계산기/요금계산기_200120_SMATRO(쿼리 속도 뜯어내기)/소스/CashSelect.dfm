object frmCashSelect: TfrmCashSelect
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #54788#44552#50689#49688#51613' '#48156#54665#50668#48512
  ClientHeight = 130
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GradientLabel1: TGradientLabel
    Left = 0
    Top = 0
    Width = 500
    Height = 49
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = #54788#44552#50689#49688#51613' '#48156#54665#50668#48512#47484' '#49440#53469#54616#49464#50836
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
    EllipsType = etNone
    GradientType = gtFullHorizontal
    GradientDirection = gdLeftToRight
    Indent = 0
    Orientation = goHorizontal
    TransparentText = False
    VAlignment = vaTop
    Version = '1.2.0.0'
    ExplicitWidth = 492
  end
  object Label1: TLabel
    Left = 8
    Top = 105
    Width = 308
    Height = 17
    Caption = '* ESC'#53412#47484' '#45572#47476#47732' '#54788#51116' '#51652#54665#51473#51064' '#44208#51228#47484' '#52712#49548#54633#45768#45796'.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Layout = tlCenter
  end
  object btn1: TAdvSmoothToggleButton
    Left = 256
    Top = 55
    Width = 240
    Height = 41
    BorderColor = clAqua
    BevelWidth = 1
    Appearance.Font.Charset = ANSI_CHARSET
    Appearance.Font.Color = clWindowText
    Appearance.Font.Height = -19
    Appearance.Font.Name = #47569#51008' '#44256#46357
    Appearance.Font.Style = [fsBold]
    Caption = #54788#44552#50689#49688#51613' '#48156#54665' [2]'
    Version = '1.4.2.0'
    Status.Caption = '0'
    Status.Appearance.Fill.Color = clRed
    Status.Appearance.Fill.ColorMirror = clNone
    Status.Appearance.Fill.ColorMirrorTo = clNone
    Status.Appearance.Fill.GradientType = gtSolid
    Status.Appearance.Fill.GradientMirrorType = gtSolid
    Status.Appearance.Fill.BorderColor = clGray
    Status.Appearance.Fill.Rounding = 0
    Status.Appearance.Fill.ShadowOffset = 0
    Status.Appearance.Fill.Glow = gmNone
    Status.Appearance.Font.Charset = DEFAULT_CHARSET
    Status.Appearance.Font.Color = clWhite
    Status.Appearance.Font.Height = -11
    Status.Appearance.Font.Name = 'Tahoma'
    Status.Appearance.Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TAdvSmoothToggleButton
    Left = 4
    Top = 55
    Width = 240
    Height = 41
    BorderColor = clYellow
    BevelWidth = 1
    Appearance.Font.Charset = ANSI_CHARSET
    Appearance.Font.Color = clWindowText
    Appearance.Font.Height = -19
    Appearance.Font.Name = #47569#51008' '#44256#46357
    Appearance.Font.Style = [fsBold]
    Caption = #54788#44552#50689#49688#51613' '#48156#54665#50504#54632' [1]'
    Version = '1.4.2.0'
    Status.Caption = '0'
    Status.Appearance.Fill.Color = clRed
    Status.Appearance.Fill.ColorMirror = clNone
    Status.Appearance.Fill.ColorMirrorTo = clNone
    Status.Appearance.Fill.GradientType = gtSolid
    Status.Appearance.Fill.GradientMirrorType = gtSolid
    Status.Appearance.Fill.BorderColor = clGray
    Status.Appearance.Fill.Rounding = 0
    Status.Appearance.Fill.ShadowOffset = 0
    Status.Appearance.Fill.Glow = gmNone
    Status.Appearance.Font.Charset = DEFAULT_CHARSET
    Status.Appearance.Font.Color = clWhite
    Status.Appearance.Font.Height = -11
    Status.Appearance.Font.Name = 'Tahoma'
    Status.Appearance.Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn2Click
  end
  object edtBarcode: TAdvEdit
    Left = 4
    Top = 4
    Width = 5
    Height = 21
    EmptyTextStyle = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    ImeName = 'Microsoft Office IME 2007'
    ReadOnly = True
    TabOrder = 2
    Text = ''
    Visible = True
    Version = '3.3.2.0'
  end
  object CashCancel: TButton
    Left = 408
    Top = 102
    Width = 84
    Height = 25
    Caption = #54788#44552#50689#49688#51613' '#52712#49548
    TabOrder = 3
    OnClick = CashCancelClick
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 8
    object g1: TMenuItem
      Caption = #54788#44552#50689#49688#51613' '#48156#54665#50504#54632
      ShortCut = 113
      OnClick = g1Click
    end
    object N1: TMenuItem
      Caption = #54788#44552#50689#49688#51613' '#48156#54665
      ShortCut = 112
      OnClick = N1Click
    end
  end
end
