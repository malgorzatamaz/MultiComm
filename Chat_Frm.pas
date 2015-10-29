unit Chat_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, SIPVoipSDK_TLB, Vcl.ImgList, System.Actions, Vcl.ActnList;

type
  TFrameChat = class(TFrame)
    pnl1: TPanel;
    Grid: TGridPanel;
    ButtonSend: TSpeedButton;
    SpeedButtonRead: TSpeedButton;
    SpeedButtonWrite: TSpeedButton;
    ListBoxMessages: TListBox;
    MemoMessage: TMemo;
    Panel2: TPanel;
    ImageList: TImageList;
    ButtonClose: TSpeedButton;
    ActionList: TActionList;
    ActionSendMessage: TAction;
    procedure ActionSendMessageExecute(Sender: TObject);
  private
    FUserName  : string;
    FUserId : string;
    FPageIndex : Integer;
  public
    procedure Load(Phone: TCAbtoPhone);
    procedure ShowMessage(Address: string;  Msg : string);
    constructor Create(AOwner: TComponent); override;
    property UserName : string read FUserName write FUserName;
    property UserId : string read FUserId write FUserId;
    property PageIndex : Integer read FPageIndex write FPageIndex;
  end;
  var
    AbtoPhone : TCAbtoPhone;

implementation
{$R *.dfm}

uses Main_Wnd;

procedure TFrameChat.ActionSendMessageExecute(Sender: TObject);
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

constructor TFrameChat.Create(AOwner: TComponent);
var
  Bitmap : TBitmap;
begin
  inherited;
  ButtonClose.Caption := '';
  Bitmap := TBitmap.Create();
  ImageList.GetBitmap(0,Bitmap);
  ButtonClose.Glyph.Assign(Bitmap);
end;

procedure TFrameChat.Load(Phone: TCAbtoPhone);
begin
  AbtoPhone := Phone;
end;

procedure TFrameChat.ShowMessage(Address, Msg: string);
begin
  ListBoxMessages.Items.Add(Address);
  ListBoxMessages.Items.Add(Msg);
end;

end.
