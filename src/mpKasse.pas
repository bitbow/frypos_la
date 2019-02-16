unit mpKasse;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: mpKasse.pas
 Author:    Mark Przybylo
 Date:      30.10.2006
 Purpose:   hauptmodul fryPOS
 History:
 -------------------------------------------------
  2007.09.18 (mp): übernahme aus future fork
  2007.07.21 (mp): hausrabatt variabel => neue DB version 9
  2007.07.18 (mp): zeitraum bei nachdrucken korrigiert
  2007.07.15 (mp): logo kann über logo.jpg ausgetauscht werden
                   ART_STAT => neue DB version 8
  2007.07.01 (mp): artikelübersicht mit statistik
  2007.05.30 (mp): personalliste auch mit deaktiviertem personal
                   neue statistik Tischliste 2000, ZR_STAT => neue DB version 7
                   Detailübersicht > Detailliste
  2007.05.27 (mp): neue statistik Detailübersicht 1000, ZR_STAT => neue DB version 6
  2007.05.26 (mp): stornos nur mit chefpasswort möglich
  2007.04.25 (mp): loadartikel für andere auflösungen angepasst
                   "weiter" in clsilver
  2007.04.20 (mp): full client: angabe der DB in ini = DB=....
                   remote chef mit pw
                          em+yyyymmdd+pe
                          em+stunde+pe
  2007.04.18 (mp): html erweitert
  2007.04.17 (mp): html interface
  2007.04.07 (mp): bewirtungsbeleg drucken
                   uhr + datum anzeigen
                   pennerliste
  2007.04.06 (mp): korrektur drucken der chefstatistiken
                   bei z-abschluß nur noch kategorien drucken
                   bei z-abschluß kategorien zentriert
                   lockwindow bei activatepage
                   hintergrundbild bei bestellung möglich
                   resizecomponents
                   printscrollbox
  2007.04.05 (mp): bei abrechnung stornos nicht berücksichtigen
                   artikel 280 fest als zigarettengeld => noch ändern
  2007.04.04 (mp): farbe der anzeige tischheader+footer
  2007.04.03 (mp): z-abrechnung mit kategorie + rabatt
                   erinnerung bei zigarettengeld
                   bei initabrechng, cbprint auf false
  2007.04.01 (mp): chefstatistik erweitert + drucken
                   UpdateTischSumme
  2007.03.31 (mp): titlebar kann angezeigt werden
                   cheftabs breiter
  2007.03.30 (mp): neue statistik rein, alte raus.
  2007.03.27 (mp): personalübersicht mit seit letzter z-abrechnung möglich
  2007.03.19 (mp): longdrinkskombi bei artikel deaktiviert
                   tisch X+Y speichern
  2007.03.16 (mp): LoadOffeneBestellung + LoadAbrechnung nicht nach PID gruppieren
                   sonst fehlen auf der abrechnung positionen bzw. werden gleiche
                   artikel in der übersicht einzeln angezeigt.
  2007.03.15 (mp): bei bestellung, count + caption in grün anzeigen
                   kombiartikel in clmoneygreen
  2007.03.08 (mp): bei bestellung, count + caption in grün anzeigen
  2007.03.06 (mp): PrintStream.Clear zusätzlich bei Bestellung und Abrechnung
  2007.03.05 (mp): kombiartikel stornieren
                   nach storno wieder richtige page anzeigen
                   abrechnung jetzt über anmeldeID
                   abgemeldetes personal mit in abrechnung einbeziehen
  2007.03.04 (mp): UpdateDatabse über skripte x.dbv
                   CheckCreateDBObject, CheckDatabaseMetaAndData raus
  2007.03.03 (mp): MWST auf einzelposten ausweisen konfigurierbar CFG = EinzelMWST
                   konfiguration der einzelabrechnung raus
  2007.02.27 (mp): kombiartikel fertiggestellt
                   x-abrechnung kompakt
  2007.02.25 (mp): anzeige menge + wert immer nur für abgerechnete tische
                   ShowPersonalAbrechnung über MaxIID von bestellung
  2007.02.25 (mp): problem bei frei+rabatt behoben (preis jetzt immer aus bestellung)
                   personalabrechnen überarbeitet
                   statistik überarbeitet
                   doppelter abrechnungsdruck überarbeitet
                   kombiartikel überarbeitet
                   bonsplitten
                   beim abrechnen wird alles auf das personal gebucht,welches abrechnet
                   layouts editieren wirkt sich auf das geladene layout aus
  2007.02.24 (mp): kein preis bei personalbestellung
                   bestellhinweis kann deaktiviert werden
                   chefstorno verbessert
                   champagner + sekt + wein
  2007.02.23 (mp): personalbestellung
                   bestellhinweis zurücksetzen
                   layout editieren
  2007.02.20 (mp): kategorie SEKT
                   sortierung bei longdrinks kombinationen
                   umschalten aktuelle / aufgelaufene bestellung
                   mit doppelklick auf personalübersicht wird gedruckt
  2007.02.19 (mp): datum bei personalstatistik
  2007.02.18 (mp): kategorie: longdrinks kombi, aperitif, essen
                   longdrinks kombinationen möglich
                   mwst
  2007.02.11 (mp): statistik über pos drucker,
                   druckvorschau,
                   nachdrucken
  2007.02.10 (mp): zeitkorrektur in RestartCheckPersTisch
                   drucken über memorystream PrintStream
                   lbstorno oben rechts, blinkend
  2007.01.28 (mp): personal abrechnen erweitert
  2007.01.20 (mp): personal abrechnen
  2007.01.15 (mp): copyright
                   ShowCursor
                   alle fenster als dialog
                   umsetzen mit text und anderer farbe
  2007.01.11 (mp): skins raus
  2007.01.09 (mp): wieder auf 800x600, noch optimieren
  2007.01.06 (mp): artikel anlegen,updaten,löschen => artikelliste neu laden
  2007.01.01 (mp): auf 1024x768
                   in onidle nix machen
  2006.12.31 (mp): chart
  2006.12.26 (mp): nach z-abrechnung tische zurücksetzen
  2006.12.24 (mp): umsetzen
  2006.12.17 (mp): nach z-abrechnung alle tische auf last=0
  2006.12.01 (mp): RestartCheckPersTisch
  2006.11.30 (mp): softkey
                   personalwechsel für anmeldescreen korrigiert
  2006.11.28 (mp): korrektur x-barrechung zeitraum
  2006.11.21 (mp): aufgeräumt
  2006.11.15 (mp): statusbar links = rabattauswahl
  2006.10.30 (mp): erstellt
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExButtons, JvBitBtn, ExtCtrls, JvExExtCtrls,
  JvComponent, JvPanel, cTisch, ComCtrls, ToolWin, uDB, JvSplitter,
  JvItemsPanel, JvExControls, JvExComCtrls, JvComCtrls, ImgList,
  JvExStdCtrls, JvButton, JvCtrls, JvBaseThumbnail, JvThumbImage,
  jpeg, JvNetscapeSplitter, JvStatusBar, JvBehaviorLabel,
  JvValidateEdit, JvRadioGroup, JvScrollText, JvEdit, Menus,
  TeEngine, Series, TeeProcs, Chart, Mask, JvExMask,
  JvToolEdit, grids, ButtonGroup, abrechnen, JvCheckBox,
  JvLabel, CheckLst, JvListBox, JvExForms, JvScrollBox,
  erinnerung, JvTracker, JvBackgrounds, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, idcontext, JvClock,

  FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.FMTBcd,
  Data.SqlExpr, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, JvExtComponent, FireDAC.Phys.IB, FireDAC.Phys.IBDef;

const
{$MESSAGE 'ACHTUNG DBVERSION 7'}
  DBVERS = 7;

  KATEGORIENAME: array [100..110] of string = ('AFG','BIER','KAFFEE','COCKTAILS','LONGDRINKS KOMBI',
                                               'APERITIF / SPIRITUOSEN','ESSEN','SEKT / CHAMPAGNER / WEIN',
                                               'FREI 4','FREI 5','FREI 6');
  _LOKO_INTERN = 0;

  _AFG       = 100;
  _BIER      = 101;
  _KAFFEE    = 102;
  _COCKTAILS = 103;
  _LOKO      = 104;
  _SPIRIT    = 105;
  _ESSEN     = 106;
  _SEKT      = 107;

  _SBT: array [0..6] of string = ('','Angemeldet','Tisch','zu zahlen','Aktuell','Orders','letzte Order');

  MAXARTPERROW   = 9;
  MAXARTPERPAGE  = 29;
  MinPersonal    = 1;
  MaxPersonal    = 100;
  MaxChars       = 52;
  MwstNormal     = 11900;
  MwstGemindert  = 10700;
  KombiGrundlage = 1;
  KombiZusatz    = 2;

type

  THtmlTable = record
    cDIV,cTBL,cHEAD,
    cROW,cLEFT,cRIGHT,
    nTBL,nLEFT,nRIGHT: string;
    Mode: integer;
  end;

  TStatItem = class
    private
      p: TPanel;
      h: TPanel;
      l: TListBox;

    public
      constructor Create(aOwner: TWinControl; aTop,aLeft: integer; aOnDrawStatItem: TDrawItemEvent);
      destructor  Destroy; override;
  end;

  TStatList = class
    private
      Liste: TList;
    public
      constructor Create;
      destructor  Destroy; override;
      procedure Clear;
  end;

  TPageMode = (pmDefault,pmNext,pmBack);

  TFirma = record
    bez, str, hau,
    plz, ort, tel,
    stn: string;
  end;

  TArtikelItem = class
    Bez: string;
    ArtID,Preis,
    Aktiv,Mwst,
    Kombi: integer;
    Color: TColor;
  end;

  TBestellItem = class
    ArtID,
    Preis,
    Rabatt,
    Kategorie,
    KombiArtid: integer;
    KombiBez: string;
    Printed: Boolean;
    HausRabatt: integer;
  end;

  TBestellButton = class(TJVImgBtn)
    private
      Artikel: TArtikel;
      Pos: integer;
      PageMode: TPageMode;
      VonIdx,BisIdx,
      Count: integer;
      Cap: string;
    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;
  end;

  TfrmfryPos = class(TForm)
    pcfryPos: TJvPageControl;
    tsAnmelden: TTabSheet;
    tsTisch: TTabSheet;
    tsBestellung: TTabSheet;
    tsChef: TTabSheet;
    tiChef: TJvThumbImage;
    tiTheke: TJvThumbImage;
    tiPersonal1: TJvThumbImage;
    tiPersonal2: TJvThumbImage;
    tiPersonal3: TJvThumbImage;
    tiPersonal4: TJvThumbImage;
    tiPersonal5: TJvThumbImage;
    tiPersonal6: TJvThumbImage;
    tiPersonal7: TJvThumbImage;
    tiPersonal9: TJvThumbImage;
    tiPersonal8: TJvThumbImage;
    tiLogo: TJvThumbImage;
    pcBestellung: TJvPageControl;
    tsBier: TTabSheet;
    tsAFG: TTabSheet;
    tsCocktails: TTabSheet;
    tsKaffee: TTabSheet;
    tsLoKo: TTabSheet;
    panBestellungTop: TPanel;
    panBestellungRight: TPanel;
    lbBestellTisch: TLabel;
    panRightTop: TPanel;
    lbTischBestellungNeu: TListBox;
    jvsb: TJvStatusBar;
    jvpTischRight: TJvPanel;
    btnPersChange: TJvImgBtn;
    btnAnmeldung: TJvImgBtn;
    btnTischAuswahl: TJvImgBtn;
    btnBier: TJvImgBtn;
    btnAFG: TJvImgBtn;
    btnKaffee: TJvImgBtn;
    btnCocktails: TJvImgBtn;
    btnLoKo: TJvImgBtn;
    btnRabatt: TJvImgBtn;
    lbName1: TLabel;
    lbName2: TLabel;
    lbName3: TLabel;
    lbName0: TLabel;
    pcChef: TJvPageControl;
    tsAbrechnen: TTabSheet;
    tsPersonal: TTabSheet;
    tsArtikel: TTabSheet;
    tsTischLayout: TTabSheet;
    panAbrechnenLeft: TPanel;
    panAbrechnenMainRight: TPanel;
    btnXRech: TJvImgBtn;
    btnZRech: TJvImgBtn;
    panAbrechnenTop: TPanel;
    panAbrechnenBottom: TPanel;
    panAbrechnenRight: TPanel;
    panAbrechnen: TPanel;
    panZ: TPanel;
    lbT: TListBox;
    panTop: TPanel;
    panV: TPanel;
    lbPZ: TListBox;
    panPZTop: TPanel;
    panK: TPanel;
    lbAM: TListBox;
    panAMTop: TPanel;
    panVS: TPanel;
    lbAU: TListBox;
    panAUTop: TPanel;
    panE: TPanel;
    lbPU: TListBox;
    panPUTop: TPanel;
    panPersonalLeft: TPanel;
    Panel2: TPanel;
    panAddPers: TPanel;
    panDelPers: TPanel;
    Panel4: TPanel;
    panPersonalStat: TPanel;
    panPSUG: TPanel;
    lbUM: TListBox;
    Panel8: TPanel;
    panPSVF: TPanel;
    lbVF: TListBox;
    Panel10: TPanel;
    panPSMF: TPanel;
    lbMF: TListBox;
    Panel12: TPanel;
    panPSMH: TPanel;
    lbMH: TListBox;
    Panel14: TPanel;
    panPSVH: TPanel;
    lbVH: TListBox;
    Panel16: TPanel;
    lbPersonal: TListBox;
    lbUG: TListBox;
    Panel17: TPanel;
    Panel18: TPanel;
    lbS: TListBox;
    Panel19: TPanel;
    lbAZ: TListBox;
    Panel20: TPanel;
    lbE: TListBox;
    Panel21: TPanel;
    lbA: TListBox;
    Panel22: TPanel;
    btnArtBier: TJvImgBtn;
    btnArtAFG: TJvImgBtn;
    btnArtKaffee: TJvImgBtn;
    btnArtCock: TJvImgBtn;
    btnArtLoKo: TJvImgBtn;
    Panel23: TPanel;
    lbArtikel: TListBox;
    Panel24: TPanel;
    panArtikelTop: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    edPreis: TJvValidateEdit;
    edBez: TEdit;
    cbAktiv: TCheckBox;
    Label1: TLabel;
    Label7: TLabel;
    btnSaveArtikel: TJvImgBtn;
    btnDelArtikel: TJvImgBtn;
    panChefTischeLeft: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    btnSaveLayout: TJvImgBtn;
    lbLayouts: TListBox;
    btnUseLayout: TJvImgBtn;
    btnDelLayout: TJvImgBtn;
    tsCFG: TTabSheet;
    lbName4: TLabel;
    lbName5: TLabel;
    lbName6: TLabel;
    lbName7: TLabel;
    lbName8: TLabel;
    lbName9: TLabel;
    lbTischAdd: TLabel;
    lbTischDel: TLabel;
    tReminder: TTimer;
    gbChef: TGroupBox;
    edPW: TEdit;
    Label8: TLabel;
    btnSavePW: TJvImgBtn;
    cbChef: TCheckBox;
    gbReminder: TGroupBox;
    rgReminder: TJvRadioGroup;
    gbPersonal: TGroupBox;
    rgPersonal: TJvRadioGroup;
    gbAudio: TGroupBox;
    gbVideo: TGroupBox;
    gbDiv: TGroupBox;
    cbXPVista: TCheckBox;
    cbPrinter: TCheckBox;
    stReminder: TJvScrollText;
    btnSoftKey: TButton;
    Label2: TLabel;
    gbAbrechnung: TGroupBox;
    cbReminderSound: TCheckBox;
    cbPrintOn: TComboBox;
    Label4: TLabel;
    btnUmsetzen: TJvImgBtn;
    btnExit: TJvImgBtn;
    btnKeyboard: TJvImgBtn;
    cbCursor: TCheckBox;
    btnPersAbrechnen: TJvImgBtn;
    lbAbrechnung: TListBox;
    Label11: TLabel;
    btnNachdrucken: TJvImgBtn;
    cbPrint: TCheckBox;
    cbPreview: TCheckBox;
    btnSpirit: TJvImgBtn;
    tsSpirit: TTabSheet;
    tsFood: TTabSheet;
    btnFood: TJvImgBtn;
    btnArtSprit: TJvImgBtn;
    btnArtFood: TJvImgBtn;
    rgKombi: TRadioGroup;
    rgMwst: TRadioGroup;
    JvLabel1: TJvLabel;
    panPersonalLeftBot: TPanel;
    Label12: TLabel;
    datPersVon: TJvDateEdit;
    Label13: TLabel;
    datPersBis: TJvDateEdit;
    btnSekt: TJvImgBtn;
    lbTisch: TLabel;
    tsSekt: TTabSheet;
    panAction: TPanel;
    btnOK: TJvImgBtn;
    btnAbrechnen: TJvImgBtn;
    btnStorno: TJvImgBtn;
    cbSplit: TJvCheckBox;
    cbBewirtung: TJvCheckBox;
    panOrderTop: TPanel;
    lbTischBestellungOffen: TListBox;
    btnArtSekt: TJvImgBtn;
    btnResetOrder: TJvImgBtn;
    cbEditLayout: TCheckBox;
    btnPersOrder: TJvImgBtn;
    gbBonSplit: TGroupBox;
    chklstBonSplit: TCheckListBox;
    panLokoTop: TPanel;
    panLokoBottom: TPanel;
    JvgBevel1: TBevel;
    pcKombiGrund: TJvPageControl;
    tsGrundlage: TTabSheet;
    pcKombiZusatz: TJvPageControl;
    tsZusatz: TTabSheet;
    JvgBevel2: TBevel;
    cbKompakt: TCheckBox;
    grbMWST: TGroupBox;
    rgBonMWST: TJvRadioGroup;
    cbAbrPers: TCheckBox;
    tsChefStat: TTabSheet;
    panCSTop: TPanel;
    btnCSGS: TJvImgBtn;
    btnCSGT: TJvImgBtn;
    btnCSW: TJvImgBtn;
    btnCSM: TJvImgBtn;
    btnCSGJ: TJvImgBtn;
    btnGSG: TJvImgBtn;
    btnCSTZ: TJvImgBtn;
    btnCSSZ: TJvImgBtn;
    chkPersLastZ: TCheckBox;
    jvSBStat: TJvScrollBox;
    panStatSB: TPanel;
    rgStatOpt: TRadioGroup;
    panStatName: TPanel;
    cbSummen: TCheckBox;
    cbTitleBar: TCheckBox;
    btnCSXZ: TJvImgBtn;
    rgCSDay: TRadioGroup;
    jvCSBack: TJvTracker;
    jvBG: TJvBackground;
    btnLoadBG: TJvImgBtn;
    btnPenner: TJvImgBtn;
    jvPenner: TJvTracker;
    jvClock: TJvClock;
    lbCSZ: TLabel;
    lbCSP: TLabel;
    lbDatum: TLabel;
    cbStorno: TCheckBox;
    btnPrintStat: TJvImgBtn;
    http: TIdHTTPServer;
    btnTest: TJvImgBtn;
    btnRes: TJvImgBtn;
    cbProz: TCheckBox;
    JvLabel2: TJvLabel;
    lbArtUG: TJvLabel;
    JvLabel3: TJvLabel;
    JvLabel4: TJvLabel;
    JvLabel6: TJvLabel;
    JvLabel7: TJvLabel;
    lbArtUA: TJvLabel;
    lbArtUW: TJvLabel;
    lbArtUM: TJvLabel;
    lbArtUJ: TJvLabel;
    JvLabel12: TJvLabel;
    JvLabel21: TJvLabel;
    JvLabel5: TJvLabel;
    lbArtMG: TJvLabel;
    lbArtMA: TJvLabel;
    lbArtMW: TJvLabel;
    lbArtMM: TJvLabel;
    lbArtMJ: TJvLabel;
    gbHausRabatt: TGroupBox;
    rgHausRabatt: TJvRadioGroup;
    btnArtInfo: TJvImgBtn;
    btnTischInfo: TJvImgBtn;
    gbFirmData: TGroupBox;
    edFirmBez: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edFirmNN: TEdit;
    Label6: TLabel;
    edFirmVN: TEdit;
    Label9: TLabel;
    edFirmStr: TEdit;
    Label10: TLabel;
    edFirmOrt: TEdit;
    edFirmHN: TEdit;
    Label14: TLabel;
    edFirmPLZ: TEdit;
    Label15: TLabel;
    edFirmTel: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edFirmFax: TEdit;
    edFirmMobil: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edFirmSN: TEdit;
    btnFirmSave: TJvImgBtn;
    d: TFDConnection;
    s: TFDQuery;
    t: TFDTransaction;
    q: TFDQuery;
    pnlTools: TPanel;
    procedure btnFirmSaveClick(Sender: TObject);
    procedure rgHausRabattClick(Sender: TObject);
    procedure cbStornoClick(Sender: TObject);
    procedure jvClockDblClick(Sender: TObject);
    procedure btnResClick(Sender: TObject);
    procedure httpConnect(AContext: TIdContext);
    procedure btnTestClick(Sender: TObject);
    procedure httpCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure jvCSBackChangedValue(Sender: TObject; NewValue: Integer);
    procedure jvPennerChangedValue(Sender: TObject; NewValue: Integer);
    procedure btnLoadBGClick(Sender: TObject);
    procedure btnPrintStatClick(Sender: TObject);
    procedure cbTitleBarClick(Sender: TObject);
    procedure btnCSGSClick(Sender: TObject);
    procedure cbAbrPersClick(Sender: TObject);
    procedure rgBonMWSTClick(Sender: TObject);
    procedure chklstBonSplitClick(Sender: TObject);
    procedure btnPersOrderClick(Sender: TObject);
    procedure btnResetOrderClick(Sender: TObject);
    procedure btnArtSektClick(Sender: TObject);
    procedure panOrderTopClick(Sender: TObject);
    procedure btnSektClick(Sender: TObject);
    procedure btnFoodClick(Sender: TObject);
    procedure btnSpiritClick(Sender: TObject);
    procedure btnLoKoClick(Sender: TObject);
    procedure btnArtFoodClick(Sender: TObject);
    procedure btnArtSpritClick(Sender: TObject);
    procedure btnNachdruckenClick(Sender: TObject);
    procedure btnStornoClick(Sender: TObject);
    procedure btnPersAbrechnenClick(Sender: TObject);
    procedure cbCursorClick(Sender: TObject);
    procedure lbArtikelDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure btnKeyboardClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnUmsetzenClick(Sender: TObject);
    procedure cbPrintOnChange(Sender: TObject);
    procedure btnSoftKeyClick(Sender: TObject);
    procedure cbPrinterClick(Sender: TObject);
    procedure lbTischAddClick(Sender: TObject);
    procedure lbTischDelClick(Sender: TObject);
    procedure cbXPVistaClick(Sender: TObject);
    procedure cbReminderSoundClick(Sender: TObject);
    procedure panDelPersClick(Sender: TObject);
    procedure panAddPersClick(Sender: TObject);
    procedure rgReminderClick(Sender: TObject);
    procedure tReminderTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgPersonalClick(Sender: TObject);
    procedure cbChefClick(Sender: TObject);
    procedure btnSavePWClick(Sender: TObject);
    procedure btnDelLayoutClick(Sender: TObject);
    procedure tsTischLayoutMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lbLayoutsClick(Sender: TObject);
    procedure btnUseLayoutClick(Sender: TObject);
    procedure lbTischBestellungOffenClick(Sender: TObject);
    procedure btnDelArtikelClick(Sender: TObject);
    procedure btnSaveArtikelClick(Sender: TObject);
    procedure lbArtikelClick(Sender: TObject);
    procedure btnArtLoKoClick(Sender: TObject);
    procedure btnArtCockClick(Sender: TObject);
    procedure btnArtKaffeeClick(Sender: TObject);
    procedure btnArtAFGClick(Sender: TObject);
    procedure btnArtBierClick(Sender: TObject);
    procedure pcChefChange(Sender: TObject);
    procedure lbPersonalClick(Sender: TObject);
    procedure lbTDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure btnZRechClick(Sender: TObject);
    procedure btnXRechClick(Sender: TObject);
    procedure btnRabattClick(Sender: TObject);
    procedure btnSaveLayoutClick(Sender: TObject);
    procedure jvsbDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure btnPersChangeClick(Sender: TObject);
    procedure btnAbrechnenClick(Sender: TObject);
    procedure pcfryPosChange(Sender: TObject);
    procedure btnTischAuswahlClick(Sender: TObject);
    procedure btnAnmeldungClick(Sender: TObject);
    procedure lbTischBestellungOffenDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure btnOKClick(Sender: TObject);
    procedure lbTischBestellungNeuClick(Sender: TObject);
    procedure pcBestellungChange(Sender: TObject);
    procedure lbTischBestellungNeuDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure tiCocktailsClick(Sender: TObject);
    procedure tiKaffeeClick(Sender: TObject);
    procedure tiAFGClick(Sender: TObject);
    procedure tiBierClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tiChefClick(Sender: TObject);
    procedure tiTischBackClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PersonalAuswahl(Sender: TObject);
    procedure PersPanelPrint(Sender: TObject);
  private
    AppDB,
    AppPath,
    AppName,
    AppIni,
    AppVersion: string;

    ini: TStringList;

    TischList: TTischListe;
    TischLayoutList: TTischListe;

    MoveTisch: TTisch;
    TischLayout: integer;
    LayoutToEdit: integer;
    BestellListe: TList;
    StornoAktiv: boolean;
    AktPers: integer;
    AktTisch: integer;
    AktRabatt: integer;
    AktKat: integer;
    PersonalListe: TStringList;
    Bestellung: TStringList;
    ReminderPeriod: integer;
    ReminderSound: boolean;
    XPVistaMode: boolean;
    DruckerOK: boolean;
    bbNext,bbBack: TBestellButton;
    bbKGNext,bbKGBack: TBestellButton;
    bbKZNext,bbKZBack: TBestellButton;
    VonTisch,NachTisch: integer;
    VonNachTisch: TStringList;
    ArtList: TArtikelListe;
    PrintStream: TMemoryStream;
    Firma: TFirma;
    LastKombiItem: TArtikelItem;
    KombiPreis: Integer;
    ResetOrder: boolean;
    BonSplit: string;
    EinzelMWST: Boolean;
    AbrPers: Boolean;
    LastKategorie: integer;
    StatList: TStatList;
    Personen: string;
    HausRabatt: integer;
    BonTitel: string;
    BonFoot1: string;
    BonFoot2: string;

    function DoConnect: integer;
    function GetPersonal(var BID: integer; Mode: integer): integer;
    function PersonalLogin(ID: integer): integer;
    function GetAnmeldeTisch(TischTag: integer): TJvThumbImage;
    function GetCFG(Tag: string): string;
    function OffeneBestellungen(Tisch: integer = 0): boolean;
    function ShowPersonalAbrechnung(grd: TStringGrid; bg: TButtonGroup): string;

    procedure PrintBestellung(PrintKat: integer);
    procedure GenericPrint;
    procedure GenericPreview(PreviewList: TStringList);

    procedure PrintAbrechnung(Rechnung: TStringList);
    procedure CreateTische(Tische: TTischListe; TischParent: TWinControl; ID: integer; Faktor: extended = 1.0);
    procedure CreateBestellButton(p: TTabSheet; l,t,w,h: integer; c: string;
                                  ID,Preis,Kategorie,Kombi: integer;
                                  aPageMode: TPageMode = pmdefault);
    procedure SetDoubleBuffered;
    procedure ActivatePage(ts: TTabSheet);
    procedure TischAuswahl(Sender, Tisch: TObject);
    procedure BestellungAuswahl(Sender: TObject);
    procedure SaveTische(Tische: TTischListe; ID: integer);
    procedure ClearBestellung(ClearSheet: TTabSheet = nil);
    procedure LoadPic(ti: TJvThumbImage; Pic: string);
    procedure LoadOffeneBestelllung(Tisch: integer);
    procedure LoadPersonal;
    procedure CheckPersonal;
    procedure AbrechnenGesamt;
    procedure ClearStatusBar(Mode: integer);
    procedure SaveNewPos(Name: string);
    procedure SetAngemeldet(Bediener: integer; Aktiv: boolean);
    procedure ClearBestellListe;
    procedure SetTischStatus(Tische: TTischListe; TischID: integer; Mode: boolean; Last: TDateTime = 0);
    procedure ShowAbrechnung(Mode: integer; MitMeldung: Boolean = True);
    procedure ShowPersonal(ID: integer);
    procedure FillPersonal;
    procedure ClearArtikel;
    procedure FillArtikel(Kat: integer);
    procedure SaveArtikel;
    procedure CheckTische;
    procedure DeleteBestellung(Idx: integer);
    procedure LoadTischLayOut;
    procedure SaveTischLayOut(Layout: integer; IID: integer = 0);
    procedure DeleteLayOut(Layout: integer);
    procedure CheckChefMode;
    procedure SetCFG(IID: integer; Tag, Val: string);
    procedure InitCFG;
    procedure SetPersonalButton(Abmelden: boolean = false);
    procedure MyOnIdle(Sender: TObject; var Done: Boolean);
    procedure SavePersonal(Name: string);
    procedure Abrechnen(Einzel: boolean);
    procedure AbrechnenEinzel;
    procedure InitBestellButton(var b: TBestellButton);
    procedure DelTischFromLayout;
    procedure AddTischToLayout;
    procedure RestartCheckPersTisch;
    procedure UpdateTische(VonNach: TStringList);
    procedure LoadArtList;
    procedure LoadArtikel(Kat: integer; ts: TTAbSheet; AbID: integer = 0);
    procedure DoSoftKey;
    procedure PersonalAbrechnen;
    procedure ChangePersonal;
    procedure ShowAbrechnenStat(PrintData: TStringList);
    procedure TranslateChars(sl: TStringList);
    procedure InitAbrechnen(LB: TListBox; DoAbrechnung: Boolean);
    procedure PersonalLogOut;
    procedure AddFirmFooter(PrintList: TStringList);
    procedure AddFirmHeader(PrintList: TStringList; FromDB: boolean);
    procedure LoadKombiArtikel(Kat: integer; ts: TTAbSheet; AbID,BisID: integer);
    procedure SetTischLabel(ts: TTabSheet);
    procedure SetActiveOrderMode(Mode: integer);
    procedure CopyArtikel(SortArtList, OrgArtList: TArtikelListe; KombiArt: integer);
    procedure UpdateTischValues(Tisch: TTisch);
    procedure LoadKategorie;
    procedure SaveBonSplit;
    procedure SetBestellButton;
    procedure ResetLastKombiItem;
    function  UpdateDatabase(Script: string): Boolean;
    procedure InitChefStat;
    procedure DrawStatItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    function SetStatCaption(Liste, ZR: integer): string;
    function SetAktZR(Liste, ZR, LastZR: integer): boolean;
    procedure UpdateTischSumme;
    procedure ShowErinnerung;
    procedure ResizeComponents;
    procedure PrintScrollBox;
    function BuildWebPage(UserRang: integer): string;
    function HtmlTable2Html(HT: THtmlTable): string;
    function GetPageAndStyle: string;
    function BuildHtml: string;
    procedure GetArtValMen(ArtId: integer);
    function GetAktRabattFromDB: integer;
    function GetAktRabattStrFromDB(VonIID, BisIID: integer): string;
  public
    { Public-Deklarationen }
  end;

  function StripStr2Num(Input: string): integer;
  function StripNumStr(Input: string): string;
  function JaNein(const Msg: string): boolean;
  function ErrorMsg(const Msg: string): integer;
  function IntDat(aVal: TDateTime): integer;
  function DatAsint: integer;
  function MakePreis(Preis: integer; MitEuro: boolean = true): string;
  function TimeDiff(Start, Ende: TDateTime): integer;
  function Minuten2Zeit(Minuten: integer): string;
  function MakeDate(Dat: integer): string;
  function MakeDateSmall(Dat: integer): string;

var
  frmfryPos: TfrmfryPos;
  fryPOSHandle: THandle;

implementation

uses rsFileVersion, rabatt, DateUtils,
     printers, einzelabrechnung,
     shellapi, umsetzen, printing,
     // DDBC gmTypes, GmPreview,
     JclStrHashMap, editlayout, JclMath, reservierung;

resourcestring
  CopyRightString        = '© 2007 M.Przybylo';

  StrDatenbankverbind    = '!!! No se pudo establecer la conexión con la base de datos, se terminará fryPos!!!';
  StrWEITER              = 'WEITER >>';
  StrfryPosBeenden     = 'Salir de frypos?';
  StrCheftaste           = 'salida de emergencia';
  StrPasswort            = 'Passwort';
  StrTisch               = 'Mesa ';
  StrPersonalAnmelden    = 'Personal de registro';
  StrPersonalAbmelden    = 'Personal de registro';
  StrDasKomplettePerson  = 'El personal completo está registrado.!';
  StrKeinPersonalGefund  = 'No se ha encontrado personal, crea en modo Chef!';
  StrRegulaer            = 'regular';
  StrHausrabatt          = 'descuento casa';
  StrFrei                = 'gratis';
  StrBestellungUm        = 'Orden en ';
  StrTheke               = 'bar';
  StrNochAngemeldetesPe  = '¿Desconectado todavía conectado en el personal?';
  StrEsGibtNichtAbgere   = 'No hay mesas instaladas, ¿asentarse?';
  StrTischanordnungSpeic = 'Tischanordnung speichern';
  StrBezeichnung         = 'Bezeichnung';
  StrOhneBestellung      = 'ohne Bestellung.';
  StrDMinOhneBestell     = '%d Min.';
  Str22dStunden22d       = '%2.2d Stunden %d Minuten';
  StrZAbschlussErstelle  = 'Z-Abschluss erstellen?';
  StrKeinUmsatzSeitLet   = 'Kein Umsatz seit letztem Z-Abschluß vorhanden!';
  StrAbrechnungZeitraum  = '-Abrechnung Zeitraum %s bis %s ( %s )';
  StrUmsatzAktuell       = 'Umsatz aktuell ';
  StrKategorie           = 'Kategorie ';
  StrArtikelAktualisiere = 'Artikel aktualisieren?';
  StrArtikelAnlegen      = 'Artikel anlegen?';
  StrArtikelSLoeschen    = 'Artikel %s löschen?';
  StrBestellungStorniere = 'Bestellung stornieren?';
  StrfryPosBestellung  = 'fryPos Bestellung/Abrechnung';
  StrEsIstKeinBondruck   = 'Es ist kein Bondrucker installiert!';
  StrBitteGenericTexton  = 'Bitte Generic/Textonly Drucker mit Bezeichnung "Bondrucker" installieren!';
  StrPersonalAnlegen     = 'Personal anlegen';
  StrName                = 'Name';

{$R *.dfm}
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function RGB2TColor(const R, G, B: Byte): Integer;
begin
  // convert hexa-decimal values to RGB
  result := R + G shl 8 + B shl 16;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TColor2RGB(const Color: TColor; Add: byte): TColor;
var
  r,g,b: Byte;
begin
  // convert hexa-decimal values to RGB
  R := (Color and $FF) + Add;
  G := (Color shr 8)  and $FF;
  B := (Color shr 16) and $FF;

  result := RGB2TColor(R,G,B);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function SortBez(Item1,Item2: pointer): integer;
begin
  result := StrIComp(PChar(TArtikel(Item1).Bezeichnung),PChar(TArtikel(Item2).Bezeichnung));
end;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
function MakeDate(Dat: integer): string;
begin
  result := format('%2.2d.%2.2d.%4.4d',[(Dat mod 10000) mod 100,(Dat mod 10000) div 100,Dat div 10000])
end;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
function MakeDateSmall(Dat: integer): string;
begin
  result := format('%2.2d.%2.2d.%2.2d',[(Dat mod 10000) mod 100,(Dat mod 10000) div 100,(Dat div 10000) mod 100])
end;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
function Minuten2Zeit(Minuten: integer): string;
begin
  result := '0';
  try
    result := format('%2.2dh:%2.2dm',[Minuten div 60,Minuten mod 60]);
  except
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
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
    if (Input[i] in ['0'..'9']) then
      erg := erg + Input[i];

  result := strtointdef(erg,0) * f;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function StripNumStr(Input: string): string;
var
  i: integer;
  erg: string;
begin
  erg := '';

  for i := 1 to length(Input) do
    if not(Input[i] in ['0'..'9']) then
      erg := erg + Input[i];

  result := erg;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function ErrorMsg(const Msg: string): integer;
begin
  result := 0;
  MessageBeep(0);
  MessageDlg(Msg,mtError,[mbOK],0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function DatAsInt: integer;
begin
  result := strtoint(FormatDateTime('yyyymmdd',now));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function IntDat(aVal: TDateTime): integer;
begin
  result := strtoint(FormatDateTime('yyyymmdd',aVal));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function JaNein(const Msg: string): boolean;
begin
  result := true;
  if MessageDlg(Msg,mtConfirmation,[mbNO,mbYES],0) <> idYes then result := false;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function GetFileVersion: string;
var
  fv: TrsFileVersion;
begin
  result := '';

  fv := TrsFileVersion.Create;
  if fv.GetFileVersion(ParamStr(0)) then result := fv.Version + '.' + inttostr(fv.build);

  fv.Free;
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
function TfrmfryPos.DoConnect: integer;
var
  c: string;
begin
  result := -1;
  c := Caption;

  if assigned(GlobalDB) then
  begin
    try
      if (AppDB <> '') then
      begin
        result := GlobalDB.DBConnect(AppDB,'masterkey');
        Caption := Caption + ' (ip-server)';
      end
      else
      begin
        if (FileExists(AppPath + 'gds32.dll')) then
        begin
          result := GlobalDB.DBConnect(AppPath + 'frypos.fdb','masterkey');
          Caption := Caption + ' (lokal)';
        end
        else
        begin
          if (FileExists(AppPath + 'db\frypos.fdb')) then
          begin
            result := GlobalDB.DBConnect(AppPath + 'db\frypos.fdb','masterkey');
            Caption := Caption + ' (server)';
          end;
        end;
      end;
    except
      on e: exception do
      begin
        Caption := c;
        result  := -1;
        ShowMessage(e.Message);
      end;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormCreate(Sender: TObject);
var
  bg: string;
begin
  if (UpdateDatabase('')) then
  begin
    if (FileExists('logo.jpg')) then
    begin
      try
        tiLogo.Picture.LoadFromFile('logo.jpg');
      except
      end;
    end;

    ResizeComponents;

    lbTischBestellungOffen.Color   := pcfryPos.Color;
    lbTischBestellungNeu.Color     := pcfryPos.Color;
    jvpTischRight.Color            := pcfryPos.Color;
    // jvpTischRight.HotColor         := jvpTischRight.Color;
    jvpTischRight.ParentBackground := false;
    lbTischBestellungNeu.Align     := alClient;
    lbTischBestellungOffen.Align   := alClient;

    ClearStatusBar(1);
    SetDoubleBuffered;

    Caption := Caption + ' Version ' + GetFileVersion;

    AppPath    := ExtractFilePath(ParamStr(0));
    AppName    := ExtractFileName(ParamStr(0));
    AppIni     := AppPath+ChangeFileExt(AppName,'.ini');
    AppVersion := GetFileVersion;

    ini := TStringList.Create;
    if (FileExists(AppIni)) then ini.LoadFromFile(AppIni);

    AppDB    := ini.Values['DB'];
    BonTitel := ini.Values['BONTITLE'];
    BonFoot1 := ini.Values['BONFOOT1'];
    BonFoot2 := ini.Values['BONFOOT2'];

    ArtList      := TArtikelListe.Create;
    BestellListe := TList.Create;
    Bestellung   := TStringList.Create;
    MoveTisch    := nil;

    StatList := TStatList.Create;

    btnAnmeldung.Visible    := false;
    btnTischauswahl.Visible := false;
    btnRabatt.Visible       := false;
    btnExit.Top             := btnAnmeldung.Top;
    btnKeyboard.Top         := btnAnmeldung.Top;

    ActivatePage(tsAnmelden);

    if (DoConnect < 0) then
    begin
      ShowMessage(StrDatenbankverbind);
      Application.Terminate;
    end;
    lbDatum.Caption := FormatDateTime('dddd, d. mmmm yyyy',now);

    LoadArtList;
    PersonalListe   := TStringList.Create;
    TischList       := TTischListe.Create;
    TischLayoutList := TTischListe.Create;
    TischLayout     := strtointdef(GetCFG('LAYOUT'),1);
    tiChef.Visible  := strtointdef(GetCFG('CHEF'),0) = 1;
    ReminderPeriod  := strtointdef(GetCFG('REMINDER'),15);
    ReminderSound   := strtointdef(GetCFG('REMSOUND'),1) > 0;
    XPVistaMode     := strtointdef(GetCFG('XPVISTA'),1) > 0;
    DruckerOK       := strtointdef(GetCFG('PRINTER'),1) > 0;
    KombiPreis      := strtointdef(GetCFG('KOMBIPREIS'),250);
    BonSplit        := GetCFG('BONSPLIT');
    EinzelMWST      := strtointdef(GetCFG('EINZELMWST'),0) = 0;
    AbrPers         := strtointdef(GetCFG('ABRPERS'),1) = 1;

    bg := GetCFG('BACKGROUND');

    if (FileExists(bg)) then
    begin
      try
        jvBG.Image.Picture.LoadFromFile(bg);
      except
      end;
    end;

    ShowCursor(strtointdef(GetCFG('CURSOR'),1) = 1);

    LoadPersonal;
    LoadKategorie;

    SetPersonalButton;
    SetBestellButton;

    CreateTische(TischList, tsTisch, TischLayout);
    RestartCheckPersTisch;

    VonNachTisch := TStringList.Create;

    datPersVon.Date := now;
    datPersBis.Date := now;

    ResetOrder  := false;

    if (GetCFG('MAXIMIZE') = '1') then WindowState := wsMaximized;

    if (GetCFG('TITLEBAR') = '1') then BorderStyle := bsSingle
    else
    begin
      BorderStyle := bsNone;
      Top         := Top - 15;
    end;

    if (GetCFG('CENTER') = '1') then Position := poDesktopCenter;

    jvsb.Panels[0].Text := CopyRightString;
    PrintStream := TMemoryStream.Create;

    AddFirmHeader(nil,true);
  end
  else
    Application.Terminate;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tReminder.Enabled := false;
  if (stReminder.Active) then stReminder.Active := false;

  if Assigned(LastKombiItem) then LastKombiItem.Free;
  if Assigned(StatList) then StatList.Free;

  bbNext.Free;
  bbBack.Free;
  bbKGNext.Free;
  bbKGBack.Free;
  bbKZNext.Free;
  bbKZBack.Free;
  ini.Free;

  ClearBestellung;
  ClearBestellListe;
  ClearArtikel;

  ArtList.Free;
  BestellListe.Free;
  Bestellung.Free;
  TischList.Free;
  TischLayoutList.Free;
  PersonalListe.Free;
  VonNachTisch.Free;
  PrintStream.Free;

  ShowCursor(true);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ClearBestellung(ClearSheet: TTabSheet);
var
  i: integer;
begin
  for i := 0 to BestellListe.Count-1 do
  begin
    if (ClearSheet = nil) then
      TBestellButton(BestellListe[i]).Free
    else
    begin
      if (ClearSheet = TBestellButton(BestellListe[i]).Parent) then
      begin
        TBestellButton(BestellListe[i]).Free;
        BestellListe[i] := nil;        
      end;
    end;
  end;

  if (ClearSheet = nil) then
    BestellListe.Clear
  else
  begin
    BestellListe.Pack;

    if (BestellListe.Capacity > BestellListe.Count) then
      BestellListe.Capacity := BestellListe.Count;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CreateTische(Tische: TTischListe; TischParent: TWinControl;
                                    ID: integer; Faktor: extended);
var
  q: TDBQuery;
begin
  LockWindowUpdate(TischParent.Handle);

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select num,pox,poy,wit,hei,inf,opn from get_tischex(%d)',[ID]);
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      Tische.Add(q.DBSql.Fields[0].AsInteger,
                 q.DBSql.Fields[0].AsInteger,
                 q.DBSql.Fields[1].AsInteger,
                 q.DBSql.Fields[2].AsInteger,
                 q.DBSql.Fields[3].AsInteger,
                 q.DBSql.Fields[4].AsInteger,
                 TischParent,
                 Faktor,
                 q.DBSql.Fields[5].AsString,
                 q.DBSql.Fields[6].AsInteger).TischClick := TischAuswahl;
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;

  LockWindowUpdate(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not(JaNein(StrfryPosBeenden)) then
  begin
    CanClose := false;
    exit;
  end
  else
  begin
    PersonalLogOut;
    GlobalDB.DBDisConnect;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadArtikel(Kat: integer; ts: TTAbSheet; AbID: integer);
var
  i,c,t,x,
  m,y,l,r,
  mpr: integer;
  ta: TArtikel;
  _MAXARTPERROW,
  _MAXARTPERPAGE: integer;
begin
  LockWindowUpdate(ts.Handle);
  _MAXARTPERROW  := ts.Height div 55;
  _MAXARTPERPAGE := ((ts.Width - 100) div 180) * (_MAXARTPERROW+1);

  LastKategorie := Kat;

  if (ArtList.Artikel.Count > 0) then
  begin
    SetTischLabel(ts);
    ClearBestellung;

    mpr := _MAXARTPERROW + 1;
    m   := 0;
    x   := 0;
    y   := 0;
    c   := 0;
    r   := 0;

    if (AbID = 0) then bbNext.Artikel.ID := 0;

    for i := 0 to ArtList.Artikel.Count - 1 do
    begin
      ta := TArtikel(ArtList.Artikel[i]);

      if (ta.Kategorie = Kat) then
      begin
        if (c < _MAXARTPERPAGE) then
        begin
          if (ta.Idx > AbID) then
          begin
            m := ta.Idx;
            l := (x * 205 + ((y - (y mod (mpr))) * (mpr)));
            l := l + 5;
            t := 20 + (y * 45);

            CreateBestellButton(ts,l,t,180,40,ta.Bezeichnung,ta.ID,ta.Preis,Kat,ta.Kombi);
            inc(y);

            if (y > _MAXARTPERROW) then
            begin
              inc(x);
              y := 0;
            end;
            inc(c);
          end;
        end
        else
          inc(r);
      end;
    end;

    bbNext.Parent            := ts;
    bbNext.Left              := ts.Width - 100;
    bbNext.Top               := ts.Top + ts.Height - 70;
    bbNext.Visible           := r > 0;
    bbNext.Artikel.ID        := m;
    bbNext.Artikel.Kategorie := Kat;
    bbNext.Color             := clSilver;
  end;
  LockWindowUpdate(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
const
  ArtAnz = 13;

procedure TfrmfryPos.LoadKombiArtikel(Kat: integer; ts: TTAbSheet; AbID, BisID: integer);
var
  i,c,t,x,r,
  m,y,l,mpr,
  minidx,maxidx: integer;
  ta: TArtikel;
  SortArtList: TArtikelListe;
begin
  LockWindowUpdate(ts.Handle);

  LastKategorie := Kat;
  SetTischLabel(ts);

  mpr := MAXARTPERROW + 1;
  c   := 0;
  r   := 0;
  x   := 0;
  y   := 0;
  m   := 0;

  if (ArtList.Artikel.Count > 0) then
  begin
    if (ts = tsGrundlage) then
    begin
      if (LastKombiItem.Kombi = KombiGrundlage) then ResetLastKombiItem;
      ClearBestellung(tsGrundlage);

      SortArtList := TArtikelListe.Create;
      CopyArtikel(SortArtList,ArtList,KombiGrundlage);
      SortArtList.Artikel.Sort(SortBez);

      for i := 0 to SortArtList.Artikel.Count - 1 do
      begin
        ta := TArtikel(SortArtList.Artikel[i]);
        ta.KombiIdx := i + 1;

        if (ta.Kombi = KombiGrundlage) then
        begin
          if (c < ArtAnz) then
          begin
            if ((ta.KombiIdx > AbID) and ((ta.KombiIdx <= BisID) or (BisID = 0))) then
            begin
              m := ta.KombiIdx;
              if (bbKGNext.VonIdx > m) then bbKGNext.VonIdx := m;

              l := (x * 205 + ((y - (y mod (mpr))) * (mpr)));
              l := l + 5;
              t := 20 + (y * 45);

              CreateBestellButton(ts,l,t,180,40,ta.Bezeichnung,ta.ID,ta.Preis,Kat,ta.Kombi);
              inc(y);

              if (y > 4) then
              begin
                inc(x);
                y := 0;
              end;
              inc(c);
            end;
          end
          else
            inc(r);
        end;
      end;

      if (bbKGNext.VonIdx > 0) then
      begin
        bbKGBack.VonIdx := bbKGNext.VonIdx - ArtAnz;
        bbKGBAck.BisIdx := bbKGBack.VonIdx + ArtAnz;
      end;

      bbKGBack.Visible := bbKGBack.BisIdx >= ArtAnz;

      bbKGNext.Visible := r > 0;
      bbKGNext.VonIdx  := m;
      bbKGNext.Artikel.Kategorie := Kat;

      SortArtList.Free;
    end;

    if (ts = tsZusatz) then
    begin
      if (LastKombiItem.Kombi = KombiZusatz) then ResetLastKombiItem;
      ClearBestellung(tsZusatz);

      SortArtList := TArtikelListe.Create;
      CopyArtikel(SortArtList,ArtList,KombiZusatz);
      SortArtList.Artikel.Sort(SortBez);

      for i := 0 to SortArtList.Artikel.Count - 1 do
      begin
        ta := TArtikel(SortArtList.Artikel[i]);
        ta.KombiIdx := i + 1;

        if (ta.Kombi = KombiZusatz) then
        begin
          if (c < ArtAnz) then
          begin
            if ((ta.KombiIdx > AbID) and ((ta.KombiIdx <= BisID) or (BisID = 0))) then
            begin
              m := ta.KombiIdx;
              if (bbKZNext.VonIdx > m) then bbKZNext.VonIdx := m;

              l := (x * 205 + ((y - (y mod (mpr))) * (mpr)));
              l := l + 5;
              t := 20 + (y * 45);

              CreateBestellButton(ts,l,t,180,40,ta.Bezeichnung,ta.ID,ta.Preis,Kat,ta.Kombi);
              inc(y);

              if (y > 4) then
              begin
                inc(x);
                y := 0;
              end;
              inc(c);
            end;
          end
          else
            inc(r);
        end;
      end;

      if (bbKZNext.VonIdx > 0) then
      begin
        bbKZBack.VonIdx := bbKZNext.VonIdx - ArtAnz;
        bbKZBAck.BisIdx := bbKZBack.VonIdx + ArtAnz;
      end;

      bbKZBack.Visible := bbKZBack.BisIdx >= ArtAnz;

      bbKZNext.Visible := r > 0;
      bbKZNext.VonIdx  := m;
      bbKZNext.Artikel.Kategorie := Kat;

      SortArtList.Free;
    end;
  end;
  LockWindowUpdate(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CreateBestellButton(p: TTabSheet; l,t,w,h: integer;
                                           c: string; ID,Preis,Kategorie,Kombi: integer;
                                           aPageMode: TPageMode);
var
  bb: TBestellButton;
begin
  bb                     := TBestellButton.Create(p);
  bb.Parent              := p;
  bb.Left                := l;
  bb.Top                 := t;
  bb.Width               := w;
  bb.Height              := h;
  bb.Caption             := c;
  bb.Font.Size           := 10;
  bb.Font.Style          := [fsBold];
  bb.WordWrap            := true;
  bb.OnClick             := BestellungAuswahl;
  bb.Pos                 := -1;
  bb.PageMode            := aPageMode;
  bb.Count               := 0;
  bb.Cap                 := c;
  bb.Artikel.ID          := ID;
  bb.Artikel.Bezeichnung := c;
  bb.Artikel.Preis       := Preis;
  bb.Artikel.Kategorie   := Kategorie;
  bb.Artikel.Kombi       := Kombi;

  BestellListe.Add(bb);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetDoubleBuffered;
var
  i: integer;
begin
  DoubleBuffered := true;

  for i := ComponentCount-1 downto 0 do
    if (Components[i] is TWinControl) then
      if not(Components[i] is TListBox) then
        (Components[i] as TWinControl).DoubleBuffered := true;

  stReminder.DoubleBuffered := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ActivatePage(ts: TTabSheet);
begin
  LockWindowUpdate(pcfryPos.Handle);

  pcfryPos.ActivePage := ts;

  if ((ts = tsTisch) or (ts = tsAnmelden)) then
  begin
    if (ts = tsAnmelden) then
    begin
      AktTisch := 0;
      AktPers  := 0;

      ClearStatusBar(1);
      jvsb.Panels[0].Text := CopyRightString;
    end;

    if (ts = tsTisch) then
    begin
      jvsb.Panels[4].Text := '';
      btnUmsetzen.Enabled := OffeneBestellungen;
    end;

    UpdateTischSumme;
    Bestellung.Clear;
  end
  else if (ts = tsBestellung) then
  begin
    btnOK.Enabled     := lbTischBestellungNeu.Items.Count > 0;
    btnStorno.Enabled := ((btnOK.Enabled) or (lbTischBestellungOffen.Items.Count > 0));
    SetActiveOrderMode(0);
  end
  else
  begin
    pcChef.ActivePage := tsAbrechnen;
  end;

  //rabatt immer zurücksetzen, ausser bei tisch 0 (personalbestellung)
  if (AktTisch > 0) then
  begin
    AktRabatt  := -1;
    HausRabatt := 0;
  end;
  
  pcfryPos.OnChange(Self);

  LockWindowUpdate(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.UpdateTischSumme;
var
  q: TDBQuery;
  i: integer;
begin
  if (assigned(TischList)) then
    for i := 0 to TischList.Tische.Count-1 do
      TischList.Items[i].Header := '';

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select tbl,sum(prs) from bestellung where tbl > 0 and sta = 0 and sto = 0 group by tbl';
    q.StartTransAction;
    q.DBSql.Open;

    while not (q.DBSql.Eof) do
    begin
      TischList.Tisch[q.DBSql.Fields[0].AsInteger].Header := MakePreis(q.DBSql.Fields[1].AsInteger,false);
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PersonalAuswahl(Sender: TObject);
var
  p,t: integer;
begin
  t := (Sender as TJvThumbImage).Tag;
  p := PersonalLogIn(t);

  if (p > 0) then
  begin
    ResetOrder := false;
    AktPers := p;
    jvsb.Panels[1].Text := PersonalListe.Values[inttostr(AktPers)];

    SetAngemeldet(t,true);

    LoadPic(Sender as TJvThumbImage,'personal_aktiv.jpg');
    ActivatePage(tsTisch);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiTischBackClick(Sender: TObject);
begin
  ActivatePage(tsAnmelden);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiChefClick(Sender: TObject);
begin
  CheckChefMode;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CheckChefMode;
var
  ps: string;
  ok: boolean;
begin
  ok := strtointdef(GetCFG('CHEF'),0) = 1;

  if not(ok) then
  begin
    ps := '';
    InputQuery(StrCheftaste,StrPasswort,ps);
    ok := lowercase(ps) = lowercase(GetCFG('CHEFPW'));
  end;

  if (ok) then
  begin
    tiChef.Visible := strtointdef(GetCFG('CHEF'),0) = 1;
    ActivatePage(tsChef);
    pcChef.OnChange(Self);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetCFG(IID: integer; Tag, Val: string);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('execute procedure upd_cfg(%d,''%s'',''%s'')', [IID, Tag, Val]);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.TischAuswahl(Sender, Tisch: TObject);
var
  t: TTisch;
begin
  t := TTisch(Tisch);

  if (t.LayOutTisch) then
  begin
    if (cbEditLayout.Checked) then
    begin
      DoSoftKey;
      frmEditLayout := TfrmEditLayout.Create(nil);
      frmEditLayout.edH.Text := IntToStr(t.Height);
      frmEditLayout.edB.Text := IntToStr(t.Width);
      frmEditLayout.edI.Text := t.Footer;
      frmEditLayout.ShowModal;

      t.Height := StrToInt(frmEditLayout.edH.Text);
      t.Width  := strtoint(frmEditLayout.edB.Text);
      t.Footer := frmEditLayout.edI.Text;

      frmEditLayout.Release;
      UpdateTischValues(t);

      if (TischLayout = LayoutToEdit) then
      begin
        TischList.Tisch[t.TischID].X      := t.X;
        TischList.Tisch[t.TischID].Y      := t.Y;
        TischList.Tisch[t.TischID].Height := t.Height;
        TischList.Tisch[t.TischID].Width  := t.Width;
        TischList.Tisch[t.TischID].Footer := t.Footer;
      end;
    end
    else
    begin
      if assigned(MoveTisch) then
      begin
        if (t.TischID = MoveTisch.TischID) then MoveTisch := nil
        else                                    MoveTisch := t;
      end
      else
        MoveTisch := t;
    end;
  end
  else if (t.Umsetzen) then
  begin
    if (VonTisch = 0) then
    begin
      VonTisch := t.TischID;
      t.Von    := VonTisch;
      t.Nach   := VonTisch;
      t.Color  := clMoneyGreen;
    end
    else
    begin
      if (VonTisch <> t.TischID) then
      begin
        NachTisch := t.TischID;
        t.Nach    := NachTisch;
        t.Von     := VonTisch;
        t.Color   := clMoneyGreen;
        t.Header  := 'Umgesetzt';
        t.Footer  := 'von Tisch ' + inttostr(VonTisch);

        VonNachTisch.Add(format('%d=%d',[VonTisch,NachTisch]));
      end;

      VonTisch  := 0;
      NachTisch := 0;
    end;
  end
  else
  begin
    if (ResetOrder) then
    begin
      ResetOrder := false;
      btnResetOrder.Color := clSilver;
      SetTischStatus(TischList,t.TischID,true);
      ActivatePage(tsAnmelden);
    end
    else
    begin
      StornoAktiv     := false;
      btnStorno.Color := clSilver;

      AktTisch            := t.TischID;
      jvsb.Panels[2].Text := inttostr(AktTisch);

      lbTischBestellungOffen.Clear;
      LoadOffeneBestelllung(AktTisch);

      ClearBestellListe;
      lbTisch.Caption := StrTisch + inttostr(AktTisch);

      LoadArtikel(_BIER,tsBier);

      cbSplit.Checked     := t.EinzelAbrechnung;
      cbBewirtung.Checked := false;

      ActivatePage(tsBestellung);
      pcBestellung.ActivePage := tsBier;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.PersonalLogin(ID: integer): integer;
var
  q: TDBQuery;
  t: integer;
begin
  result := 0;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select per       ' +
                               '  from anmeldung ' +
                               ' where id  = %d  ' +
                               '   and sta = 1   ',[ID]);

    q.StartTransAction;
    q.DBSql.Open;

    result := q.DBSql.Fields[0].AsInteger;

    q.DBSql.Close;
    q.Commit;

    if (result = 0) then
    begin
      result := GetPersonal(t,1);

      if (result > 0) then
      begin
        q.DBSql.Sql.Text := format('insert into anmeldung(id,per,sta) values(%d,%d,%d)',[ID,result,1]);
        q.StartTransAction;
        q.DBSql.ExecSQL;
        q.DBSql.Close;
        q.Commit;
      end;
    end;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetPersonal(var BID: integer; Mode: integer): integer;
var
  q: TDBQuery;
  i,x,y,w: integer;
  f: TForm;
  b: TButton;
  n,v: string;
  sl: TStringList;
  PersonalVorhanden: boolean;
begin
  result := 0;
  bid    := 0;

  if (GlobalDB.GDB.Connected) then
  begin
    f  := TForm.Create(nil);
    sl := TStringList.Create;

    if (Mode = 1) then f.Caption := StrPersonalAnmelden
    else               f.Caption := StrPersonalAbmelden;

    f.Position    := poOwnerFormCenter;
    f.BorderStyle := bsDialog;
    f.Height      := 325;

    x := 0;
    y := 0;
    w := 0;

    q := TDBQuery.Create;

    if (Mode = 0) then
    begin
      q.DBSql.Sql.Text := 'select distinct personal.nummer,personal.name,personal.vorname,anmeldung.id ' +
                          '  from anmeldung ' +
                          '  left join personal on personal.nummer = anmeldung.per ' +
                          ' where anmeldung.sta  = 1 ' +
                          '   and personal.aktiv = 1 ' +
                          ' order by personal.name collate de_de, personal.vorname collate de_de';
    end
    else
    begin
      q.DBSql.Sql.Text := 'select distinct personal.nummer,personal.name,personal.vorname ' +
                          '  from personal ' +
                          '  left join anmeldung on anmeldung.per = personal.nummer ' +
                          ' where personal.aktiv = 1 ' +
                          '   and personal.nummer not in (select per from anmeldung where sta = 1) ' +
                          ' order by personal.name collate de_de, personal.vorname collate de_de';
    end;

    q.StartTransAction;
    q.DBSql.Open;

    PersonalVorhanden := not(q.DBSql.Eof);

    while not(q.DBSql.Eof) do
    begin
      i   := q.DBSql.Fields[0].AsInteger;
      n   := trim(q.DBSql.Fields[1].AsString);
      v   := trim(q.DBSql.Fields[2].AsString);

      //beim abmelden sammeln
      if (Mode = 0) then
        sl.Add(inttostr(i) + '=' + q.DBSql.Fields[3].AsString);

      b             := TButton.Create(f);
      b.Parent      := f;
      b.Width       := 150;
      b.Height      := 40;
      b.Top         := y * 40  + (y*10);
      b.Left        := x * 150 + (x*10);

      if (b.Left = 0) then b.Left := 3;

      b.Caption     := n + ' ' + v;
      b.ModalResult := i + 1000;

      inc(y);
      inc(w);

      if (y > 5) then
      begin
        inc(x);
        y := 0;
        w := 0;
      end;

      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    if (PersonalVorhanden) then
    begin
      if (w = 0) then dec(x,1);
      f.Width := ((x+1) * 160);
      f.ShowModal;

      if (f.ModalResult > 1000) then
      begin
        result := f.ModalResult - 1000;

        //nur beim abmelden
        bid := strtointdef(sl.Values[inttostr(result)],0);
      end;
    end
    else
    begin
      if (PersonalListe.Count > 0) then ErrorMsg(StrDasKomplettePerson)
      else                              ErrorMsg(StrKeinPersonalGefund);
    end;
    f.Release;
    sl.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  tiChef.Visible := ((Key = VK_CONTROL) and (pcfryPos.ActivePage = tsAnmelden));

  if (Key = VK_DELETE) then
  begin
    if (pcChef.ActivePage = tsTischLayOut) then
    begin
      DelTischFromLayout;
      Key := 0;
    end;
  end
  else if (Key = VK_INSERT) then
  begin
    if (pcChef.ActivePage = tsTischLayOut) then
    begin
      AddTischToLayout;
      Key := 0;
    end;
  end;

  if (Key <> 0) then inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  tiChef.Visible := false;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SaveTische(Tische: TTischListe; ID: integer);
var
  q: TDBQuery;
  t: TTisch;
  i: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;

    for i := 0 to Tische.Tische.Count-1 do
    begin
      t := Tische.Tische[i];

      if not(t.Deleted) then
      begin
        q.DBSql.Sql.Text := format('insert into tischex(rid,num,pox,poy,wit,hei) ' +
                                   '             values(%d,%d,%d,%d,%d,%d)',
                                   [id,t.TischID,t.x,t.y,80,80]);
        q.StartTransAction;
        q.DBSql.ExecSQL;
      end;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiBierClick(Sender: TObject);
begin
  LoadArtikel(_BIER,tsBier);
  pcBestellung.ActivePage := tsBier;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiAFGClick(Sender: TObject);
begin
  LoadArtikel(_AFG,tsAFG);
  pcBestellung.ActivePage := tsAFG;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiKaffeeClick(Sender: TObject);
begin
  LoadArtikel(_KAFFEE,tsKaffee);
  pcBestellung.ActivePage := tsKaffee;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tiCocktailsClick(Sender: TObject);
begin
  LoadArtikel(_COCKTAILS,tsCocktails);
  pcBestellung.ActivePage := tsCocktails;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.BestellungAuswahl(Sender: TObject);
var
  tbb: TBestellButton;
  bi: TBestellItem;
  RabattPreis: integer;
begin
  SetActiveOrderMode(0);

  tbb := Sender as TBestellButton;

  if (tbb.PageMode = pmDefault) then
  begin
    if ((tbb.Artikel.Kombi > 0) and (pcBestellung.ActivePage = tsLoKo)) then
    begin
      if (LastKombiItem.ArtID < 0) then
      begin
        inc(tbb.Count);
        tbb.Font.Color := clGreen;
        tbb.Caption    := inttostr(tbb.Count) + ' x ' + #10#13 + tbb.Cap;

        LastKombiItem.ArtID := tbb.Artikel.ID;
        LastKombiItem.Bez   := tbb.Artikel.Bezeichnung;
        LastKombiItem.Preis := tbb.Artikel.Preis;
        LastKombiItem.Kombi := tbb.Artikel.Kombi;
        LastKombiItem.Color := tbb.Color;
        LastKombiItem.Aktiv := integer(tbb);

        tbb.Color := clMoneyGreen;
      end
      else if (LastKombiItem.ArtID = tbb.Artikel.ID) then
      begin
        dec(tbb.Count);

        if (tbb.Count > 0) then tbb.Caption := inttostr(tbb.Count) + ' x ' + #10#13 + tbb.Cap
        else
        begin
          tbb.Caption := tbb.Cap;
          tbb.Font.Color := clBlack;
        end;

        LastKombiItem.ArtID := -1;
        LastKombiItem.Bez   := '';
        LastKombiItem.Preis := -1;
        LastKombiItem.Kombi := 0;
        LastKombiItem.Aktiv := 0;

        tbb.Color := LastKombiItem.Color;
      end
      else
      begin
        if (tbb.Artikel.Kombi <> LastKombiItem.Kombi) then
        begin
          inc(tbb.Count);
          tbb.Font.Color := clGreen;
          tbb.Caption := inttostr(tbb.Count) + ' x ' + #10#13 + tbb.Cap;

          bi           := TBestellItem.Create;
          bi.Preis     := tbb.Artikel.Preis + LastKombiItem.Preis;
          bi.Rabatt    := AktRabatt;
          bi.Kategorie := _LOKO;
          bi.Printed   := false;
          bi.HausRabatt:= HausRabatt;

          if (tbb.Artikel.Kombi = KombiZusatz) then
          begin
            bi.KombiBez   := LastKombiItem.Bez + ' mit ' + tbb.Artikel.Bezeichnung;
            bi.ArtID      := LastKombiItem.ArtID;
            bi.KombiArtid := tbb.Artikel.ID;
          end
          else
          begin
            bi.KombiBez   := tbb.Artikel.Bezeichnung + ' mit ' + LastKombiItem.Bez;
            bi.ArtID      := tbb.Artikel.ID;
            bi.KombiArtid := LastKombiItem.ArtID;
          end;

          TBestellButton(LastKombiItem.Aktiv).Color := LastKombiItem.Color;
          LastKombiItem.ArtID := -1;
          LastKombiItem.Bez   := '';
          LastKombiItem.Preis := -1;
          LastKombiItem.Kombi := 0;
          LastKombiItem.Aktiv := 0;

          lbTischBestellungNeu.Items.AddObject(bi.KombiBez + '=' +
                                               MakePreis(bi.Preis,true),
                                               pointer(bi));

          if (lbTischBestellungNeu.Items.Count > 1) then
            lbTischBestellungNeu.Items.Move(lbTischBestellungNeu.Items.Count-1,0);

          btnOK.Enabled       := lbTischBestellungNeu.Items.Count > 0;
          btnStorno.Enabled   := btnOK.Enabled;

          RabattPreis := CommercialRound((bi.Preis * (100.0 - bi.HausRabatt)) / 100.0);
          jvsb.Panels[4].Text := MakePreis(RabattPreis + StripStr2Num(jvsb.Panels[4].Text),false);

          //rabatte zurücksetzen
          if (AktTisch > 0) then
          begin
            AktRabatt  := -1;
            HausRabatt := 0;
          end;
        end;
      end;
    end
    else
    begin
      inc(tbb.Count);
      tbb.Font.Color := clGreen;
      tbb.Caption    := inttostr(tbb.Count) + ' x ' + #10#13 + tbb.Cap;

      bi            := TBestellItem.Create;
      bi.ArtID      := tbb.Artikel.ID;
      bi.Preis      := tbb.Artikel.Preis;
      bi.Rabatt     := AktRabatt;
      bi.KombiArtid := 0;
      bi.Kategorie  := tbb.Artikel.Kategorie;
      bi.Printed    := false;
      bi.HausRabatt := HausRabatt;

      lbTischBestellungNeu.Items.AddObject(tbb.Artikel.Bezeichnung + '=' +
                                           MakePreis(tbb.Artikel.Preis,true),
                                           pointer(bi));

      if (lbTischBestellungNeu.Items.Count > 1) then
        lbTischBestellungNeu.Items.Move(lbTischBestellungNeu.Items.Count-1,0);

      btnOK.Enabled       := lbTischBestellungNeu.Items.Count > 0;
      btnStorno.Enabled   := btnOK.Enabled;

      RabattPreis := CommercialRound((bi.Preis * (100.0 - bi.HausRabatt)) / 100.0);
      jvsb.Panels[4].Text := MakePreis(RabattPreis + StripStr2Num(jvsb.Panels[4].Text),false);

      if (AktTisch > 0) then
      begin
        AktRabatt := -1;
        HausRabatt := 0;
      end;
    end;
  end
  else if (tbb.PageMode = pmNext) then
  begin
    StornoAktiv      := false;
    btnStorno.Color  := clSilver;

    if (pcBestellung.ActivePage = tsLoKo) then
    begin
      if (tbb = bbKGNext) then
      begin
        if (LastKombiItem.Kombi = bbKGNext.Artikel.Kombi) then ResetLastKombiItem;
        LoadKombiArtikel(2,TTabSheet(tbb.Parent),bbKGNext.VonIdx,0);
      end
      else if (tbb = bbKZNext) then
      begin
        if (LastKombiItem.Kombi = bbKZNext.Artikel.Kombi) then ResetLastKombiItem;
        LoadKombiArtikel(2,TTabSheet(tbb.Parent),bbKZNext.VonIdx,0);
      end;
    end
    else
      LoadArtikel(tbb.Artikel.Kategorie,TTabSheet(tbb.Parent),tbb.Artikel.ID);
  end
  else if (tbb.PageMode = pmBack) then
  begin
    StornoAktiv      := false;
    btnStorno.Color  := clSilver;

    if (pcBestellung.ActivePage = tsLoKo) then
    begin
      if (tbb = bbKGBack) then
      begin
        if (LastKombiItem.Kombi = bbKGBack.Artikel.Kombi) then ResetLastKombiItem;
        LoadKombiArtikel(2,TTabSheet(tbb.Parent),bbKGBack.VonIdx,bbKGBack.BisIdx);
      end
      else if (tbb = bbKZBack) then
      begin
        if (LastKombiItem.Kombi = bbKZBack.Artikel.Kombi) then ResetLastKombiItem;
        LoadKombiArtikel(2,TTabSheet(tbb.Parent),bbKZBack.VonIdx,bbKZBack.BisIdx);
      end;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TBestellButton }
constructor TBestellButton.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  Artikel := TArtikel.Create;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TBestellButton.Destroy;
begin
  Artikel.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischBestellungNeuDrawItem(Control: TWinControl; Index: Integer;
                                                    Rect: TRect; State: TOwnerDrawState);
var
  aLeft,aRight,
  RabattPreis: integer;
  b,p,s: string;
  bi: TBestellItem;
begin
  with (Control as TListBox) do
  begin
    bi := TBestellItem(Items.Objects[Index]);

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

    Canvas.Font.Style := [fsBold];
    Canvas.TextOut(aLeft,Rect.Top,b);
    Canvas.Font.Style := [];

    case bi.Rabatt of
      -1: Canvas.TextOut(aLeft,Rect.Top+13,StrRegulaer);
       0:
       begin
         Canvas.TextOut(aLeft,Rect.Top+13,StrHausrabatt);
         RabattPreis := CommercialRound((bi.Preis * (100.0 - bi.HausRabatt)) / 100.0);
         p := MakePreis(RabattPreis);
       end;
       1:
       begin
         Canvas.TextOut(aLeft,Rect.Top+13,StrFrei);
         p := MakePreis(0);
       end;
       2:
       begin
         Canvas.TextOut(aLeft,Rect.Top+13,'Personalbestellung');
         p := MakePreis(0);
       end;
    end;

    aRight := Rect.Right - Rect.Left - Canvas.TextWidth(p) - 3;
    Canvas.TextOut(aRight,Rect.Top + 13,p);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadPic(ti: TJvThumbImage; Pic: string);
var
  p: string;
begin
  p := AppPath + 'img\' + Pic;
  if (FileExists(p)) then ti.Picture.LoadFromFile(p)
  else if (FileExists(pic)) then ti.Picture.LoadFromFile(pic);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.pcBestellungChange(Sender: TObject);
begin
  StornoAktiv     := false;
  btnStorno.Color := clSilver;
  SetActiveOrderMode(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischBestellungNeuClick(Sender: TObject);
var
  p: integer;
  bi: TBestellItem;
begin
  if (StornoAktiv) then
  begin
    if (lbTischBestellungNeu.ItemIndex <> -1) then
    begin
      bi := TBestellItem(lbTischBestellungNeu.Items.Objects[lbTischBestellungNeu.ItemIndex]);
      p  := CommercialRound((bi.Preis * (100.0 - bi.HausRabatt)) / 100.0);
      
      jvsb.Panels[4].Text := MakePreis(StripStr2Num(jvsb.Panels[4].Text)-p,false);
      TBestellItem(lbTischBestellungNeu.Items.Objects[lbTischBestellungNeu.ItemIndex]).Free;
      lbTischBestellungNeu.Items.Delete(lbTischBestellungNeu.ItemIndex);
    end;
  end;

  btnOK.Enabled     := lbTischBestellungNeu.Items.Count > 0;
  btnStorno.Enabled := btnOK.Enabled;

  if ((StornoAktiv) and not(btnStorno.Enabled)) then
    btnStorno.Color := clSilver;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnOKClick(Sender: TObject);
var
  q: TDBQuery;
  MaxBes,i: integer;
  bi: TBestellItem;
  sl: TStringList;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;

    q.DBSql.Sql.Text := format('select max(bes) from bestellung where tbl = %d and sta = 0',[AktTisch]);
    q.StartTransAction;
    q.DBSql.Open;

    MaxBes := q.DBSql.Fields[0].AsInteger + 1;

    q.DBSql.Close;
    q.Commit;

    if  (lbTischBestellungNeu.Items.Count > 0) then
    begin
      q.StartTransAction;

      for i := 0 to lbTischBestellungNeu.Items.Count-1 do
      begin
        bi := TBestellItem(lbTischBestellungNeu.Items.Objects[i]);

        if (bi.KombiArtid > 0) then
        begin
          q.DBSql.Sql.Text := format('insert into bestellung(PID,TBL,AID,DAT,STA,BES,RAB,PRS,LOK) ' +
                                                    ' values(%d,%d,%d,%d,%d,%d,%d,%d,''%s'')',
                                     [AktPers,AktTisch,0,DatAsInt,0,
                                      MaxBes,bi.Rabatt+1,bi.Preis,bi.KombiBez]);
          q.DBSql.ExecSQL;
        end
        else
        begin
          q.DBSql.Sql.Text := format('insert into bestellung(PID,TBL,AID,DAT,STA,BES,RAB) values(%d,%d,%d,%d,%d,%d,%d)',
                                     [AktPers,AktTisch,bi.ArtID,DatAsInt,0,MaxBes,bi.Rabatt+1]);
          q.DBSql.ExecSQL;
        end;
      end;

      q.DBSql.Close;
      q.Commit;
    end;
    q.Free;
  end;

  if (AktTisch > 0) then
  begin
    if (BonSplit <> '') then
    begin
      sl := TStringList.Create;
      sl.CommaText := BonSplit;

      for i := 0 to sl.Count-1 do
        PrintBestellung(StrToInt(sl[i]));

      sl.Free;
    end;

    PrintBestellung(0);
    SetTischStatus(TischList,AktTisch,true);
    TischList.Tisch[AktTisch].Header := '';
  end;

  ActivatePage(tsAnmelden);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PrintBestellung(PrintKat: integer);
var
  c,i,p,idx,id: integer;
  s,a: string;
  sl,PrintList: TStringList;
  bi: TBestellItem;
  HashValue: THashValue;
begin
  sl        := nil;
  PrintList := nil;
  PrintStream.Clear;

  try
    sl        := TSTringList.Create;
    PrintList := TSTringList.Create;

    for i := 0 to lbTischBestellungNeu.Items.Count-1 do
    begin
      bi := TBestellItem(lbTischBestellungNeu.Items.Objects[i]);

      if ((not bi.Printed) and ((bi.Kategorie = PrintKat) or (PrintKat = 0))) then
      begin
        { DDBC
        if (bi.KombiArtid > 0) then
          HashValue := TextHash(IntToStr(bi.Artid) + '-' + IntToStr(bi.KombiArtid))
        else
          HashValue := TextHash(IntToStr(bi.Artid) + '-' + IntToStr(bi.Artid));
        }
        s  := lbTischBestellungNeu.Items[i];
        a  := copy(s,1,pos('=',s)-1);
        p  := StripStr2Num(copy(s,pos('=',s)+1,length(s)));

        idx := sl.IndexOfObject(pointer(HashValue));

        if (idx <> -1) then
        begin
          id := StripStr2Num(copy(sl[idx],pos('=',s)+1,length(sl[idx])));
          inc(p,id);

          c := StripStr2Num(copy(sl[idx],1,pos('x',sl[idx])-1));
          inc(c,1);

          sl[idx] := inttostr(c) + ' x ' + a + '=' + inttostr(p);
        end
        else
          sl.AddObject('1 x ' + a + '=' + inttostr(p),pointer(HashValue));

        bi.Printed := true;
      end;
    end;

    if (sl.Count > 0) then
    begin
      sl.Sorted := true;

      PrintList.Add(char($1D) + char($21) + char($01));

      s := char($1B) + chr($4D) + '0';
      PrintList.Add(s);

      //center
      s := char($1B) + chr($61) + '1';
      PrintList.Add(s);

      s := StrBestellungUm + formatdatetime('hh:mm:nn',now);
      PrintList.Add(s);
      PrintList.Add(PersonalListe.Values[inttostr(AktPers)]);
      PrintList.Add('');

      s := format('Tisch %2.2d',[AktTisch]);
      PrintList.Add(s);

      //links
      s := char($1B) + chr($61)+ '0';
      PrintList.Add(s);

      for i := 0 to sl.Count-1 do
      begin
        a  := copy(sl[i],1,pos('=',sl[i])-1);
        s  := MakePreis(StripStr2Num(copy(sl[i],pos('=',sl[i])+1,length(sl[i]))),true);

        PrintList.Add(a);
        PrintList.Add('');
      end;

      for i := 1 to 5 do PrintList.Add('');

      //cut
      s := char($1D) + chr($56) + '1';

      PrintList.Add(s);

      TranslateChars(PrintList);
      PrintList.SaveToStream(PrintStream);
      GenericPrint;
    end;
  finally
    if assigned(sl) then sl.Free;
    if assigned(PrintList) then PrintList.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadOffeneBestelllung(Tisch: integer);
var
  q: TDBQuery;
  g: integer;
  lb,mb,bez: string;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    lbTischBestellungOffen.Clear;

    g  := 0;
    lb := '';
    mb := '';

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format(' select distinct aid,bezeichnung,prs,count(*),max(tim),max(bes),lok' +
                               '   from bestellung ' +
                               '   join artikel on id = aid ' +
                               '  where tbl = %d ' +
                               '    and sta = 0 ' +
                               '    and sto = 0 ' +
                               '  group by aid,bezeichnung,prs,lok order by 6',[Tisch]);
    q.StartTransAction;
    q.DBSql.Open;

    btnAbrechnen.Enabled := not(q.DBSql.eof);
    cbSplit.Enabled      := btnAbrechnen.Enabled;
    cbBewirtung.Enabled  := btnAbrechnen.Enabled;

    while not(q.DBSql.Eof) do
    begin
      if (Trim(q.DBSql.FieldByName('LOK').AsString) <> '') then
        bez := Trim(q.DBSql.FieldByName('LOK').AsString)
      else
        bez := Trim(q.DBSql.FieldByName('BEZEICHNUNG').AsString);

      g  := g + (q.DBSql.Fields[2].AsInteger * q.DBSql.Fields[3].AsInteger);
      lb := q.DBSql.Fields[4].AsString;
      mb := q.DBSql.Fields[5].AsString;

      lbTischBestellungOffen.Items.AddObject((q.DBSql.Fields[3].AsString) + ' x ' +
                                              bez + '=' +
                                              MakePreis(q.DBSql.Fields[2].AsInteger *
                                                        q.DBSql.Fields[3].AsInteger,true),
                                              pointer(q.DBSql.Fields[0].AsInteger));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    jvsb.Panels[3].Text := MakePreis(g,false);
    jvsb.Panels[5].Text := mb;
    jvsb.Panels[6].Text := copy(lb,pos(' ',lb)+1,length(lb));
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischBestellungOffenDrawItem(Control: TWinControl; Index: Integer;
                                                      Rect: TRect; State: TOwnerDrawState);
var
  aLeft: integer;
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
    s := copy(s,pos('=',s)+1,length(s));

    p := copy(s,1,pos('=',s)-1);
    s := copy(s,pos('=',s)+1,length(s));

    aLeft   := Rect.Left + 2;

    Canvas.Font.Style := [fsBold];
    Canvas.TextOut(aLeft,Rect.Top,b);
    Canvas.Font.Style := [];
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadPersonal;
var
  q: TDBQuery;
begin
  PersonalListe.Clear;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select nummer,vorname,name,aktiv ' +
                        '  from personal ' +
                        ' order by nummer';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      PersonalListe.AddObject(q.DBSql.Fields[0].AsString + '=' +
                              q.DBSql.Fields[1].AsString + ' ' + q.DBSql.Fields[2].AsString,
                              pointer(q.DBSql.Fields[3].AsInteger));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadKategorie;
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select bezeichnung,kategorie ' +
                        '  from kategorie ' +
                        ' where aktiv = 1 ' +
                        ' order by kategorie';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      chklstBonSplit.AddItem(q.DBSql.Fields[0].AsString,pointer(q.DBSql.Fields[1].AsInteger));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnAnmeldungClick(Sender: TObject);
begin
  ActivatePage(tsAnmelden);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnTischAuswahlClick(Sender: TObject);
begin
  ActivatePage(tsTisch);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.pcfryPosChange(Sender: TObject);
begin
  btnPersAbrechnen.Visible:= pcfryPos.ActivePage = tsAnmelden;
  btnExit.Visible         := pcfryPos.ActivePage = tsAnmelden;
  btnKeyboard.Visible     := pcfryPos.ActivePage = tsAnmelden;

  btnAnmeldung.Visible    := ((pcfryPos.ActivePage = tsTisch) or
                              (pcfryPos.ActivePage = tsBestellung));

  btnTischAuswahl.Visible := pcfryPos.ActivePage = tsBestellung;
  btnRabatt.Visible       := pcfryPos.ActivePage = tsBestellung;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnAbrechnenClick(Sender: TObject);
var
  s: string;
begin
  Personen := '';
  PrintStream.Clear;

  if (AktTisch = strtointdef(GetCFG('THEKE'),1)) then s := StrTheke
  else                                                s := StrTisch;

  if (JaNein(format('%s %d abrechnen?',[s,AktTisch]))) then
  begin
    if (cbBewirtung.Checked) then
    begin
      DoSoftKey;
      InputQuery('Bewirtungsbeleg','Personenanzahl',Personen);
    end;

    Abrechnen(cbSplit.Checked);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnPersChangeClick(Sender: TObject);
begin
  ChangePersonal;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetAnmeldeTisch(TischTag: integer): TJvThumbImage;
var
  i: integer;
begin
  result := nil;

  for i := ComponentCount-1 downto 0 do
  begin
    if (Components[i] is TJvThumbImage) then
    begin
      if ((Components[i] as TJvThumbImage).Tag = TischTag) then
      begin
        result := Components[i] as TJvThumbImage;
        break;
      end;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.jvsbDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  c: integer;
  s: string;
begin
  Statusbar.Canvas.FillRect(Rect);

  Statusbar.Canvas.Font.Size  := 7;
  Statusbar.Canvas.Font.Style := [fsBold];

  if (Panel.Index = 0) then
  begin
    s := 'Ver. ' + GetFileVersion + '/' + inttostr(DBVERS);
    c := ((Rect.Right - Rect.Left) - (StatusBar.Canvas.TextWidth(s))) div 2;
    Statusbar.Canvas.TextOut(Rect.Left+c,Rect.Top,s);
  end
  else
  begin
    if (Panel.Index < 7) then
    begin
      c := ((Rect.Right - Rect.Left) - (StatusBar.Canvas.TextWidth(_SBT[Panel.Index]))) div 2;
      Statusbar.Canvas.TextOut(Rect.Left+c,Rect.Top,_SBT[Panel.Index]);
    end;
  end;

  if (Panel.Index < 7) then
  begin
    Statusbar.Canvas.Font.Size := 7;
    c := ((Rect.Right - Rect.Left) - (StatusBar.Canvas.TextWidth(Panel.Text))) div 2;
    Statusbar.Canvas.TextOut(Rect.Left+c,Rect.Top + 13,Panel.Text);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CheckPersonal;
var
  q: TDBQuery;
  c: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;

    q.DBSql.Sql.Text := 'select count(*) from anmeldung where sta = 1';
    q.StartTransAction;
    q.DBSql.Open;

    c := q.DBSql.Fields[0].AsInteger;

    q.DBSql.Close;
    q.Commit;

    if (c > 0) then
    begin
      if (JaNein(StrNochAngemeldetesPe)) then
      begin
        q.DBSql.Sql.Text := 'update anmeldung set edz = ''now'', sta = 0 where sta = 1';
        q.StartTransAction;
        q.DBSql.ExecSQL;
        q.DBSql.Close;
        q.Commit;

        jvsb.Panels[1].Text := '';
        SetPersonalButton(true);
      end;
    end;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CheckTische;
var
  q: TDBQuery;
  c: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;

    q.DBSql.Sql.Text := 'select count(*) from bestellung where sta = 0';
    q.StartTransAction;
    q.DBSql.Open;

    c := q.DBSql.Fields[0].AsInteger;

    q.DBSql.Close;
    q.Commit;

    if (c > 0) then
    begin
      if (JaNein(StrEsGibtNichtAbgere)) then
      begin
        q.DBSql.Sql.Text := 'update bestellung set sta = 1 where sta = 0';
        q.StartTransAction;
        q.DBSql.ExecSQL;
        q.DBSql.Close;
        q.Commit;

        //alle tische zurücksetzen
        TischList.SetLast(0);
        SetTischStatus(TischList,-1,true);
      end;
    end;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.Abrechnen(Einzel: boolean);
begin
  if (TischList.Tisch[AktTisch] <> nil) then
  begin
    if (Einzel) then AbrechnenEinzel
    else             AbrechnenGesamt;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.AbrechnenEinzel;
var
  q: TDBQuery;
  rab,UpdIID: string;
  Bestellung,PrintList: TStringList;
  ai: TAbrechnungItem;
  i,Summe,Betrag,
  Menge,mwstvali,
  mwstwert: integer;
  Artikel,Left,
  Right,Line,mwstval: string;
  mwst: TStringList;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    Summe := 0;
    Bestellung := TStringList.Create;
    PrintList  := TStringList.Create;
    mwst       := TStringList.Create;

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format(' select iid,bezeichnung,prs,rab,mwst,lok ' +
                               '   from bestellung ' +
                               '   join artikel on artikel.id = bestellung.aid ' +
                               '  where bestellung.tbl = %d ' +
                               '    and bestellung.sta = 0  ' +
                               '    and bestellung.sto = 0  ' +
                               '  order by bezeichnung',[AktTisch]);
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      case q.DBSql.Fields[3].AsInteger of
        1: rab := StrHausrabatt;
        2: rab := StrFrei;
      end;

      ai     := TAbrechnungItem.Create;
      ai.IID := q.DBSql.Fields[0].AsInteger;

      if (Trim(q.DBSql.FieldByName('LOK').AsString) <> '') then
        ai.Art := Trim(q.DBSql.FieldByName('LOK').AsString)
      else
        ai.Art := Trim(q.DBSql.FieldByName('BEZEICHNUNG').AsString);

      ai.Bez    := ai.Art + '=' + MakePreis(q.DBSql.Fields[2].AsInteger);
      ai.Preis  := q.DBSql.Fields[2].AsInteger;
      ai.Mwst   := q.DBSql.Fields[4].AsInteger;
      ai.Marked := false;

      Bestellung.AddObject(ai.Bez,pointer(ai));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;

    frmEinzelAbrechnung            := TfrmEinzelAbrechnung.Create(nil);
    frmEinzelAbrechnung.Bestellung := Bestellung;
    frmEinzelAbrechnung.ShowModal;
    frmEinzelAbrechnung.Release;

    UpdIID := '';

    for i := 0 to Bestellung.Count-1 do
    begin
      ai := TAbrechnungItem(Bestellung.Objects[i]);

      if (ai.Marked) then
      begin
        UpdIID := UpdIID + inttostr(ai.IID) + ',';

        Artikel := ai.Art;
        Betrag  := ai.Preis;
        Menge   := 1;
        Summe   := Summe + Betrag;

        Left  := Artikel;
        Right := format('%d  x  %s EUR',[Menge,MakePreis(Betrag,false)]);
        Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
        PrintList.Add(Line);

        mwstval := IntToStr(ai.Mwst);
        if (mwst.Values[mwstval] = '') then mwst.Add(mwstval + '=' + IntToStr(Betrag))
        else                                mwst.Values[mwstval] := IntToStr((strtoint(mwst.Values[mwstval]) + Betrag));

        if (EinzelMWST) then
        begin
          Left  := 'Summe inkl. ' + FormatFloat('0.#0',(ai.Mwst - 10000.0) / 100.0) + '% Mwst.';
          Right := FormatFloat('0.#0', (Betrag - (Betrag * 10000.0 / ai.Mwst)) / 100.0) + ' EUR';

          Left  := Left + ' ( ' + Right + ' ) ';
          Right := format('%s EUR',[MakePreis(Betrag,false)]);

          Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
          PrintList.Add(Line);

          Line  := format('%s%*.*s%s',['----------', MaxChars - 20,0,' ','----------']);
          PrintList.Add(Line);
        end;
      end;
    end;

    if (PrintList.Count > 0) then
    begin
      PrintList.Add('');

      for i := 0 to mwst.Count-1 do
      begin
        mwstvali := strtoint(mwst.Names[i]);
        mwstwert := strtoint(mwst.Values[IntToStr(mwstvali)]);

        Left  := 'Gesamt inkl. ' + FormatFloat('#.##',(mwstvali - 10000.0) / 100.0) + '% Mwst.';
        Right := FormatFloat('0.#0', (mwstwert - (mwstwert * 10000.0 / mwstvali)) / 100.0) + ' EUR';

        Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
        PrintList.Add(Line);
      end;

      Left  := 'Gesamtbetrag';
      Right := MakePreis(Summe,false) + ' EUR';
      Line  := format('%s%*.*s%s',[Left, (MaxChars-10) - (length(Left) + length(Right)),0,' ',Right]);
      PrintList.Add(Line);

      PrintAbrechnung(PrintList);

      UpdIID := copy(UpdIID,1,length(UpdIID)-1);

      q.DBSql.Sql.Text := format('update bestellung set sta = 1, pid = %d where iid in (%s)',[AktPers,UpdIID]);
      q.StartTransAction;
      q.DBSql.ExecSQL;
      q.DBSql.Close;
      q.Commit;

      if (AktTisch > 0) then
      begin
        if not(OffeneBestellungen(AktTisch)) then
          SetTischStatus(TischList,AktTisch,false);
      end;

      ActivatePage(tsAnmelden);
    end;

    q.Free;

    for i := 0 to Bestellung.Count-1 do
      TAbrechnungItem(Bestellung.Objects[i]).Free;

    Bestellung.Free;
    PrintList.Free;
    mwst.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.AbrechnenGesamt;
var
  q: TDBQuery;
  i,Summe,Betrag,
  Menge,mwstvali,
  mwstwert: integer;
  Artikel,Left,
  Right,Line,mwstval: string;
  sl,mwst: TStringList;
  DoShowMsg: boolean;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    Summe  := 0;
    DoShowMsg := false;

    sl     := TStringList.Create;
    mwst   := TStringList.Create;

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format(' select distinct aid,bezeichnung,prs,sum(prs),count(*),mwst,lok' +
                                 ' from bestellung ' +
                                 ' join artikel on artikel.id = bestellung.aid ' +
                                ' where bestellung.tbl = %d ' +
                                  ' and bestellung.sta = 0 ' +
                                  ' and bestellung.sto = 0 ' +
                                ' group by aid,bezeichnung,prs,mwst,lok',[AktTisch]);
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      if (q.DBSql.Fields[0].AsInteger = 280) then DoShowMsg := true;

      if (Trim(q.DBSql.FieldByName('LOK').AsString) <> '') then
        Artikel := Trim(q.DBSql.FieldByName('LOK').AsString)
      else
        Artikel := Trim(q.DBSql.FieldByName('BEZEICHNUNG').AsString);

      Betrag := q.DBSql.Fields[3].AsInteger;
      Menge  := q.DBSql.Fields[4].AsInteger;
      Summe  := Summe + Betrag;

      Left  := Artikel;
      Right := format('%d  x  %s EUR',[Menge,MakePreis(q.DBSql.Fields[2].AsInteger,false)]);
      Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
      sl.Add(Line);

      mwstval := q.DBSql.Fields[5].AsString;
      if (mwst.Values[mwstval] = '') then mwst.Add(mwstval + '=' + IntToStr(Betrag))
      else                                mwst.Values[mwstval] := IntToStr((strtoint(mwst.Values[mwstval]) + Betrag));

      if (EinzelMWST) then
      begin
        Left  := 'Summe inkl. ' + FormatFloat('0.#0',(q.DBSql.Fields[5].AsInteger - 10000.0) / 100.0) + '% Mwst.';
        Right := FormatFloat('0.#0', (Betrag - (Betrag * 10000.0 / q.DBSql.Fields[5].AsInteger)) / 100.0) + ' EUR';

        Left  := Left + ' ( ' + Right + ' ) ';
        Right := format('%s EUR',[MakePreis(Betrag,false)]);

        Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
        sl.Add(Line);

        Line  := format('%s%*.*s%s',['----------', MaxChars - 20,0,' ','----------']);
        sl.Add(Line);
      end;

      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;

    sl.Add('');

    for i := 0 to mwst.Count-1 do
    begin
      mwstvali := strtoint(mwst.Names[i]);
      mwstwert := strtoint(mwst.Values[IntToStr(mwstvali)]);

      Left  := 'Gesamt inkl. ' + FormatFloat('#.##',(mwstvali - 10000.0) / 100.0) + '% Mwst.';
      Right := FormatFloat('0.#0', (mwstwert - (mwstwert * 10000.0 / mwstvali)) / 100.0) + ' EUR';

      Line  := format('%s%*.*s%s',[Left, MaxChars - (length(Left) + length(Right)),0,' ',Right]);
      sl.Add(Line);
    end;

    Left  := 'Gesamtbetrag';
    Right := MakePreis(Summe,false) + ' EUR';
    Line  := format('%s%*.*s%s',[Left, (MaxChars-10) - (length(Left) + length(Right)),0,' ',Right]);
    sl.Add(Line);

    PrintAbrechnung(sl);
    sl.Free;

    q.DBSql.Sql.Text := format('update bestellung set sta = 1, pid = %d where tbl = %d and sta = 0',
                               [AktPers,AktTisch]);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;

    q.Free;
    mwst.Free;

    if (AktTisch > 0) then
    begin
      SetTischStatus(TischList,AktTisch,false);
      if (DoShowMsg) then ShowErinnerung;
    end;

    ActivatePage(tsAnmelden);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ShowErinnerung;
begin
  frmErinnerung := TfrmErinnerung.Create(nil);
  frmErinnerung.jvReminder.BehaviorOptions.Active := true;
  frmErinnerung.ShowModal;
  frmErinnerung.Release;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PrintAbrechnung(Rechnung: TStringList);
var
  i: integer;
  s: string;
  PrintList: TStringList;
begin
  PrintList := nil;

  try
    PrintList := TStringList.Create;

    //font B 9x17: ziemlich klein
    s := char($1B) + chr($4D)+ '2';
    PrintList.Add(s);

    //center
    s := char($1B) + chr($61) + '1';
    PrintList.Add(s);

    AddFirmHeader(PrintList,false);

    if (strtointdef(Personen,0) > 0) then s := 'Bewirtungsbeleg vom ' +  formatdatetime('dd.mm.yyyy',now)
    else                                  s := 'Rechnung vom ' +  formatdatetime('dd.mm.yyyy',now);

    s := s + ' um ' + formatdatetime('hh:mm',now);
    PrintList.Add(s);

    if (strtointdef(Personen,0) > 0) then PrintList.Add(format('Personen: %s',[Personen]));

    s := format('Tisch %2.2d',[AktTisch]);
    PrintList.Add(s);

    //font B 9x17: ziemlich klein
    s := char($1B) + chr($4D)+ '1';
    PrintList.Add(s);

    //links
    s := char($1B) + chr($61) + '0';
    PrintList.Add(s);

    for i := 0 to Rechnung.Count-1 do
    begin
      if (i = Rechnung.Count-1) then
      begin
        //font größer
        s := char($1B) + chr($4D)+ '0';
        PrintList.Add(s + Rechnung[i]);
      end
      else
        PrintList.Add(Rechnung[i]);
    end;

    PrintList.Add('');
    PrintList.Add(format('Bedienung: %s',[PersonalListe.Values[inttostr(AktPers)]]));
    PrintList.Add('');

    //center
    s := char($1B) + chr($61) + '1';
    PrintList.Add(s);

    AddFirmFooter(PrintList);

    for i := 1 to 5 do PrintList.Add('');

    //cut
    s := char($1D) + chr($56) + '1';
    PrintList.Add(s);

    TranslateChars(PrintList);
    PrintList.SaveToStream(PrintStream);
    GenericPrint;
  finally
    if assigned(PrintList) then PrintList.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ClearStatusBar(Mode: integer);
var
  i: Integer;
begin
  for i := 0 to jvsb.Panels.Count - 1 do
  begin
    if (i < 7) then
    begin
      jvsb.Panels[i].Text := '';

      if (Mode = 1) then
        jvsb.Panels[i].Style := psOwnerDraw;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSaveLayoutClick(Sender: TObject);
var
  name: string;
begin
  name := '';

  InputQuery(StrTischanordnungSpeic,StrBezeichnung,name);
  if (trim(name) <> '') then
  begin
    SaveNewPos(name);
    LoadTischLayOut;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SaveNewPos(Name: string);
var
  q: TDBQuery;
  id: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    MoveTisch := nil;
    
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'insert into tische (bez) values('''+ name + ''')';
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;

    q.DBSql.Sql.Text := 'select max(iid) from tische';
    q.StartTransAction;
    q.DBSql.Open;

    id := q.DBSql.Fields[0].AsInteger;
    q.DBSql.Close;
    q.Commit;
    q.Free;

    if (id > 0) then SaveTische(TischLayoutList,id);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetAngemeldet(Bediener: integer; Aktiv: boolean);
begin
  case Bediener of
      1: begin lbName1.Caption := jvsb.Panels[1].Text; lbName1.Visible := Aktiv; end;
      2: begin lbName2.Caption := jvsb.Panels[1].Text; lbName2.Visible := Aktiv; end;
      3: begin lbName3.Caption := jvsb.Panels[1].Text; lbName3.Visible := Aktiv; end;
      4: begin lbName4.Caption := jvsb.Panels[1].Text; lbName4.Visible := Aktiv; end;
      5: begin lbName5.Caption := jvsb.Panels[1].Text; lbName5.Visible := Aktiv; end;
      6: begin lbName6.Caption := jvsb.Panels[1].Text; lbName6.Visible := Aktiv; end;
      7: begin lbName7.Caption := jvsb.Panels[1].Text; lbName7.Visible := Aktiv; end;
      8: begin lbName8.Caption := jvsb.Panels[1].Text; lbName8.Visible := Aktiv; end;
      9: begin lbName9.Caption := jvsb.Panels[1].Text; lbName9.Visible := Aktiv; end;
    100: begin lbName0.Caption := jvsb.Panels[1].Text; lbName0.Visible := Aktiv; end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnRabattClick(Sender: TObject);
begin
  if (AktTisch > 0) then
  begin
    HausRabatt := GetAktRabattFromDB;

    frmRabatt := TfrmRabatt.Create(nil);
    frmRabatt.btnHaus.Caption := format('Hausrabatt = %d%s',[HausRabatt,'%']);
    frmRabatt.ShowModal;

    AktRabatt := frmRabatt.Rabatt;
    frmRabatt.Release;

    if (AktRabatt <> 0) then HausRabatt := 0;
  end
  else
    AktRabatt := 2;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ClearBestellListe;
var
  i: integer;
begin
  for i := 0 to lbTischBestellungNeu.Count-1 do
    if (lbTischBestellungNeu.Items.Objects[i] <> nil) then
      TBestellItem(lbTischBestellungNeu.Items.Objects[i]).Free;

  lbTischBestellungNeu.Clear;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ClearArtikel;
var
  i: integer;
begin
  for i := 0 to lbArtikel.Count-1 do
    if (lbArtikel.Items.Objects[i] <> nil) then
      TArtikelItem(lbArtikel.Items.Objects[i]).Free;

  lbArtikel.Clear;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetTischStatus(Tische: TTischListe; TischID: integer; Mode: boolean; Last: TDateTime);
var
  t: TTisch;
  i,d: integer;
  s: string;
begin
  stReminder.Items.Clear;
  tReminder.Enabled := false;
  if (stReminder.Active) then stReminder.Active := false;

  s := '';
  for i := 0 to Tische.Tische.Count-1 do
  begin
    t := TTisch(Tische.Tische[i]);

    if (((t.TischID) = TischID) or (TischID = 0)) then
    begin
      t.aktiv := Mode;

      if (Mode = true) then
      begin
        t.Color := clGreen;
        if (Last = 0) then t.Last := now
        else               t.Last := Last;
      end
      else
      begin
        t.Color := clBtnFace;
        t.Last  := 0;
      end;
    end
    else
    begin
      if (t.Last > 0) then
      begin
        d := TimeDiff(t.last,now);

        if ((d >= ReminderPeriod) and (ReminderPeriod > 0)) then
        begin
          if (s = '') then s := ' * ';
          s := s + StrTisch + inttostr(t.TischID) + ' * ';

          if (stReminder.Items.Count = 0) then stReminder.Items.Add(s)
          else                                 stReminder.Items[0] := s;

          t.Color := clMaroon;
//          t.Color := TColor2RGB(clMaroon,d);
          if (ReminderSound) then MessageBeep(MB_ICONASTERISK);
        end;
      end;
    end;
  end;

  if (stReminder.Items.Count >  0) then
  begin
    stReminder.Active := true;
    btnResetOrder.Enabled := ReminderPeriod > 0;
  end;

  tReminder.Enabled := ReminderPeriod > 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnXRechClick(Sender: TObject);
begin
  ShowAbrechnung(-1);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnZRechClick(Sender: TObject);
begin
  if (JaNein(StrZAbschlussErstelle)) then
  begin
    CheckPersonal;
    CheckTische;
    ShowAbrechnung(0);

    //alle tische zurücksetzen: last = 0, status mit 0 übergeben
    TischList.SetLast(0);
    SetTischStatus(TischList,0,false);
    InitAbrechnen(lbAbrechnung,True);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  aLeft,aRight,
  tw,th: integer;
  m,s,z: string;
  r: TRect;
  tc: TColor;
begin
  with (Control as TListBox) do
  begin
    if ((Index mod 2) = 0) then
    begin
      if (odSelected in State) then Canvas.Brush.Color := clHighlight
      else                          Canvas.Brush.Color := $A8FAFA;
    end;

    Canvas.FillRect(rect);

    s := Items[Index];

    if (pos('=',s) > 0) then
    begin
      m := copy(s,1,pos('=',s)-1);
      s := copy(s,pos('=',s)+1,length(s));
      z := copy(s,1,length(s));
    end
    else
      m := s;

    aLeft  := Rect.Left + 2;
    aRight := Rect.Right - Rect.Left - Canvas.TextWidth(z) - 2;

    if (z <> '') then
    begin
      Canvas.TextOut(aLeft,Rect.Top,m);
      Canvas.TextOut(aRight,Rect.Top+13,z);
    end
    else
    begin
      th := Canvas.TextHeight(m) div 2;
      tw := Canvas.TextWidth(m) div 2;
      tc := Canvas.Brush.Color;
      r.Left   := rect.Left;
      r.right  := rect.right;
      r.Top    := rect.Top;
      r.Bottom := rect.Top + 4;

      Canvas.Brush.Color := clMoneyGreen;
      Canvas.FillRect(r);
      Canvas.Brush.Color := tc;;

      Canvas.TextOut(((Rect.Right - Rect.Left) div 2)-tw,Rect.Top + 13-th,m);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
const
  Field: array[0..7] of string = ('sum(prs) as erg, ''Tisch '' || tbl',
                                  'sum(prs) as erg, personal.name || '' '' || personal.Vorname as Name',
                                  '0 as erg, personal.name || '' '' || personal.Vorname as Name',
                                  'sum(prs) as erg,bezeichnung,lok',
                                  'count(*) as erg,bezeichnung,lok',
                                  'sum(prs) as erg,kategorie.bezeichnung,artikel.bezeichnung,lok',
                                  'count(*) as erg,kategorie.bezeichnung,artikel.bezeichnung,lok',
                                  'count(*) as erg,rab,bezeichnung,lok');

procedure TfrmfryPos.ShowAbrechnung(Mode: integer; MitMeldung: boolean);
var
  q: TDBQuery;
  i,iid,miid,
  Umsatz,Menge,Index: integer;
  v,b,s,where,join,
  GroupOrder,rabatt,
  strRabatt: string;
  dtv,dtb: TDateTime;
  PrintList: TStringList;
  Komplett: Boolean;
begin
  PrintList := TStringList.Create;
  Komplett  := ((not cbKompakt.Checked) or (Mode >= 0));

  if (GlobalDB.GDB.Connected) then
  begin
    lbT.Clear;
    lbPU.Clear;
    lbPZ.Clear;
    lbAU.Clear;
    lbAM.Clear;

    q := TDBQuery.Create;

    if (Mode > 0) then
      //+1 weil immer die letzte bis bisid = nächste vonid ist
      q.DBSql.Sql.Text := 'select vid+1 from abrechnung where bid=' + inttostr(Mode)
    else
      q.DBSql.Sql.Text := 'select max(bid) from abrechnung';

    q.StartTransAction;
    q.DBSql.Open;

    iid := q.DBSql.Fields[0].AsInteger;
    q.DBSql.Close;
    q.Commit;

    if (Mode > 0) then strRabatt := GetAktRabattStrFromDB(iid,mode)
    else               strRabatt := GetAktRabattStrFromDB(iid+1,mode);

    if (Mode > 0) then
      q.DBSql.Sql.Text := 'select min(tim),max(tim) from bestellung ' +
                          ' where iid between ' + inttostr(iid) + ' and ' + inttostr(Mode)
    else
      q.DBSql.Sql.Text := 'select min(tim),max(tim),max(iid) from bestellung where iid > ' + inttostr(iid);

    q.StartTransAction;
    q.DBSql.Open;

    v    := q.DBSql.Fields[0].AsString;
    b    := q.DBSql.Fields[1].AsString;
    dtv  := q.DBSql.Fields[0].AsDateTime;
    dtb  := q.DBSql.Fields[1].AsDateTime;

    if (Mode > 0) then miid := Mode
    else               miid := q.DBSql.Fields[2].AsInteger;

    q.DBSql.Close;
    q.Commit;

    if (miid = 0) then
    begin
      if (MitMeldung) then
        ShowMessage(StrKeinUmsatzSeitLet);
    end
    else
    begin
      s := format(StrAbrechnungZeitraum,[v,b,Minuten2Zeit(TimeDiff(dtv,dtb))]);

      if      (Mode < 0) then s := 'X' + s
      else if (Mode = 0) then s := 'Z' + s
      else                    s := 'N' + s;

      panAbrechnenTop.Caption := s;

      Umsatz := 0;
      Menge  := 0;
      Index  := 0;

      if (Mode > 0) then where := ' where iid between %d and ' + inttostr(Mode)
      else               where := ' where iid > %d ';

      for i := low(Field) to high(Field) do
      begin
        join   := '';
        rabatt := '';

        case i of
          1,2:   join := ' left join personal on personal.nummer = bestellung.pid ';
          3,4,7: join := ' left join artikel on artikel.id = bestellung.aid ';
          5,6:   join := ' left join artikel on artikel.id = bestellung.aid ' +
                         ' left join kategorie on kategorie.kategorie = artikel.kategorie ';
        end;

        if (i > 2) then
        begin
          case i of
            5,6: GroupOrder := ' group by 2,3,4 order by 2 collate de_de asc, 1 desc, 3 collate de_de asc, 4 collate de_de asc';
              7: begin
                   GroupOrder := ' group by 2,3,4 order by 2, 1 desc, 3 collate de_de asc, 4 collate de_de asc';
                   rabatt     := ' and rab > 0 ';
                 end;
          else
            GroupOrder := ' group by 2,3 order by 1 desc, 2 collate de_de asc, 3 collate de_de asc'
          end;
        end
        else
          GroupOrder := ' group by 2 order by 1 desc, 2 collate de_de asc';

        q.DBSql.Sql.Text := format(' select %s from bestellung %s ' +
                                   where + ' and sto = 0 and sta = 1 ' + rabatt +
                                   GroupOrder,
                                   [Field[i],Join,iid]);
        q.StartTransAction;
        q.DBSql.Open;

        while not (q.DBSql.EOF) do
        begin
          if (Index = 0) then PrintList.Add('T0=' + v + '-' + b);

          inc(Index);

          if (i > 2) then
          begin
            if (i in [5,6,7]) then
            begin
              if (Trim(q.DBSql.Fields[3].AsString) <> '') then s := q.DBSql.Fields[3].AsString
              else                                             s := q.DBSql.Fields[2].AsString;

              if (i in [5,6]) then
              begin
                //longdrinks kombi
                if (q.DBSql.Fields[1].IsNull) then s := q.DBSql.Fields[2].AsString + '=' + s
                else                               s := q.DBSql.Fields[1].AsString + '=' + s;
              end
              else
              begin
                case q.DBSql.Fields[1].AsInteger of
                  1:   s := strRabatt + '=' + s;
                  2,3: s := '100%' + '=' + s;
                end;
              end;
            end
            else
            begin
              if (Trim(q.DBSql.Fields[2].AsString) <> '') then s := q.DBSql.Fields[2].AsString
              else                                             s := q.DBSql.Fields[1].AsString;
            end;
          end
          else
            s := q.DBSql.Fields[1].AsString;

          case i of
            0:
            begin
              lbT.Items.Add(s + '=' + MakePreis(q.DBSql.Fields[0].AsInteger));
              Umsatz := Umsatz +  q.DBSql.Fields[0].AsInteger;
            end;
            1:
            begin
              s := s + '=' + MakePreis(q.DBSql.Fields[0].AsInteger);
              lbPU.Items.Add(s);

              PrintList.Add(format('PW%d=%s',[Index,s]));
            end;
            2:
            begin
//              dtv  := q.DBSql.Fields[0].AsDateTime;
  //            dtb  := q.DBSql.Fields[1].AsDateTime;
              lbPZ.Items.Add(s + '=' + Minuten2Zeit(q.DBSql.Fields[0].AsInteger));
            end;
            3:
            begin
              s := s + '=' + MakePreis(q.DBSql.Fields[0].AsInteger);
              lbAU.Items.Add(s);

    //          if (Komplett) then
      //          PrintList.Add(format('AW%d=%s',[Index,s]));
            end;
            4:
            begin
              s := s + '=' + q.DBSql.Fields[0].AsString;
              lbAM.Items.Add(s);

//              if (Komplett) then
  //              PrintList.Add(format('AM%d=%s',[Index,s]));

              Menge := Menge + q.DBSql.Fields[0].AsInteger;
            end;
            5:
            begin
              s := s + '=' + MakePreis(q.DBSql.Fields[0].AsInteger);
              if (Komplett) then
                PrintList.Add(format('KW%d=%s',[Index,s]));
            end;
            6:
            begin
              s := s + '=' + q.DBSql.Fields[0].AsString;
              if (Komplett) then
                PrintList.Add(format('KM%d=%s',[Index,s]));
            end;
            7:
            begin
              s := s + '=' + q.DBSql.Fields[0].AsString;
              if (Komplett) then
                PrintList.Add(format('RA%d=%s',[Index,s]));
            end;
          end;
          q.DBSql.Next;
        end;
        q.DBSql.Close;
        q.Commit;
      end;

      panAbrechnenBottom.Caption := StrUmsatzAktuell + MakePreis(Umsatz);
      PrintList.Add('GM=Menge=' + inttostr(Menge));
      PrintList.Add('GW=Umsatz=' + MakePreis(Umsatz));

      if (Mode = 0) then
      begin
        if (miid > iid) then
        begin
          q.DBSql.Sql.Text := format('insert into abrechnung (vid,bid) values(%d,%d)',[iid,miid]);
          q.StartTransAction;
          q.DBSql.ExecSQL;
          q.DBSql.Close;
          q.Commit;
        end
      end;
    end;
    q.Free;
  end;

  if (PrintList.Count > 0) then
    ShowAbrechnenStat(PrintList);

  PrintList.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbPersonalClick(Sender: TObject);
begin
  if (lbPersonal.ItemIndex > -1) then
    ShowPersonal(integer(lbPersonal.Items.Objects[lbPersonal.ItemIndex]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ShowPersonal(ID: integer);
var
  q: TDBQuery;
  i: integer;
  s: string;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    lbUG.Clear;
    lbVH.Clear;
    lbVF.Clear;
    lbMH.Clear;
    lbMF.Clear;
    lbUM.Clear;
    lbS.Clear;
    lbAZ.Clear;
    lbE.Clear;
    lbA.Clear;

    q := TDBQuery.Create;

    if (chkPersLastZ.Checked) then
      q.DBSql.Sql.Text := format('select iid,val1,val2 from pers_stat_bid(%d)',[ID])
    else
      q.DBSql.Sql.Text := format('select iid,val1,val2 from pers_stat_dat(%d,%d,%d)',
                                 [IntDat(datPersVon.Date),IntDat(datPersbis.Date),ID]);
    q.StartTransAction;
    q.DBSql.Open;

    while not (q.DBSql.EOF) do
    begin
      i := q.DBSql.Fields[0].AsInteger;

      if (i < 10) then
      begin
        s := PersonalListe.Values[q.DBSql.Fields[2].AsString];
        if (integer(PersonalListe.Objects[PersonalListe.IndexOfName(q.DBSql.Fields[2].AsString)]) = 0) then
          s := s + ' (inaktiv)';
      end
      else             s := q.DBSql.Fields[2].AsString;

      if ((q.DBSql.Fields[2].AsString = inttostr(ID)) or (ID = 0) or (i = 10)) then
      begin
        case i of
           1: lbUG.Items.Add(s + '=' + MakePreis(q.DBSql.Fields[1].AsInteger));
           2: lbVH.Items.Add(s + '=' + MakePreis(q.DBSql.Fields[1].AsInteger));
           3: lbVF.Items.Add(s + '=' + MakePreis(q.DBSql.Fields[1].AsInteger));
           4: lbMH.Items.Add(s + '=' + q.DBSql.Fields[1].AsString);
           5: lbMF.Items.Add(s + '=' + q.DBSql.Fields[1].AsString);
           6: lbUM.Items.Add(s + '=' + q.DBSql.Fields[1].AsString);
           7: lbS.Items.Add(s  + '=' + q.DBSql.Fields[1].AsString);
           8: lbAZ.Items.Add(s + '=' + Minuten2Zeit(q.DBSql.Fields[1].AsInteger));
           9: lbE.Items.Add(s  + '=' + q.DBSql.Fields[1].AsString);
          10: lbA.Items.Add(s  + '=' + q.DBSql.Fields[1].AsString);
        end;
      end;

      q.DBSql.Next;
    end;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.pcChefChange(Sender: TObject);
begin
  if      (pcChef.ActivePage = tsAbrechnen)   then InitAbrechnen(lbAbrechnung,true)
  else if (pcChef.ActivePage = tsPersonal)    then FillPersonal
  else if (pcChef.ActivePage = tsArtikel)     then FillArtikel(_BIER)
  else if (pcChef.ActivePage = tsTischLayOut) then LoadTischLayout
  else if (pcChef.ActivePage = tsCFG)         then InitCFG
  else if (pcChef.ActivePage = tsChefStat)    then InitChefStat;

  btnAnmeldung.Visible := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.InitAbrechnen(LB: TListBox; DoAbrechnung: Boolean);
var
  q: TDBQuery;
begin
  lb.Clear;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select bid,dat from abrechnung order by bid desc';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      lb.Items.AddObject(q.DBSql.Fields[1].AsString,pointer(q.DBSql.Fields[0].AsInteger));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    if (DoAbrechnung) then
    begin
      cbPrint.Checked   := false;
      cbPreview.Checked := false;
      ShowAbrechnung(-1,false);
      cbPreview.Checked := true;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FillPersonal;
var
  q: TDBQuery;
begin
  lbPersonal.Clear;
  lbUG.Clear;
  lbVH.Clear;
  lbVF.Clear;
  lbMH.Clear;
  lbMF.Clear;
  lbUM.Clear;
  lbS.Clear;
  lbAZ.Clear;
  lbE.Clear;
  lbA.Clear;

  lbPersonal.Items.AddObject('Alle',pointer(0));

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select nummer,vorname || '' '' || name ' +
                        '  from personal ' +
                        ' where aktiv = 1 ' +
                        ' order by 2';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      lbPersonal.Items.AddObject(q.DBSql.Fields[1].AsString,pointer(q.DBSql.Fields[0].AsInteger));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FillArtikel(Kat: integer);
var
  k: string;
  q: TDBQuery;
  ai: TArtikelItem;
begin
  if (Kat = _ESSEN) then rgMwst.ItemIndex := 1
  else                   rgMwst.ItemIndex := 0;

  rgKombi.Visible := Kat <> _LOKO_INTERN;

  AktKat := Kat;
  k      := uppercase(KATEGORIENAME[Kat]);

  ClearArtikel;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select artikel.id,artikel.bezeichnung,artikel.preis,artikel.aktiv, ' +
                                     ' artikel.mwst,artikel.kombi, ' +
                               '       kategorie.bezeichnung ' +
                               '  from artikel ' +
                               '  left join kategorie on kategorie.kategorie = artikel.kategorie ' +
                               ' where artikel.kategorie = %d and artikel.aktiv = 1 ' +
                               ' order by artikel.bezeichnung collate de_de',[Kat]);
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      k  := StrKategorie + uppercase(q.DBSql.Fields[6].AsString);

      ai       := TArtikelItem.Create;
      ai.ArtID := q.DBSql.Fields[0].AsInteger;
      ai.Bez   := q.DBSql.Fields[1].AsString;
      ai.Preis := q.DBSql.Fields[2].AsInteger;
      ai.Aktiv := q.DBSql.Fields[3].AsInteger;
      ai.Mwst  := q.DBSql.Fields[4].AsInteger;
      ai.Kombi := q.DBSql.Fields[5].AsInteger;

      lbArtikel.Items.AddObject(q.DBSql.Fields[1].AsString,pointer(ai));
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;

  panArtikelTop.Caption := k;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtBierClick(Sender: TObject);
begin
  FillArtikel(_BIER);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtAFGClick(Sender: TObject);
begin
  FillArtikel(_AFG);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtKaffeeClick(Sender: TObject);
begin
  FillArtikel(_KAFFEE);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtCockClick(Sender: TObject);
begin
  FillArtikel(_COCKTAILS);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtLoKoClick(Sender: TObject);
begin
  FillArtikel(_LOKO_INTERN);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbArtikelClick(Sender: TObject);
var
  ai: TArtikelItem;
begin
  if (lbArtikel.Count > 0) then
  begin
    ai                := TArtikelItem(lbArtikel.Items.Objects[lbArtikel.ItemIndex]);
    edBez.Text        := ai.Bez;
    edPreis.Text      := MakePreis(ai.Preis,false);
    cbAktiv.Checked   := ai.Aktiv > 0;
    rgKombi.ItemIndex := ai.Kombi;

    if (ai.Mwst = MwstNormal) then rgMwst.ItemIndex := 0
    else                           rgMwst.ItemIndex := 1;

    GetArtValMen(ai.ArtID);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSaveArtikelClick(Sender: TObject);
begin
  if (lbArtikel.ItemIndex > -1) then
  begin
    if (JaNein(StrArtikelAktualisiere)) then SaveArtikel;
  end
  else
  begin
    if (AktKat <> _LOKO_INTERN) then
      if (JaNein(StrArtikelAnlegen)) then SaveArtikel;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SaveArtikel;
var
  q: TDBQuery;
  ai: TArtikelItem;
  mwst: Integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q  := TDBQuery.Create;
    ai := nil;

    if (rgMwst.ItemIndex = 0) then mwst := MwstNormal  //GetMwstNormal(DatAsint)
    else                           mwst := MwstGemindert; //GetMwstGemindert(DatAsint);

    if (lbArtikel.ItemIndex > -1) then
      ai := TArtikelItem(lbArtikel.Items.Objects[lbArtikel.ItemIndex]);

    if (ai <> nil) then
    begin
      q.DBSql.Sql.Text := format('update artikel set bezeichnung=''%s'',preis=%d,' +
                                 'aktiv=%d,mwst=%d,kombi=%d where id=%d',
                                 [edBez.Text,StripStr2Num(edPreis.Text),
                                  ord(cbAktiv.Checked),mwst,rgKombi.ItemIndex,ai.ArtID]);
    end
    else
    begin
      q.DBSql.Sql.Text := format('insert into artikel (bezeichnung,kategorie,preis,mwst,kombi) ' +
                                              ' values(''%s'',%d,%d,%d,%d)',
                                 [edBez.Text,AktKat,StripStr2Num(edPreis.Text),mwst,rgKombi.ItemIndex]);
    end;

    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;

    lbArtikel.ItemIndex := -1;
    FillArtikel(AktKat);
    LoadArtList;
  end;

  rgKombi.ItemIndex := 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnDelArtikelClick(Sender: TObject);
var
  q: TDBQuery;
  ai: TArtikelItem;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q  := TDBQuery.Create;
    ai := nil;

    if (lbArtikel.ItemIndex > -1) then
      ai := TArtikelItem(lbArtikel.Items.Objects[lbArtikel.ItemIndex]);

    if (ai <> nil) then
    begin
      if (JaNein(format(StrArtikelSLoeschen,[ai.bez]))) then
      begin
        q.DBSql.Sql.Text := format('update artikel set aktiv = 0 where id = %d',[ai.ArtID]);
        q.StartTransAction;
        q.DBSql.ExecSQL;
        q.DBSql.Close;
        q.Commit;
      end;
    end;

    q.Free;
    lbArtikel.ItemIndex := -1;
    FillArtikel(AktKat);
    LoadArtList;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.DeleteBestellung(Idx: integer);
var
  q: TDBQuery;
  maxid,aid: integer;
  lok,ps: string;
  ok,PersStorno: boolean;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;

    if (JaNein(StrBestellungStorniere)) then
    begin
      aid := integer(lbTischBestellungOffen.Items.Objects[Idx]);
      lok := '';

      if (aid = 0) then
      begin
        lok := lbTischBestellungOffen.Items[Idx];
        lok := Trim(Copy(lok,Pos('x',lok)+1,Length(lok)));
        lok := Trim(Copy(lok,1, Pos('=',lok)-1));
        lok := Format(' and lok = ''%s'' ',[lok]);
      end;

      q.DBSql.Sql.Text := format(' select max(iid) ' +
                                 '   from bestellung ' +
                                 '  where aid=%d ' +
                                 '    and tbl=%d ' +
                                 '    and pid=%d ' +
                                 '    and sta=0  ' + lok +
                                 '    and sto=0',
                                 [integer(lbTischBestellungOffen.Items.Objects[Idx]),AktTisch,AktPers]);
      q.StartTransAction;
      q.DBSql.Open;

      maxid := q.DBSql.Fields[0].AsInteger;
      q.DBSql.Close;
      q.Commit;

      PersStorno := true;

      if (maxid = 0) then
      begin
        PersStorno := false;

        if (JaNein(format('Bestellung wurde nicht von %s aufgenommen, Chefstorno aktivieren?',
                          [Trim(PersonalListe.Values[inttostr(AktPers)])]))) then
        begin
          ok := strtointdef(GetCFG('CHEF'),0) = 1;

          if not(ok) then
          begin
            DoSoftKey;
            ps := '';
            InputQuery(StrCheftaste,StrPasswort,ps);
            ok := lowercase(ps) = lowercase(GetCFG('CHEFPW'));
          end;

          if (ok) then
          begin
            if (JaNein('Bestellung stornieren?')) then ok := true
            else                                       ok := false;
          end;

          if (ok) then
          begin
            q.DBSql.Sql.Text := format(' select max(iid) ' +
                                       '   from bestellung ' +
                                       '  where aid=%d ' +
                                       '    and tbl=%d ' +
                                       '    and sta=0  ' + lok +
                                       '    and sto=0',
                                       [integer(lbTischBestellungOffen.Items.Objects[Idx]),AktTisch]);
            q.StartTransAction;
            q.DBSql.Open;

            maxid := q.DBSql.Fields[0].AsInteger;
            q.DBSql.Close;
            q.Commit;
          end;
        end;
      end;

      if (maxid > 0) then
      begin
        ok := true;

        if (strtointdef(GetCFG('STORNO'),0) = 1) then
        begin
          if (PersStorno) then
          begin
            ok := strtointdef(GetCFG('CHEF'),0) = 1;

            if not(ok) then
            begin
              DoSoftKey;
              ps := '';
              InputQuery(StrCheftaste,StrPasswort,ps);
              ok := lowercase(ps) = lowercase(GetCFG('CHEFPW'));
            end;
          end;
        end;

        if (ok) then
        begin
          q.DBSql.Sql.Text := format('update bestellung set sto = 1 where iid = %d',[maxid]);
          q.StartTransAction;
          q.DBSql.ExecSQL;
          q.DBSql.Close;
          q.Commit;

          LoadOffeneBestelllung(AktTisch);
        end
        else
          ErrorMsg('Storno nicht möglich!');
      end;
    end;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischBestellungOffenClick(Sender: TObject);
begin
  if (StornoAktiv) then
    DeleteBestellung(lbTischBestellungOffen.ItemIndex);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnUseLayoutClick(Sender: TObject);
begin
  if (lbLayOuts.ItemIndex > -1) then
    SaveTischLayout(integer(lbLayouts.Items.Objects[lbLayouts.ItemIndex]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadTischLayOut;
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    lbLayouts.Clear;

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select iid,bez from tische order by iid';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      lbLayOuts.Items.AddObject(q.DBSql.Fields[1].AsString + '=',pointer(q.DBSql.Fields[0].AsInteger));
      q.DBSql.Next;
    end;
    q.DBSql.Close;
    q.Commit;
    q.Free;

    btnUseLayout.Enabled  := lbLayOuts.Items.Count > 0;
    btnSaveLayout.Enabled := btnUseLayout.Enabled;
    btnDelLayout.Enabled  := btnUseLayout.Enabled;

    if (lbLayOuts.Items.Count > 0) then
    begin
      lbLayOuts.ItemIndex := 0;
      lbLayoutsClick(Self);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SaveTischLayOut(Layout: integer; IID: integer);
begin
  SetCFG(IID, 'LAYOUT', inttostr(Layout));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetCFG(Tag: string): string;
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select val from cfg where tag = ''%s''',[Tag]);
    q.StartTransAction;
    q.DBSql.Open;
    result := q.DBSql.Fields[0].AsString;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbLayoutsClick(Sender: TObject);
begin
  if (lbLayOuts.ItemIndex > -1) then
  begin
    TischLayoutList.Clear;

    LayoutToEdit := integer(lbLayouts.Items.Objects[lbLayouts.ItemIndex]);
    CreateTische(TischLayoutList,tsTischLayout,LayoutToEdit);
    TischLayoutList.SetLayoutMode(true);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tsTischLayoutMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (MoveTisch <> nil) then
  begin
    MoveTisch.X := X;
    MoveTisch.Y := Y;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.GenericPrint;
var
  i,idx,n: integer;
  buf: array[0..8195] of byte;
begin
  idx := -2;

  for i := 0 to Printer.Printers.Count-1 do
  begin
    if ((lowercase(Printer.Printers[i]) = 'bondrucker')) then
    begin
      idx := Printer.Printers.IndexOf(Printer.Printers[i]);
      break;
    end;
  end;

  if (idx <> -2) then
  begin
    Printer.PrinterIndex := idx;
    Printer.Title := StrfryPosBestellung;
    Printer.BeginDoc;

    PrintStream.Position := 0;
    try
      repeat
        n := PrintStream.Read(buf[2], 255);

        if (n > 0) then
        begin
          buf[0] := n;
          buf[1] := 0;
          escape(Printer.Handle, PASSTHROUGH, n, @buf, nil);
        end;
      until (n = 0);
    finally
      Printer.EndDoc;
    end;
  end
  else
  begin
    if not(DruckerOK) then
      ErrorMsg(StrEsIstKeinBondruck + #10#13 + StrBitteGenericTexton);
  end;
  PrintStream.Clear;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.GenericPreview(PreviewList: TStringList);
var
  i,pw,x,y,w,h: integer;
  s,align,v1,v2: string;
begin
  { DDBC
  x := 8; y := 4;

  w  := 80;
  pw := w - (x div 2);
  h  := 150;

  frmPrintPreview := TfrmPrintPreview.Create(nil);
  // DDBC frmPrintPreview.gmPreview.SetCustomPageSize(w,h,gmMillimeters);

  for i := 0 to PreviewList.Count-1 do
  begin
    if (y > 140) then
    begin
      // DDBC frmPrintPreview.gmPreview.NewPage;
      y := 2;
    end;

    s   := PreviewList.Values[PreviewList.Names[i]];
    v1  := copy(s,1,pos('^',s)-1);
    v2  := copy(s,pos('^',s)+1,length(s));

    align := StripNumStr(PreviewList.Names[i]);

    x := 8;

    if (align = 'C') then
    begin
      x := (pw div 2) - (trunc(frmPrintPreview.gmPreview.Canvas.TextWidth(s).AsMillimeters) div 2) - 1;
    end
    else if (align = 'R') then
    begin
      x := pw - trunc(frmPrintPreview.gmPreview.Canvas.TextWidth(s).AsMillimeters) - 1;
    end
    else if (align = 'LR') then
    begin
      frmPrintPreview.gmPreview.Canvas.TextOut(x,y,v1);
      s := v2;
      x := pw - trunc(frmPrintPreview.gmPreview.Canvas.TextWidth(s).AsMillimeters) - 1;
    end;

    frmPrintPreview.gmPreview.Canvas.TextOut(x,y,s);
    inc(y,5);
  end;

  frmPrintPreview.gmPreview.FirstPage;
  frmPrintPreview.gmPreview.FitWholePage;
  frmPrintPreview.ShowModal;
  frmPrintPreview.Release;
  }
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnDelLayoutClick(Sender: TObject);
begin
  if (lbLayOuts.ItemIndex > -1) then
    DeleteLayOut(integer(lbLayouts.Items.Objects[lbLayouts.ItemIndex]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.DeleteLayOut(Layout: integer);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'delete from tische where iid=' + inttostr(Layout);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;

    LoadTischLayOut;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSavePWClick(Sender: TObject);
begin
  SetCFG(0,'CHEFPW',lowercase(trim(edPW.Text)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbChefClick(Sender: TObject);
begin
  SetCFG(0,'CHEF',inttostr(ord(cbChef.Checked)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.rgPersonalClick(Sender: TObject);
begin
  SetCFG(0,'PERSONAL',inttostr(rgPersonal.ItemIndex+1));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.rgReminderClick(Sender: TObject);
begin
  SetCFG(0,'REMINDER',inttostr(rgReminder.ItemIndex * 5));
  ReminderPeriod := strtointdef(GetCFG('REMINDER'),15);
  if (ReminderPeriod > 0) then SetTischStatus(TischList,-1,true);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.InitCFG;
var
  sl: TStringList;
  i,idx: Integer;
  q: TDBQuery;
begin
  sl := TStringList.Create;
  sl.CommaText := GetCFG('BONSPLIT');

  for i := 0 to sl.count-1 do
  begin
    idx := chklstBonSplit.Items.IndexOfObject(Pointer(strtointdef(sl[i],0)));
    if (idx > -1) then chklstBonSplit.Checked[idx] := true;
  end;

  sl.Free;

  edPW.Text            := GetCFG('CHEFPW');
  cbChef.Checked       := strtointdef(GetCFG('CHEF'),0) = 1;
  rgPersonal.ItemIndex := strtointdef(GetCFG('PERSONAL'),3) - 1;
  rgReminder.ItemIndex := strtointdef(GetCFG('REMINDER'),15) div 5;
  cbxpvista.Checked    := XPVistaMode;
  cbPrinter.Checked    := DruckerOK;
  cbPrintOn.Text       := GetCFG('PRINTEXT');
  cbCursor.Checked     := strtointdef(GetCFG('CURSOR'),0) = 1;
  rgBonMWST.ItemIndex  := strtointdef(GetCFG('EINZELMWST'),0);
  cbAbrPers.Checked    := strtointdef(GetCFG('ABRPERS'),1) = 1;
  cbTitleBar.Checked   := strtointdef(GetCFG('TITLEBAR'),0) = 1;
  cbStorno.Checked     := strtointdef(GetCFG('STORNO'),0) = 1;

  cbReminderSound.Checked := ReminderSound;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select bez, nna, vna, str, hau, plz, ort, tel, fax, mob, stn from firma';
    q.StartTransAction;
    q.DBSql.Open;

    if not(q.DBSql.Eof) then
    begin
      edFirmBez.Text   := q.DBSql.Fields[0].AsString;
      edFirmNN.Text    := q.DBSql.Fields[1].AsString;
      edFirmVN.Text    := q.DBSql.Fields[2].AsString;
      edFirmStr.Text   := q.DBSql.Fields[3].AsString;
      edFirmHN.Text    := q.DBSql.Fields[4].AsString;
      edFirmPLZ.Text   := q.DBSql.Fields[5].AsString;
      edFirmOrt.Text   := q.DBSql.Fields[6].AsString;
      edFirmTel.Text   := q.DBSql.Fields[7].AsString;
      edFirmFax.Text   := q.DBSql.Fields[8].AsString;
      edFirmMobil.Text := q.DBSql.Fields[9].AsString;
      edFirmSN.Text    := q.DBSql.Fields[10].AsString;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetPersonalButton(Abmelden: boolean);
var
  i,j: integer;
begin
  j := strtointdef(GetCFG('PERSONAL'),3);

  for i := ComponentCount-1 downto 0 do
  begin
    if (Components[i] is TJvThumbImage) then
    begin
      if (Abmelden) then
      begin
        if ((Components[i] as TJvThumbImage).Tag in [MinPersonal..MaxPersonal]) then
        begin
          SetAngemeldet((Components[i] as TJvThumbImage).Tag,false);
          LoadPic((Components[i] as TJvThumbImage),'personal_inaktiv.jpg');
        end;
      end
      else
      begin
        if (j >= (Components[i] as TJvThumbImage).Tag) then
          (Components[i] as TJvThumbImage).Visible := true;
      end;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.FormShow(Sender: TObject);
begin
  exit;
  Application.OnIdle := MyOnIdle;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.MyOnIdle(Sender: TObject; var Done: Boolean);
begin
  exit;

  if (StornoAktiv) then
  begin
    if (btnStorno.Color = clSilver) then btnStorno.Color := clMaroon
    else                                 btnStorno.Color := clSilver;
    Sleep(250);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.tReminderTimer(Sender: TObject);
begin
  SetTischStatus(TischList,-1,true);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.panAddPersClick(Sender: TObject);
var
  p: string;
begin
  p := '';
  InputQuery(StrPersonalAnlegen,StrName,p);
  if (trim(p) <> '') then SavePersonal(p);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SavePersonal(Name: string);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text :=format('insert into personal(name,vorname) values(''%s'',''%s'')',[Name,'']);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;

    LoadPersonal;
    FillPersonal;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.panDelPersClick(Sender: TObject);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    if (lbPersonal.ItemIndex > -1) then
    begin
      q := TDBQuery.Create;
      q.DBSql.Sql.Text :=format('update personal set aktiv = 0 where nummer = %d',
                                [integer(lbPersonal.Items.Objects[lbPersonal.ItemIndex])]);
      q.StartTransAction;
      q.DBSql.ExecSQL;
      q.DBSql.Close;
      q.Commit;
      q.Free;

      LoadPersonal;
      FillPersonal;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.InitBestellButton(var b: TBestellButton);
begin
  b                     := TBestellButton.Create(nil);
  b.Left                := 0;
  b.Top                 := 0;
  b.Width               := 85;
  b.Height              := 40;
  b.Caption             := '';
  b.Font.Size           := 10;
  b.Font.Style          := [fsBold];
  b.WordWrap            := true;
  b.OnClick             := BestellungAuswahl;
  b.Pos                 := 0;
  b.PageMode            := pmDefault;
  b.Visible             := false;
  b.VonIdx              := 0;
  b.BisIdx              := 0;
  b.Artikel.ID          := 0;
  b.Artikel.Bezeichnung := '';
  b.Artikel.Preis       := 0;
  b.Artikel.Kategorie   := 0;
  b.Artikel.Kombi       := 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbReminderSoundClick(Sender: TObject);
begin
  SetCFG(0,'REMSOUND',inttostr(ord(cbReminderSound.Checked)));
  ReminderSound := strtointdef(GetCFG('REMSOUND'),1) > 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbXPVistaClick(Sender: TObject);
begin
  SetCFG(0,'XPVISTA',inttostr(ord(cbxpvista.Checked)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischDelClick(Sender: TObject);
begin
  DelTischFromLayout;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbTischAddClick(Sender: TObject);
begin
  AddTischToLayout;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.DelTischFromLayout;
begin
  if (MoveTisch <> nil) then
    MoveTisch.Deleted := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.AddTischToLayout;
begin
  TischLayoutList.Add(0,0,20,20,80,80,tsTischLayout).TischClick := TischAuswahl;
  TischLayoutList.SetLayoutMode(true);
  btnSaveLayout.Enabled := true;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbPrinterClick(Sender: TObject);
begin
  SetCFG(0,'PRINTER',inttostr(ord(cbPrinter.Checked)));
  DruckerOK := strtointdef(GetCFG('PRINTER'),1) > 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSoftKeyClick(Sender: TObject);
begin
  DoSoftKey;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.DoSoftKey;
begin
  ShellExecute(handle,'','osk.exe','','',SW_SHOWNORMAL);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.RestartCheckPersTisch;
var
  q: TDBQuery;
  ti: TJvThumbImage;
  c: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select tbl,max(tim) from bestellung where sta = 0 and tbl > 0 group by tbl order by tbl';
    q.StartTransAction;
    q.DBSql.Open;

    c := 0;
    while not(q.DBSql.Eof) do
    begin
      SetTischStatus(TischList,q.DBSql.Fields[0].AsInteger,true,q.DBSql.Fields[1].AsDateTime);
      inc(c);
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;

    //nochmal für alle prüfen, da tisch.id = tischid geprüft wird
    if (c > 0) then SetTischStatus(TischList,-1,true,0);

    q.DBSql.Sql.Text := 'select per,id from anmeldung where sta = 1';
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      jvsb.Panels[1].Text := PersonalListe.Values[(q.DBSql.Fields[0].AsString)];
      ti := GetAnmeldeTisch(q.DBSql.Fields[1].AsInteger);
      SetAngemeldet(q.DBSql.Fields[1].AsInteger,true);
      LoadPic(ti,'personal_aktiv.jpg');
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbPrintOnChange(Sender: TObject);
begin
  SetCFG(0,'PRINTEXT',lowercase(trim(cbPrintOn.Text)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnUmsetzenClick(Sender: TObject);
var
  TischUmsetzen: TTischListe;
  wF: extended;
begin
  frmUmsetzen := TfrmUmsetzen.Create(nil);

  VonTisch  := 0;
  NachTisch := 0;
  VonNachTisch.Clear;

  TischUmsetzen := TTischListe.Create;
  wF := (tsTisch.Width / frmUmsetzen.pan.Width);

  CreateTische(TischUmsetzen,frmUmsetzen.pan,TischLayout,wF);
  TischUmsetzen.SetUmsetzen(true);

  frmUmsetzen.ShowModal;
  frmUmsetzen.Release;

  TischUmsetzen.Free;

  if (VonNachTisch.Count > 0) then
    UpdateTische(VonNachTisch);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.UpdateTische(VonNach: TStringList);
var
  q: TDBQuery;
  von,nach,i,iid: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select max(bid) from abrechnung';
    q.StartTransAction;
    q.DBSql.Open;

    iid := q.DBSql.Fields[0].AsInteger;
    q.DBSql.Close;
    q.Commit;

    q.DBSql.Sql.Text := 'update bestellung set tbl = :NACH where iid > :IID and tbl = :VON and sta = 0';
    q.StartTransAction;

    for i := 0 to VonNach.Count-1 do
    begin
      von  := strtoint(VonNach.Names[i]);
      nach := strtoint(VonNach.Values[inttostr(von)]);

      q.DBSql.ParamByName('NACH').AsInteger := nach;
      q.DBSql.ParamByName('IID').AsInteger  := iid;
      q.DBSql.ParamByName('VON').AsInteger  := von;
      q.DBSql.ExecSQL;

      if ((TischList.Tisch[Von].Last <> 0) and (TischList.Tisch[Nach].Last = 0)) then
        TischList.Tisch[Nach].Last := TischList.Tisch[Von].Last;

      SetTischStatus(TischList,Von,false);
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    for i := 0 to VonNach.Count-1 do
    begin
      von  := strtoint(VonNach.Names[i]);
      nach := strtoint(VonNach.Values[inttostr(von)]);

      if (OffeneBestellungen(Nach)) then
        SetTischStatus(TischList,Nach,true);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.OffeneBestellungen(Tisch: integer): boolean;
var
  q: TDBQuery;
  iid: integer;
  s: string;
begin
  result := false;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select max(bid) from abrechnung';
    q.StartTransAction;
    q.DBSql.Open;

    iid := q.DBSql.Fields[0].AsInteger;
    q.DBSql.Close;
    q.Commit;

    s := '';
    if (Tisch > 0) then s := ' and tbl=' + inttostr(Tisch);

    q.DBSql.Sql.Text := format('select count(*) from bestellung where iid > %d and sta = 0 and sto = 0 %s',
                               [iid,s]);
    q.StartTransAction;
    q.DBSql.Open;

    result := q.DBSql.Fields[0].AsInteger > 0;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.LoadArtList;
var
  q: TDBQuery;
  idx: integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    ArtList.Artikel.Clear;

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select kategorie,id,bezeichnung,preis,mwst,kombi,msg ' +
                          'from artikel ' +
                         'where aktiv = 1 ' +
                         'order by kategorie,bezeichnung collate de_de';
    q.StartTransAction;
    q.DBSql.Open;

    idx := 1;
    while not(q.DBSql.Eof) do
    begin
      ArtList.Add(idx,q.DBSql.Fields[1].AsInteger, q.DBSql.Fields[1].AsInteger,
                  q.DBSql.Fields[0].AsInteger, q.DBSql.Fields[3].AsInteger,
                  q.DBSql.Fields[2].AsString,
                  q.DBSql.Fields[4].AsInteger,q.DBSql.Fields[5].AsInteger,
                  q.DBSql.Fields[6].AsInteger);
      inc(idx);
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnExitClick(Sender: TObject);
begin
  Close;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnKeyboardClick(Sender: TObject);
begin
  DoSoftKey;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PersonalAbrechnen;
var
  AbrechnenList: TStringList;
  ti: TJvThumbImage;
  q: TDBQuery;
  i,PersNummer,
  AnmeldeTag{,Umsatz}: integer;
  Pers{,Zeit}: string;
  Abrechnen,
  Angemeldet: boolean;
begin
  AbrechnenList := TStringList.Create;

  frmAbrechnen                := TfrmAbrechnen.Create(self);
  frmAbrechnen.Parent         := self;
  frmAbrechnen.Abrechnen      := AbrechnenList;
  frmAbrechnen.panTop.Caption := ShowPersonalAbrechnung(frmAbrechnen.grdInfo, frmAbrechnen.grpbtn);
  frmAbrechnen.ShowModal;

  Abrechnen := frmAbrechnen.DoAbrechnen;

  frmAbrechnen.Release;

  if (Abrechnen) then
  begin
    if (GlobalDB.GDB.Connected) then
    begin
      q := TDBQuery.Create;

      for i := 0 to AbrechnenList.Count-1 do
      begin
        Pers       := AbrechnenList[i];
        PersNummer := TAbrechnenItem(AbrechnenList.Objects[i]).PersonalNummer;
        AnmeldeTag := TAbrechnenItem(AbrechnenList.Objects[i]).AnmeldeTag;
//        Zeit       := TAbrechnenItem(AbrechnenList.Objects[i]).Arbeitszeit;
//        Umsatz     := TAbrechnenItem(AbrechnenList.Objects[i]).Umsatz;
        Abrechnen  := TAbrechnenItem(AbrechnenList.Objects[i]).Abrechnen;

        if (Abrechnen) then
        begin
          ti := GetAnmeldeTisch(AnmeldeTag);

          if (ti <> nil) then
          begin
            q.DBSql.Sql.Text := format('select count(*) from anmeldung where per = %d and id = %d and sta = 1',
                                       [PersNummer,AnmeldeTag]);
            q.StartTransAction;
            q.DBSql.Open;

            Angemeldet := q.DBSql.Fields[0].AsInteger > 0;

            q.DBSql.Close;
            q.Commit;

            if (Angemeldet) then
            begin
              jvsb.Panels[1].Text := '';
              SetAngemeldet(ti.Tag, false);
              LoadPic(ti, 'personal_inaktiv.jpg');
            end;
          end;

          q.DBSql.Sql.Text := format('update anmeldung set edz = ''now'', sta = 0, abr = 1 ' +
                                     ' where per = %d '                                      +
                                       ' and abr = 0', [PersNummer]);
          q.StartTransAction;
          q.DBSql.ExecSQL;
          q.DBSql.Close;
          q.Commit;
        end;
      end;
      q.Free;
    end;
  end;

  for i := 0 to AbrechnenList.Count-1 do
    TAbrechnenItem(AbrechnenList.Objects[i]).Free;

  AbrechnenList.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ChangePersonal;
var
  p: Integer;
  t: Integer;
  ti: TJvThumbImage;
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    p := GetPersonal(t, 0);

    if ((p > 0) and (t > 0)) then
    begin
      ti := GetAnmeldeTisch(t);

      if (ti <> nil) then
      begin
        q := TDBQuery.Create;
        q.DBSql.Sql.Text := format('update anmeldung set edz = ''now'', sta = 0 ' +
                                   ' where id = %d '                              +
                                   '   and per =%d', [t, p]);
        q.StartTransAction;
        q.DBSql.ExecSQL;
        q.DBSql.Close;
        q.Commit;
        q.Free;

        p := PersonalLogIn(ti.Tag);

        if (p < 1) then
        begin
          jvsb.Panels[1].Text := '';
          SetAngemeldet(ti.Tag, false);
          LoadPic(ti, 'personal_inaktiv.jpg');
          ActivatePage(tsAnmelden);
        end
        else
        begin
          jvsb.Panels[1].Text := PersonalListe.Values[inttostr(p)];
          SetAngemeldet(ti.Tag, true);
        end;
      end;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.lbArtikelDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  aLeft,aRight,
  tw,th: integer;
  m,s,z: string;
  r: TRect;
  tc: TColor;
begin
  with (Control as TListBox) do
  begin
    if ((Index mod 2) = 0) then
    begin
      if (odSelected in State) then Canvas.Brush.Color := clHighlight
      else                          Canvas.Brush.Color := $A8FAFA;
    end;

    Canvas.FillRect(rect);

    s := Items[Index];

    if (pos('=',s) > 0) then
    begin
      m := copy(s,1,pos('=',s)-1);
      s := copy(s,pos('=',s)+1,length(s));
      z := copy(s,1,length(s));
    end
    else
      m := s;

    aLeft  := Rect.Left + 2;
    aRight := Rect.Right - Rect.Left - Canvas.TextWidth(z) - 2;

    if (z <> '') then
    begin
      Canvas.TextOut(aLeft,Rect.Top,m);
      Canvas.TextOut(aRight,Rect.Top+13,z);
    end
    else
    begin
      th := Canvas.TextHeight(m) div 2;
      tw := Canvas.TextWidth(m) div 2;
      tc := Canvas.Brush.Color;
      r.Left   := rect.Left;
      r.right  := rect.right;
      r.Top    := rect.Top;
      r.Bottom := rect.Top + 4;

      Canvas.Brush.Color := clMoneyGreen;
      Canvas.FillRect(r);
      Canvas.Brush.Color := tc;;

      Canvas.TextOut(((Rect.Right - Rect.Left) div 2)-tw,Rect.Top + 13-th,m);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbCursorClick(Sender: TObject);
begin
  SetCFG(0,'CURSOR',inttostr(ord(cbCursor.Checked)));
  ShowCursor(cbCursor.Checked);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnPersAbrechnenClick(Sender: TObject);
begin
  PersonalAbrechnen;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.ShowPersonalAbrechnung(grd: TStringGrid; bg: TButtonGroup): string;
var
  q: TDBQuery;
  LastIID,i,
  mindat,maxdat,
  SummeZeit,
  SummeUmsatz: integer;
  Ende: TDateTime;
  bi: TGrpButtonItem;
  ai: TAbrechnenItem;
  MaxIID: Integer;
  AnmeldeStatus: string;
begin
  result := 'Personalabrechnung';

  q := TDBQuery.Create;
  q.DBSql.Sql.Text := 'select max(bid) from abrechnung';
  q.DBSql.Open;

  MaxIID := q.DBSql.Fields[0].AsInteger;

  q.DBSql.Close;
  q.Commit;

  if not (AbrPers) then AnmeldeStatus := ' and anmeldung.sta  = 1 '
  else                  AnmeldeStatus := '';

  q.DBSql.SQL.Text := 'select anmeldung.sdz,anmeldung.edz,anmeldung.id, ' +
                            ' personal.nummer,personal.name,personal.vorname, ' +
                            ' sum(bestellung.prs) as Umsatz,anmeldung.iid ' +
                       ' from anmeldung ' +
                       ' left join personal on personal.nummer = anmeldung.per ' +
                       ' left join bestellung on bestellung.pid = personal.nummer ' +
                      ' where anmeldung.abr  = 0 ' + AnmeldeStatus +
                        ' and personal.aktiv = 1 ' +
                        ' and bestellung.iid > ' + IntToStr(MaxIID) + ' ' +
                        ' and bestellung.sta = 1 ' +
                        ' and bestellung.sto = 0 ' +
                        ' and bestellung.anm = anmeldung.iid ' +
                      ' group by anmeldung.iid ,anmeldung.sdz,anmeldung.edz,anmeldung.id, ' +
                               ' personal.nummer,personal.name,personal.vorname ' +
                      ' order by personal.name collate de_de, personal.vorname collate de_de, anmeldung.iid desc';
  q.DBSql.Open;

  i           := 1;
  LastIID     := -1;
  SummeZeit   := 0;
  SummeUmsatz := 0;
  mindat      := intdat(q.DBSql.Fields[0].AsDateTime);
  maxdat      := mindat;
  ai          := nil;

  grd.Cells[0,0] := 'Personal';
  grd.Cells[1,0] := 'Zeitraum';
  grd.Cells[2,0] := 'Arbeitszeit';
  grd.Cells[3,0] := 'Umsatz';

  while not (q.dbsql.Eof) do
  begin
    if (LastIID <> q.DBSql.Fields[3].AsInteger) then
    begin
      if (SummeZeit > 0) then
      begin
        grd.Cells[0,i] := 'Zeit: ' + Minuten2Zeit(SummeZeit);
        ai.Arbeitszeit := Minuten2Zeit(SummeZeit);
      end;

      if (SummeUmsatz > 0) then
      begin
        if (SummeZeit > 0) then
          grd.Cells[0,i] := grd.Cells[0,i] + ' / ' + 'Umsatz: ' + MakePreis(SummeUmsatz,true)
        else
          grd.Cells[0,i] := 'Umsatz: ' + MakePreis(SummeUmsatz,true);

        ai.Umsatz      := SummeUmsatz;
      end;

      ai                := TAbrechnenItem.Create;
      ai.Abrechnen      := false;
      ai.PersonalNummer := q.DBSql.Fields[3].AsInteger;
      ai.AnmeldeTag     := q.DBSql.Fields[2].AsInteger;

      inc(i);
      grd.Cells[0,i]   := q.DBSql.Fields[4].AsString + ' ' + q.DBSql.Fields[5].AsString;
      grd.Objects[0,i] := Pointer(q.DBSql.Fields[3].AsInteger);
      LastIID          := q.DBSql.Fields[3].AsInteger;

      bi         := bg.Items.Add;
      bi.Caption := q.DBSql.Fields[4].AsString + ' ' + q.DBSql.Fields[5].AsString;
      bi.Data    := pointer(ai);

      SummeZeit   := 0;
      SummeUmsatz := 0;
    end;
    inc(i);

    Ende := q.DBSql.Fields[1].AsDateTime;
    if (Ende = 0) then Ende := now;

    SummeZeit      := SummeZeit + TimeDiff(q.DBSql.Fields[0].AsDateTime,Ende);
    SummeUmsatz    := SummeUmsatz + q.DBSql.Fields[6].AsInteger;
    grd.Cells[1,i] := q.DBSql.Fields[0].AsString + ' - ' + DateTimeToStr(Ende);
    grd.Cells[2,i] := Minuten2Zeit(TimeDiff(q.DBSql.Fields[0].AsDateTime,Ende));
    grd.Cells[3,i] := MakePreis(q.DBSql.Fields[6].AsInteger);

    grd.RowCount := i;

    if (intdat(q.DBSql.Fields[0].AsDateTime) < mindat) then mindat := intdat(q.DBSql.Fields[0].AsDateTime);
    if (intdat(Ende) > maxdat) then maxdat := intdat(Ende);

    q.DBSql.Next;
  end;

  if (SummeZeit > 0) then
  begin
    grd.Cells[0,i] := 'Zeit: ' + Minuten2Zeit(SummeZeit);
    ai.Arbeitszeit := Minuten2Zeit(SummeZeit);
  end;

  if (SummeUmsatz > 0) then
  begin
    if (SummeZeit > 0) then
      grd.Cells[0,i] := grd.Cells[0,i] + ' / ' + 'Umsatz: ' + MakePreis(SummeUmsatz,true)
    else
      grd.Cells[0,i] := 'Umsatz: ' + MakePreis(SummeUmsatz,true);

    ai.Umsatz := SummeUmsatz;
  end;

  q.DBSql.Close;
  q.Commit;
  q.Free;

  if (i > 1) then
  begin
    grd.RowCount := i + 1;
    result := result + ' ' + MakeDate(mindat) + ' - ' + MakeDate(maxdat);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ShowAbrechnenStat(PrintData: TStringList);
var
  i,count: integer;
  s,v,v1,v2,
  Tag,LastTag: string;
  PrintList,
  PreviewList: TStringList;
  LastKat: string;
  PrintKat: boolean;
begin
  PrintList   := nil;
  PreviewList := nil;

  try
    count := 0;
    PrintList   := TStringList.Create;
    PreviewList := TStringList.Create;

    //font B 9x17: ziemlich klein
    s := char($1B) + chr($4D)+ '1';
    PrintList.Add(s);

    //center
    s := char($1B) + chr($61) + '1';
    PrintList.Add(s);

    PrintList.Add('Abrechnungsübersicht');
    PrintList.Add('******************************');

    PreviewList.Add(format('C%d=Abrechnungsübersicht',[count]));
    inc(count);
    PreviewList.Add(format('C%d=******************************',[count]));

    LastTag  := '';
    LastKat  := '';
    PrintKat := false;

    for i := 0 to PrintData.Count-1 do
    begin
      inc(count);
      Tag := StripNumStr(PrintData.Names[i]);

      if (Tag <> LastTag) then
      begin
        //center
        s := char($1B) + chr($61) + '1' + chr($0D);
        PrintList.Add(s);

        s := '';

        if (Tag = 'T') then
        begin
          s := PrintData.Values[PrintData.Names[i]];
        end
        else if (Tag = 'PW') then
        begin
          s := 'Personalliste nach Wert';
        end
        else if (Tag = 'PM') then
        begin
          s := 'Personalliste nach Menge';
        end
        else if (Tag = 'AW') then
        begin
          s := 'Artikelliste nach Wert';
        end
        else if (Tag = 'AM') then
        begin
          s := 'Artikelliste nach Menge';
        end
        else if (Tag = 'KM') then
        begin
          s := 'Kategorieliste nach Menge';
        end
        else if (Tag = 'KW') then
        begin
          s := 'Kategorieliste nach Wert';
        end
        else if (Tag = 'RA') then
        begin
          s := 'Rabattartikel nach Menge';
        end
        else if (Tag = 'GM') then
        begin
          s := 'Gesamtmenge';
        end
        else if (Tag = 'GW') then
        begin
          s := 'Gesamtwert';
        end;

        if (s <> '') then
        begin
          PrintList.Add(s);
          PrintList.Add('------------------------------');

          PreviewList.Add(format('C%d=%s',[count,s]));
          inc(count);
          PreviewList.Add(format('C%d=------------------------------',[count]));
          inc(count);
          LastTag := Tag;
        end;
      end;

      if ((Tag = 'KM') or (Tag = 'KW') or (Tag = 'RA')) then
      begin
        v  := PrintData.Values[PrintData.Names[i]];
        s := copy(v,1,pos('=',v)-1);
        v := copy(v,pos('=',v)+1,length(v));

        v1 := copy(v,1,pos('=',v)-1);
        v2 := copy(v,pos('=',v)+1,length(v));

        if (LastKat <> s) then
        begin
          PrintKat := true;
          PreviewList.Add(format('C%d=- %s -',[count,s]));
          inc(count);
        end;
      end
      else
      begin
        v  := PrintData.Values[PrintData.Names[i]];
        v1 := copy(v,1,pos('=',v)-1);
        v2 := copy(v,pos('=',v)+1,length(v));
      end;

      if (Tag <> 'T') then
      begin
        if ((PrintKat) and (LastKat <> s)) then
        begin
          PrintKat := false;
          PrintList.Add(char($1B) + chr($61) + '1' + '- ' + uppercase(s) + ' -');
          LastKat := s;
        end;

        s := format('%s%*.*s%s',[v1, MaxChars - (length(v1) + length(v2)),0,' ',v2]);

        PreviewList.Add(format('LR%d=%s^%s',[count,v1,v2]));
        PrintList.Add(char($1B) + chr($61) + '0' + s);
      end;
    end;

    for i := 1 to 4 do PrintList.Add('');

    //cut
    s := char($1D) + chr($56) + '1';
    PrintList.Add(s);

    if (cbPreview.Checked) then GenericPreview(PreviewList);

    if (cbPrint.Checked) then
    begin
      TranslateChars(PrintList);
      PrintList.SaveToStream(PrintStream);
      GenericPrint;
    end;

  finally
    if assigned(PrintList) then PrintList.Free;
    if assigned(PreviewList) then PreviewList.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnStornoClick(Sender: TObject);
begin
  ClearBestellung;

  if not(StornoAktiv) then
  begin
    StornoAktiv      := true;
    btnStorno.Color  := clMaroon;
    bbNext.Visible   := false;
    bbKGNext.Visible := false;
    bbKGBack.Visible := false;
    bbKZNext.Visible := false;
    bbKZBack.Visible := false;
  end
  else
  begin
    StornoAktiv     := false;
    btnStorno.Color := clSilver;

    if (LastKategorie = _LOKO) then btnLoKoClick(Self)
    else                            LoadArtikel(LastKategorie,pcBestellung.ActivePage);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.TranslateChars(sl: TStringList);
var
  i,j,k,t: integer;
  s: string;
  c: char;
  Translate: TStringList;
begin
  Translate := TStringList.Create;

  if (FileExists(AppPath + 'translate.txt')) then
    Translate.LoadFromFile(AppPath + 'translate.txt');

  //deutsch
  sl.Add(char($1B) + chr($52) + '2');

  //smooth on
  sl.Add(char($1D) + chr($62) + '1');

  //charaktersize normal
  sl.Add(char($1D) + char($21) + char($00));

  //halbe breite
// sl.Add(char($1D) + char($21) + char($01));

  //wie unten
//  sl.Add(char($1D) + char($21) + char($30));

  //groß breit
//  sl.Add(char($1D) + char($21) + char($31));

  for i := 0 to sl.count-1 do
  begin
    s := sl[i];
    s := StringReplace(sl[i],'€','EUR',[rfReplaceAll]);

    for j := 1 to length(s) do
    begin
      c := s[j];

      if (Translate.Count > 0) then
      begin
        //z.b.: ü=129
        for k := 0 to Translate.Count-1 do
        begin
          t := strtointdef(Translate.Values[Translate.Names[k]],-1);
          if (t > 0) then c := Chr(t);
        end;
      end
      else
      begin
        if (c = 'ü') then c := chr(129);
        if (c = 'Ü') then c := chr(154);
      end;

      s[j] := c;
    end;

    sl[i] := s;
  end;

  Translate.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnNachdruckenClick(Sender: TObject);
begin
  if (lbAbrechnung.ItemIndex > -1) then
    ShowAbrechnung(integer(lbAbrechnung.Items.Objects[lbAbrechnung.ItemIndex]));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PersonalLogOut;
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'update anmeldung set edz = ''now'', sta = 0 where sta = 1';
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtSpritClick(Sender: TObject);
begin
  FillArtikel(_SPIRIT);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtFoodClick(Sender: TObject);
begin
  FillArtikel(_ESSEN);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnLoKoClick(Sender: TObject);
begin
  ResetLastKombiItem;

  bbKGNext.VonIdx  := 0;
  bbKGNext.BisIdx  := 0;
  bbKGBack.VonIdx  := 0;
  bbKGBack.BisIdx  := 0;
  bbKGBack.Visible := false;

  bbKZNext.VonIdx  := 0;
  bbKZNext.BisIdx  := 0;
  bbKZBack.VonIdx  := 0;
  bbKZBack.BisIdx  := 0;
  bbKZBack.Visible := false;

  ClearBestellung;

  LoadKombiArtikel(_LOKO,tsGrundlage,0,0);
  LoadKombiArtikel(_LOKO,tsZusatz,0,0);

  pcBestellung.ActivePage := tsLoKo;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSpiritClick(Sender: TObject);
begin
  LoadArtikel(_SPIRIT,tsSpirit);
  pcBestellung.ActivePage := tsSpirit;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnFoodClick(Sender: TObject);
begin
  LoadArtikel(_ESSEN,tsFood);
  pcBestellung.ActivePage := tsFood;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.AddFirmHeader(PrintList: TStringList; FromDB: boolean);
var
  q: TDBQuery;
begin
  if (FromDB) then
  begin
    if (GlobalDB.GDB.Connected) then
    begin
      q := TDBQuery.Create;
      q.DBSql.Sql.Text := 'select bez, str, hau, plz, ort, tel, stn from firma';
      q.StartTransAction;
      q.DBSql.Open;

      Firma.Bez := q.DBSql.FieldByName('BEZ').AsString;
      Firma.Str := q.DBSql.FieldByName('STR').AsString;
      Firma.Hau := q.DBSql.FieldByName('HAU').AsString;
      Firma.Plz := q.DBSql.FieldByName('PLZ').AsString;
      Firma.Ort := q.DBSql.FieldByName('ORT').AsString;
      Firma.Tel := q.DBSql.FieldByName('TEL').AsString;
      Firma.Stn := q.DBSql.FieldByName('STN').AsString;

      q.DBSql.Close;
      q.Commit;
      q.Free;
    end;
  end
  else
  begin
    PrintList.Add(Firma.Bez);
    PrintList.Add(BonTitel);
    PrintList.Add('');
    PrintList.Add(Firma.Str + ' ' + Firma.Hau);
    PrintList.Add(Firma.Plz + ' ' + Firma.Ort);
    PrintList.Add('Telefon: ' + Firma.Tel);
    PrintList.Add('Steuernummer: ' + Firma.Stn);
    PrintList.Add('');
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.AddFirmFooter(PrintList: TStringList);
begin
  PrintList.Add(BonFoot1);
  PrintList.Add(BonFoot2);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PersPanelPrint(Sender: TObject);
var
  PrintList: TStringList;
  s,v,v1,v2: string;
  i: integer;
begin
  if (JaNein((Sender as TListBox).Hint + ' Übersicht ausdrucken?')) then
  begin
    PrintList := TStringList.Create;

    //font B 9x17: ziemlich klein
    s := char($1B) + chr($4D)+ '1';
    PrintList.Add(s);

    //center
    s := char($1B) + chr($61) + '1' + chr($0D);
    PrintList.Add(s);

    if (pcChef.ActivePage = tsPersonal) then
    begin
      PrintList.Add((Sender as TListBox).Hint + ' ' + MakeDate(IntDat(datPersVon.Date)) + '-' +
                                                      MakeDate(IntDat(datPersBis.Date)));
      PrintList.Add(lbPersonal.Items[lbPersonal.ItemIndex]);
    end
    else if (pcChef.ActivePage = tsChefStat) then
    begin
      PrintList.Add((Sender as TListBox).hint);
    end;

    PrintList.Add('**********************************');
    PrintList.Add('');

    //font B 9x17: bischen größer
    s := char($1B) + chr($4D)+ '2';
    PrintList.Add(s);

    if ((Sender as TListBox).Count > 0) then
    begin
      for i := 0 to (Sender as TListBox).Count-1 do
      begin
        v   := (Sender as TListBox).Items[i];
        v1  := copy(v,1,pos('=',v)-1);
        v2  := copy(v,pos('=',v)+1,length(v));
        s   := format('%s%*.*s%s',[v1, MaxChars - (length(v1) + length(v2)),0,' ',v2]);
        PrintList.Add(char($1B) + chr($61) + '0' + s);
      end;

      for i := 1 to 4 do PrintList.Add('');

      //cut
      s := char($1D) + chr($56) + '1';
      PrintList.Add(s);

      TranslateChars(PrintList);
      PrintList.SaveToStream(PrintStream);
      GenericPrint;
    end;

    PrintList.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetTischLabel(ts: TTabSheet);
begin
  lbTisch.Parent := ts;

  if ((ts = tsGrundlage) or (ts = tsZusatz)) then
  begin
    lbTisch.Align     := alTop;
    lbTisch.Font.Size := 12;
  end
  else
  begin
    lbTisch.Align     := alBottom;
    lbTisch.Font.Size := 16;
  end;

  lbTisch.Alignment := taCenter;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnSektClick(Sender: TObject);
begin
  LoadArtikel(_SEKT,tsSekt);
  pcBestellung.ActivePage := tsSekt;
  pcBestellung.OnChange(Self);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.panOrderTopClick(Sender: TObject);
begin
  if (lbTischBestellungNeu.Visible) then SetActiveOrderMode(1)
  else                                   SetActiveOrderMode(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetActiveOrderMode(Mode: integer);
begin
  case Mode of
    0:
    begin
      panOrderTop.Caption := 'Aktuelle Bestellung';
      lbTischBestellungOffen.Visible := False;
      lbTischBestellungNeu.Visible   := true;
    end;
    1:
    begin
      panOrderTop.Caption := 'Aufgelaufene Bestellung';
      lbTischBestellungNeu.Visible   := false;
      lbTischBestellungOffen.Visible := true;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnArtSektClick(Sender: TObject);
begin
  FillArtikel(_SEKT);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.CopyArtikel(SortArtList,OrgArtList: TArtikelListe; KombiArt: integer);
var
  i: integer;
  ta: TArtikel;
begin
  for i := 0 to OrgArtList.Artikel.Count-1 do
  begin
    if (TArtikel(OrgArtList.Artikel[i]).Kombi = KombiArt) then
    begin
      ta := TArtikel.Create;
      ta.Idx         := TArtikel(OrgArtList.Artikel[i]).Idx;
      ta.Bezeichnung := TArtikel(OrgArtList.Artikel[i]).Bezeichnung;
      ta.ID          := TArtikel(OrgArtList.Artikel[i]).ID;
      ta.Preis       := TArtikel(OrgArtList.Artikel[i]).Preis;
      ta.Kombi       := TArtikel(OrgArtList.Artikel[i]).Kombi;
      SortArtList.Artikel.Add(ta);
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnResetOrderClick(Sender: TObject);
begin
  if not(ResetOrder) then
  begin
    btnResetOrder.Color := clGreen;
    ResetOrder := true;
  end
  else
  begin
    btnResetOrder.Color := clSilver;
    ResetOrder := false;
  end
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.UpdateTischValues(Tisch: TTisch);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('update tischex set wit=%d,hei=%d,inf=''%s'',pox=%d,poy=%d where rid=%d and num=%d',
                               [Tisch.Width,Tisch.Height,Tisch.Footer,Tisch.X,Tisch.Y,
                                TischLayout,Tisch.TischID]);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnPersOrderClick(Sender: TObject);
begin
  StornoAktiv     := false;
  btnStorno.Color := clSilver;

  AktTisch            := 0;
  AktRabatt           := 2;
  jvsb.Panels[2].Text := 'PERS';

  lbTischBestellungOffen.Clear;
  LoadOffeneBestelllung(AktTisch);

  ClearBestellListe;
  lbTisch.Caption := 'Personalbestellung';

  LoadArtikel(_BIER,tsBier);

  ActivatePage(tsBestellung);
  pcBestellung.ActivePage := tsBier;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.chklstBonSplitClick(Sender: TObject);
begin
  SaveBonSplit;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SaveBonSplit;
var
  q: TDBQuery;
  i: Integer;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    BonSplit := '';

    for i := 0 to chklstBonSplit.Items.count-1 do
      if (chklstBonSplit.Checked[i]) then
        BonSplit := BonSplit + IntToStr(Integer(chklstBonSplit.Items.Objects[i])) + ',';

    if (BonSplit <> '') then
    begin
      BonSplit := Copy(BonSplit,1,Length(BonSplit)-1);

      q := TDBQuery.Create;
      q.DBSql.Sql.Text := format('execute procedure upd_cfg(0,''BONSPLIT'',''%s'')',[BonSplit]);
      q.StartTransAction;
      q.DBSql.ExecSQL;
      q.DBSql.Close;
      q.Commit;
      q.Free;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.SetBestellButton;
begin
  bbNext   := TBestellButton.Create(pcBestellung);
  bbBack   := TBestellButton.Create(pcBestellung);

  bbKGNext := TBestellButton.Create(pcBestellung);
  bbKGBack := TBestellButton.Create(pcBestellung);

  bbKZNext := TBestellButton.Create(pcBestellung);
  bbKZBack := TBestellButton.Create(pcBestellung);

  InitBestellButton(bbNext);
  InitBestellButton(bbBack);

  InitBestellButton(bbKGNext);
  InitBestellButton(bbKGBack);

  InitBestellButton(bbKZNext);
  InitBestellButton(bbKZBack);

  bbNext.Caption  := StrWEITER;
  bbNext.PageMode := pmNext;

  bbBack.Caption  := '<< ZURÜCK';
  bbBack.PageMode := pmBack;

  bbKGNext.Caption  := StrWEITER;
  bbKGNext.PageMode := pmNext;

  bbKGBack.Caption  := '<< ZURÜCK';
  bbKGBack.PageMode := pmBack;

  bbKZNext.Caption  := StrWEITER;
  bbKZNext.PageMode := pmNext;

  bbKZBack.Caption  := '<< ZURÜCK';
  bbKZBack.PageMode := pmBack;

  bbKGBack.Parent := tsGrundlage;
  bbKGBack.Left   := tsGrundlage.Left + 415;
  bbKGBack.Top    := tsGrundlage.Top  + 200;
  bbKGNext.Parent := tsGrundlage;
  bbKGNext.Left   := tsGrundlage.Left + 510;
  bbKGNext.Top    := tsGrundlage.Top  + 200;

  bbKZBack.Parent := tsZusatz;
  bbKZBack.Left   := tsZusatz.Left + 415;
  bbKZBack.Top    := tsZusatz.Top  + 200;
  bbKZNext.Parent := tsZusatz;
  bbKZNext.Left   := tsZusatz.Left + 510;
  bbKZNext.Top    := tsZusatz.Top  + 200;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ResetLastKombiItem;
begin
  if Assigned(LastKombiItem) then LastKombiItem.Free;
  LastKombiItem       := TArtikelItem.Create;
  LastKombiItem.ArtID := -1;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.UpdateDatabase(Script: string): Boolean;
var
  mss: TStringStream;
  msl: TStringList;
  avers: integer;
  apa,dbName,sql: string;
begin
  result := true;
  avers  := 0;

  dbname := '';
  apa    := ExtractFilePath(ParamStr(0));

  if (FileExists(AppPath + 'gds32.dll')) then
    dbname := AppPath + 'frypos.fdb'
  else if (FileExists(AppPath + 'db\frypos.fdb')) then
    dbname := AppPath + 'db\frypos.fdb';

  mss := TStringStream.Create('');
  msl := TStringList.Create;

  if (dbName <> '') then
  begin
    // DDBC d.ConnectionName := dbName;
    d.Params.Database := dbName;
    d.Connected := True;

    try
      q.sql.Add('select gen_id(GEN_VERSION,0) from RDB$DATABASE');
      q.Transaction.StartTransaction;
      q.Open;
      // DDBC avers := q.Fields.AsInteger[0];
       avers := q.Fields[0].AsInteger;
    except
    end;

    q.Close;
    q.Transaction.Commit;

    if (DBVERS > avers) then
    begin
      sql := IntToStr(DBVERS) + '.dbv';

      if (FileExists(apa + sql)) then
      begin
        s.sql.LoadFromFile(apa + sql);

        try
          s.ExecSQL;
        except
          on e: exception do
          begin
            result := false;
            ErrorMsg(format('Fehler beim Datenbankupdate [#%d]!',[DBVERS]) + #10#13 + e.Message);
          end;
        end;
        d.Connected := false;
      end
      else
      begin
        result := false;
        if (JaNein(Format('ACHTUNG: ' + apa + sql + ' wurde nicht gefunden. ' + #10#13#10#13 +
                          'Die Programmversion [ %s ] paßt evtl. nicht zur Datenbankversion [ %d ].' +
                           #10#13#10#13 + ' fryPOS starten?',
                           [GetFileVersion,avers]))) then
          result := true;
      end;
    end;
  end;

  mss.Free;
  msl.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.rgBonMWSTClick(Sender: TObject);
begin
  SetCFG(0,'EINZELMWST',inttostr(rgBonMWST.ItemIndex));
  EinzelMWST := rgBonMWST.ItemIndex = 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbAbrPersClick(Sender: TObject);
begin
  SetCFG(0,'ABRPERS',inttostr(ord(cbAbrPers.Checked)));
  AbrPers := cbAbrPers.Checked;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.InitChefStat;
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select count(*) from abrechnung';
    q.StartTransAction;
    q.DBSql.Open;
    jvCSBack.Maximum := q.DBSql.Fields[0].AsInteger;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{ TStatListBox }
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
constructor TStatItem.Create(aOwner: TWinControl; aTop,aLeft: integer;
                             aOnDrawStatItem: TDrawItemEvent);
begin
  inherited Create;

  p := TPanel.Create(nil);
  h := TPanel.Create(nil);
  l := TListBox.Create(nil);

  p.DoubleBuffered := true;
  h.DoubleBuffered := true;

  p.Parent      := aOwner;
  p.Top         := aTop;
  p.Left        := aLeft;
  p.Width       := 193;
  p.Height      := 150;
  p.BevelInner  := bvNone;
  p.BevelOuter  := bvRaised;
  p.BorderStyle := bsNone;

  h.Color       := clInfoBk;
  h.Parent      := p;
  h.Align       := alTop;
  h.Height      := 15;
  h.Font.Size   := 8;
  h.Font.Style  := [fsBold];
  h.Caption     := 'Header';
  h.BevelInner  := bvNone;
  h.BevelOuter  := bvNone;
  h.BorderStyle := bsNone;

  l.Parent      := p;
  l.Align       := alClient;
  l.Font.Size   := 8;
  l.Font.Style  := [];
  l.Style       := lbOwnerDrawFixed;
  l.OnDrawItem  := aOnDrawStatItem;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TStatItem.Destroy;
begin
  l.Free;
  h.Free;
  p.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.DrawStatItem(Control: TWinControl; Index: Integer;
                                    Rect: TRect; State: TOwnerDrawState);
var
  aLeft,aright: integer;
  b,s: string;
begin
  with (Control as TListBox) do
  begin
    if ((Index mod 2) = 0) then
    begin
      if (odSelected in State) then Canvas.Brush.Color := clHighlight
      else                          Canvas.Brush.Color := $A8FAFA;
    end;

    Canvas.FillRect(Rect);

    s := Items[Index];

    b := copy(s,1,pos('=',s)-1);
    s := copy(s,pos('=',s)+1,length(s));

    aLeft := Rect.Left + 2;

    Canvas.TextOut(aLeft,Rect.Top,b);

    aRight := Rect.Right - Rect.Left - Canvas.TextWidth(s) - 3;
    Canvas.TextOut(aRight,Rect.Top,s);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.SetAktZR(Liste,ZR,LastZR: integer): boolean;
begin
  result := false;

  case Liste of
    0: result := false;
    1: result := ZR = YearOf(now);
    2: result := ZR = MonthOf(now);
    3: result := ZR = WeekOf(now);
    4,40:
    begin
      if (rgCSDay.ItemIndex = 0) then result := ZR = DayOfWeek(now)-1
      else                            result := ((ZR div 100000000) = DayOfWeek(now)-1);
    end;
    5,50: result := ZR = strtoint(formatdatetime('hh',now));
    60: try
          result := ZR = DayOfWeek(StrToDateTime(MakeDate(ZR mod 100000000)))-1;
        except
          result := false;
        end;
    100: result := false;
    1000: result := (((ZR div 100) <> (LastZR div 100)) and ((LastZR div 100) < 1000));
    2000: result := false;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
const
  Tage: array[0..6] of string  = ('Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag');
  sTage: array[0..6] of string = ('So.','Mo.','Di.','Mi.','Do.','Fr.','Sa.');

  Monate: array[1..12] of string = ('Januar','Februar','März','April','Mai','Juni',
                                    'Juli','August','September','Oktober','November','Dezember');

  KatName: array[100..107] of string = ('AFG','Bier','Kaffee','Cocktails','Longdrinks Kombi',
                                        'Aperitif / Spirituosen','Essen','Champagner / Sekt');

function TfrmfryPos.SetStatCaption(Liste,ZR: integer): string;
var
  tZR: integer;
begin
  case Liste of
    0: result    := 'Gesamt';
    1: result    := inttostr(ZR);
    2: result    := Monate[ZR];
    3: result    := 'Woche ' + inttostR(ZR);
    4,40:
    begin
      if (rgCSDay.ItemIndex = 0) then
      begin
        if (Liste = 40) then result := 'Gesamt'
        else                 result := Tage[ZR];
      end
      else
      begin
        if (Liste = 40) then result := 'Gesamt'
        else                 result := sTage[(ZR div 100000000)] + ' ' + MakeDateSmall(ZR mod 100000000);
      end;
    end;
    5,50: result := format('%2.2d:00-%2.2d:59',[ZR,ZR]);
    60:   result := sTage[DayOfWeek(StrToDateTime(MakeDate(ZR mod 100000000)))-1]  + ' ' +
                    MakeDateSmall(ZR mod 100000000);
    100:  if (ZR in [100..107]) then result := KatName[ZR]
          else                       result := 'Kategorie ' + inttostr(ZR);
    1000:
    begin
      if (ZR > 99999) then tZR := ZR div 1000
      else                 tZR := ZR mod 10;

      case tZR of
            105: result := 'Regulär';
            104: result := 'Rabatt';
            103: result := 'Frei';
            102: result := 'Personal';
            101: result := 'Verlust';
            100: result := 'Storno';
            5: result := 'Regulär-' + KatName[ZR div 100];
            4: result := 'Rabatt-' + KatName[ZR div 100];
            3: result := 'Frei-' + KatName[ZR div 100];
            2: result := 'Personal-' + KatName[ZR div 100];
            1: result := 'Verlust-' + KatName[ZR div 100];
            0: result := 'Storno-' + KatName[ZR div 100];
          end;
    end;
    2000: result := format('Tisch %d',[ZR]);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnCSGSClick(Sender: TObject);
var
  si: TStatItem;
  c,w,i,l,sm,sv,t,
  gm,gv,abr,lzr: integer;
  MenWert,s,pv: string;
  q: TDBQuery;
begin
  if ((Sender as TButton).Tag < 1000) then cbProz.Checked := false;
  panStatName.Caption := (Sender as TButton).Caption;

  w := jvSBStat.Width div 193;

  StatList.Clear;

  LockWindowUpdate(jvSBStat.Handle);

  if (GlobalDB.GDB.Connected) then
  begin
    i  := 0;
    t  := 0;
    c  := 0;
    sm := 0;
    sv := 0;
    gm := 0;
    gv := 0;

    panStatSB.Height := (t+1) * 155;

    si := TStatItem.Create(jvSBStat,2+(t*150),2+(i*193),DrawStatItem);
    StatList.Liste.Add(si);
    TStatItem(StatList.Liste[c]).l.OnDblClick := PersPanelPrint;

    if (rgStatOpt.ItemIndex = 0) then MenWert := 'men'
    else                              MenWert := 'val';

    if ((Sender as TButton).Tag = 100) then ABR := jvPenner.Value
    else                                    ABR := jvCSBack.Value;

    q := TDBQuery.Create;

    q.DBSql.Sql.Text := format('select zer,aid,bez,sum(men) as men,sum(val) as val ' +
                                ' from zr_stat(%d,%d,%d) ' +
                               ' group by zer,aid,bez ' +
                               ' order by zer desc,%s desc,bez collate de_de',
                               [(Sender as TButton).Tag, ABR, rgCSDay.ItemIndex-1, MenWert]);
    q.StartTransAction;
    q.DBSql.Open;

    l := q.DBSql.FieldByName('ZER').AsInteger;

    if (l = 999999999) then
    begin
      TStatItem(StatList.Liste[c]).h.Caption := 'Gesamt';
      TStatItem(StatList.Liste[c]).h.Color   := clTeal;
      TStatItem(StatList.Liste[c]).l.Hint    := TStatItem(StatList.Liste[c]).h.Caption;
    end
    else
    begin
      TStatItem(StatList.Liste[c]).h.Caption := SetStatCaption((Sender as TButton).Tag,l);
      TStatItem(StatList.Liste[c]).l.Hint    := TStatItem(StatList.Liste[c]).h.Caption;
    end;

    if (SetAktZR((Sender as TButton).Tag,l,-1)) then
      TStatItem(StatList.Liste[c]).h.Color := clMoneyGreen;

    while not(q.DBSql.Eof) do
    begin
      if (l <> q.DBSql.FieldByName('ZER').AsInteger) then
      begin
        lzr := l;
        if (lzr = 100000) then lzr := -1;

        if (cbSummen.Checked) then
        begin
          if (gm > 0) then
            pv := Format('%.2f',[(sm / gm) * 100.0]) + '%';

          if ((cbProz.Checked) and (l <> 999999999)) then
            s := ' [' + pv + '] ' + TStatItem(StatList.Liste[c]).h.Caption +
                 ' [' + Format('%.2f',[(sv / gv) * 100.0]) + '%' + ']'
          else
            s := ' [' + inttostr(sm) + '] ' + TStatItem(StatList.Liste[c]).h.Caption +
                 ' [' + MakePreis(sv,false) + ']';

          if (length(s) > 32) then TStatItem(StatList.Liste[c]).h.Font.Size := 6
          else                     TStatItem(StatList.Liste[c]).h.Font.Size := 8;
          TStatItem(StatList.Liste[c]).h.Caption := s;
        end;

        sv := 0;
        sm := 0;

        inc(c);
        inc(i);

        if (i > w-1) then
        begin
          i := 0;
          inc(t);
          panStatSB.Height := (t+1) * 155;
        end;

        si := TStatItem.Create(jvSBStat,2+(t*150),2+(i*193),DrawStatItem);
        StatList.Liste.Add(si);
        TStatItem(StatList.Liste[c]).l.OnDblClick := PersPanelPrint;

        l := q.DBSql.FieldByName('ZER').AsInteger;

        TStatItem(StatList.Liste[c]).h.Caption := SetStatCaption((Sender as TButton).Tag,l);
        TStatItem(StatList.Liste[c]).l.Hint    := TStatItem(StatList.Liste[c]).h.Caption;

        if (SetAktZR((Sender as TButton).Tag,l,lzr)) then
          TStatItem(StatList.Liste[c]).h.Color := clMoneyGreen;
      end;

      sm := sm + q.DBSql.FieldByName('MEN').AsInteger;
      sv := sv + q.DBSql.FieldByName('VAL').AsInteger;

      if (l = 999999999) then
      begin
        gm := gm + q.DBSql.FieldByName('MEN').AsInteger;;
        gv := gv + q.DBSql.FieldByName('VAL').AsInteger;;
      end;

      if (rgStatOpt.ItemIndex = 0) then
      begin
        if (gm > 0) then
          pv := Format('%.2f',[(q.DBSql.FieldByName('MEN').AsInteger / gm) * 100.0]) + '%';

        if ((cbProz.Checked) and (l <> 999999999)) then
          TStatItem(StatList.Liste[c]).l.Items.Add(q.DBSql.FieldByName('BEZ').AsString + '=' + pv)
        else
          TStatItem(StatList.Liste[c]).l.Items.Add(q.DBSql.FieldByName('BEZ').AsString + '=' +
                                                   q.DBSql.FieldByName('MEN').AsString);
      end
      else
      begin
        if (gv > 0) then
          pv := Format('%.2f',[(q.DBSql.FieldByName('VAL').AsInteger / gv) * 100.0]) + '%';

        if ((cbProz.Checked) and (l <> 999999999)) then
          TStatItem(StatList.Liste[c]).l.Items.Add(q.DBSql.FieldByName('BEZ').AsString + '=' + pv)
        else
          TStatItem(StatList.Liste[c]).l.Items.Add(q.DBSql.FieldByName('BEZ').AsString + '=' +
                                                   MakePreis(q.DBSql.FieldByName('VAL').AsInteger,false));
      end;

      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    if (cbSummen.Checked) then
    begin
      if (gm > 0) then
        pv := Format('%.2f',[(sm / gm) * 100.0]) + '%';

      if ((cbProz.Checked) and (l <> 999999999)) then
        s := ' [' + pv + '] ' + TStatItem(StatList.Liste[c]).h.Caption +
             ' [' + Format('%.2f',[(sv / gv) * 100.0]) + '%' + ']'
      else
        s := ' [' + inttostr(sm) + '] ' + TStatItem(StatList.Liste[c]).h.Caption +
             ' [' + MakePreis(sv,false) + ']';

      TStatItem(StatList.Liste[c]).h.Caption := s;
    end;
  end;

  LockWindowUpdate(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TStatListBoxList }
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TStatList.Clear;
var
  i: integer;
begin
  for i := 0 to Liste.Count-1 do
    TStatItem(Liste[i]).Free;

  Liste.Clear;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
constructor TStatList.Create;
begin
  inherited;
  Liste := TList.Create;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TStatList.Destroy;
begin
  Clear;
  Liste.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbTitleBarClick(Sender: TObject);
begin
  SetCFG(0,'TITLEBAR',inttostr(ord(cbTitleBar.Checked)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.ResizeComponents;
var
  w,ww: integer;
begin
  w  := panAbrechnen.Width + 10;
  ww := w div 5;

  panZ.Width  := ww;
  panE.Width  := ww;
  panV.Width  := ww;
  panVS.Width := ww;
  panK.Width  := ww;

  w  := panPersonalStat.Width + 10;
  ww := w div 5;

  panPSUG.Width := ww;
  panPSVH.Width := ww;
  panPSVF.Width := ww;
  panPSMH.Width := ww;
  panPSMF.Width := ww;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure PaintControl( aControl: TWinControl; aCanvas: TCanvas; offsetx, offsety: Integer );
Begin
  SaveDC( aCanvas.handle );
  try
    SetWindowOrgEx( aCanvas.handle,
                    -(acontrol.left + offsetx),
                    -(acontrol.top + offsety),
                    nil );
    acontrol.perform( wm_print,
                      acanvas.handle,
                      PRF_CHILDREN or PRF_CLIENT or PRF_NONCLIENT or
                      PRF_ERASEBKGND );
  finally
    RestoreDC( aCanvas.handle, -1 );
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.PrintScrollBox;
var
  bmp: TBitmap;
  i: integer;
  DC: HDC;
begin
  bmp := TBitmap.Create;

  DC := GetDC(HWND_DESKTOP);
  try
    bmp.width  := jvSBStat.HorzScrollBar.Range div 2;
    bmp.height := jvSBStat.VertScrollBar.Range div 2;
    bmp.canvas.lock;

    SetMapMode( bmp.canvas.handle, MM_ISOTROPIC);
    SetWindowExtEx(bmp.canvas.handle, 200, 200, nil);
    SetViewportExtEx(bmp.canvas.handle, 100, 100, nil);

    try
      SetWindowOrgEx(bmp.canvas.handle,-jvSBStat.HorzScrollBar.Position,
                      -jvSBStat.VertScrollBar.Position,nil );

      jvSBStat.Perform(WM_PAINT,bmp.canvas.handle, 1);
      SetWindowOrgEx( bmp.canvas.handle, 0, 0, nil );

      for i:= 0 to jvSBStat.controlcount-1 do
        If jvSBStat.Controls[i] is TWincontrol then
          Paintcontrol(TWinControl(jvSBStat.Controls[i]),bmp.canvas,
                      jvSBStat.horzscrollBar.Position,jvSBStat.vertScrollBar.Position );
    finally
      bmp.canvas.unlock;
    end;
      bmp.SaveToFile('stat.bmp');
  finally
    begin
      ReleaseDC(HWND_DESKTOP, DC);
      bmp.free;
    end;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnPrintStatClick(Sender: TObject);
begin
  PrintScrollBox;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnLoadBGClick(Sender: TObject);
var
  od: TOpenDialog;
begin
  od := TOpenDialog.Create(nil);
  od.Execute;

  if (od.FileName <> '') then
  begin
    try
      jvBG.Image.Picture.LoadFromFile(od.FileName);
      SetCFG(0,'BACKGROUND',od.FileName);
    except
    end;
  end;
  od.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.jvPennerChangedValue(Sender: TObject; NewValue: Integer);
begin
  lbCSP.Caption := 'Gesamtverkauf weniger als ' + inttostr(jvPenner.Value);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.jvCSBackChangedValue(Sender: TObject; NewValue: Integer);
begin
  lbCSZ.Caption := format('Anzeige der letzten %d Z-Abr.',[jvCSBack.Value]);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.jvClockDblClick(Sender: TObject);
begin
  if (jvClock.ShowMode = scAnalog) then jvClock.ShowMode := scDigital
  else                                  jvClock.ShowMode := scAnalog;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.cbStornoClick(Sender: TObject);
begin
  SetCFG(0,'STORNO',inttostr(ord(cbStorno.Checked)));
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.GetArtValMen(ArtId: integer);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select ken,men,ums from art_stat(%d)',[ArtId]);
    q.StartTransAction;
    q.DBSql.Open;

    while not(q.DBSql.Eof) do
    begin
      case q.DBSql.Fields[0].AsInteger of
        0: begin
             lbArtUG.Caption := MakePreis(q.DBSql.Fields[2].AsInteger);
             lbArtMG.Caption := q.DBSql.Fields[1].AsString;
           end;
       10: begin
             lbArtUA.Caption := MakePreis(q.DBSql.Fields[2].AsInteger);
             lbArtMA.Caption := q.DBSql.Fields[1].AsString;
           end;
       20: begin
             lbArtUW.Caption := MakePreis(q.DBSql.Fields[2].AsInteger);
             lbArtMW.Caption := q.DBSql.Fields[1].AsString;
           end;
       30: begin
             lbArtUM.Caption := MakePreis(q.DBSql.Fields[2].AsInteger);
             lbArtMM.Caption := q.DBSql.Fields[1].AsString;
           end;
       40: begin
             lbArtUJ.Caption := MakePreis(q.DBSql.Fields[2].AsInteger);
             lbArtMJ.Caption := q.DBSql.Fields[1].AsString;
           end;
       end;

      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.httpCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
                                      AResponseInfo: TIdHTTPResponseInfo);
var
  s: string;                                      
begin
  if (ARequestInfo.AuthExists) then
  begin
    if ((ARequestInfo.AuthUsername = 'frypos') and
        (ARequestInfo.AuthPassword = 'frypos')) then
    begin
      s := BuildWebPage(1);
      AResponseInfo.ContentText := s;
    end
    else if ((ARequestInfo.AuthUsername = 'em' + inttostr(DatAsInt) + 'pe') and
             (ARequestInfo.AuthPassword = 'em' + formatdatetime('hh',now) + 'pe')) then
    begin
      s := BuildWebPage(0);
      AResponseInfo.ContentText := s;
    end
    else
      AResponseInfo.ContentText := GetPageAndStyle + '<p class="v">'+ 'Verbindung gestört...' + '</p>';
  end
  else
    AResponseInfo.AuthRealm := 'webfryPOS'
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnTestClick(Sender: TObject);
begin
  if not(http.Active) then
  begin
    ShowMessage('Nach dem Aktivieren der Remotestatistikfuntion nimmt fryPOS auf Port 52323 Verbindungen entgegen.' +
                #10#13#10#13 +
                'Unter Umständen wird sich Windows melden und fragen ob dieser Port freigeschaltet werden soll.' +
                #10#13 + 'Um eine Verbindung zu gewährleisten bitte Bestätigen.');
  end;

  http.Active := not http.Active;

  if (http.Active) then btnTest.Font.Style := [fsBold]
  else                  btnTest.Font.Style := [];
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.BuildWebPage(UserRang: integer): string;
var
  Version,Datum,
  Html,Body: string;
begin
  Version := format('<p class="v">fryPOS %s Datenbank %d-%d </p>',
                    [AppVersion,DBVers,UserRang]);
  Datum   := format('<p class="v1">%s, %s ( lokal )</p>',
                    [FormatDateTime('dddd, d. mmmm yyyy',now),FormatDateTime('hh:mm:ss',now)]);

  Html := GetPageAndStyle;
  Body := '<body> ' + Version + Datum + BuildHtml + '</body>';
  Html := Html + Body + '</html>';

  result := Html;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetPageAndStyle: string;
begin
  result := '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"'             +
            ' "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'                +
            ' <html xmlns="http://www.w3.org/1999/xhtml" > '                             +
            ' <head> '                                                                   +
             ' <title>webfryPOS</title> '                                              +
              '<style> '                                                                 +
                 '.v {text-align:center; font:bold 14pt arial; color:#fefcfd; '          +
                     'border:1px solid black; background-color:#794d2a;} '               +
                 '.v1 {text-align:center; font:bold 8pt arial; color:#fffffff;} '        +
                 '.v2 {text-align:center; font:bold 12pt arial; color:#fffffff;} '       +
                 '.t1 { font:normal 12pt arial; color:navy; border:1px solid black; } '  +
                 '.t1 td {} '                                                            +
                 '.p { background-color:#ffffa0; border-bottom:2px solid #808040; } '    +
                 '.r { text-align:right; padding-left:14px;} '                           +
                 '.l { text-align:left; } '                                              +
                 '.c { text-align:center; } '                                            +
                 '.rosa { background-color:#6ee06e; } '                                  +
                 '.tbl1 { width:190px; height:308px; overflow:auto; position:absolute; top:115px; left:10px;} ' +
                 '.tbl2 { width:190px; height:308px; overflow:auto; position:absolute; top:115px; left:240px; }' +
                 '.tbl3 { width:190px; height:308px; overflow:auto; position:absolute; top:115px; left:470px; }' +
                 '.tbl4 { width:190px; height:308px; overflow:auto; position:absolute; top:115px; left:700px; }' +
               '</style> '                                                               +
            '</head> ';
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.BuildHtml: string;
var
  ht: THtmlTable;
  i: integer;
  q: TDBQuery;
begin
  result := '';

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select LVA,RVA from HTML_EXPORT(0)';
    q.StartTransAction;
    q.DBSql.Open;

    result := format('<p class="v2">%s aktuell %s</p>',
                    [trim(q.DBSql.FieldByName('LVA').AsString),
                     MakePreis(strtointdef(q.DBSql.FieldByName('RVA').AsString,0),true)]);

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;

  i := 1;

  ht.cDIV   := 'tbl' + inttostr(i);
  ht.cTBL   := 't1';
  ht.cHEAD  := 'p';
  ht.cROW   := 'rosa';
  ht.cLEFT  := 'l';
  ht.cRIGHT := 'r';
  ht.nTBL   := 'aktuell Personal';
  ht.nLEFT  := 'Name';
  ht.nRIGHT := 'angemeldet';
  ht.Mode   := 1;

  result := result + HtmlTable2Html(ht);

  i := 2;

  ht.cDIV   := 'tbl' + inttostr(i);
  ht.cTBL   := 't1';
  ht.cHEAD  := 'p';
  ht.cROW   := 'rosa';
  ht.cLEFT  := 'l';
  ht.cRIGHT := 'r';
  ht.nTBL   := 'aktuell Personalumsatz';
  ht.nLEFT  := 'Name';
  ht.nRIGHT := 'Umsatz';
  ht.Mode   := 2;

  result := result + HtmlTable2Html(ht);

  i := 3;

  ht.cDIV   := 'tbl' + inttostr(i);
  ht.cTBL   := 't1';
  ht.cHEAD  := 'p';
  ht.cROW   := 'rosa';
  ht.cLEFT  := 'l';
  ht.cRIGHT := 'r';
  ht.nTBL   := 'aktuell Stundenumsatz';
  ht.nLEFT  := 'Stunde';
  ht.nRIGHT := 'Umsatz';
  ht.Mode   := 3;

  result := result + HtmlTable2Html(ht);

  i := 4;

  ht.cDIV   := 'tbl' + inttostr(i);
  ht.cTBL   := 't1';
  ht.cHEAD  := 'p';
  ht.cROW   := 'rosa';
  ht.cLEFT  := 'l';
  ht.cRIGHT := 'r';
  ht.nTBL   := '7 Z-Abr. zurück';
  ht.nLEFT  := 'Tag';
  ht.nRIGHT := 'Umsatz';
  ht.Mode   := 4;

  result := result + HtmlTable2Html(ht);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.HtmlTable2Html(HT: THtmlTable): string;
var
  v: integer;
  l,r,d: string;
  q: TDBQuery;
begin
  result := '';

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select LVA,RVA from HTML_EXPORT(%d)',[HT.Mode]);
    q.StartTransAction;
    q.DBSql.Open;

    d := '';

    while not(q.DBSql.Eof) do
    begin
      l := trim(q.DBSql.FieldByName('LVA').AsString);
      r := trim(q.DBSql.FieldByName('RVA').AsString);

      case HT.Mode of
        2: r := MakePreis(strtointdef(r,0),true);
        3:
        begin
          v := strtointdef(l,0);
          l := format('%2.2d:00-%2.2d:59',[v,v]);
          r := MakePreis(strtointdef(r,0),true);
        end;
        4:
        begin
          v := StripStr2Num(copy(l,1,10));

          if (v = DatAsInt) then l := 'Aktuell'
          else                   l := MakeDateSmall(v);

          r := MakePreis(strtointdef(r,0),true);
        end;
      end;

      d := d + format('<tr class="%s"><td>%s</td><td class="%s">%s</td></tr>',[HT.cROW,l,HT.cRIGHT,r]);
      q.DBSql.Next;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;

    result := format('<div class="%s">' +
                     '<table class="%s" cellpadding="2" cellspacing="2">' +
                     '<tr>'                                               +
                     '<th colspan="2" class="%s">%s</th>'                 +
                     '</tr>'                                              +
                     '<tr class="%s">'                                    +
                     '<th class="%s">%s</th>'                             +
                     '<th class="%s">%s</th>'                             +
                     '</tr>'                                              +
                     '%s'                                                 +
                     '</table></div>',
                     [HT.cDIV,HT.cTBL,HT.cHEAD,HT.nTBL,HT.cROW,HT.cLEFT,HT.nLEFT,HT.cRIGHT,HT.nRIGHT,d]);
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.httpConnect(AContext: TIdContext);
begin
  MessageBeep(0);
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnResClick(Sender: TObject);
var
  TischRes: TTischListe;
  wF: extended;
  tr: TRes;
  q: TDBQuery;
begin
  tr := TRes.Create;

  frmReservierung     := TfrmReservierung.Create(nil);
  frmReservierung.Res := tr;

  TischRes := TTischListe.Create;
  wF := (tsTisch.Width / frmReservierung.panRes2.Width);

  CreateTische(TischRes,frmReservierung.panRes2,TischLayout,wF);
  TischRes.SetReserviert(true);
  TischRes.SetTischAuswahl(frmReservierung.TischAuswahl);

  frmReservierung.Tische := TischRes;
  frmReservierung.ShowModal;
  frmReservierung.Release;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('insert into res (TNR,NAM,TEL,INF,PER,DAU,DAT,TIM,STA) ' +
                               'values(%d,''%s'',''%s'',''%s'',%d,%d,%d,%d,%d)',
                               [tr.Tisch,tr.Name,tr.Tel,tr.Notiz,tr.Personen,tr.Dauer,tr.Dat,tr.Tim,tr.Status]);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;

  TischRes.Free;
  tr.Free;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetAktRabattFromDB: integer;
var
  q: TDBQuery;
begin
  result := 0;

  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'select first(1) rabatt_rab ' +
                         ' from rabatt ' +
                        ' where rabatt_abn <= gen_id(gen_bestellung,0)+1 ' +
                          ' and rabatt_art = 1 ' +
                        ' order by rabatt_abn desc';
    q.StartTransAction;
    q.DBSql.Open;

    if not(q.DBSql.Eof) then
      result := q.DBSql.Fields[0].AsInteger;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TfrmfryPos.GetAktRabattStrFromDB(VonIID, BisIID: integer): string;
var
  q: TDBQuery;
  sVonIID,sBisIID: string;
begin
  result := '';

  if (GlobalDB.GDB.Connected) then
  begin
    sVonIID := format('(select first(1) rabatt_abn ' +
                        ' from rabatt ' +
                       ' where rabatt_abn <= %d ' +
                       ' order by rabatt_abn desc) ',[VonIID]);

    if (BisIID > 0) then sBisIID := inttostr(BisIID)
    else                 sBisIID := 'gen_id(gen_bestellung,0)';

    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('select min(rabatt_rab),max(rabatt_rab) ' +
                                ' from rabatt ' +
                               ' where rabatt_abn between %s and %s ' +
                                 ' and rabatt_art = 1',
                               [sVonIID,sBisIID]);
    q.StartTransAction;
    q.DBSql.Open;

    if not(q.DBSql.Eof) then
    begin
      if (q.DBSql.Fields[0].AsInteger <> q.DBSql.Fields[1].AsInteger) then
        result := q.DBSql.Fields[0].AsString + '-' + q.DBSql.Fields[1].AsString
      else
        result := q.DBSql.Fields[0].AsString;
    end;

    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;

  if (result <> '') then result := result + '%';
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPOS.rgHausRabattClick(Sender: TObject);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := 'execute procedure upd_rabatt(1,' + inttostr((rgHausRabatt.ItemIndex+1) * 5) + ')';
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TfrmfryPos.btnFirmSaveClick(Sender: TObject);
var
  q: TDBQuery;
begin
  if (GlobalDB.GDB.Connected) then
  begin
    q := TDBQuery.Create;
    q.DBSql.Sql.Text := format('update firma set bez = ''%s'', nna = ''%s'', vna = ''%s'',' +
                               ' str = ''%s'', hau = ''%s'', plz = ''%s'', ' +
                               ' ort = ''%s'', tel = ''%s'', fax = ''%s'',' +
                               ' mob = ''%s'', stn = ''%s''',
                               [edFirmBez.Text,edFirmNN.Text,edFirmVN.Text,
                                edFirmStr.Text,edFirmHN.Text,edFirmPLZ.Text,
                                edFirmOrt.Text,edFirmTel.Text,edFirmFax.Text,
                                edFirmMobil.Text,edFirmSN.Text]);
    q.StartTransAction;
    q.DBSql.ExecSQL;
    q.DBSql.Close;
    q.Commit;
    q.Free;
  end;
end;

initialization

  fryPOSHandle := CreateMutex(nil,True,'mtxfrypos');

  if (GetLastError = ERROR_ALREADY_EXISTS) then
  begin
    ErrorMsg('fryPOS ist schon gestartet!');
    Application.Terminate;
  end;

finalization
  if (fryPOSHandle <> 0) then CloseHandle(fryPOSHandle);

end.
