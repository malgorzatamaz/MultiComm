unit Call_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, SIPVoipSDK_TLB, Vcl.ImgList, System.Actions,
  Vcl.ActnList;

type
  TFrameCall = class(TFrame)
    pnlMenu: TPanel;
    Menu: TGridPanel;
    GridMain: TGridPanel;
    ButtonVoice: TSpeedButton;
    ButtonVideo: TSpeedButton;
    lbl1: TLabel;
    TrackBarVolume: TTrackBar;
    lbl2: TLabel;
    ImageList: TImageList;
    Panel1: TPanel;
    GridMessageSend: TGridPanel;
    MemoMessage: TMemo;
    ButtonSend: TSpeedButton;
    pnl1: TPanel;
    ListBoxMessages: TListBox;
    ButtonClose: TSpeedButton;
    ActionList1: TActionList;
    ActionCall: TAction;
    ActionSendMessage: TAction;
    ButtonCall: TSpeedButton;
    procedure ActionSendMessageExecute(Sender: TObject);
    procedure ActionCallExecute(Sender: TObject);
  private
    FUserName: string;
    FUserId: string;
    FPageIndex : Integer;
  public
    gIsCallEstablish: Boolean;
    procedure Load(Phone: TCAbtoPhone);
    procedure ShowMessage(Address, Msg :string);
    constructor Create(AOwner: TComponent); override;
    property UserName: string read FUserName write FUserName;
    property UserId: string read FUserName write FUserId;
    property PageIndex : Integer read FPageIndex write FPageIndex;
  published
    property ClientHeight;
    property ClientWidth;
  end;

var
  AbtoPhone: TCAbtoPhone;

implementation

{$R *.dfm}

uses Main_Wnd;

procedure TFrameCall.ActionCallExecute(Sender: TObject);
var
  tmpBitmap: TBitmap;
begin
  if gIsCallEstablish = False then
  begin
    tmpBitmap := TBitmap.Create();
    ImageList.GetBitmap(4, tmpBitmap);
    ButtonCall.Glyph := tmpBitmap;
    gIsCallEstablish := True;
    AbtoPhone.HangUpLastCall;
  end
  else
  begin
    tmpBitmap := TBitmap.Create();
    ImageList.GetBitmap(3, tmpBitmap);
    ButtonCall.Glyph := tmpBitmap;
    gIsCallEstablish := False;
    AbtoPhone.StartCall(UserName + '@iptel.org');
  end;
end;

procedure TFrameCall.ActionSendMessageExecute(Sender: TObject);
var
  i : Integer;
  cfg : Variant;
begin
  cfg := AbtoPhone.Config;

  ListBoxMessages.Items.Add(cfg.CallerId + ': ');
  for i := 0 to High(MemoMessage.Lines.Count) do
  begin
    AbtoPhone.SendTextMessage(UserName,MemoMessage.Lines[i],1);
    ListBoxMessages.Items.Add(MemoMessage.Lines[i]);
  end;

  MemoMessage.Lines.Clear;
end;

procedure TFrameCall.ShowMessage(Address, Msg : string);
begin
  ListBoxMessages.Items.Add(Address + ': ');
  ListBoxMessages.Items.Add(Msg);
end;

constructor TFrameCall.Create(AOwner: TComponent);
begin
  inherited;
  ButtonClose.Caption := '';
end;

procedure TFrameCall.Load(Phone: TCAbtoPhone);
begin
  ButtonCall.Caption := '';
  AbtoPhone := Phone;
  gIsCallEstablish := False;
end;

end.
