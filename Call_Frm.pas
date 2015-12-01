unit Call_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, SIPVoipSDK_TLB, Vcl.ImgList, System.Actions,
  Vcl.ActnList,CallEstablish_Code;

type
  TFrameCall = class(TFrame)
    PanelMenu: TPanel;
    GridPanelMenu: TGridPanel;
    GridMain: TGridPanel;
    LabelMinus: TLabel;
    TrackBarVolume: TTrackBar;
    LabelPlus: TLabel;
    ImageList: TImageList;
    ListBoxMessages: TListBox;
    ActionList1: TActionList;
    ActionCall: TAction;
    ActionSendMessage: TAction;
    ActionCamera: TAction;
    ActionMute: TAction;
    ButtonMute: TButton;
    PanelButton: TPanel;
    ButtonCall: TButton;
    ButtonHangUp: TButton;
    ActionHangUp: TAction;
    Grid: TGridPanel;
    EditMessage: TEdit;
    Panel1: TPanel;
    ButtonCloseCall: TSpeedButton;
    ButtonSendMessage: TButton;
    LabelName: TLabel;
    procedure ActionSendMessageExecute(Sender: TObject);
    procedure ActionCallExecute(Sender: TObject);
    procedure LabelMinusClick(Sender: TObject);
    procedure LabelPlusClick(Sender: TObject);
    procedure TrackBarVolumeChange(Sender: TObject);
    procedure ActionMuteExecute(Sender: TObject);
    procedure AbtoPhone_OnEstablishedCall(ASender: TObject;
      const Msg: WideString; LineId: Integer);
    procedure AbtoPhone_OnClearedCall(ASender: TObject; const Msg: WideString;
      Status, LineId: Integer);
    procedure ActionHangUpExecute(Sender: TObject);
    procedure ActionMuteUpdate(Sender: TObject);
  private
    FUserName: string;
    FCallerId: string;
    FPageIndex: Integer;
    fIsCallEstablish: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Load(Phone: TCAbtoPhone);
    procedure ShowMessage(Address, Msg: string);
    property UserName: string read FUserName write FUserName;
    property UserId: string read FUserName write FCallerId;
    property PageIndex: Integer read FPageIndex write FPageIndex;
    property IsCallEstablish: Boolean read fIsCallEstablish write fIsCallEstablish;
  published
    property ClientHeight;
    property ClientWidth;
  end;

var
  AbtoPhone: TCAbtoPhone;
  gMuted, gVideoShow, gShowSelf: Boolean;
  gLastTrackVolumePosition: Integer;

implementation

{$R *.dfm}

uses Main_Wnd;

procedure TFrameCall.AbtoPhone_OnClearedCall(ASender: TObject;
  const Msg: WideString; Status, LineId: Integer);
begin
  fIsCallEstablish := False;
end;

procedure TFrameCall.AbtoPhone_OnEstablishedCall(ASender: TObject;
  const Msg: WideString; LineId: Integer);
begin
  fIsCallEstablish := True;
end;


procedure TFrameCall.ActionCallExecute(Sender: TObject);
begin
  AbtoPhone.StartCall(UserName + '@iptel.org');
  fIsCallEstablish := True;
  ButtonCall.Visible := False;
  ButtonHangUp.Visible := True;
  gIsCallEstablish := False;
end;

procedure TFrameCall.ActionHangUpExecute(Sender: TObject);
begin
  AbtoPhone.HangUpLastCall;
  fIsCallEstablish := False;
  ButtonCall.Visible := True;
  ButtonHangUp.Visible := False;
  gIsCallEstablish := False;
end;

procedure TFrameCall.ActionMuteExecute(Sender: TObject);
begin
  if not gMuted then
  begin
    gLastTrackVolumePosition := TrackBarVolume.Position;
    TrackBarVolume.Position := 0;
  end
  else
  begin
    if gLastTrackVolumePosition <> 0 then
    begin
      TrackBarVolume.Position := gLastTrackVolumePosition;
    end
    else
    begin
      TrackBarVolume.Position := 1;
    end;
  end;
end;

procedure TFrameCall.ActionMuteUpdate(Sender: TObject);
begin
  if TrackBarVolume.Position = 0 then
  begin
    gMuted := True;
    ButtonMute.ImageIndex := 5;
  end
  else
  begin
    gMuted := False;
    ButtonMute.ImageIndex := 4;
  end;
end;

procedure TFrameCall.ActionSendMessageExecute(Sender: TObject);
var
  cfg: Variant;
begin
  cfg := AbtoPhone.Config;
  AbtoPhone.SendTextMessage(UserName + '@iptel.org', EditMessage.Text, 0);

  ListBoxMessages.Items.Add('Ja : ');
  ListBoxMessages.Items.Add(' ' + EditMessage.Text + sLineBreak);
  EditMessage.Text := '';
end;

procedure TFrameCall.ShowMessage(Address, Msg: string);
begin
  ListBoxMessages.Items.Add(address);
  ListBoxMessages.Items.Add(' ' + Msg + sLineBreak);
end;

procedure TFrameCall.TrackBarVolumeChange(Sender: TObject);
begin
  AbtoPhone.PlaybackVolume := TrackBarVolume.Position
end;

constructor TFrameCall.Create(AOwner: TComponent);
begin
  inherited;
  fIsCallEstablish := False;
  gMuted := False;
  ButtonCall.Caption := '';
  ButtonMute.Caption := '';
  ButtonSendMessage.Caption := '';
  TrackBarVolume.Position := 5;
  ButtonCloseCall.Caption := '';
  LabelName.Caption := fCallerId;
end;

procedure TFrameCall.LabelMinusClick(Sender: TObject);
begin
  if TrackBarVolume.Position > 0 then
    TrackBarVolume.Position := TrackBarVolume.Position - 1;
end;

procedure TFrameCall.LabelPlusClick(Sender: TObject);
begin
  if TrackBarVolume.Position < 10 then
    TrackBarVolume.Position := TrackBarVolume.Position + 1
end;

procedure TFrameCall.Load(Phone: TCAbtoPhone);
begin
  AbtoPhone := Phone;
  AbtoPhone.OnEstablishedCall := AbtoPhone_OnEstablishedCall;
  AbtoPhone.OnClearedCall := AbtoPhone_OnClearedCall;
  gShowSelf := False;
  TrackBarVolume.Position := 5;
  TrackBarVolume.Position := AbtoPhone.PlaybackVolume;
end;

end.
