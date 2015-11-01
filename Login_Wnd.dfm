object FormLog: TFormLog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Zaloguj si'#281
  ClientHeight = 241
  ClientWidth = 344
  Color = clCream
  Constraints.MaxHeight = 270
  Constraints.MaxWidth = 350
  Constraints.MinHeight = 270
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Left = 5
  GlassFrame.Top = 5
  GlassFrame.Right = 5
  GlassFrame.Bottom = 5
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 334
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Alignment = taCenter
    Caption = 'Login'
    Constraints.MaxHeight = 30
    Constraints.MinHeight = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 38
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 75
    Width = 334
    Height = 30
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Alignment = taCenter
    Caption = 'Has'#322'o'
    Constraints.MaxHeight = 30
    Constraints.MinHeight = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 39
  end
  object ButtonLogin: TSpeedButton
    Left = 0
    Top = 158
    Width = 161
    Height = 83
    Action = ActionLogIn
    Align = alLeft
    Caption = 'Zaloguj'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object LabelWarning: TLabel
    Left = 0
    Top = 140
    Width = 344
    Height = 18
    Align = alTop
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 4
  end
  object SpeedButton1: TSpeedButton
    Left = 167
    Top = 158
    Width = 177
    Height = 83
    Align = alRight
    Caption = 'Zamknij'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object EditLogin: TEdit
    AlignWithMargins = True
    Left = 50
    Top = 43
    Width = 244
    Height = 24
    Margins.Left = 50
    Margins.Right = 50
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'mobile32'
  end
  object EditPassword: TEdit
    AlignWithMargins = True
    Left = 50
    Top = 113
    Width = 244
    Height = 24
    Margins.Left = 50
    Margins.Right = 50
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = 'freak18'
  end
  object ActionList: TActionList
    Left = 368
    Top = 104
    object ActionLogIn: TAction
      Caption = 'ActionLogIn'
      OnExecute = ActionLoginExecute
    end
  end
end
