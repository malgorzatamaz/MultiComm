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
    ButtonCall: TSpeedButton;
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
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ActionSendMessageExecute(Sender: TObject);
    procedure ActionCallExecute(Sender: TObject);
  private
    pUserName: string;
    pUserId: string;
    pPageIndex : Integer;
  public
    gIsCallEstablish: Boolean;
    procedure Release;
    procedure AbtoPhone_OnEstablishedCall(ASender: TObject;
      const Msg: WideString; LineId: Integer);
    procedure Load(Phone: TCAbtoPhone);
    procedure HangUp();
    procedure Call();
    procedure ShowMessage(Adress, Msg :string);
    constructor Create(AOwner: TComponent); override;
    property UserName: string read pUserName write pUserName;
    property UserId: string read pUserName write pUserId;
    property PageIndex : Integer read pPageIndex write pPageIndex;
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
begin
  if gIsCallEstablish then
  begin
    AbtoPhone.HangUpLastCall;
    HangUp;
  end
  else
  begin
    AbtoPhone.StartCall(UserName + '@iptel.org');
    Call;
  end
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
    AbtoPhone.SendTextMessage(UserName,MemoMessage.Lines[i]);
    ListBoxMessages.Items.Add(MemoMessage.Lines[i]);
  end;

  MemoMessage.Lines.Clear;
end;

procedure TFrameCall.ButtonCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TFrameCall.CMRelease(var Message: TMessage);
begin
  Free;
end;

procedure TFrameCall.Release;
begin
  PostMessage(Handle, CM_RELEASE, 0, 0);
end;

procedure TFrameCall.ShowMessage(Addres, Msg : string);
begin
  ListBoxMessages.Items.Add(Adress + ': ');
  ListBoxMessages.Items.Add(Msg);
end;

constructor TFrameCall.Create(AOwner: TComponent);
begin
  inherited;
  ButtonClose.Caption := '';
end;

procedure TFrameCall.Call;
var
  tmpBitmap: TBitmap;
begin
  tmpBitmap := TBitmap.Create();
  ImageList.GetBitmap(3, tmpBitmap);
  ButtonCall.Glyph := tmpBitmap;
  gIsCallEstablish := True;
end;

procedure TFrameCall.HangUp;
var
  tmpBitmap: TBitmap;
begin
  tmpBitmap := TBitmap.Create();
  ImageList.GetBitmap(4, tmpBitmap);
  ButtonCall.Glyph := tmpBitmap;
  gIsCallEstablish := False;
end;

procedure TFrameCall.Load(Phone: TCAbtoPhone);
begin
  AbtoPhone := Phone;
  gIsCallEstablish := False;
  AbtoPhone.OnEstablishedCall := AbtoPhone_OnEstablishedCall;
end;

procedure TFrameCall.AbtoPhone_OnEstablishedCall(ASender: TObject;
  const Msg: WideString; LineId: Integer);
begin
  Call;
end;
end.
