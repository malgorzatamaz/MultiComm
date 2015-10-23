unit Call_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, SIPVoipSDK_TLB, Vcl.ImgList;

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
    ButtonClose: TSpeedButton;
    GridMessageSend: TGridPanel;
    mmoMessage: TMemo;
    ButtonSend: TSpeedButton;
    pnl1: TPanel;
    lstMessage: TListBox;
    procedure ButtonCallClick(Sender: TObject);
  private
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
  public
    gIsCallEstablish: Boolean;
    pUserName: string;
    pUserId: string;
    procedure Release;
    procedure AbtoPhone_OnEstablishedCall(ASender: TObject;
      const Msg: WideString; LineId: Integer);
    procedure AbtoPhone_OnTextMessageReceived(ASender: TObject;
      const address: WideString; const Message: WideString);
    procedure Load(Phone: TCAbtoPhone);
    constructor Create(AOwner: TComponent); override;
    property gUserName: string read pUserName write pUserName;
    property gUserId: string read pUserName write pUserId;
  published
    property ClientHeight;
    property ClientWidth;
  end;

var
  AbtoPhone: TCAbtoPhone;

implementation

{$R *.dfm}

uses Main_Wnd;

procedure TFrameCall.AbtoPhone_OnTextMessageReceived(ASender: TObject;
  const address, Message: WideString);
begin
//
end;

procedure TFrameCall.ButtonCallClick(Sender: TObject);
var
  tmpBitmap: TBitmap;
begin
  tmpBitmap := TBitmap.Create();

  if gIsCallEstablish then
  begin
    AbtoPhone.HangUpLastCall;
    ImageList.GetBitmap(4, tmpBitmap);
    ButtonCall.Glyph := tmpBitmap;
    gIsCallEstablish := False;
  end
  else
  begin
    AbtoPhone.StartCall(gUserName + '@iptel.org');
    ImageList.GetBitmap(3, tmpBitmap);
    ButtonCall.Glyph := tmpBitmap;
  end
end;

procedure TFrameCall.CMRelease(var Message: TMessage);
begin
  Free;
end;

procedure TFrameCall.Release;
begin
  PostMessage(Handle, CM_RELEASE, 0, 0);
end;

constructor TFrameCall.Create(AOwner: TComponent);
begin
  inherited;
  ButtonClose.Caption := '';
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
  gIsCallEstablish := True;
end;

end.
