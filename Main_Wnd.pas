unit Main_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Call_Frm,
  Vcl.ImgList, Login_Wnd, SipVoipSDK_TLB, Contacts_Wnd, StrUtils, CallEstablish_Code,
  Vcl.Styles, Vcl.Tabs, TypInfo, SelectMenuWnd, Settings_Wnd, Contacts;

const
  configFileName: String = 'phoneCfg.ini';

type
  TFormMainWindow = class(TForm)
    PageControl: TPageControl;
    TabSheetContatcs: TTabSheet;
    ActionList: TActionList;
    ActionCall: TAction;
    ActionChat: TAction;
    ActionSettings: TAction;
    ActionLogin: TAction;
    ImageList: TImageList;
    ActionCloseCall: TAction;
    PanelContacts: TPanel;
    ListViewContacts: TListView;
    ActionContactsList: TAction;
    MainMenu: TMainMenu;
    MainMenuAccont: TMenuItem;
    MainMenuActions: TMenuItem;
    MainMenuCall: TMenuItem;
    MainMenuContacts: TMenuItem;
    MainMenuSettings: TMenuItem;
    MainMenuLogout: TMenuItem;
    N1: TMenuItem;
    MainMenuCloseApp: TMenuItem;
    ActionClose: TAction;
    ButtonResize: TButton;
    PanelVideo: TPanel;
    ActionResize: TAction;
    procedure ActionCallExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ActionSettingsExecute(Sender: TObject);
    procedure ActionLoginExecute(Sender: TObject);
    procedure ActionContactsListExecute(Sender: TObject);
    procedure AbtoPhone_OnRegistered(ASender: TObject; const Msg: WideString);
    procedure AbtoPhone_OnIncomingCall(ASender: TObject;
      const AddrFrom: WideString; LineId: Integer);
    procedure AbtoPhone_OnClearedCall(ASender: TObject; const Msg: WideString;
      Status, LineId: Integer);
    procedure AbtoPhone_OnEstablishedCall(ASender: TObject;
      const Msg: WideString; LineId: Integer);
    procedure AbtoPhone_OnTextMessageReceived(ASender: TObject;
      const address: WideString; const message: WideString);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionResizeExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListViewContactsDblClick(Sender: TObject);
    procedure ActionCloseCallExecute(Sender: TObject);
  private
    isAutoAnswerEnabled: Boolean;
    fNumberOfLines: Integer;
    isFullSize: Boolean;
    procedure OpenCallFrm(UserName, CallerId: string);
    procedure LoadConfig();
    function ExtractBetween(const Value, A, B: string): string;
    function ReturnNameFromAddress(const clAddress: string): string;
  end;

var
  FormMainWindow: TFormMainWindow;
  AbtoPhone: TCAbtoPhone;
  LoginWindow: TFormLog;
  gFrameCalls: array of TFrameCall;
  gTabSheets: array of TTabSheet;

implementation

{$R *.dfm}

procedure TFormMainWindow.ActionResizeExecute(Sender: TObject);
begin
  if gIsCallEstablish then
  begin
    if isFullSize then
    begin
      Self.Width := 1324;
      ButtonResize.Caption := '<<<';
      isFullSize := False;
    end
    else
    begin
      Self.Width := 730;
      ButtonResize.Caption := '>>>';
      isFullSize := True;
    end;
  end;
end;

procedure TFormMainWindow.ActionCallExecute(Sender: TObject);
var
  i, j, index: Integer;
  lUserName, lCallerId: string;
  lExist: Boolean;
begin
  if ListViewContacts.ItemIndex <> -1 then
  begin
    lExist := False;
    index := ListViewContacts.Selected.index;
    lUserName := gContacts[index].UserName;
    lCallerId := gContacts[index].CallerId;

    for i := 0 to Length(gFrameCalls) do
    begin
       if lUserName = gFrameCalls[i].UserName then
       begin
        lExist := True;
        index := gFrameCalls[i].PageIndex;
       end;
    end;

    if not lExist then
    begin
      OpenCallFrm(lUserName, lCallerId);
      gContacts[index].OpenPage := Length(gTabSheets);
    end
    else
    begin
      PageControl.ActivePageIndex := index;
    end;
  end;
end;

procedure TFormMainWindow.ActionCloseCallExecute(Sender: TObject);
var
  lIndex: Integer;
begin
  lIndex := PageControl.ActivePageIndex;
  PageControl.ActivePageIndex := lIndex - 1;
  PageControl.Pages[lIndex].Free;
end;

procedure TFormMainWindow.ActionCloseExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMainWindow.ActionContactsListExecute(Sender: TObject);
var
  ContactsListWindow: TFormContactsList;
begin
  ContactsListWindow := TFormContactsList.Create(Self);
  ContactsListWindow.Show;
end;

procedure TFormMainWindow.ActionLoginExecute(Sender: TObject);
begin
  AbtoPhone := TCAbtoPhone.Create(Self);
  LoadConfig;
  AbtoPhone.Initialize;
  LoginWindow := TFormLog.Create(Self);
  LoginWindow.Load(AbtoPhone);
  LoginWindow.Show;
end;

procedure TFormMainWindow.ActionSettingsExecute(Sender: TObject);
var
  settingsForm: TSettingsForm;
  phoneCfg: Variant;
begin
  Application.CreateForm(TSettingsForm, settingsForm);

  phoneCfg := AbtoPhone.Config;
  settingsForm.SetSettings(phoneCfg, AbtoPhone.RetrieveVersion,
    AbtoPhone.RetrieveExternalAddress);

  settingsForm.ShowModal;
  if settingsForm.ModalResult = mrOk then
  begin
    settingsForm.SetupUserInput;
    AbtoPhone.ApplyConfig;
    phoneCfg.Store(configFileName);
    Self.Caption := 'MultiComm - Zalogowano jako ' + AbtoPhone.Config.RegUser;
  end;
  isAutoAnswerEnabled := phoneCfg.AutoAnswerEnabled;
  settingsForm.Free;
end;

procedure TFormMainWindow.OpenCallFrm(UserName, CallerId: string);
var
  i, j: Integer;
  lExist: Boolean;
begin
  lExist := false;

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserName = UserName then
    begin
      lExist := True;
    end;
  end;

  if not lExist then
  begin
    i := Length(gTabSheets);
    SetLength(gTabSheets, Length(gTabSheets) + 1);
    gTabSheets[i] := TTabSheet.Create(nil);
    gTabSheets[i].Caption := 'Rozmowa z ' + CallerId;
    gTabSheets[i].PageControl := PageControl;
    gTabSheets[i].Show;

    j := Length(gFrameCalls);
    SetLength(gFrameCalls, Length(gFrameCalls) + 1);

    gFrameCalls[j] := TFrameCall.Create(nil);
    gFrameCalls[j].Name := 'FrameCall' + IntToStr(j);
    gFrameCalls[j].PageIndex := gTabSheets[i].PageIndex;
    gFrameCalls[j].UserName := UserName;
    gFrameCalls[j].Align := alClient;
    gFrameCalls[j].Load(AbtoPhone);
    gFrameCalls[j].Parent := gTabSheets[i];
  end;
end;

function TFormMainWindow.ReturnNameFromAddress(const clAddress: string): string;
var
  lStart, lStop: Integer;
  i: Integer;
  lName: String;
begin
  lStart := AnsiPos(':', clAddress);
  lStop := AnsiPos('@', clAddress);

  lName := '';
  for i := lStart + 1 to lStop - 1 do
  begin
    lName := lName + clAddress[i];
  end;

  Result := lName;
end;

procedure TFormMainWindow.ListViewContactsDblClick(Sender: TObject);
var
  i: Integer;
begin
  if ListViewContacts.SelCount = 1 then
  begin
    i := ListViewContacts.Selected.Index;
    OpenCallFrm(gContacts[i].UserName,gContacts[i].CallerId);
  end;
end;

procedure TFormMainWindow.LoadConfig;
var
  phoneConfig: Variant;
begin
  phoneConfig := AbtoPhone.Config;
  AbtoPhone.OnRegistered := AbtoPhone_OnRegistered;
  AbtoPhone.OnIncomingCall := AbtoPhone_OnIncomingCall;
  AbtoPhone.OnClearedCall := AbtoPhone_OnClearedCall;
  AbtoPhone.OnEstablishedCall := AbtoPhone_OnEstablishedCall;
  AbtoPhone.OnTextMessageReceived := AbtoPhone_OnTextMessageReceived;

  phoneConfig.RemoteVideoWindow := PanelVideo.Handle;
  phoneConfig.ListenPort := 5060;
  phoneConfig.RegDomain := 'iptel.org';
  phoneConfig.LicenseUserId :=
    'Trial3f33-8785-FFFF-F3469758-2111-2C1A-E7DB-4FF723D0C845';
  phoneConfig.LicenseKey :=
    'XNFcCTrfMnNWDmYLFgSmx9aeWZ67BZA8EvaUF4CSUkq6TsAAMquJJEtqQ3stk2iFtCA4DdRv64HcPdZOIGCb+g== ';

  AbtoPhone.ApplyConfig;
end;

function TFormMainWindow.ExtractBetween(const Value, A, B: string): string;
var
  aPos, bPos: Integer;
begin
  Result := '';
  aPos := Pos(A, Value);
  if aPos > 0 then
  begin
    aPos := aPos + Length(A);
    bPos := PosEx(B, Value, aPos);
    if bPos > 0 then
    begin
      Result := Copy(Value, aPos, bPos - aPos);
    end;
  end;
end;

procedure TFormMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
var
  tmpTabSheet: TTabSheet;
  tmpFrameCall: TFrameCall;
  i: Integer;
begin
  if gIsCallEstablish then
    AbtoPhone.HangUpLastCall;

  AbtoPhone.Free;
end;

procedure TFormMainWindow.FormCreate(Sender: TObject);
var
  Item: TListItem;
  i: Integer;
begin
  Self.Width := 730;
  Self.Height := 530;
  isFullSize := False;

  AbtoPhone := TCAbtoPhone.Create(Self);
  LoadConfig;
  AbtoPhone.Initialize;

  SetLength(gContacts, 5);
  gContacts[0].UserName := 'mobile32';
  gContacts[1].UserName := 'janfri';
  gContacts[2].UserName := 'malgorzatamaz';
  gContacts[3].UserName := 'hpereverzieva';
  gContacts[4].UserName := 'music';

  gContacts[0].CallerId := 'Grzesiek';
  gContacts[1].CallerId := 'Janek';
  gContacts[2].CallerId := 'Gosia';
  gContacts[3].CallerId := 'Ania';
  gContacts[4].CallerId := 'Muzyka';

  ListViewContacts.SmallImages := ImageList;

  for i := 0 to High(gContacts) do
  begin
    Item := ListViewContacts.Items.Add();
    Item.Caption := gContacts[i].CallerId;
    Item.ImageIndex := i + 2;
  end;

  LoginWindow := TFormLog.Create(nil);
  LoginWindow.Load(AbtoPhone);
  Self.Enabled := false;
  LoginWindow.FormStyle := fsStayOnTop;
  LoginWindow.Show;

  fNumberOfLines := 0;
end;

procedure TFormMainWindow.FormResize(Sender: TObject);
begin
  ActionResizeExecute(nil);
end;

procedure TFormMainWindow.AbtoPhone_OnIncomingCall(ASender: TObject;
  const AddrFrom: WideString; LineId: Integer);
var
  gExist: Boolean;
  i, X: Integer;
  UserName, CallerId: string;
begin
  gExist := false;
  CallerId := ReturnNameFromAddress(AddrFrom);

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserId = CallerId then
    begin
      gExist := True;
      UserName := gFrameCalls[i].UserName;
    end;
  end;

  if gIsCallEstablish then
  begin
    X := MessageDlg('Dzwoni ' + CallerId + ', przerwa� poprzedni� rozmow�?',
      mtConfirmation, mbYesNo, 0);
  end
  else
  begin
    X := MessageDlg('Dzwoni ' + CallerId + ', odebra�?', mtConfirmation,
      mbYesNo, 0);
  end;

  if X = mrYes then
  begin
    if gIsCallEstablish then
    begin
      AbtoPhone.HangUpLastCall;
      AbtoPhone.AnswerCall;
    end
    else
    begin
      if not gExist then
      begin
        OpenCallFrm(UserName, CallerId);
      end
      else
      begin
        for i := 0 to High(gContacts) do
        begin
          if gContacts[i].UserName = UserName then
          begin
            PageControl.ActivePageIndex := gContacts[i].OpenPage;
          end;
        end;
      end;
      gIsCallEstablish := True;
      gCallEstablishPage := PageControl.ActivePageIndex;
      gFrameCalls[gCallEstablishPage -1].IsCallEstablish := True;

      AbtoPhone.AnswerCall;
    end;
  end
  else
    AbtoPhone.RejectCall;
end;

procedure TFormMainWindow.AbtoPhone_OnRegistered(ASender: TObject;
  const Msg: WideString);
var
  lmessage: string;
begin
  lmessage := Msg;
  if Pos('200', lmessage) > 0 then
  begin
    Self.Caption := 'MultiComm - Zalogowano jako ' + AbtoPhone.Config.RegUser;

    LoginWindow.LoginSucessfull;

    if Assigned(LoginWindow) then
    begin
      LoginWindow.Close;
      LoginWindow.Free;
      LoginWindow := nil;
    end;

    Self.Enabled := True;
    Self.Activate;
  end
  else
  begin
    LoginWindow.LoginUnsucessful;
  end;
end;

procedure TFormMainWindow.AbtoPhone_OnTextMessageReceived(ASender: TObject;
  const address, message: WideString);
var
  gExist: Boolean;
  i: Integer;
  UserName, CallerId: string;
  tmpFrameCall: TFrameCall;
begin
  gExist := false;
  CallerId := ReturnNameFromAddress(address);

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserId = CallerId then
    begin
      gExist := True;
      UserName := gFrameCalls[i].UserName;
      tmpFrameCall := gFrameCalls[i];
    end;
  end;

  if not gExist then
  begin
    OpenCallFrm(UserName, CallerId);
    i := Length(gFrameCalls) - 1;
    gFrameCalls[i].ShowMessage(CallerId, message);
  end
  else
  begin
    if Assigned(tmpFrameCall) then
    begin
      tmpFrameCall.ShowMessage(CallerId, message);
      PageControl.ActivePageIndex := tmpFrameCall.PageIndex;
    end;
  end;
end;

procedure TFormMainWindow.AbtoPhone_OnClearedCall(ASender: TObject;
  const Msg: WideString; Status, LineId: Integer);
begin
  gIsCallEstablish := false;
end;

procedure TFormMainWindow.AbtoPhone_OnEstablishedCall(ASender: TObject;
  const Msg: WideString; LineId: Integer);
begin
  gIsCallEstablish := True;
end;
end.
