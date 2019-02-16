unit info;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: mpKasse.pas
 Author:    Mark Przybylo
 Date:      04.04.2007
 Purpose:   info
 History:
 -------------------------------------------------
  2007.05.16 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvComponent, JvgLabel, ExtCtrls, StdCtrls, JvLabel,
  JvExStdCtrls, JvBehaviorLabel, JvButton, JvCtrls;

type
  TfrmInfo = class(TForm)
    panInfo: TPanel;
    jvInfo: TJvBehaviorLabel;
    pan1: TPanel;
    lb1: TJvLabel;
    btnOK: TJvImgBtn;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    lbName: TJvLabel;
    lbAM: TJvLabel;
    lbTel: TJvLabel;
    lbInfo: TJvLabel;
    lbPers: TJvLabel;
    lbDauer: TJvLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

end.
