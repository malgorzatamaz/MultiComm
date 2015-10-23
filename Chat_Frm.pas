unit Chat_Frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, SIPVoipSDK_TLB, Vcl.ImgList;

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
    procedure ButtonCloseClick(Sender: TObject);
  private
    pUserName  : string;
    pUserId : string;
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
  public
    procedure Release;
    procedure Load(Phone: TCAbtoPhone);
    constructor Create(AOwner: TComponent); override;
    property gUserName : string read pUserName write pUserName;
    property gUserId : string read pUserId write pUserName;
  end;
  var
    AbtoPhone : TCAbtoPhone;

implementation
{$R *.dfm}
procedure TFrameChat.ButtonCloseClick(Sender: TObject);
begin
//
end;

procedure TFrameChat.CMRelease(var Message: TMessage);
begin
  Free;
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

procedure TFrameChat.Release;
begin
  PostMessage(Handle, CM_RELEASE, 0, 0);
end;

end.
