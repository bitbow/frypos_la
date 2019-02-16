unit printing;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: printing.pas
 Author:    Mark Przybylo
 Date:      11.02.2007
 Purpose:   druckmodul MoccaPOS
 History:
 -------------------------------------------------
  2007.02.11 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  { GmTypes, GmClasses, GmCanvas, GmPageList, GmPreview, GmPageNavigator, } StdCtrls;

type
  TfrmPrintPreview = class(TForm)
    // gmPreview: TGmPreview;
    // gmNavPane: TGmPageNavigator;
    btnPrint: TButton;
    procedure btnPrintClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmPrintPreview: TfrmPrintPreview;

implementation

{$R *.dfm}

procedure TfrmPrintPreview.btnPrintClick(Sender: TObject);
var
  pd: TPrinterSetupDialog;
begin
  pd := TPrinterSetupDialog.Create(nil);

  // DDBC if (pd.Execute) then
  //  gmPreview.Print;
  pd.Free;
end;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
end.
