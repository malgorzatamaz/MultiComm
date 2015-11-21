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
    ListView1: TListView;
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
  AddEditWnd := TAddEditForm.Create(Self);
  AddEditWnd.Caption := 'Dodaj użytkownika';
  AddEditWnd.gAdd := True;
  Enabled := False;
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
  AddEditWnd := TAddEditForm.Create(Self);
  AddEditWnd.Caption := 'Edytuj użytkownika';
  AddEditWnd.gAdd := False;
  Enabled := False;
  AddEditWnd.Show;
end;

procedure TFormContactsList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;
end.
