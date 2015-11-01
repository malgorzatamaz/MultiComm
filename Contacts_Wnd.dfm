object FormContactsList: TFormContactsList
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Lista kontakt'#243'w'
  ClientHeight = 393
  ClientWidth = 728
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 41
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    BevelWidth = 8
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object ButtonAdd: TSpeedButton
      Left = 0
      Top = 0
      Width = 80
      Height = 37
      Align = alLeft
      Caption = 'Dodaj'
      Flat = True
      ExplicitHeight = 49
    end
    object ButtonDelete: TSpeedButton
      Left = 80
      Top = 0
      Width = 80
      Height = 37
      Align = alLeft
      Caption = 'Usu'#324
      Flat = True
      ExplicitHeight = 49
    end
    object ButtonEdit: TSpeedButton
      Left = 160
      Top = 0
      Width = 80
      Height = 37
      Align = alLeft
      Caption = 'Edytuj'
      Flat = True
      ExplicitHeight = 49
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 728
    Height = 352
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnl3: TPanel
      Left = 0
      Top = 296
      Width = 728
      Height = 56
      Align = alBottom
      BevelKind = bkSoft
      BevelOuter = bvNone
      BevelWidth = 5
      TabOrder = 0
      object Button2: TSpeedButton
        Left = 0
        Top = 0
        Width = 170
        Height = 52
        Align = alLeft
        Caption = 'Anuluj'
        Flat = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitHeight = 41
      end
      object Button3: TSpeedButton
        Left = 554
        Top = 0
        Width = 170
        Height = 52
        Align = alRight
        Caption = 'Zapisz'
        Flat = True
        ExplicitLeft = 328
        ExplicitHeight = 41
      end
    end
    object Grid1Grid: TGridPanel
      Left = 0
      Top = 0
      Width = 329
      Height = 296
      Align = alLeft
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 31.696905016008540000
        end
        item
          Value = 42.689434364994660000
        end
        item
          Value = 25.613660618996800000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = LabelCallerId
          Row = 0
        end
        item
          Column = 0
          Control = LabelUserName
          Row = 1
        end
        item
          Column = 1
          Control = EditUserName
          Row = 1
        end
        item
          Column = 0
          Control = LabelImagePath
          Row = 2
        end
        item
          Column = 1
          Control = EditAvatarPath
          Row = 2
        end
        item
          Column = 2
          Control = ButtonPath
          Row = 2
        end
        item
          Column = 1
          Control = EditCallerId
          Row = 0
        end>
      RowCollection = <
        item
          Value = 21.268688308875570000
        end
        item
          Value = 20.649740281954650000
        end
        item
          Value = 19.907002649649530000
        end
        item
          Value = 38.174568759520250000
        end>
      TabOrder = 1
      ExplicitLeft = -3
      ExplicitTop = -4
      DesignSize = (
        329
        296)
      object LabelCallerId: TLabel
        Left = 16
        Top = 24
        Width = 83
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Nazwa konataktu'
        ExplicitLeft = 28
        ExplicitTop = 46
      end
      object LabelUserName: TLabel
        Left = 6
        Top = 84
        Width = 94
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Nazwa u'#380'ytkownika'
        ExplicitLeft = 17
        ExplicitTop = 154
      end
      object EditUserName: TEdit
        Left = 113
        Top = 81
        Width = 121
        Height = 21
        Align = alCustom
        Anchors = []
        TabOrder = 0
      end
      object LabelImagePath: TLabel
        Left = 66
        Top = 146
        Width = 33
        Height = 13
        Align = alCustom
        Alignment = taRightJustify
        Anchors = []
        Caption = 'Avatar'
      end
      object EditAvatarPath: TEdit
        Left = 113
        Top = 138
        Width = 121
        Height = 21
        Align = alCustom
        Anchors = []
        TabOrder = 1
      end
      object ButtonPath: TSpeedButton
        AlignWithMargins = True
        Left = 247
        Top = 126
        Width = 79
        Height = 52
        Align = alClient
        Anchors = []
        Caption = 'Wybierz'
        Flat = True
        ExplicitLeft = 293
        ExplicitTop = 95
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
      object EditCallerId: TEdit
        Left = 113
        Top = 20
        Width = 121
        Height = 21
        Anchors = []
        TabOrder = 2
      end
    end
    object ListView1: TListView
      AlignWithMargins = True
      Left = 339
      Top = 10
      Width = 379
      Height = 276
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      BevelInner = bvLowered
      BevelKind = bkSoft
      Columns = <>
      TabOrder = 2
    end
  end
end
