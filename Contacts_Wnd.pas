unit Contacts_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, Add_Edit_Wnd;

type
  TFormContactsList = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    ButtonClose: TSpeedButton;
    ListViewContacts: TListView;
    ButtonEdit: TSpeedButton;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    ActionListContacts: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFormContactsList.ActionAddExecute(Sender: TObject);
var
  AddEditWnd: TAddEditForm;
begin
  AddEditWnd := TAddEditForm.Create(self);
  with AddEditWnd do
  begin
    BtnSave.Action := ActionAdd ;//ActionListAddEdit.Actions[0]
    BtnSave.Caption := 'Zapisz';
    gAdd:=True;
  end;
  AddEditWnd.Caption := 'Dodaj użytkownika';
  AddEditWnd.Show;
end;

procedure TFormContactsList.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormContactsList.ActionEditExecute(Sender: TObject);
var
  AddEditWnd: TAddEditForm;
begin
  AddEditWnd := TAddEditForm.Create(self);
  with AddEditWnd do
  begin
    BtnSave.Action := ActionEdit;//ActionListAddEdit.Actions[1];
    BtnSave.Caption := 'Zapisz';
    gAdd:=false;
  end;
  AddEditWnd.Caption := 'Edytuj użytkownika';
  AddEditWnd.Show;
end;

procedure TFormContactsList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;
end.
