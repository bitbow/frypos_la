unit rabatt;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: rabatt.pas
 Author:    Mark Przybylo
 Date:      30.10.2006
 Purpose:   rabatte

 History:
 -------------------------------------------------
  2007.03.03 (mp): bezeichnung eindeutiger
  2006.12.17 (mp): rabattmodul
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvButton, JvCtrls;

type
  TfrmRabatt = class(TForm)
    btnHaus: TJvImgBtn;
    btnFrei: TJvImgBtn;
    procedure btnFreiClick(Sender: TObject);
    procedure btnHausClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    Rabatt: integer;
  end;

var
  frmRabatt: TfrmRabatt;

implementation

{$R *.dfm}

procedure TfrmRabatt.FormCreate(Sender: TObject);
begin
  Rabatt := -1;
end;

procedure TfrmRabatt.btnHausClick(Sender: TObject);
begin
  Rabatt := 0;
  Close;
end;

procedure TfrmRabatt.btnFreiClick(Sender: TObject);
begin
  Rabatt := 1;
  Close;
end;

end.
