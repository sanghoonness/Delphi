object frmLogin: TfrmLogin
  Left = 663
  Top = 320
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #47196#44536#51064
  ClientHeight = 280
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object AdvSmoothPanel1: TAdvSmoothPanel
    Left = 10
    Top = 10
    Width = 433
    Height = 263
    Cursor = crDefault
    Caption.Location = plCustom
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -13
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = [fsBold]
    Caption.Top = 7
    Caption.ColorStart = clBlack
    Caption.ColorEnd = clBlack
    Caption.Line = False
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.3.0.3'
    TabOrder = 0
    object AdvSmoothLabel1: TAdvSmoothLabel
      Left = 14
      Top = 43
      Width = 392
      Height = 36
      Fill.Color = clGray
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #44540#47924#51088#47484' '#49440#53469#54980' '#48708#48128#48264#54840#47484' '#51077#47141#54616#50668' '#51452#49464#50836
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -16
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = [fsBold]
      Caption.ColorStart = clBlack
      Caption.ColorEnd = clBlack
      CaptionShadow.Text = 'AdvSmoothLabel'
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -27
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      CaptionShadow.ColorStart = clNavy
      CaptionShadow.ColorEnd = clNavy
      Version = '1.6.0.2'
    end
    object cmbManager: TAdvComboBox
      Left = 96
      Top = 104
      Width = 176
      Height = 27
      Color = clWindow
      Version = '1.5.1.0'
      Visible = True
      Style = csDropDownList
      EmptyTextStyle = []
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = -1
      LabelCaption = #44540#47924#51088#47749
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -16
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = cmbManagerChange
      OnKeyPress = cmbManagerKeyPress
    end
    object edtPassword: TAdvEdit
      Left = 96
      Top = 152
      Width = 176
      Height = 27
      EditType = etPassword
      EmptyTextStyle = []
      LabelCaption = #48708#48128#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -16
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      CanUndo = False
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
      Visible = True
      OnKeyPress = edtPasswordKeyPress
      Version = '3.3.2.0'
    end
    object btnLogin: TAdvSmoothButton
      Left = 288
      Top = 104
      Width = 106
      Height = 75
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -21
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = #47196#44536#51064
      ParentFont = False
      TabOrder = 2
      Version = '2.0.1.0'
      OnClick = btnLoginClick
    end
    object edtCheck: TAdvEdit
      Left = 104
      Top = 200
      Width = 121
      Height = 22
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
      TabOrder = 3
      Text = ''
      Visible = False
      Version = '3.3.2.0'
    end
  end
  object AdvSmoothPanel2: TAdvSmoothPanel
    Left = 449
    Top = 10
    Width = 260
    Height = 263
    Cursor = crDefault
    Caption.HTMLFont.Charset = DEFAULT_CHARSET
    Caption.HTMLFont.Color = clWindowText
    Caption.HTMLFont.Height = -11
    Caption.HTMLFont.Name = 'Tahoma'
    Caption.HTMLFont.Style = []
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -16
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.Line = False
    Fill.Color = 16445929
    Fill.ColorTo = 15587527
    Fill.ColorMirror = 15587527
    Fill.ColorMirrorTo = 16773863
    Fill.GradientType = gtVertical
    Fill.GradientMirrorType = gtVertical
    Fill.BorderColor = 14922381
    Fill.Rounding = 10
    Fill.ShadowOffset = 10
    Fill.Glow = gmNone
    Version = '1.3.0.3'
    TabOrder = 1
    object btnNum0: TAdvSmoothButton
      Left = 16
      Top = 183
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '0'
      ParentFont = False
      TabOrder = 0
      Version = '2.0.1.0'
      OnClick = btnNum0Click
    end
    object btnNum1: TAdvSmoothButton
      Left = 16
      Top = 127
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '1'
      ParentFont = False
      TabOrder = 1
      Version = '2.0.1.0'
      OnClick = btnNum1Click
    end
    object btnNum2: TAdvSmoothButton
      Left = 72
      Top = 127
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '2'
      ParentFont = False
      TabOrder = 2
      Version = '2.0.1.0'
      OnClick = btnNum2Click
    end
    object btnNum3: TAdvSmoothButton
      Left = 128
      Top = 127
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '3'
      ParentFont = False
      TabOrder = 3
      Version = '2.0.1.0'
      OnClick = btnNum3Click
    end
    object btnNum4: TAdvSmoothButton
      Left = 16
      Top = 71
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '4'
      ParentFont = False
      TabOrder = 4
      Version = '2.0.1.0'
      OnClick = btnNum4Click
    end
    object btnNum5: TAdvSmoothButton
      Left = 72
      Top = 71
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '5'
      ParentFont = False
      TabOrder = 5
      Version = '2.0.1.0'
      OnClick = btnNum5Click
    end
    object btnNum6: TAdvSmoothButton
      Left = 128
      Top = 71
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '6'
      ParentFont = False
      TabOrder = 6
      Version = '2.0.1.0'
      OnClick = btnNum6Click
    end
    object btnNum7: TAdvSmoothButton
      Left = 16
      Top = 15
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '7'
      ParentFont = False
      TabOrder = 7
      Version = '2.0.1.0'
      OnClick = btnNum7Click
    end
    object btnNum8: TAdvSmoothButton
      Left = 72
      Top = 15
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '8'
      ParentFont = False
      TabOrder = 8
      Version = '2.0.1.0'
      OnClick = btnNum8Click
    end
    object btnNum9: TAdvSmoothButton
      Left = 128
      Top = 15
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = '9'
      ParentFont = False
      TabOrder = 9
      Version = '2.0.1.0'
      OnClick = btnNum9Click
    end
    object btnBack: TAdvSmoothButton
      Left = 184
      Top = 15
      Width = 50
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -29
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = #8592
      ParentFont = False
      TabOrder = 10
      Version = '2.0.1.0'
      OnClick = btnBackClick
    end
    object btnDel: TAdvSmoothButton
      Left = 72
      Top = 183
      Width = 105
      Height = 50
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = #51221#51221
      ParentFont = False
      TabOrder = 11
      Version = '2.0.1.0'
      OnClick = btnDelClick
    end
    object btnOK: TAdvSmoothButton
      Left = 184
      Top = 71
      Width = 50
      Height = 162
      Appearance.Font.Charset = ANSI_CHARSET
      Appearance.Font.Color = clWindowText
      Appearance.Font.Height = -27
      Appearance.Font.Name = 'Tahoma'
      Appearance.Font.Style = [fsBold]
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
      Caption = #54869#51064
      ParentFont = False
      TabOrder = 12
      Version = '2.0.1.0'
      OnClick = btnLoginClick
    end
  end
  object qryManager: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Manager')
    Left = 40
    Top = 208
    object qryManagerParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryManagerMNo: TWordField
      FieldName = 'MNo'
    end
    object qryManagerPasswd: TStringField
      FieldName = 'Passwd'
    end
    object qryManagerMName: TStringField
      FieldName = 'MName'
      Size = 50
    end
    object qryManagerAuthority: TWordField
      FieldName = 'Authority'
    end
    object qryManagerReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryManagerReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryManagerReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryManagerReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryManagerReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
end
