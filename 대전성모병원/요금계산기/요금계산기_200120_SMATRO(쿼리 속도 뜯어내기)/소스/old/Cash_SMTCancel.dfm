object frmCash_SMTCancel: TfrmCash_SMTCancel
  Left = 0
  Top = 0
  Caption = #54788#44552#50689#49688#51613#52712#49548
  ClientHeight = 442
  ClientWidth = 636
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
    Width = 636
    Height = 442
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    ExplicitHeight = 363
    object sLabel1: TsLabel
      Left = 112
      Top = 8
      Width = 399
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #54788#44552#50689#49688#51613' '#52712#49548
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
        Left = 27
        Top = 19
        Width = 564
        Height = 64
        Alignment = taCenter
        AutoSize = False
        Caption = #54788#44552#50689#49688#51613' '#46321#47197' '#51221#48372#47484' '#51077#47141' '#54980' '#13#10#54788#44552#50689#49688#51613' '#48156#54665#52712#49548' '#48260#53948#51012' '#45572#47476#49464#50836
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 15
      Top = 161
      Width = 597
      Height = 208
      BevelInner = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lbHint: TLabel
        Left = 49
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
      object Label1: TLabel
        Left = 128
        Top = 167
        Width = 455
        Height = 19
        Caption = #49324#50629#51088') '#49324#50629#51088' '#46321#47197#48264#54840' / '#44060#51064') '#55092#45824#54256' '#48264#54840' '#54841#51008' '#54788#44552#50689#49688#51613' '#52852#46300#48264#54840
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 23
        Top = 102
        Width = 90
        Height = 19
        Caption = #46321#47197' '#44396#48516
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 128
        Top = 183
        Width = 105
        Height = 19
        Caption = '* '#51089#49457' '#49884' - '#49373#47029
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtAuthNo: TAdvEdit
        Left = 392
        Top = 24
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
        TabOrder = 1
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtAuthDate: TAdvEdit
        Left = 128
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
        TabOrder = 0
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtFee: TAdvEdit
        Left = 392
        Top = 64
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #44208#51228#44552#50529' '
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
        Version = '3.3.2.0'
      end
      object edtCustNo: TAdvEdit
        Left = 128
        Top = 134
        Width = 438
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #46321#47197' '#51221#48372' '
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
        TabOrder = 3
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object rb1: TRadioButton
        Left = 128
        Top = 99
        Width = 113
        Height = 24
        Caption = #49324#50629#51088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object rb2: TRadioButton
        Left = 240
        Top = 99
        Width = 113
        Height = 24
        Caption = #44060#51064
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object btnCancel: TsButton
      Left = 317
      Top = 383
      Width = 295
      Height = 39
      Caption = #51333'  '#47308
      TabOrder = 2
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnOK: TsButton
      Left = 16
      Top = 383
      Width = 295
      Height = 39
      Caption = #54788#44552#50689#49688#51613' '#48156#54665#52712#49548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
