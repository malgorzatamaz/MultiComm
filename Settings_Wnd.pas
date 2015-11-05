unit Settings_Wnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, SIPVoipSDK_TLB, CheckLst;

type
  TSettingsForm = class(TForm)
    RegistrarGroupBox: TGroupBox;
    ProxyDomainLabel: TLabel;
    RegistrarUserLabel: TLabel;
    RegisrarPasswordLabel: TLabel;
    AuthIdLabel: TLabel;
    ExpireTimeLabel: TLabel;
    RegDomainEdit: TEdit;
    RegUserEdit: TEdit;
    RegPassEdit: TEdit;
    RegAuthIdEdit: TEdit;
    RegExpireEdit: TEdit;
    OutboundGroupBox: TGroupBox;
    OutboundProxyLabel: TLabel;
    OutboundProxyUserLabel: TLabel;
    OutboundProxyPasswordLabel: TLabel;
    OutboundProxyEdit: TEdit;
    OutboundUserEdit: TEdit;
    OutboundPasswordEdit: TEdit;
    SoundGroupBox: TGroupBox;
    IdentificationGroupBox: TGroupBox;
    CodecGroupBox: TGroupBox;
    OkButton: TButton;
    CancelButton: TButton;
    UserAgentEditLabel: TLabel;
    CallerIdLabel: TLabel;
    EchoCancelationCheckBox: TCheckBox;
    NoiseReductionCheckBox: TCheckBox;
    AutoGainControlCheckBox: TCheckBox;
    MoveUpButton: TButton;
    MoveDownButton: TButton;
    UserAgentEdit: TEdit;
    CallerIdEdit: TEdit;
    CodecsListBox: TCheckListBox;
    DevicesGroupBox: TGroupBox;
    NetworkInterfaceComboBox: TComboBox;
    RecordDeviceComboBox: TComboBox;
    SoundDeviceComboBox: TComboBox;
    Label1: TLabel;
    SoundRecordLabel: TLabel;
    SoundDeviceLabel: TLabel;
    OtherGroupBox: TGroupBox;
    StunEdit: TEdit;
    StunLabel: TLabel;
    SipPortLabel: TLabel;
    SipPortEdit: TEdit;
    VideoDeviceComboBox: TComboBox;
    Label2: TLabel;
    LabelAddr: TEdit;
    LabelVersion: TEdit;
    procedure MoveUpButtonClick(Sender: TObject);
    procedure MoveDownButtonClick(Sender: TObject);
    procedure MoveCodec(oldIndex, newIndex: Integer);
    function GetCodecsString: string;
  public
    Settings: Variant;
    procedure SetSettings(Settings: Variant; version: WideString;
      addr: WideString);
    procedure SetupUserInput;
  end;

implementation

{$R *.dfm}

procedure TSettingsForm.SetSettings(Settings: Variant; version: WideString;
  addr: WideString);
var
  i: Integer;
begin

  Self.Settings := Settings;

  Self.StunEdit.Text := Settings.StunServer;
  Self.SipPortEdit.Text := IntToStr(Settings.ListenPort);

  Self.UserAgentEdit.Text := Settings.UserAgent;
  Self.CallerIdEdit.Text := Settings.CallerId;

  Self.RegDomainEdit.Text := Settings.RegDomain;
  Self.RegUserEdit.Text := Settings.RegUser;
  Self.RegPassEdit.Text := Settings.RegPass;
  Self.RegAuthIdEdit.Text := Settings.RegAuthId;
  Self.RegExpireEdit.Text := IntToStr(Settings.RegExpire);

  Self.OutboundProxyEdit.Text := Settings.ProxyDomain;
  Self.OutboundUserEdit.Text := Settings.ProxyUser;
  Self.OutboundPasswordEdit.Text := Settings.ProxyPass;

  Self.EchoCancelationCheckBox.Checked := Settings.EchoCancelationEnabled <> 0;
  Self.NoiseReductionCheckBox.Checked := Settings.NoiseReductionEnabled <> 0;
  Self.AutoGainControlCheckBox.Checked := Settings.AutoGainControlEnabled <> 0;
  Self.LabelVersion.Text := version;
  Self.LabelAddr.Text := addr;

  { Codecs }
  for i := 0 to Settings.CodecCount - 1 do
  begin
    CodecsListBox.Items.Add(Settings.CodecName[i]);
    CodecsListBox.Checked[i] := Settings.CodecSelected[i] <> 0;
  end;

  { Playback devices list }
  for i := 0 to Settings.PlaybackDeviceCount - 1 do
    SoundDeviceComboBox.Items.Add(Settings.PlaybackDevice[i]);

  if Settings.PlaybackDeviceCount <> 0 then
    SoundDeviceComboBox.ItemIndex := Self.SoundDeviceComboBox.Items.IndexOf
      (Settings.ActivePlaybackDevice);

  { Record devices list }
  for i := 0 to Settings.RecordDeviceCount - 1 do
    RecordDeviceComboBox.Items.Add(Settings.RecordDevice[i]);

  if Settings.RecordDeviceCount <> 0 then
    Self.RecordDeviceComboBox.ItemIndex :=
      Self.RecordDeviceComboBox.Items.IndexOf(Settings.ActiveRecordDevice);

  { Network interfaces list }
  for i := 0 to Settings.NetworkInterfaceCount - 1 do
    NetworkInterfaceComboBox.Items.Add(Settings.NetworkInterface[i]);

  if Settings.NetworkInterfaceCount <> 0 then
    NetworkInterfaceComboBox.ItemIndex :=
      Self.NetworkInterfaceComboBox.Items.IndexOf
      (Settings.ActiveNetworkInterface);

  { Video devices list }
  for i := 0 to Settings.VideoDeviceCount - 1 do
    VideoDeviceComboBox.Items.Add(Settings.VideoDevice[i]);

  if Settings.VideoDeviceCount <> 0 then
    VideoDeviceComboBox.ItemIndex := Self.VideoDeviceComboBox.Items.IndexOf
      (Settings.ActiveVideoDevice);

end;

procedure TSettingsForm.MoveUpButtonClick(Sender: TObject);
var
  selected: Integer;
begin
  selected := Self.CodecsListBox.ItemIndex;
  if selected >= 1 then
    Self.MoveCodec(selected, selected - 1);

end;

procedure TSettingsForm.MoveDownButtonClick(Sender: TObject);
var
  selected: Integer;
begin
  selected := Self.CodecsListBox.ItemIndex;
  if (selected <> -1) and (selected < Self.CodecsListBox.Count - 1) then
  begin
    Self.MoveCodec(selected, selected + 1);
  end;
end;

procedure TSettingsForm.MoveCodec(oldIndex, newIndex: Integer);
var
  CodecName: string;
  isChecked: Boolean;
begin
  CodecName := Self.CodecsListBox.Items[oldIndex];
  isChecked := Self.CodecsListBox.Checked[oldIndex];
  Self.CodecsListBox.Items.Delete(oldIndex);

  Self.CodecsListBox.Items.Insert(newIndex, CodecName);
  Self.CodecsListBox.Checked[newIndex] := isChecked;
  Self.CodecsListBox.ItemIndex := newIndex;
end;

function TSettingsForm.GetCodecsString: string;
var
  i, Count: Integer;
  { codec: string; }
begin
  Count := Self.CodecsListBox.Count;
  result := '';
  for i := 0 to Count - 1 do
  begin
    if Self.CodecsListBox.Checked[i] = True then
      result := result + Self.CodecsListBox.Items[i] + '|';
  end;
end;

procedure TSettingsForm.SetupUserInput;
begin
  Settings.StunServer := StunEdit.Text;
  try
    Settings.ListenPort := StrToInt(SipPortEdit.Text);
  except
    Settings.ListenPort := 0;
  end;

  Settings.ActivePlaybackDevice := SoundDeviceComboBox.Text;
  Settings.ActiveRecordDevice := RecordDeviceComboBox.Text;
  Settings.ActiveNetworkInterface := NetworkInterfaceComboBox.Text;
  Settings.ActiveVideoDevice := VideoDeviceComboBox.Text;

  if EchoCancelationCheckBox.Checked then
    Settings.EchoCancelationEnabled := 1
  else
    Settings.EchoCancelationEnabled := 0;

  if NoiseReductionCheckBox.Checked then
    Settings.NoiseReductionEnabled := 1
  else
    Settings.NoiseReductionEnabled := 0;

  if AutoGainControlCheckBox.Checked then
    Settings.AutoGainControlEnabled := 1
  else
    Settings.AutoGainControlEnabled := 0;

  Settings.UserAgent := UserAgentEdit.Text;
  Settings.CallerId := CallerIdEdit.Text;

  Settings.RegDomain := RegDomainEdit.Text;
  Settings.RegUser := RegUserEdit.Text;
  Settings.RegPass := RegPassEdit.Text;
  Settings.RegAuthId := RegAuthIdEdit.Text;

  try
    Settings.RegExpire := StrToInt(RegExpireEdit.Text);
  except
    Settings.RegExpire := 0;
  end;

  Settings.ProxyDomain := OutboundProxyEdit.Text;
  Settings.ProxyUser := OutboundUserEdit.Text;
  Settings.ProxyPass := OutboundPasswordEdit.Text;

  Settings.SetCodecOrder(GetCodecsString, 0);
end;

end.
