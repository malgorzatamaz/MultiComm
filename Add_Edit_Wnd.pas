unit Add_Edit_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Data.DB, Data.Win.ADODB;

type
  TAddEditForm = class(TForm)
    GridPanel1: TGridPanel;
    EditUserName: TEdit;
    Label1: TLabel;
    EditCallerId: TEdit;
    Label2: TLabel;
    EditImage: TEdit;
    ButtonSelectImage: TSpeedButton;
    Panel1: TPanel;
    ButtonClose: TSpeedButton;
    Panel2: TPanel;
    ActionListAddEdit: TActionList;
    ActionAdd: TAction;
    ActionEdit: TAction;
    ActionClose: TAction;
    ActionSelectImage: TAction;
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    BtnSave: TSpeedButton;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionSelectImageExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    gAdd: Boolean;
  end;

var
  AddEditForm: TAddEditForm;

implementation

{$R *.dfm}


procedure TAddEditForm.ActionAddExecute(Sender: TObject);
var
number:integer;
begin
  ADOConnection.Connected:=true;
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Add('exec AddContact  '+EditUserName.Text+', '+EditCallerId.Text);
    number:=ExecSql;
    if(number<0) then
    begin
      ShowMessage('U�ytkownik ju� istnieje!');
    end;
  end;
end;



procedure TAddEditForm.ActionCloseExecute(Sender: TObject);
begin
  Close;
  Free;
end;

procedure TAddEditForm.ActionEditExecute(Sender: TObject);
begin
  ShowMessage('Click to edit');
end;

procedure TAddEditForm.ActionSelectImageExecute(Sender: TObject);
var
openDialog : TOpenDialog;
begin
  openDialog := TOpenDialog.Create(self);
  openDialog.InitialDir := GetCurrentDir;
  openDialog.Options := [ofFileMustExist];
  openDialog.Filter :=
    'PNG|*.png|BMP|*.bmp|JPG|*.jpg';

  openDialog.FilterIndex := 3;

  if openDialog.Execute then
    EditImage.Text := openDialog.Files[0];

  openDialog.Free;
end;

end.