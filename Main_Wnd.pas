unit Main_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls, Chat_Frm, Call_Frm,
  Vcl.ImgList, Login_Wnd, SipVoipSDK_TLB, Contacts_Wnd, StrUtils,
  Vcl.Styles, Vcl.Tabs, TypInfo, SelectMenuWnd, Settings_Wnd;

const
  configFileName: String = 'phoneCfg.ini';

type
  TContact = record
    Id: Integer;
    Image: string;
    Name: string;
    CallerId: string;
    OpenPage: Integer;
  end;

  TContacts = array of TContact;

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
    ActionCloseChat: TAction;
    PanelContacts: TPanel;
    ListViewContacts: TListView;
    ActionContactsList: TAction;
    MainMenu: TMainMenu;
    Plik1: TMenuItem;
    DodajKonakt1: TMenuItem;
    Akcje1: TMenuItem;
    Zadzwo1: TMenuItem;
    Rozpocznijchat1: TMenuItem;
    N2: TMenuItem;
    Usukontakt1: TMenuItem;
    Usukontakt2: TMenuItem;
    Ustawienia1: TMenuItem;
    Wyloguj1: TMenuItem;
    N1: TMenuItem;
    Zamknij1: TMenuItem;
    ActionClose: TAction;
    PanelActions: TPanel;
    ButtonChat: TButton;
    ButtonCall: TButton;
    ButtonResize: TButton;
    PanelVideo: TPanel;
    ActionResize: TAction;
    procedure ActionCallExecute(Sender: TObject);
    procedure ActionChatExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ActionSettingsExecute(Sender: TObject);
    procedure ActionLoginExecute(Sender: TObject);
    procedure ActionCloseChatExecute(Sender: TObject);
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
    procedure ListViewContactsClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ActionResizeExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    isAutoAnswerEnabled: Boolean;
    fNumberOfLines: Integer;
    isFullSize: Boolean;
    procedure OpenCallFrm(UserName, CallerId: string);
    procedure OpenChatFrm(UserName, CallerId: string);
    procedure LoadConfig();
    function ExtractBetween(const Value, A, B: string): string;
    function ReturnNameFromAddress(const clAddress: string): string;
  public
    gIsCallEstablish: Boolean;
    AbtoPhone: TCAbtoPhone;
  end;

var
  FormMainWindow: TFormMainWindow;
  AbtoPhone: TCAbtoPhone;
  LoginWindow: TFormLog;
  gContacts: TContacts;
  gTabSheets: array of TTabSheet;
  gFrameChats: array of TFrameChat;
  gFrameCalls: array of TFrameCall;

implementation

{$R *.dfm}

procedure TFormMainWindow.ActionResizeExecute(Sender: TObject);
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

procedure TFormMainWindow.ActionCallExecute(Sender: TObject);
var
  i, j, index: Integer;
  UserName, CallerId: string;
begin
  if ListViewContacts.ItemIndex <> -1 then
  begin
    index := ListViewContacts.Selected.index;
    UserName := gContacts[index].Name;
    CallerId := gContacts[index].CallerId;

    gContacts[index].OpenPage := High(gTabSheets) + 2;

    OpenCallFrm(UserName, CallerId);
  end;
end;

procedure TFormMainWindow.ActionChatExecute(Sender: TObject);
var
  index: Integer;
  CallerId, UserName: string;
begin
  if ListViewContacts.ItemIndex <> -1 then
  begin
    index := ListViewContacts.Selected.index;
    UserName := gContacts[index].Name;
    CallerId := gContacts[index].CallerId;

    gContacts[index].OpenPage := High(gTabSheets) + 2;

    OpenChatFrm(UserName, CallerId);
  end;
end;

procedure TFormMainWindow.ActionCloseChatExecute(Sender: TObject);
var
  ChatFrame: TFrameChat;
  TabSheet: TTabSheet;
  Button: TSpeedButton;
  i: Integer;
begin
  //
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
  Exist: Boolean;
begin
  Exist := false;

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserName = UserName then
    begin
      Exist := True;
    end;
  end;

  if not Exist then
  begin
    i := Length(gTabSheets);
    SetLength(gTabSheets, Length(gTabSheets) + 1);
    gTabSheets[i] := TTabSheet.Create(nil);
    gTabSheets[i].Caption := 'Rozmowa z ' + CallerId;
    gTabSheets[i].PageControl := PageControl;
    gTabSheets[i].PageIndex := i + 1;
    gTabSheets[i].Show;

    j := Length(gFrameCalls);
    SetLength(gFrameCalls, Length(gFrameCalls) + 1);

    Inc(fNumberOfLines);
    gFrameCalls[j] := TFrameCall.Create(nil);
    gFrameCalls[j].LineNumberOfForm := fNumberOfLines;
    gFrameCalls[j].Name := 'FrameCall' + IntToStr(j);
    gFrameCalls[j].PageIndex := gTabSheets[i].PageIndex;
    gFrameCalls[j].UserName := UserName;
    gFrameCalls[j].Align := alClient;
    gFrameCalls[j].Load(AbtoPhone);
    gFrameCalls[j].Parent := gTabSheets[i];
  end;
end;

procedure TFormMainWindow.OpenChatFrm(UserName, CallerId: string);
var
  i, j: Integer;
  Exist: Boolean;
begin
  Exist := false;

  for i := 0 to High(gFrameChats) do
  begin
    if gFrameChats[i].UserName = UserName then
    begin
      Exist := True;
    end;
  end;

  if not Exist then
  begin
    i := Length(gTabSheets);
    SetLength(gTabSheets, Length(gTabSheets) + 1);
    gTabSheets[i] := TTabSheet.Create(nil);
    gTabSheets[i].Caption := 'Czat z ' + CallerId;
    gTabSheets[i].PageControl := PageControl;
    gTabSheets[i].PageIndex := i + 1;
    gTabSheets[i].Show;

    j := Length(gFrameChats);
    SetLength(gFrameChats, Length(gFrameChats) + 1);

    Inc(fNumberOfLines);
    gFrameChats[j] := TFrameChat.Create(nil);
    gFrameChats[j].LineNumberOfForm := fNumberOfLines;
    gFrameChats[j].Parent := gTabSheets[i];
    gFrameChats[j].Name := 'FrameChat' + IntToStr(j);
    gFrameChats[j].PageIndex := gTabSheets[i].PageIndex;
    gFrameChats[j].UserName := UserName;
    gFrameChats[j].Align := alClient;
    gFrameChats[j].Load(AbtoPhone);
    gFrameChats[j].Parent := gTabSheets[i];
  end;
end;

procedure TFormMainWindow.PageControlChange(Sender: TObject);
var
  FrameCall: TFrameCall;
  FrameChat: TFrameChat;
begin
  PanelActions.Visible := false;
  PanelActions.Enabled := false;

  if PageControl.ActivePageIndex <> 0 then
  begin
    for FrameCall in gFrameCalls do
    begin
      if FrameCall.PageIndex = PageControl.ActivePageIndex then
      begin
        AbtoPhone.SetCurrentLine(FrameCall.LineNumberOfForm);
      end;
    end;
    for FrameChat in gFrameChats do
    begin
      if FrameChat.PageIndex = PageControl.ActivePageIndex then
      begin
        AbtoPhone.SetCurrentLine(FrameChat.LineNumberOfForm);
      end;
    end;
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

procedure TFormMainWindow.ListViewContactsClick(Sender: TObject);
begin
  if ListViewContacts.ItemIndex <> -1 then
  begin
    PanelActions.Enabled := True;
    PanelActions.Visible := True;
  end
  else
  begin
    PanelActions.Enabled := false;
    PanelActions.Visible := false;
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
  tmpFrameChat: TFrameChat;
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

  ButtonChat.Caption := '';
  ButtonChat.ImageAlignment := iaCenter;
  ButtonCall.Caption := '';
  ButtonCall.ImageAlignment := iaCenter;

  AbtoPhone := TCAbtoPhone.Create(Self);
  LoadConfig;
  AbtoPhone.Initialize;

  SetLength(gContacts, 5);
  gContacts[0].Name := 'mobile32';
  gContacts[1].Name := 'janfri';
  gContacts[2].Name := 'malgorzatamaz';
  gContacts[3].Name := 'hpereverzieva';
  gContacts[4].Name := 'music';

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
  UserName := AddrFrom;

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserName = AddrFrom then
    begin
      gExist := True;
      CallerId := gFrameCalls[i].UserId;
    end;
  end;

  if gIsCallEstablish then
  begin
    X := MessageDlg('Dzwoni ' + AddrFrom + ', przerwa� poprzedni� rozmow�?',
      mtConfirmation, mbYesNo, 0);
  end
  else
  begin
    X := MessageDlg('Dzwoni ' + AddrFrom + ', odebra�?', mtConfirmation,
      mbYesNo, 0);
  end;

  if X = mrYes then
  begin
    if gIsCallEstablish then
    begin
      AbtoPhone.HangUpLastCall;
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
          if gContacts[i].Name = UserName then
          begin
            PageControl.ActivePageIndex := gContacts[i].OpenPage;
          end;
        end;
      end;
      gIsCallEstablish := True;

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
  tmpFrameChat: TFrameChat;
  tmpFrameCall: TFrameCall;
begin
  gExist := false;
  UserName := ReturnNameFromAddress(address);

  for i := 0 to High(gFrameCalls) do
  begin
    if gFrameCalls[i].UserName = UserName then
    begin
      gExist := True;
      CallerId := gFrameCalls[i].UserId;
      tmpFrameCall := gFrameCalls[i];
    end;
  end;

  for i := 0 to High(gFrameChats) do
  begin
    if gFrameChats[i].UserName = UserName then
    begin
      gExist := True;
      CallerId := gFrameChats[i].UserId;
      tmpFrameChat := gFrameChats[i];
    end;
  end;

  if not gExist then
  begin
    OpenChatFrm(UserName, CallerId);
    i := Length(gFrameChats) - 1;
    gFrameChats[i].ShowMessage(address, message);
  end
  else
  begin
    if Assigned(tmpFrameCall) then
    begin
      tmpFrameCall.ShowMessage(address, message);
      PageControl.ActivePageIndex := tmpFrameCall.PageIndex;
    end;

    if Assigned(tmpFrameChat) then
    begin
      tmpFrameChat.ShowMessage(address, message);
      PageControl.ActivePageIndex := tmpFrameChat.PageIndex;
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
