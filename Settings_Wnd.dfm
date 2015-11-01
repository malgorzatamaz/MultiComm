object SettingsForm: TSettingsForm
  Left = 283
  Top = 164
  BorderStyle = bsDialog
  Caption = 'PhoneConfig'
  ClientHeight = 435
  ClientWidth = 697
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DevicesGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 681
    Height = 70
    Caption = 'Urz'#261'dzenia'
    TabOrder = 0
    object Label1: TLabel
      Left = 353
      Top = 19
      Width = 73
      Height = 13
      Caption = 'Karta sieciowa:'
    end
    object SoundRecordLabel: TLabel
      Left = 8
      Top = 43
      Width = 45
      Height = 13
      Caption = 'Mikrofon:'
    end
    object SoundDeviceLabel: TLabel
      Left = 8
      Top = 19
      Width = 40
      Height = 13
      Caption = 'G'#322'o'#347'niki:'
    end
    object Label2: TLabel
      Left = 353
      Top = 43
      Width = 40
      Height = 13
      Caption = 'Kamera:'
    end
    object NetworkInterfaceComboBox: TComboBox
      Left = 432
      Top = 16
      Width = 245
      Height = 21
      Style = csDropDownList
      TabOrder = 2
    end
    object RecordDeviceComboBox: TComboBox
      Left = 88
      Top = 40
      Width = 245
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object SoundDeviceComboBox: TComboBox
      Left = 88
      Top = 16
      Width = 245
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
  end
  object RegistrarGroupBox: TGroupBox
    Left = 8
    Top = 81
    Width = 209
    Height = 145
    Caption = 'Rejestracja'
    TabOrder = 2
    object ProxyDomainLabel: TLabel
      Left = 8
      Top = 19
      Width = 75
      Height = 13
      Caption = 'Proxy/Domena:'
    end
    object RegistrarUserLabel: TLabel
      Left = 8
      Top = 43
      Width = 58
      Height = 13
      Caption = 'U'#380'ytkownik:'
    end
    object RegisrarPasswordLabel: TLabel
      Left = 8
      Top = 67
      Width = 31
      Height = 13
      Caption = 'Has'#322'o:'
    end
    object AuthIdLabel: TLabel
      Left = 8
      Top = 91
      Width = 48
      Height = 13
      Caption = 'Autor. Id:'
    end
    object ExpireTimeLabel: TLabel
      Left = 8
      Top = 115
      Width = 73
      Height = 13
      Caption = 'Czas wa'#380'no'#347'ci:'
    end
    object RegDomainEdit: TEdit
      Left = 88
      Top = 16
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object RegUserEdit: TEdit
      Left = 88
      Top = 40
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object RegPassEdit: TEdit
      Left = 88
      Top = 64
      Width = 113
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object RegAuthIdEdit: TEdit
      Left = 88
      Top = 88
      Width = 113
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object RegExpireEdit: TEdit
      Left = 88
      Top = 112
      Width = 113
      Height = 21
      TabOrder = 4
    end
  end
  object OutboundGroupBox: TGroupBox
    Left = 9
    Top = 232
    Width = 209
    Height = 97
    Caption = 'Zewn'#281'trzne Proxy'
    TabOrder = 5
    object OutboundProxyLabel: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Proxy:'
    end
    object OutboundProxyUserLabel: TLabel
      Left = 8
      Top = 48
      Width = 58
      Height = 13
      Caption = 'U'#380'ytkownik:'
    end
    object OutboundProxyPasswordLabel: TLabel
      Left = 8
      Top = 69
      Width = 31
      Height = 13
      Caption = 'Has'#322'o:'
    end
    object OutboundProxyEdit: TEdit
      Left = 88
      Top = 16
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object OutboundUserEdit: TEdit
      Left = 88
      Top = 40
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object OutboundPasswordEdit: TEdit
      Left = 88
      Top = 64
      Width = 113
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object SoundGroupBox: TGroupBox
    Left = 224
    Top = 80
    Width = 225
    Height = 145
    Caption = 'G'#322'os'
    TabOrder = 3
    object EchoCancelationCheckBox: TCheckBox
      Left = 8
      Top = 16
      Width = 193
      Height = 17
      Caption = 'Redukcja echa'
      TabOrder = 0
    end
    object NoiseReductionCheckBox: TCheckBox
      Left = 8
      Top = 40
      Width = 105
      Height = 17
      Caption = 'Redukcja ha'#322'asu'
      TabOrder = 1
    end
    object AutoGainControlCheckBox: TCheckBox
      Left = 8
      Top = 64
      Width = 153
      Height = 17
      Caption = 'Automatyczna kontola g'#322'osu'
      TabOrder = 2
    end
  end
  object IdentificationGroupBox: TGroupBox
    Left = 8
    Top = 328
    Width = 209
    Height = 73
    Caption = 'Identyfikacja'
    TabOrder = 6
    object UserAgentEditLabel: TLabel
      Left = 8
      Top = 24
      Width = 54
      Height = 13
      Caption = 'U'#380'ykownik:'
    end
    object CallerIdLabel: TLabel
      Left = 8
      Top = 48
      Width = 79
      Height = 13
      Caption = 'Id dzwoni'#261'cego:'
    end
    object UserAgentEdit: TEdit
      Left = 88
      Top = 16
      Width = 113
      Height = 21
      TabOrder = 0
    end
    object CallerIdEdit: TEdit
      Left = 88
      Top = 40
      Width = 113
      Height = 21
      TabOrder = 1
    end
  end
  object CodecGroupBox: TGroupBox
    Left = 456
    Top = 80
    Width = 233
    Height = 321
    Caption = 'Kodeki'
    TabOrder = 4
    object MoveUpButton: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 21
      Caption = 'Do g'#243'ry'
      TabOrder = 0
      OnClick = MoveUpButtonClick
    end
    object MoveDownButton: TButton
      Left = 152
      Top = 16
      Width = 75
      Height = 21
      Caption = 'Na d'#243#322
      TabOrder = 1
      OnClick = MoveDownButtonClick
    end
    object CodecsListBox: TCheckListBox
      Left = 8
      Top = 43
      Width = 217
      Height = 273
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object OkButton: TButton
    Left = 480
    Top = 407
    Width = 75
    Height = 21
    Caption = 'Zapisz'
    ModalResult = 1
    TabOrder = 7
  end
  object CancelButton: TButton
    Left = 606
    Top = 407
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'Anuluj'
    ModalResult = 2
    TabOrder = 8
  end
  object OtherGroupBox: TGroupBox
    Left = 224
    Top = 232
    Width = 225
    Height = 169
    Caption = 'Inne'
    TabOrder = 1
    object StunLabel: TLabel
      Left = 8
      Top = 43
      Width = 30
      Height = 13
      Caption = 'STUN:'
    end
    object SipPortLabel: TLabel
      Left = 8
      Top = 16
      Width = 113
      Height = 13
      Caption = 'SIP Port nas'#322'uchiwania:'
    end
    object StunEdit: TEdit
      Left = 125
      Top = 40
      Width = 97
      Height = 21
      TabOrder = 1
    end
    object SipPortEdit: TEdit
      Left = 125
      Top = 13
      Width = 97
      Height = 21
      TabOrder = 0
      Text = '5060'
    end
  end
  object VideoDeviceComboBox: TComboBox
    Left = 440
    Top = 48
    Width = 245
    Height = 21
    Style = csDropDownList
    TabOrder = 9
  end
  object LabelAddr: TEdit
    Left = 224
    Top = 407
    Width = 225
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 10
    Text = 'Adres'
  end
  object LabelVersion: TEdit
    Left = 8
    Top = 407
    Width = 209
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 11
    Text = 'Wersja'
  end
end
