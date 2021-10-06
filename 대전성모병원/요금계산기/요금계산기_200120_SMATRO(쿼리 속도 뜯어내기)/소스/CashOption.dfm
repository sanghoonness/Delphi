object frmCashOption: TfrmCashOption
  Left = 0
  Top = 0
  Caption = #54788#44552#50689#49688#51613
  ClientHeight = 179
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GradientLabel1: TGradientLabel
    Left = 37
    Top = 24
    Width = 320
    Height = 65
    Alignment = taCenter
    AutoSize = False
    Caption = #54788#44552#50689#49688#51613' '#13#10#44060#51064'/'#48277#51064' '#44396#48516
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
  end
  object btn1: TAdvSmoothToggleButton
    Left = 216
    Top = 118
    Width = 140
    Height = 41
    BorderColor = clAqua
    BevelWidth = 1
    Caption = #48277#51064' '#54788#44552#50689#49688#51613
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
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TAdvSmoothToggleButton
    Left = 36
    Top = 118
    Width = 140
    Height = 41
    BorderColor = clYellow
    BevelWidth = 1
    Caption = #44060#51064' '#54788#44552#50689#49688#51613
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
    TabOrder = 1
    OnClick = btn2Click
  end
  object edtBarcode: TAdvEdit
    Left = 352
    Top = 8
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
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 72
    object g1: TMenuItem
      Caption = #48277#51064' '#54788#44552#50689#49688#51613
      ShortCut = 113
      OnClick = g1Click
    end
    object N1: TMenuItem
      Caption = #44060#51064' '#54788#44552#50689#49688#51613
      ShortCut = 112
      OnClick = N1Click
    end
  end
end
