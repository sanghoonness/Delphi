object frmCancel_SMT: TfrmCancel_SMT
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #49888#50857#52852#46300' '#49849#51064#52712#49548
  ClientHeight = 557
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
    Height = 557
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
      Caption = #49888#50857#52852#46300' '#49849#51064#52712#49548
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
      Height = 254
      BevelInner = bvLowered
      TabOrder = 0
      object lbVan: TLabel
        Left = 16
        Top = 105
        Width = 567
        Height = 144
        AutoSize = False
        Caption = 
          #50896#49849#51064#48264#54840', '#50896#49849#51064#51068#51088', '#50896#44208#51228#44552#50529#51012' '#13#10#13#10#51077#47141' '#54980' '#49849#51064#52712#49548' '#48260#53948#51012' '#45572#47476#44256' '#44208#51228' '#49884#13#10#13#10#49324#50857#54620' '#49888#50857#52852#46300#47484' '#45800#47568#44592 +
          #50640' '#44866#50500#51452#49464#50836'!'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 424
        Top = 52
        Width = 149
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = '(YYMMDD '#47196' '#51077#47141')'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtPrvAuthNo: TAdvEdit
        Left = 136
        Top = 20
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #50896#49849#51064#48264#54840' '
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
      object edtPrvAuthDate: TAdvEdit
        Left = 424
        Top = 20
        Width = 150
        Height = 27
        EmptyTextStyle = []
        LabelCaption = #50896#49849#51064#51068#51088' '
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
        MaxLength = 8
        ParentFont = False
        TabOrder = 1
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtPrvAmt: TAdvSpinEdit
        Left = 136
        Top = 64
        Width = 150
        Height = 29
        Value = 0
        DateValue = 42497.918230972220000000
        HexValue = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = #44404#47548#52404
        Font.Style = []
        IncrementFloat = 0.100000000000000000
        IncrementFloatPage = 1.000000000000000000
        LabelAlwaysEnabled = True
        LabelCaption = #50896#44208#51228#44552#50529' '
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -19
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = True
        Version = '1.6.0.0'
      end
    end
    object Panel2: TPanel
      Left = 15
      Top = 305
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
      Left = 490
      Top = 498
      Width = 91
      Height = 39
      Caption = #52712'  '#49548
      TabOrder = 2
      OnClick = btnCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnCreditCancel: TsButton
      Left = 393
      Top = 498
      Width = 91
      Height = 39
      Caption = #49849#51064#52712#49548
      TabOrder = 3
      OnClick = btnCreditCancelClick
      SkinData.SkinSection = 'BUTTON'
    end
    object m_pPay: TPay
      Left = 517
      Top = 15
      Width = 40
      Height = 40
      TabOrder = 4
      Visible = False
      OnRecvMSG = m_pPayRecvMSG
      OnCompletedJob = m_pPayCompletedJob
      ControlData = {000300002204000022040000}
    end
  end
  object tEvent: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tEventTimer
    Left = 574
    Top = 8
  end
end
