unit Login_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, SIPVoipSDK_TLB;

type
  TFormLog = class(TForm)
    EditLogin: TEdit;
    EditPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ButtonLogin: TSpeedButton;
    LabelWarning: TLabel;
    ActionList: TActionList;
    ActionLogIn: TAction;
    procedure ActionLogInExecute(Sender: TObject);
  private
  public
    procedure Load(Phone: TCAbtoPhone);
    procedure LoginUnsucessful();
  end;

var
  AbtoPhone: TCAbtoPhone;

implementation

{$R *.dfm}

procedure TFormLog.Load(Phone: TCAbtoPhone);
begin
  AbtoPhone := Phone;
  Self.Activate;
end;

procedure TFormLog.LoginUnsucessful;
begin
  LabelWarning.Caption := 'B³¹d logowania';
end;

procedure TFormLog.ActionLogInExecute(Sender: TObject);
var
  phoneConfig: Variant;
begin
  phoneConfig := AbtoPhone.Config;
  if not(EditLogin.Text = '') and not(EditPassword.Text = '') then
  begin
    phoneConfig.RegUser := EditLogin.Text;
    phoneConfig.RegPass := EditPassword.Text;

    AbtoPhone.ApplyConfig;
  end;
end;
end.
