object FormSettings: TFormSettings
  Left = 283
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Konfiguracja'
  ClientHeight = 351
  ClientWidth = 694
  Color = clCream
  Constraints.MaxHeight = 380
  Constraints.MaxWidth = 700
  Constraints.MinHeight = 380
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonOk: TSpeedButton
    Left = 460
    Top = 319
    Width = 110
    Height = 25
    Caption = 'Zapisz'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ButtonCancel: TSpeedButton
    Left = 579
    Top = 319
    Width = 110
    Height = 21
    Caption = 'Anuluj'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBoxDevices: TGroupBox
    Left = 8
    Top = 8
    Width = 681
    Height = 70
    Caption = 'Urz'#261'dzenia'
    TabOrder = 0
    object LabelNetworkInteface: TLabel
      Left = 336
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Interface sieciowy'
    end
    object LabelSoundRecord: TLabel
      Left = 25
      Top = 40
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mikrofon'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelSoundDevice: TLabel
      Left = 30
      Top = 21
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'G'#322'o'#347'niki'
    end
    object LabelVideoDevice: TLabel
      Left = 390
      Top = 43
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kamera'
    end
    object ComboBoxNetworkInterface: TComboBox
      Left = 432
      Top = 16
      Width = 245
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object ComboBoxRecordDevice: TComboBox
      Left = 72
      Top = 40
      Width = 245
      Height = 21
      Style = csDropDownList
      Color = clHighlightText
      TabOrder = 1
    end
    object ComboBoxSoundDevice: TComboBox
      Left = 72
      Top = 16
      Width = 245
      Height = 21
      Style = csDropDownList
      Color = clHighlightText
      TabOrder = 0
    end
  end
  object GroupBoxSound: TGroupBox
    Left = 241
    Top = 80
    Width = 209
    Height = 105
    Caption = 'D'#378'wi'#281'k'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object CheckBoxEchoCancelation: TCheckBox
      Left = 3
      Top = 17
      Width = 193
      Height = 17
      Caption = 'Redukcja echa'
      TabOrder = 0
    end
    object CheckBoxNoiseReduction: TCheckBox
      Left = 3
      Top = 40
      Width = 105
      Height = 17
      Caption = 'Redukcja szum'#243'w'
      TabOrder = 1
    end
    object CheckBoxAutoGainControl: TCheckBox
      Left = 3
      Top = 63
      Width = 203
      Height = 17
      Caption = 'Automatyczna regulacja wzmocnienia'
      TabOrder = 2
    end
  end
  object IdentificationGroupBox: TGroupBox
    Left = 8
    Top = 75
    Width = 227
    Height = 110
    Caption = 'Identyfikacja'
    TabOrder = 4
    object LabelUserAgentEdit: TLabel
      Left = 7
      Top = 20
      Width = 91
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = 'Agent u'#380'ytkownika'
      ParentBiDiMode = False
    end
    object LabelCallerId: TLabel
      Left = 3
      Top = 46
      Width = 95
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = 'Nazwa U'#380'ytkownika'
      ParentBiDiMode = False
    end
    object EditUserAgent: TEdit
      Left = 104
      Top = 16
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object EditCallerId: TEdit
      Left = 104
      Top = 43
      Width = 113
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBoxCodec: TGroupBox
    Left = 456
    Top = 80
    Width = 233
    Height = 233
    Caption = 'Kodeki'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object ButtonMoveDown: TSpeedButton
      Left = 192
      Top = 16
      Width = 30
      Height = 34
      Flat = True
      Glyph.Data = {
        F6070000424DF60700000000000036040000280000001E0000001E0000000100
        080000000000C0030000C40E0000C40E00000001000000010000000000000101
        0100020202000303030005050500060606000707070008080800090909000A0A
        0A000C0C0C000D0D0D000E0E0E000F0F0F001010100013131300161616001818
        1800191919001A1A1A001C1C1C001D1D1D001E1E1E0020202000212121002424
        2400252525002626260028282800292929002B2B2B002C2C2C002D2D2D002F2F
        2F00303030003232320034343400363636003737370038383800393939003A3A
        3A003B3B3B003C3C3C0040404000414141004242420044444400454545004646
        460047474700494949004A4A4A004B4B4B004D4D4D004E4E4E00505050005252
        52005353530054545400565656005757570058585800595959005D5D5D006666
        6600696969006A6A6A006D6D6D006E6E6E007171710072727200757575007B7B
        7B007E7E7E008181810086868600898989008E8E8E0090909000949494009595
        950096969600989898009B9B9B009E9E9E00A1A1A100A4A4A400A6A6A600A8A8
        A800AEAEAE00B4B4B400B6B6B600B7B7B700C2C2C200C3C3C300C4C4C400C6C6
        C600C7C7C700CBCBCB00CCCCCC00CDCDCD00D1D1D100D7D7D700DBDBDB00DCDC
        DC00DDDDDD00DEDEDE00E0E0E000E3E3E300E4E4E400E6E6E600E7E7E700E8E8
        E800E9E9E900EAEAEA00EBEBEB00ECECEC00EEEEEE00EFEFEF00F0F0F000F1F1
        F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
        F900FAFAFA00FBFBFB00FCFCFC00FEFEFE00FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000868686868686
        86868678624E381C1112203B51657C8686868686868686860000868686868686
        86774F1E0900000000000000000C22557D868686868686860000868686868686
        581B0100000000000000000000000001245B8686868686860000868686867A45
        0000000000000000000000000000000000014B828686868600008686867E3B03
        0000000000000000000000000000000000000447818686860000868686420200
        0000000000000000000000000000000000000004498686860000868554000000
        00000000000000021A1701000000000000000000015A86860000866B16000000
        00000000000001366E6B2301000000000000000000217B860000864200000000
        0000000000003B7C86866F2D000000000000000000004E8600006D0B00000000
        00000000033780868686867E2E0100000000000000001C760000590300000000
        0000000139778686868686867126010000000000000009610000420000000000
        0000003F7D8686868686868686723100000000000000004B0000250000000000
        00033B82868686868686868686868032010000000000002E0000120000000000
        023C7886868686867D7F8686868686732B010000000000150000040000000000
        407E8686868686712F3A7E86868686867435000000000004000005000000033F
        848686868686742A00003E7A8686868686823501000000050000110000001973
        86868686867B34010000033D7E86868686866A0A000000140000270000001167
        868686866F2C000000000000377D868686865E070000002F0000440000000018
        688686722600000000000000003A7886856613000000004C0000580300000000
        206C7530010000000000000000033977631800000000086000006F0E00000000
        000D0F000000000000000000000000100900000000001F780000864600000000
        0000000000000000000000000000000000000000000151860000866916000000
        0000000000000000000000000000000000000000001F79860000868557010000
        0000000000000000000000000000000000000000035C86860000868686480200
        00000000000000000000000000000000000000054D86868600008686867A3A02
        00000000000000000000000000000000000003467F8686860000868686867B4A
        0400000000000000000000000000000000064E83868686860000868686868686
        5D1D020000000000000000000000000326628686868686860000868686868686
        86705217060100000000000001081B5676868686868686860000868686868686
        8686867D5F504131282933435364808686868686868686860000}
    end
    object ButtonMoveUp: TSpeedButton
      Left = 19
      Top = 17
      Width = 30
      Height = 33
      Flat = True
      Glyph.Data = {
        F6070000424DF60700000000000036040000280000001E0000001E0000000100
        080000000000C0030000C40E0000C40E00000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000F0F0F001111110013131300161616001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002323
        2300262626002727270028282800292929002A2A2A002B2B2B002C2C2C002D2D
        2D002E2E2E002F2F2F0030303000333333003535350036363600383838003939
        39003A3A3A003D3D3D0040404000414141004343430045454500464646004747
        470048484800494949004A4A4A004B4B4B004C4C4C004F4F4F00505050005151
        51005454540055555500565656005757570058585800595959005A5A5A005E5E
        5E005F5F5F0066666600696969006A6A6A006C6C6C006E6E6E00717171007373
        7300767676007B7B7B007E7E7E008181810085858500888888008E8E8E008F8F
        8F0095959500989898009B9B9B009D9D9D009F9F9F00A4A4A400A5A5A500A7A7
        A700AEAEAE00B3B3B300B5B5B500BFBFBF00C2C2C200C3C3C300C4C4C400C6C6
        C600CACACA00CBCBCB00CCCCCC00D1D1D100D2D2D200DADADA00DCDCDC00DDDD
        DD00DEDEDE00DFDFDF00E0E0E000E1E1E100E2E2E200E3E3E300E4E4E400E5E5
        E500E7E7E700E8E8E800E9E9E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEE
        EE00EFEFEF00F0F0F000F1F1F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6
        F600F8F8F800F9F9F900FCFCFC00FDFDFD00FEFEFE00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000878787878787
        878785796151381C1112213A52647D8687878787878787870000878787878786
        857951200B01010000000001010D24557E858787878787870000878787878685
        581B0200000000000000000000000003265B8586878787870000878787867C47
        0200000000000000000000000000000000044D828687878700008787877F3B06
        0000000000000000000000000000000000000949828787870000878784440400
        00000000000000000000000000000000000000084B8587870000878454020000
        0000000000000000000000000000000000000000035A85870000876817000000
        000000000000000000000000000000000000000000237C870000854501000000
        00000000000000000000000000000000000000000002508600006D0D00000000
        001013010000000000000000000001160E00000000011D760000590300000001
        1E666930020000000000000000033C6C5D17000000000A600000450000000025
        67878773330200000000000002437B8786651C000000004D0000280000001469
        8787878776310200000000023F828787878762090000002E0000120000001A75
        8787878787763403000005407A87878787876A0C00000016000006000000043D
        7C878787878775360303457D8787878787773202000000060000070000000001
        3B7B8787878787783642838787878786702C0100000000060000120000000000
        04417A8787878787797C8787878786752D030000000000170000290000000000
        0004397A86878787878787878786762E020000000000002F0000460000000000
        000003377B86878787878787866F2903000000000000014E0000570300000000
        000000053E7B878787878787742B04000000000000000A5F0000700F01000000
        0000000004367887878787722C02000000000000000122780000874801000000
        000000000002357987876B270200000000000000000252870000876718010000
        000000000000033B736E29020000000000000000012279870000878657030000
        0000000000000002191501000000000000000000045C868700008787844A0300
        00000000000000000000000000000000000000074F84878700008787877C3A04
        0000000000000000000000000000000000000548808787870000878787867C4C
        0701000000000000000000000000000001085083868787870000878787878686
        5C1F030100000000000000000000010429608687878787870000878787878787
        867152190801000000000000010A1C5677868787878787870000878787878787
        8787877E5E524331292A34455363818787878787878787870000}
    end
    object ListBoxCodecs: TCheckListBox
      AlignWithMargins = True
      Left = 7
      Top = 58
      Width = 219
      Height = 168
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBoxOther: TGroupBox
    Left = 8
    Top = 191
    Width = 227
    Height = 122
    Caption = 'Inne'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      227
      122)
    object StunLabel: TLabel
      Left = 75
      Top = 43
      Width = 26
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = 'STUN'
      ParentBiDiMode = False
    end
    object LabelSipPort: TLabel
      Left = 8
      Top = 17
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Port nas'#322'uchiwania '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 48
      Top = 69
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Domena'
    end
    object EditStun: TEdit
      Left = 107
      Top = 40
      Width = 110
      Height = 21
      TabOrder = 1
    end
    object EditSipPort: TEdit
      Left = 107
      Top = 13
      Width = 110
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '5060'
    end
    object EditDomain: TEdit
      Left = 107
      Top = 67
      Width = 110
      Height = 21
      Anchors = []
      TabOrder = 2
    end
  end
  object ComboBoxVideoDevice: TComboBox
    Left = 440
    Top = 48
    Width = 245
    Height = 21
    Style = csDropDownList
    TabOrder = 5
  end
  object LabelAddr: TEdit
    Left = 241
    Top = 319
    Width = 207
    Height = 21
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'Address'
  end
  object LabelVersion: TEdit
    Left = 8
    Top = 319
    Width = 227
    Height = 21
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = 'Version'
  end
  object GroupBoxLicense: TGroupBox
    Left = 241
    Top = 191
    Width = 209
    Height = 122
    Caption = 'Licencja'
    TabOrder = 8
    object LabelUserId: TLabel
      Left = 49
      Top = 16
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'User Id'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelKey: TLabel
      Left = 28
      Top = 43
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'License Key'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EditUserId: TEdit
      Left = 90
      Top = 13
      Width = 110
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditLicenseKey: TEdit
      Left = 90
      Top = 40
      Width = 110
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end