unit SelectMenuWnd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.Buttons;

type
  TSelectMenu = class(TForm)
    SpeedButtonCall: TSpeedButton;
    SpeedButtonMessage: TSpeedButton;
    SpeedButtonClose: TSpeedButton;
    ActionList: TActionList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
