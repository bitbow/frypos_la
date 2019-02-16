program frypos;

uses
  Forms,
  cTisch in 'cTisch.pas',
  abrechnen in 'abrechnen.pas' {frmAbrechnen},
  mpKasse in 'mpKasse.pas' {frmfryPos},
  rabatt in 'rabatt.pas' {frmRabatt},
  einzelabrechnung in 'einzelabrechnung.pas' {frmEinzelAbrechnung},
  umsetzen in 'umsetzen.pas' {frmUmsetzen},
  printing in 'printing.pas' {frmPrintPreview},
  EditLayout in 'EditLayout.pas' {frmEditLayout},
  erinnerung in 'erinnerung.pas' {frmErinnerung},
  reservierung in 'reservierung.pas' {frmReservierung};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'fryPOS';
  Application.CreateForm(TfrmfryPos, frmfryPos);
  Application.Run;
end.
