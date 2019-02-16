unit einzelabrechnung;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: einzelabrechnung.pas
 Author:    Mark Przybylo
 Date:      26.11.2006
 Purpose:   einzelne artikel abrechnen (z.b.: theke)

 History:
 -------------------------------------------------
  2006.11.26 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type

  TfrmEinzelAbrechnung = class(TForm)
    panBottom: TPanel;
    panMid: TPanel;
    lbEinzel: TListBox;
    btnSave: TButton;
    panTop: TPanel;
    procedure FormShow(Sender: TObject);
    procedure lbEinzelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbEinzelDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  private
    { Private-Deklarationen }
  public
    Bestellung: TStringList;
  end;

  function MakePreis(Preis: integer; MitEuro: boolean = true): string;
  function StripStr2Num(Input: string): integer;

var
  frmEinzelAbrechnung: TfrmEinzelAbrechnung;

implementation

uses cTisch;

{$R *.dfm}

function StripStr2Num(Input: string): integer;
var
  i,f: integer;
  erg: string;
begin
  erg := '';
  f   := 1;

  if (length(Input) > 0) then
    if (Input[1] = '-') then f := -1;

  for i := 1 to length(Input) do
    if(Input[i] in ['0'..'9']) then
      erg := erg + Input[i];

  result := strtointdef(erg,0) * f;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function MakePreis(Preis: integer; MitEuro: boolean): string;
begin
  result := '0';
  try
    if (MitEuro) then result := format('%d,%2.2d €',[Preis div 100,abs(Preis) mod 100])
    else              result := format('%d,%2.2d',[Preis div 100,abs(Preis) mod 100]);
  except
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmEinzelAbrechnung.lbEinzelDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  aLeft,aRight: integer;
  b,p,s: string;
begin
  with (Control as TListBox) do
  begin
    if ((Index mod 2) = 0) then
    begin
      if (odSelected in State) then Canvas.Brush.Color := clHighlight
      else                          Canvas.Brush.Color := $989f94; //$A8FAFA;
    end;

    Canvas.FillRect(Rect);

    s := Items[Index];

    b := copy(s,1,pos('=',s)-1);
    p := copy(s,pos('=',s)+1,length(s));

    aLeft  := Rect.Left + 2;

    if (TAbrechnungItem(Items.Objects[Index]).Marked) then Canvas.Font.Style := [fsBold,fsStrikeOut]
    else                                                   Canvas.Font.Style := [fsBold];

    Canvas.TextOut(aLeft,Rect.Top,b);
    Canvas.Font.Style := [];

    aRight := Rect.Right - Rect.Left - Canvas.TextWidth(p) - 3;
    Canvas.TextOut(aRight,Rect.Top + 13,p);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmEinzelAbrechnung.FormCreate(Sender: TObject);
begin
  lbEinzel.DoubleBuffered := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmEinzelAbrechnung.lbEinzelClick(Sender: TObject);
var
  ai: TAbrechnungItem;
  f: integer;
begin
  if (lbEinzel.ItemIndex > -1) then
  begin
    ai := TAbrechnungItem(lbEinzel.Items.Objects[lbEinzel.ItemIndex]);
    f  := 1;
    if (ai.Marked) then f := -1;

    panTop.Caption := 'zu zahlen ' + MakePreis(StripStr2Num(panTop.Caption) + (ai.Preis * f));
    ai.Marked := not ai.Marked;
  end;
  lbEinzel.Invalidate;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmEinzelAbrechnung.FormShow(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Bestellung.Count-1 do
    lbEinzel.AddItem(TAbrechnungItem(Bestellung.Objects[i]).Bez,TAbrechnungItem(Bestellung.Objects[i]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
end.
