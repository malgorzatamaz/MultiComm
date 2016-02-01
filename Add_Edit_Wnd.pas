unit Add_Edit_Wnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  Contacts_Wnd, Common_Code, Main_Wnd, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
  Vcl.Imaging.JConsts;

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
    function GetImageType(FileName: string): TImageType;
  public
    gAdd: Boolean;
    gCurrentItem: integer;
    ParentForm: TFormContactsList;
  end;

const
  JPG_HEADER: array[0..2] of byte = ($FF, $D8, $FF);
  GIF_HEADER: array[0..2] of byte = ($47, $49, $46);
  BMP_HEADER: array[0..1] of byte = ($42, $4D);
  PNG_HEADER: array[0..3] of byte = ($89, $50, $4E, $47);
  TIF_HEADER: array[0..2] of byte = ($49, $49, $2A);

var
  AddEditForm: TAddEditForm;

implementation


{$R *.dfm}


procedure TAddEditForm.ActionAddExecute(Sender: TObject);
var
  number: integer;
  cItem: TListItem;
  lImage: TGraphic;
  lType: TImageType;
  lBitmap: TBitmap;
  lScale, lHeight, lWidth: Real;
  phoneConfig: Variant;
begin
  phoneConfig := gAbtoPhone.Config;
  if ((EditUserName.Text <> '') and (EditCallerId.Text <> '') and (EditImage.Text <> '') ) then
  begin
    ADOConnection.Connected := True;
    if (EditImage.Text <> '') then
    begin
      lBitmap := TBitmap.Create;
      lType := GetImageType(EditImage.Text);
      case lType of
        ifBMP:
          lImage := TBitmap.Create;
        ifJPG:
          lImage := TJPEGImage.Create;
        ifPNG:
          lImage := TPNGImage.Create;
      end;
      lImage.LoadFromFile(EditImage.Text);
    end;

    with ADOQuery do
    begin
      Sql.Clear;
      Sql.Text := 'exec AddContact :userName, :callerId, :type, :image, :username';
      Parameters[0].Value := EditUserName.Text;
      Parameters[1].Value := EditCallerId.Text;
      Parameters[2].Value := lType;
      Parameters[3].Assign(lImage);
      Parameters[4].Value := phoneConfig.RegUser;
      number := ExecSql;
      if number < 0 then
      begin
        ShowMessage('U¿ytkownik ju¿ istnieje!');
      end;
    end;
  end;

  if (number > 0) then
  begin
    cItem := ParentForm.ListViewContacts.Items.Add();
    SetLength(gContacts, Length(gContacts) + 1);
    gContacts[Length(gContacts) - 1].UserName := EditUserName.Text;
    gContacts[Length(gContacts) - 1].CallerId := EditCallerId.Text;
    cItem.Caption := EditCallerId.Text;

    if Assigned(lImage) then
    begin
      FormMainWindow.ImageList.SetSize(100, 100);

      lScale := lImage.Height / lImage.Width;
      if lImage.Width > 100 then
      begin
        lWidth := (100 * lScale);
      end
      else
      begin
        lWidth := lImage.Width;
      end;
      if lImage.Height > 100 then
        lHeight := 100
      else
        lHeight := lImage.Height;

      lBitmap.Assign(lImage);
      lBitmap.SetSize(100, 100);
      FormMainWindow.ImageList.Add(lBitmap, nil);
      cItem.ImageIndex := FormMainWindow.ImageList.Count - 1;
      gContacts[Length(gContacts) - 1].ImageIndex := cItem.ImageIndex;
    end;

  end;
  lImage.Free;
  lBitmap.Free;
  Close;
  Free;
end;

procedure TAddEditForm.ActionCloseExecute(Sender: TObject);
begin
  Close;
  Free;
end;

procedure TAddEditForm.ActionEditExecute(Sender: TObject);
var
  number: integer;
  cItem: TListItem;
  lImage: TGraphic;
  lField: TField;
  lStream: TStream;
  lType: TImageType;
  lBitmap: TBitmap;
  vGraphicClass: TGraphicClass;
  lScale, lHeight, lWidth: Real;
begin
  if ((EditUserName.Text <> '') and (EditCallerId.Text <> '')) then
  begin
    ADOConnection.Connected := True;
    if (EditImage.Text <> '') then
    begin
      lBitmap := TBitmap.Create;
      lType := GetImageType(EditImage.Text);
      case lType of
        ifBMP:
          lImage := TBitmap.Create;
        ifJPG:
          lImage := TJPEGImage.Create;
        ifPNG:
          lImage := TPNGImage.Create;
      end;
      lImage.LoadFromFile(EditImage.Text);
    end;
  end;

  with ADOQuery do
  begin
    Sql.Clear;
    Sql.Text := 'exec UpdateContact :userName, :callerId, :type, :image';
    Parameters[0].Value := EditUserName.Text;
    Parameters[1].Value := EditCallerId.Text;
    Parameters[2].Value := lType;
    Parameters[3].Assign(lImage);
    ExecSql;
  end;

  if Assigned(lImage) then
  begin
    lScale := lImage.Height / lImage.Width;
    if lImage.Width > 100 then
    begin
      lWidth := (100 * lScale);
    end
    else
    begin
      lWidth := lImage.Width;
    end;
    if lImage.Height > 100 then
      lHeight := 100
    else
      lHeight := lImage.Height;

    lBitmap.Assign(lImage);
    lBitmap.SetSize(100, 100);
    FormMainWindow.ImageList.Replace(gContacts[gCurrentItem].ImageIndex, lBitmap, nil);
  end;
  cItem := ParentForm.ListViewContacts.Items[gCurrentItem];
  cItem.Caption := EditCallerId.Text;
  lImage.Free;
  lBitmap.Free;
  Close;
  Free;
end;

procedure TAddEditForm.ActionSelectImageExecute(Sender: TObject);
var
  openDialog: TOpenDialog;
begin
  openDialog := TOpenDialog.Create(self);
  openDialog.InitialDir := 'C:\';
  openDialog.Options := [ofFileMustExist];
  openDialog.Filter := 'PNG|*.png|BMP|*.bmp|JPG|*.jpg';

  openDialog.FilterIndex := 3;

  if openDialog.Execute then
    EditImage.Text := openDialog.Files[0];

  openDialog.Free;
end;

function TAddEditForm.GetImageType(FileName: string): TImageType;
var
  Stream: TFileStream;
  MemStr: TMemoryStream;
begin
  Result := ifUnknown;
  Stream := TFileStream.Create(FileName, fmOpenRead);
  MemStr := TMemoryStream.Create;
  try
    MemStr.CopyFrom(Stream, 5);
    if MemStr.Size > 4 then
    begin
      if CompareMem(MemStr.Memory, @JPG_HEADER, SizeOf(JPG_HEADER)) then
        Result := ifJPG
      else if CompareMem(MemStr.Memory, @GIF_HEADER, SizeOf(GIF_HEADER)) then
        Result := ifGIF
      else if CompareMem(MemStr.Memory, @PNG_HEADER, SizeOf(PNG_HEADER)) then
        Result := ifPNG
      else if CompareMem(MemStr.Memory, @BMP_HEADER, SizeOf(BMP_HEADER)) then
        Result := ifBMP
      else if CompareMem(MemStr.Memory, @TIF_HEADER, SizeOf(TIF_HEADER)) then
        Result := ifTIF
    end;
  finally
    Stream.Free;
    MemStr.Free;
  end;
end;

end.

