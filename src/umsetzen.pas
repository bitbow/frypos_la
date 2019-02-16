unit umsetzen;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: umsetzen.pas
 Author:    Mark Przybylo
 Date:      17.12.2006
 Purpose:   umsetzen

 History:
 -------------------------------------------------
  2006.12.17 (mp): umsetzmodul
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvComponent, JvLabel, ExtCtrls;

type
  TfrmUmsetzen = class(TForm)
    panTOp: TPanel;
    lbInfo: TJvLabel;
    pan: TPanel;
  private
    { Private-Deklarationen }
  public
    Rabatt: integer;
  end;

var
  frmUmsetzen: TfrmUmsetzen;

implementation

{$R *.dfm}


end.
