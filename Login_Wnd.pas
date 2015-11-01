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
    SpeedButton1: TSpeedButton;
    procedure ActionLogInExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnterPressed(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
  public
    procedure Load(Phone: TCAbtoPhone);
    procedure LoginUnsucessful();
    procedure LoginSucessfull();
  end;

var
  FormLog: TFormLog;
  AbtoPhone: TCAbtoPhone;
  gLogged: Boolean;

implementation

uses Main_Wnd;

{$R *.dfm}

procedure TFormLog.EnterPressed(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
  begin
    ActionLogIn.Execute;
    Key := #0;
  end;
end;

procedure TFormLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not gLogged then
    Application.Terminate;
end;

procedure TFormLog.FormCreate(Sender: TObject);
begin
  gLogged := False;
end;

procedure TFormLog.FormShow(Sender: TObject);
begin
 self.SetFocus;
end;

procedure TFormLog.Load(Phone: TCAbtoPhone);
begin
  AbtoPhone := Phone;
end;

procedure TFormLog.LoginSucessfull;
begin
  gLogged := True;
end;

procedure TFormLog.LoginUnsucessful;
begin
  LabelWarning.Caption := 'B³¹d logowania';
  gLogged := False;
end;

procedure TFormLog.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
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
