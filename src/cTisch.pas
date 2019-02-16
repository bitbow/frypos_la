unit cTisch;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: cTisch.pas
 Author:    Mark Przybylo
 Date:      30.10.2006
 Purpose:   tischklasse

 History:
 -------------------------------------------------
  2007.04.01 (mp): add mit offenen posten
  2006.12.17 (mp): SetLastToNull: alle tische ohne bestellung
                   faktor zum skalieren
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}

interface

uses Windows, Controls, Classes, SysUtils, Graphics,
     Buttons, StdCtrls, Forms, JvBitBtn, ExtCtrls,
     JvComponent, JvPanel;

type

  TOnTischClick = procedure(Sender, Tisch: TObject) of object;

  TRes = class
    ID: integer;
    Name,Tel,Notiz: string;
    Tisch,Personen: integer;
    Zeitpunkt: TDateTime;
    Tim,Dat,OverTime,Status,Dauer: integer;
  end;

  TAbrechnungItem = class
    IID: integer;
    Art: string;
    Bez: string;
    Preis: integer;
    Mwst: integer;
    Marked: boolean;
  end;

  TBediener = class
    ID: integer;
    Nummer: integer;
    Name: string;
    Vorname: string;
    Anfang: TDateTime;
    Ende: TDateTime;
  end;

  TBedienerListe = class
  private
    fBediener: TList;
    procedure Clear;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure Add(aID, aNummer: integer; aAnfang, aEnde: TDateTime; aVorname, aName: string);
  end;

  TArtikel = class
  public
    Idx: integer;
    ID: integer;
    PLU: integer;
    Kategorie: integer;
    Bezeichnung: string;
    Einheit: string;
    Preis: integer;
    Mwst: Integer;
    Kombi: Integer;
    KombiIdx: integer;
    Msg: integer;   
  end;

  TArtikelListe = class
  private
    fArtikel: TList;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure Clear;
    procedure Add(aIdx, aID, aPLU, aKat, aPreis: integer; aBez: string; aMwst, aKombi, aMsg: integer);

    property Artikel: TList read fArtikel;
  end;

  TBestellung = class
  private
  public
    constructor Create;
    destructor  Destroy; override;
  end;

  TBestellListe = class
  public
    constructor Create;
    destructor  Destroy; override;
    function Add: TBestellung;
  end;

  TTisch = class
  private
    fID: integer;
    fNummer: integer;
    fBezeichnung: string;
    fX: integer;
    fY: integer;
    fWidth: integer;
    fHeight: integer;
    fAktiv: boolean;
    fLast: TDateTime;
    fLayoutTisch: boolean;
    fDeleted: boolean;
    fEinzelAbrechnung: boolean;
    fBediener: TBedienerListe;
    fBestellungen: TBestellListe;
    fBoden: TJvPanel;
    fTisch: TJvBitBtn;
    fHeader: TLabel;
    fFooter: TLabel;
    fUmsetzen: boolean;
    fReserviert: boolean;
    fVon: integer;
    fNach: integer;
    fParent: TWinControl;
    fOnTischClick: TOnTischClick;
    fResList: TList;

    procedure CreateBoden(aFaktor: extended = 1);
    procedure CreateTisch(aFaktor: extended = 1);
    procedure OnTischClick(Sender: TObject);
    procedure SetXPos(const Value: integer);
    procedure SetYPos(const Value: integer);
    procedure SetColor(color: TColor);
    procedure SetDeleted(const Value: boolean);
    procedure SetHeader(const Value: string);
    procedure SetFooter(const Value: string);
    procedure SetHeight(const Value: integer);
    procedure SetWidht(const Value: integer);

    function GetHeader: string;
    function GetFooter: string;
  public
    constructor Create(aID,aNummer,aX,aY,aWidth,aHeight: integer;aParent: TWinControl; aFaktor: extended);
    destructor  Destroy; override;

    function AddRes(aName, aTel, aNotiz: string; aZeitPunkt: TDateTime; aPersonen,aDauer: integer): string;
    property TischClick: TOnTischClick read fOnTischClick write fOnTischClick;
    property TischID: integer read fID;
    property Aktiv: boolean read fAktiv write fAktiv;
    property Color: TColor write SetColor;
    property Last: TDateTime read fLast write fLast;
    property X: integer read fX write SetXPos;
    property Y: integer read fY write SetYPos;
    property LayOutTisch: boolean read fLayoutTisch write fLayoutTisch;
    property Deleted: boolean read fDeleted write SetDeleted;
    property EinzelAbrechnung: boolean read fEinzelAbrechnung write fEinzelAbrechnung;
    property Umsetzen: boolean read fUmsetzen write fUmsetzen;
    property Reserviert: boolean read fReserviert write fReserviert;    
    property Von: integer read fVon write fVon;
    property Nach: integer read fNach write fNach;
    property Header: string read GetHeader write SetHeader;
    property Footer: string read GetFooter write SetFooter;
    property Height: integer read fHeight write SetHeight;
    property Width: integer read fWidth write SetWidht;
  end;

  TTischListe = class
  private
    fTische: TList;
    fArtikel: TArtikelListe;
    fFaktor: extended;

    function GetItem(index: integer): TTisch;
    function GetTisch(aNummer: integer): TTisch;
  public
    constructor Create;
    destructor  Destroy; override;

    function  Add(aID,aNummer,aX,aY,aWidth,aHeight: integer;
                  aParent: TWinControl; aFaktor: extended = 1.0;
                  aInfo: string = ''; aOpen: integer = 0): TTisch;

    procedure SetLayoutMode(aMode: boolean);
    procedure SetUmsetzen(aMode: boolean);
    procedure SetReserviert(aMode: boolean);    
    procedure SetLast(aValue: integer);
    procedure SetTischAuswahl(aOnTischClick: TOnTischClick);
    procedure Clear;

    property Items[index: integer]: TTisch read GetItem; default;
    property Tisch[aNummer: integer]: TTisch read GetTisch;
    property Tische: TList read fTische;
    property Faktor: extended read fFaktor write fFaktor;
  end;

  function MakePreis(Preis: integer): string;
  function TimeDiff(Start, Ende: TDateTime): integer;
  function Minuten2Zeit(Minuten: integer): string;

implementation

uses DateUtils;

{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function Minuten2Zeit(Minuten: integer): string;
begin
  result := '0';
  try
    result := format('%2.2dh:%2.2dm',[Minuten div 60,Minuten mod 60]);
  except
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TimeDiff(Start, Ende: TDateTime): integer;
var
  h,m: Integer;
  r: Real;
begin
  if (Start > Ende) then Ende := IncDay(Ende);

  r := HourSpan(Start,Ende);
  h := Round(Int(R));        // Stunden
  m := Round(Frac(R)* 60);   // Minuten

  // aus 60 Min wird 1 volle Stunde
  if (m = 60) then
  begin
    m := 0;
    inc(H);
  end;

  result := h * 60 + m;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function MakePreis(Preis: integer): string;
begin
  result := '0';

  try
    result := format('%d,%2.2d',[Preis div 100,abs(Preis) mod 100]);
  except
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TBedienerListe }
constructor TBedienerListe.Create;
begin
  fBediener := TList.Create;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TBedienerListe.Add(aID, aNummer: integer; aAnfang, aEnde: TDateTime; aVorname, aName: string);
var
  b: TBediener;
begin
  b         := TBediener.Create;
  b.ID      := aID;
  b.Nummer  := aNummer;
  b.Name    := aName;
  b.Vorname := aVorname;
  b.Anfang  := aAnfang;
  b.Ende    := aEnde;

  fBediener.Add(b);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TBedienerListe.Clear;
var
  i: integer;
begin
  for i := 0 to fBediener.Count-1 do
    TBediener(fBediener[i]).Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TBedienerListe.Destroy;
begin
  Clear;
  fBediener.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TArtikelListe }
constructor TArtikelListe.Create;
begin
  fArtikel := TList.Create;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TArtikelListe.Add(aIdx, aID, aPLU, aKat, aPreis: integer; aBez: string; aMwst, aKombi, aMsg: integer);
var
  a: TArtikel;
begin
  a              := TArtikel.Create;
  a.Idx          := aIdx;
  a.ID           := aID;
  a.Plu          := aPLU;
  a.Kategorie    := aKat;
  a.Preis        := aPreis;
  a.Bezeichnung  := aBez;
  a.Mwst         := aMWst;
  a.Kombi        := aKombi;
  a.Msg          := aMsg;

  fArtikel.Add(a);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TArtikelListe.Clear;
var
  i: integer;
begin
  for i := 0 to fArtikel.Count-1 do
    TArtikel(fArtikel[i]).Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TArtikelListe.Destroy;
begin
  Clear;
  fArtikel.Clear;
  fArtikel.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TBestellung }
constructor TBestellung.Create;
begin
   ;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TBestellung.Destroy;
begin
  ;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TBestellListe }
constructor TBestellListe.Create;
begin
   ;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TBestellListe.Add: TBestellung;
begin
  result := nil;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TBestellListe.Destroy;
begin

  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TTisch }
constructor TTisch.Create(aID,aNummer,aX,aY,aWidth,aHeight: integer; aParent: TWinControl; aFaktor: extended);
begin
  fID               := aID;
  fNummer           := aNummer;
  fX                := aX;
  fY                := aY;
  fWidth            := aWidth;
  fHeight           := aHeight;
  fParent           := aParent;
  fAktiv            := false;
  fDeleted          := false;
  fEinzelAbrechnung := false;
  fLast             := 0;
  fLayoutTisch      := false;
  fBezeichnung      := 'Tisch ' + inttostr(fNummer);
  fNach             := -1;
  fVon              := aID;
  fUmsetzen         := false;
  fReserviert       := false;

  fBediener         := TBedienerListe.Create;
  fBestellungen     := TBestellListe.Create;

  CreateBoden(aFaktor);
  CreateTisch(aFaktor);

  fHeader           := TLabel.Create(nil);
  fFooter           := TLabel.Create(nil);

  fHeader.Parent    := fBoden;
  fHeader.Font.Size := trunc(8 / aFaktor) + 1;
  fHeader.Align     := alTop;
  fHeader.Alignment := taCenter;

  fFooter.Font.Size := trunc(8 / aFaktor) + 1;
  fFooter.Parent    := fBoden;
  fFooter.Align     := alBottom;
  fFooter.Alignment := taCenter;

  fResList := TList.Create;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.CreateBoden(aFaktor: extended);
begin
  fBoden  := TJvPanel.Create(nil);

  with fBoden do
  begin
    Name    := 'fBoden' + inttostr(fID);
    Caption := '';
    Parent  := fParent;

    if (aFaktor > 1) then
    begin
      Left := trunc(fX / aFaktor) + 60;
      Top  := trunc(fY / aFaktor);
    end
    else
    begin
      Left := trunc(fX / aFaktor);
      Top  := trunc(fY / aFaktor);
    end;

    Width           := trunc(fWidth  / aFaktor);
    Height          := trunc(fHeight / aFaktor);
    MultiLine       := False;
    BevelInner      := bvLowered;
    TabOrder        := fNummer;
    DoubleBuffered  := true;
    // HotColor        := clGreen;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.CreateTisch(aFaktor: extended);
begin
  fTisch := TJvBitBtn.Create(nil);

  with fTisch do
  begin
    Name            := 'fTisch' + inttostr(fID);
    Parent          := fBoden;
    Left            := fBoden.Width  div 4;
    Top             := fBoden.Height div 4;
    Width           := fBoden.Width  div 2;
    Height          := fBoden.Height div 2;
    Caption         := inttostr(fNummer);
    Font.Charset    := DEFAULT_CHARSET;
    Font.Color      := clWindowText;
    Font.Size       := trunc(16 / aFaktor);
    Font.Name       := 'Tahoma';
    Font.Style      := [fsBold];
    ParentFont      := False;
    TabOrder        := fID;
    DoubleBuffered  := true;
    OnClick         := OnTischClick;
    fOnTischClick   := nil;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TTisch.Destroy;
var
  i: integer;
begin
  fTisch.OnClick := nil;
  fOnTischClick  := nil;

  fBediener.Free;
  fBestellungen.Free;
  fHeader.Free;
  fFooter.Free;
  fTisch.Free;
  fBoden.Free;

  for i := 0 to fResList.Count-1 do TRes(fResList[i]).Free;
  fResList.Clear;
  fResList.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.OnTischClick(Sender: TObject);
begin
  if (fAktiv) then fBoden.Color := clGreen
  else             fBoden.Color := clBtnFace;

  if assigned(fOnTischClick) then fOnTischClick(Sender, Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetXPos(const Value: integer);
begin
  fX := Value;
  fBoden.Left := fX;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetYPos(const Value: integer);
begin
  fY := Value;
  fBoden.Top := fY;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetColor(color: TColor);
begin
  fBoden.Color := color;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetDeleted;
begin
  fBoden.Visible := false;
  fDeleted       := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetHeader(const Value: string);
begin
  if (Value <> fHeader.Caption) then
  begin
    fHeader.Caption := Value;
    if (fBoden.Color <> clBtnFace) then
    begin
       fHeader.Font.Color := clCream;
       fFooter.Font.Color := clCream
    end
    else
    begin
      fHeader.Font.Color := clWindowText;
      fFooter.Font.Color := clWindowText;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetFooter(const Value: string);
begin
  if (Value <> fFooter.Caption) then
    fFooter.Caption := Value;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTisch.GetHeader: string;
begin
  result := fHeader.Caption;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTisch.GetFooter: string;
begin
  result := fFooter.Caption;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetWidht(const Value: integer);
begin
  fWidth        := value;
  fBoden.Width  := fWidth;
  fTisch.Left   := fBoden.Width  div 4;
  fTisch.Top    := fBoden.Height div 4;
  fTisch.Width  := fBoden.Width  div 2;
  fTisch.Height := fBoden.Height div 2;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTisch.SetHeight(const Value: integer);
begin
  fHeight       := value;
  fBoden.Height := fHeight;

  fTisch.Left   := fBoden.Width  div 4;
  fTisch.Top    := fBoden.Height div 4;
  fTisch.Width  := fBoden.Width  div 2;
  fTisch.Height := fBoden.Height div 2;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTisch.AddRes(aName, aTel, aNotiz: string; aZeitPunkt: TDateTime; aPersonen,aDauer: integer): string;
var
  i: integer;
  d,t: string;
  tr: TRes;
begin
  result := '';

  for i := 0 to fResList.Count-1 do
  begin
    if (aZeitPunkt = TRes(fResList[i]).Zeitpunkt) then
    begin
      d := FormatDateTime('dddd, d. mmmm yyyy',TRes(fResList[i]).Zeitpunkt);
      t := FormatDateTime('hh:mm',TRes(fResList[i]).Zeitpunkt);

      result := format('Dieser Tisch wurde bereits reserviert: ' +
                        #10#13#10#13 +
                        'Für: %s' + #10#13 +
                        'Personen: %d' + #10#13 +
                        'Dauer: %s' + #10#13 +
                        'am: %s um %s' + #10#13 +
                        'Info: %s' + #10#13 +
                        'Tel.: %s',
                        [TRes(fResList[i]).Name,TRes(fResList[i]).Personen,Minuten2Zeit(TRes(fResList[i]).Dauer),
                        d,t,TRes(fResList[i]).Notiz,TRes(fResList[i]).Tel]);
      break;
    end
    else if ((aZeitPunkt >  TRes(fResList[i]).Zeitpunkt) and
             (TimeDiff(TRes(fResList[i]).Zeitpunkt,aZeitPunkt) <= aDauer)) then
    begin
      d := FormatDateTime('dddd, d. mmmm yyyy',TRes(fResList[i]).Zeitpunkt);
      t := FormatDateTime('hh:mm',TRes(fResList[i]).Zeitpunkt);
      result := format('Die Reservierung überschneidet die Reservierung: ' +
                        #10#13#10#13 +
                        'Für: %s' + #10#13 +
                        'Personen: %d' +  #10#13 +
                        'Dauer: %s' +  #10#13 +
                        'am: %s um %s' + #10#13 +
                        'Info: %s' + #10#13 +
                        'Tel.: %s',
                        [TRes(fResList[i]).Name,TRes(fResList[i]).Personen,Minuten2Zeit(TRes(fResList[i]).Dauer),
                        d,t,TRes(fResList[i]).Notiz,TRes(fResList[i]).Tel]);
      break;
    end;
  end;

  if (result = '') then
  begin
    tr           := TRes.Create;
    tr.Name      := aName;
    tr.Tel       := aTel;
    tr.Notiz     := aNotiz;
    tr.Personen  := aPersonen;
    tr.Zeitpunkt := aZeitPunkt;
    tr.OverTime  := 0;
    tr.Status    := 1;
    tr.Dauer     := aDauer;
    fResList.Add(tr);

    d := FormatDateTime('dddd, d. mmmm yyyy',aZeitpunkt);
    t := FormatDateTime('hh:mm',aZeitpunkt);
    result := format('Der Tisch wurde reserviert: ' +
                     #10#13#10#13 +
                     'Für: %20s'  + #10#13 +
                     'Personen: %20s'  + #10#13 +
                     'Dauer: %20s'  + #10#13 +
                     'am: %10s um %10s'  + #10#13 +
                     'Info: %20s'  + #10#13 +
                     'Tel.: %20s',[aName,inttostr(aPersonen),Minuten2Zeit(aDauer),d,t,aNotiz,aTel]);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TTischListe }
constructor TTischListe.Create;
begin
  fTische  := TList.Create;
  fArtikel := TArtikelListe.Create;
  fFaktor  := 1;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTischListe.Add(aID,aNummer,aX,aY,aWidth,aHeight: integer;
                         aParent: TWinControl; aFaktor: extended;
                         aInfo: string; aOpen: integer): TTisch;
var
  i,ID,Num: integer;
begin
  ID  := aID;
  Num := aNummer;

  if (ID = 0) then
  begin
    for i := 0 to fTische.Count-1 do
      if (TTisch(fTische[i]).fID > ID) then ID := TTisch(fTische[i]).fID;

    ID  := ID + 1;
    Num := ID;
  end;

  result := TTisch.Create(ID,Num,aX,aY,aWidth,aHeight,aParent,aFaktor);
  result.fFooter.Caption := aInfo;

  if (aOpen > 0) then result.fHeader.Caption := MakePreis(aOpen)
  else                result.fHeader.Caption := '';

  fTische.Add(result);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.Clear;
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do
    TTisch(fTische[i]).Free;

  fTische.Clear;
  fArtikel.Clear;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TTischListe.Destroy;
begin
  Clear;
  fTische.Free;
  fArtikel.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTischListe.GetItem(index: integer): TTisch;
begin
  result := nil;

  if ((fTische.Count > 0) and (index in [0..fTische.Count-1])) then
    result := fTische[index];
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.SetLayoutMode(aMode: boolean);
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do TTisch(fTische[i]).fLayoutTisch := aMode;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TTischListe.GetTisch(aNummer: integer): TTisch;
var
  i: integer;
begin
  result := nil;

  for i := 0 to fTische.Count-1 do
  begin
    if (TTisch(fTische[i]).fNummer = aNummer) then
    begin
      result := TTisch(fTische[i]);
      break;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.SetLast(aValue: integer);
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do TTisch(fTische[i]).fLast := aValue;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.SetUmsetzen(aMode: boolean);
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do TTisch(fTische[i]).fUmsetzen := aMode;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.SetReserviert(aMode: boolean);
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do TTisch(fTische[i]).fReserviert := aMode;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TTischListe.SetTischAuswahl(aOnTischClick: TOnTischClick);
var
  i: integer;
begin
  for i := 0 to fTische.Count-1 do TTisch(fTische[i]).fOnTischClick := aOnTischClick;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
end.
