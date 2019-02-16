unit erinnerung;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: mpKasse.pas
 Author:    Mark Przybylo
 Date:      04.04.2007
 Purpose:   erinnerung
 History:
 -------------------------------------------------
  2007.04.04 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvgLabel, ExtCtrls, StdCtrls, JvLabel, JvExStdCtrls, JvBehaviorLabel, JvButton, JvCtrls;

type
  TfrmErinnerung = class(TForm)
    panReminder: TPanel;
    jvReminder: TJvBehaviorLabel;
    Panel1: TPanel;
    JvLabel1: TJvLabel;
    jvIRemeber: TJvImgBtn;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmErinnerung: TfrmErinnerung;

implementation

{$R *.dfm}

end.
