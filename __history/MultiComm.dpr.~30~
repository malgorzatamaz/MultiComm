program MultiComm;

uses
  Vcl.Forms,
  Call_Frm in 'Call_Frm.pas' {FrameCall: TFrame},
  SIPVoipSDK_TLB in 'SIPVoipSDK_TLB.pas',
  Login_Wnd in 'Login_Wnd.pas' {FormLog},
  Main_Wnd in 'Main_Wnd.pas' {FormMainWindow},
  Contacts_Wnd in 'Contacts_Wnd.pas' {FormContactsList},
  Vcl.Themes,
  Vcl.Styles,
  Settings_Wnd in 'Settings_Wnd.pas' {SettingsForm},
  Add_Edit_Wnd in 'Add_Edit_Wnd.pas' {AddEditForm},
  Common_Code in 'Common_Code.pas',
  CallEstablish_Code in 'CallEstablish_Code.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainWindow, FormMainWindow);
  Application.CreateForm(TAddEditForm, AddEditForm);
  Application.Run;
end.
