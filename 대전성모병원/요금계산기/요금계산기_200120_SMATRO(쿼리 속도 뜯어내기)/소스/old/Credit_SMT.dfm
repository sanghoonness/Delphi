object frmCredit_SMT: TfrmCredit_SMT
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #49888#50857#52852#46300' '#44208#51228
  ClientHeight = 364
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
    Height = 364
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
      Caption = #49888#50857#52852#46300' '#44208#51228
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
      Height = 64
      BevelInner = bvLowered
      TabOrder = 0
      object lbVan: TLabel
        Left = 19
        Top = 17
        Width = 564
        Height = 29
        Alignment = taCenter
        AutoSize = False
        Caption = #49888#50857#52852#46300#47484' '#45800#47568#44592#50640' '#44866#50500#51452#49464#50836'!'
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
      Top = 113
      Width = 597
      Height = 176
      BevelInner = bvLowered
      TabOrder = 1
      object edtCardName: TAdvEdit
        Left = 128
        Top = 24
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #52852#46300#47749' '
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
        ReadOnly = True
        TabOrder = 0
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtJumNo: TAdvEdit
        Left = 416
        Top = 24
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #44032#47609#51216#48264#54840
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
        ReadOnly = True
        TabOrder = 1
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtAuthNo: TAdvEdit
        Left = 128
        Top = 76
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
        ReadOnly = True
        TabOrder = 2
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtAuthDate: TAdvEdit
        Left = 416
        Top = 76
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
        ReadOnly = True
        TabOrder = 3
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtMsg: TAdvEdit
        Left = 128
        Top = 128
        Width = 438
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #51025#45813#47700#49884#51648' '
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
        AutoSize = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
    end
    object btnCancel: TsButton
      Left = 384
      Top = 301
      Width = 229
      Height = 39
      Caption = #52712#49548#49884' ESC '#48260#53948#51012' '#45580#47084#51452#49464#50836
      TabOrder = 2
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
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
  object tEvent: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tEventTimer
    Left = 574
    Top = 8
  end
end
