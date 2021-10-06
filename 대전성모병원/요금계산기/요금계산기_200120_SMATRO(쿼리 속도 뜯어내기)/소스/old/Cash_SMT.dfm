object frmCash_SMT: TfrmCash_SMT
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #54788#44552#50689#49688#51613' '#48156#54665
  ClientHeight = 238
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 238
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 0
    ExplicitHeight = 425
    object sLabel1: TsLabel
      Left = 112
      Top = 8
      Width = 399
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #54788#44552#50689#49688#51613' '#48156#54665
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
      Height = 136
      BevelInner = bvLowered
      TabOrder = 0
      object lbVan: TLabel
        Left = 16
        Top = 17
        Width = 567
        Height = 43
        Alignment = taCenter
        AutoSize = False
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 48
        Top = 87
        Width = 383
        Height = 34
        Alignment = taCenter
        AutoSize = False
        Caption = '* '#51089#49457' '#49884' -'#54364#49884' '#49373#47029
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -17
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
      end
      object edtCustNo: TAdvEdit
        Left = 145
        Top = 54
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
        TabOrder = 0
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
    end
    object btnCancel: TsButton
      Left = 317
      Top = 183
      Width = 295
      Height = 39
      Caption = #52712'  '#49548
      TabOrder = 1
      OnClick = btnCancelClick
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
    object sButton1: TsButton
      Left = 15
      Top = 183
      Width = 295
      Height = 39
      Caption = #54788#44552#50689#49688#51613' '#49849#51064#50836#52397
      TabOrder = 3
      OnClick = sButton1Click
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
