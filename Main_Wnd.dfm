object FormMainWindow: TFormMainWindow
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'MultiComm'
  ClientHeight = 559
  ClientWidth = 1324
  Color = clMenu
  Constraints.MinHeight = 530
  Constraints.MinWidth = 730
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 18
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 722
    Height = 553
    ActivePage = TabSheetContatcs
    Align = alLeft
    Constraints.MaxHeight = 553
    Constraints.MinHeight = 50
    Constraints.MinWidth = 700
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabPosition = tpBottom
    object TabSheetContatcs: TTabSheet
      AlignWithMargins = True
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Kontakty'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Constraints.MinHeight = 500
      Constraints.MinWidth = 700
      ParentFont = False
      object PanelContacts: TPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 522
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PanelContakts'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object ListViewContacts: TListView
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 708
          Height = 516
          Align = alClient
          BevelEdges = []
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelWidth = 5
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clMenu
          Columns = <>
          ColumnClick = False
          DragCursor = crHandPoint
          DragMode = dmAutomatic
          Font.Charset = EASTEUROPE_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ReadOnly = True
          RowSelect = True
          ParentBiDiMode = False
          ParentFont = False
          SmallImages = ImageList
          TabOrder = 0
          ViewStyle = vsSmallIcon
          OnDblClick = ListViewContactsDblClick
        end
      end
    end
  end
  object ButtonResize: TButton
    Left = 652
    Top = 533
    Width = 66
    Height = 21
    Action = ActionResize
    Align = alCustom
    TabOrder = 1
  end
  object PanelVideo: TPanel
    AlignWithMargins = True
    Left = 748
    Top = 20
    Width = 556
    Height = 509
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 30
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkTile
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
  object ActionList: TActionList
    Left = 440
    Top = 56
    object ActionCall: TAction
      Caption = 'ActionCall'
      OnExecute = ActionCallExecute
    end
    object ActionChat: TAction
      Caption = 'ActionChat'
    end
    object ActionSettings: TAction
      Caption = 'ActionSettings'
      OnExecute = ActionSettingsExecute
    end
    object ActionLogin: TAction
      Caption = 'ActionLogin'
      OnExecute = ActionLoginExecute
    end
    object ActionCloseCall: TAction
      Caption = 'ActionCloseCall'
      OnExecute = ActionCloseCallExecute
    end
    object ActionContactsList: TAction
      Caption = 'ActionContactsList'
      OnExecute = ActionContactsListExecute
    end
    object ActionClose: TAction
      Caption = 'ActionClose'
      OnExecute = ActionCloseExecute
    end
    object ActionResize: TAction
      Caption = '>>>'
      OnExecute = ActionResizeExecute
    end
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Height = 64
    Width = 64
    Left = 376
    Top = 56
  end
  object MainMenu: TMainMenu
    Left = 313
    Top = 57
    object MainMenuAccont: TMenuItem
      Caption = 'Konto'
      object MainMenuSettings: TMenuItem
        Action = ActionSettings
        Caption = 'Ustawienia'
      end
      object MainMenuLogout: TMenuItem
        Action = ActionLogin
        Caption = 'Wyloguj'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MainMenuCloseApp: TMenuItem
        Action = ActionClose
        Caption = 'Zamknij'
      end
    end
    object MainMenuActions: TMenuItem
      Caption = 'Akcje'
      object MainMenuCall: TMenuItem
        Action = ActionCall
        Caption = 'Zadzwo'#324
      end
      object MainMenuContacts: TMenuItem
        Action = ActionContactsList
        Caption = 'Edytuj list'#281' kontakt'#243'w'
      end
    end
  end
  object ADOQuery: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from dbo.Contact')
    Left = 271
    Top = 199
  end
  object ADOConnectionLoad: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=Contacts;Data Source=noteboo' +
      'k15\SQLEXPRESS'
    Provider = 'SQLOLEDB.1'
    Left = 359
    Top = 143
  end
end
