unit reservierung;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvComponent, JvTMTimeLine, ComCtrls, JvExComCtrls,
  StdCtrls, Mask, JvTracker, JvButton, JvCtrls, JvExStdCtrls, JvExControls, JvEdit, JvSpin,
  cTisch, JvExtComponent;

type
  TfrmReservierung = class(TForm)
    panRes1: TPanel;
    jvTL: TJvTMTimeline;
    panRes3: TPanel;
    panRes2: TPanel;
    panRes4: TPanel;
    Panel1: TPanel;
    lbRes: TListBox;
    edName: TJvEdit;
    edTel: TJvEdit;
    edPers: TJvEdit;
    edInfo: TJvEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    jvspBtn: TJvSpinButton;
    jvDauer: TJvTracker;
    Label5: TLabel;
    Label6: TLabel;
    jvtStunde: TJvTracker;
    Label7: TLabel;
    Label8: TLabel;
    rgMinute: TRadioGroup;
    btnSave: TJvImgBtn;
    btnExit: TJvImgBtn;
    btnStorno: TJvImgBtn;
    bntMinus: TJvImgBtn;
    btnPlus: TJvImgBtn;
    procedure btnPlusClick(Sender: TObject);
    procedure bntMinusClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure jvspBtnTopClick(Sender: TObject);
    procedure jvspBtnBottomClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    Res: TRes;
    Tische: TTischListe;

    procedure TischAuswahl(Sender, Tisch: TObject);
    { Public-Deklarationen }
  end;

var
  frmReservierung: TfrmReservierung;

implementation

uses info;

{$R *.dfm}
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.jvspBtnBottomClick(Sender: TObject);
var
  v: integer;
begin
  v := strtointdef(edPers.Text,0);

  if (v < 2) then v := 1
  else            dec(v);
  edPers.Text := inttostr(v);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.jvspBtnTopClick(Sender: TObject);
var
  v: integer;
begin
  v := strtointdef(edPers.Text,0);
  inc(v);
  edPers.Text := inttostr(v);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.btnExitClick(Sender: TObject);
begin
  Close;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.FormCreate(Sender: TObject);
var
  vs: integer;
begin
  jvTL.SelDate := now;
  jvTL.Date    := now;
  
  jvtStunde.Value := strtoint(formatdatetime('hh',now));
  vs := strtoint(copy(formatdatetime('hh:mm',now),4,2));

  case vs of
     0..14: rgMinute.ItemIndex := 1;
    15..29: rgMinute.ItemIndex := 2;
    30..44: rgMinute.ItemIndex := 3;
    45..59:
    begin
      rgMinute.ItemIndex := 0;
      if (jvtStunde.Value < 23) then jvtStunde.Value := jvtStunde.Value + 1
      else                           jvtStunde.Value := 0;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.btnSaveClick(Sender: TObject);
begin
  res.Tisch     := 1;
  res.Name      := edName.Text;
  res.Tel       := edTel.Text;
  res.Notiz     := edInfo.Text;
  res.Personen  := strtoint(edPers.Text);
  res.Status    := 1;
  res.Dauer     := jvDauer.Value;
  res.Zeitpunkt := jvTL.SelDate;
  res.Tim       := strtoint(format('%2.2d%2.2d',[jvtStunde.Value,rgMinute.ItemIndex*15]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.bntMinusClick(Sender: TObject);
begin
  if (jvtStunde.Value > 0) then jvtStunde.Value := jvtStunde.Value - 1;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.btnPlusClick(Sender: TObject);
begin
  if (jvtStunde.Value < 23) then jvtStunde.Value := jvtStunde.Value + 1;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmReservierung.TischAuswahl(Sender, Tisch: TObject);
var
  t: TTisch;
  dt: TDateTime;
  s: string;
begin
  t := TTisch(Tisch);

  if (t.Reserviert) then
  begin
    if (trim(edName.Text) <> '') then
    begin
      s  := DateTimeToStr(jvTL.Date);
      dt := StrToDateTime(format('%s %2.2d:%2.2d:00',[s,jvtStunde.Value,rgMinute.ItemIndex * 15]));

      s := t.AddRes(edName.Text,edTel.Text,edInfo.Text,dt,strtoint(edPers.Text),jvDauer.Value*60);
      t.Color := clGradientActiveCaption;

      if (s <> '') then
      begin
        frmInfo := TfrmInfo.Create(nil);
        frmInfo.lbName.Caption  := edName.Text;
        frmInfo.lbAm.Caption    := DateTimeToStr(dt);
        frmInfo.lbTel.Caption   := edTel.Text;
        frmInfo.lbInfo.Caption  := edInfo.Text;
        frmInfo.lbDauer.Caption := Minuten2Zeit(jvDauer.Value*60);
        frmInfo.lbPers.Caption  := edPers.Text;

        frmInfo.jvInfo.BehaviorOptions.Active := true;
        frmInfo.ShowModal;
        frmInfo.Release;
      end;
    end
    else
      edName.SetFocus;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
end.
