unit Contacts_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls;

type
  TFormContactsList = class(TForm)
    pnl1: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    ButtonEdit: TSpeedButton;
    pnl2: TPanel;
    pnl3: TPanel;
    Button2: TSpeedButton;
    Button3: TSpeedButton;
    Grid1Grid: TGridPanel;
    LabelCallerId: TLabel;
    LabelUserName: TLabel;
    EditUserName: TEdit;
    LabelImagePath: TLabel;
    EditAvatarPath: TEdit;
    ButtonPath: TSpeedButton;
    EditCallerId: TEdit;
    ListView1: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormContactsList: TFormContactsList;

implementation

{$R *.dfm}

procedure TFormContactsList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Free;
end;
end.