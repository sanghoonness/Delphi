object frmCredit_SMTCancel: TfrmCredit_SMTCancel
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #49888#50857#52852#46300' '#52712#49548
  ClientHeight = 369
  ClientWidth = 625
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 369
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    object sLabel1: TsLabel
      Left = 112
      Top = 8
      Width = 399
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #49888#50857#52852#46300' '#52712#49548
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
    end
    object Panel3: TPanel
      Left = 15
      Top = 41
      Width = 597
      Height = 96
      BevelInner = bvLowered
      TabOrder = 0
      object lbVan: TLabel
        Left = 19
        Top = 17
        Width = 564
        Height = 64
        Alignment = taCenter
        AutoSize = False
        Caption = #44208#51228' '#51221#48372#47484' '#51077#47141' '#54980' '#13#10#44208#51228#52712#49548' '#48260#53948#51012' '#45572#47476#49464#50836
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -29
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 15
      Top = 161
      Width = 597
      Height = 136
      BevelInner = bvLowered
      TabOrder = 1
      object lbHint: TLabel
        Left = 337
        Top = 57
        Width = 221
        Height = 19
        Caption = #50696') 2017'#45380'1'#50900'2'#51068' -> 20170102'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbHint2: TLabel
        Left = 128
        Top = 57
        Width = 139
        Height = 19
        Caption = #50696') 3000'#50896' -> 3000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtTotAmt: TAdvEdit
        Left = 128
        Top = 24
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #44208#51228#44552#50529
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        Lookup.Font.Charset = DEFAULT_CHARSET
        Lookup.Font.Color = clWindowText
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Arial'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 0
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtAuthNo: TAdvEdit
        Left = 128
        Top = 92
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #49849#51064#48264#54840' '
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        Lookup.Font.Charset = DEFAULT_CHARSET
        Lookup.Font.Color = clWindowText
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Arial'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 2
        Text = ''
        Visible = True
        OnKeyPress = edtAuthNoKeyPress
        Version = '3.3.2.0'
      end
      object edtAuthDate: TAdvEdit
        Left = 416
        Top = 24
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #49849#51064#51068#51088' '
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        Lookup.Font.Charset = DEFAULT_CHARSET
        Lookup.Font.Color = clWindowText
        Lookup.Font.Height = -11
        Lookup.Font.Name = 'Arial'
        Lookup.Font.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 1
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
    end
    object btnCancel: TsButton
      Left = 490
      Top = 309
      Width = 91
      Height = 39
      Caption = #51333'  '#47308
      TabOrder = 2
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnOK: TsButton
      Left = 325
      Top = 309
      Width = 113
      Height = 39
      Caption = #44208#51228#52712#49548
      TabOrder = 3
      OnClick = btnOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object dream: TDP_Certification_Ocx
      Left = 461
      Top = 8
      Width = 109
      Height = 32
      OnQueryResults = dreamQueryResults
      ControlData = {
        93B2000048000000030008000BF25747200000005F0065007800740065006E00
        74007800440B0000030008000AF25747E0FFFFFF5F0065007800740065006E00
        740079001A030000}
    end
  end
end
