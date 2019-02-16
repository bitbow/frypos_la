unit EditLayout;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: EditLayout.pas
 Author:    Mark Przybylo
 Date:      22.02.2007
 Purpose:   layout editieren
 History:
 -------------------------------------------------
  2007.02.22 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, JvButton, JvCtrls;

type
  TfrmEditLayout = class(TForm)
    edH: TJvValidateEdit;
    edB: TJvValidateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edI: TJvValidateEdit;
    btnOK: TJvImgBtn;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmEditLayout: TfrmEditLayout;

implementation

{$R *.dfm}

end.
