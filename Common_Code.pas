unit Common_Code;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, System.UITypes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.Styles,  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

procedure ResizeBitmap(Bitmap: TBitmap; const pNewWidth, pNewHeight: integer);

type
TContact = record           //
    ImageIndex: Integer;            // do  bazy
    UserName: string;
    CallerId: string;       //
    OpenPage: Integer;
  end;

  TImageType = (ifUnknown, ifJPG, ifGIF, ifBMP, ifPNG, ifTIF);

var
  gContacts: array of TContact;
implementation

procedure ResizeBitmap(Bitmap: TBitmap; const pNewWidth, pNewHeight: integer);
begin
  Bitmap.Canvas.StretchDraw(
    Rect(0, 0, pNewWidth, pNewHeight),
    Bitmap);
  Bitmap.SetSize(pNewWidth, pNewHeight);
end;



end.
