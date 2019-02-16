unit uDB;
{MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM
 Unit Name: udb.pas
 Author:    Mark Przybylo
 Date:      01.09.2002
 Purpose:

 History:
 -------------------------------------------------
  2006.03.15 (mp): aus openfigaro übernommen
                   DBInfo
                   diverses
MNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMN}
interface

uses
  FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.FMTBcd,
  Data.SqlExpr, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,

  FireDAC.Phys.IBDef;

{
  FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.FMTBcd,
  Data.SqlExpr, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase;

type
  TForm1 = class(TForm)
    FDIBInfo1: TFDIBInfo;
    FDTransaction1: TFDTransaction;
    FDConnection1: TFDConnection;
    SQLQuery1: TSQLQuery;
    SQLStoredProc1: TSQLStoredProc;
}

const
  _EA = '''';

type

  TDBQuery = class
  private
  public
    DBTA: TFDTransaction;
    DBSql: TFDQuery;

    constructor Create;
    destructor  Destroy; override;

    procedure Commit;
    procedure RollBack;
    procedure StartTransAction;
  end;

  TDB = class
  private
    fDB: TFDConnection;
    fTA: TFDTransaction;
    fSql: TFDQuery;
    fDBInfo: TFDIBInfo;
    fDBEvent:TFDEventAlerter;

    fAktDatabase: string;
    fAktPassWord: string;

  public
    constructor Create;
    destructor  Destroy; override;

    function DBConnect(DBName,Pass: string): integer;
    function DBDisConnect: integer;
    function DBCreateQuery: TFDQuery;
    function DBDestroyQuery: integer;

    property GDB: TFDConnection read fDB;
    property Query: TFDQuery read fSql write fSql;
    property TransAction: TFDTransaction read fTA write fTA;
    property AktDatabase: string read fAktDatabase write fAktDatabase;
    property AktPassWord: string read fAktPassWord write fAktPassWord;
    property DBInfo: TFDIBInfo read fDBInfo;
    property DBEvent: TFDEventAlerter read fDBEvent;
  end;

var
  GlobalDB: TDB;

implementation

{ TDB }

constructor TDB.Create;
begin
  fDB                 := TFDConnection.Create(nil);
  fDB.LoginPrompt     := false;

  fTA                 := TFDTransaction.Create(nil);
  fTA.Connection      := fDB;

  fSql                := TFDQuery.Create(nil);
  fSql.Connection      := fDB;
  fSql.Transaction    := fTA;

  fDBInfo             := TFDIBInfo.Create(nil);
  // fDBInfo.Connection      := fDB;

  fDBEvent            := TFDEventAlerter.Create(nil);
  fDBEvent.Connection      := fDB;

  fDB.Transaction := fTA;

  fAktDatabase := '';
  fAktPassWord := '';

  fDB.Params.Add('user_name=sysdba');

  fDB.Params.Add('lc_ctype=ISO8859_1');
  // DDBC fDB.SQLDialect   := 3;
  // DDBC fDB.DatabaseName := fAktDatabase;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TDB.DBConnect(DBName, Pass: string): integer;
begin
  result := 0;

  if (assigned(fDB)) then
  begin
    try
      //*************************************
      fDB.DriverName := 'IB';
      with fDB.Params as TFDPhysIBConnectionDefParams do
      begin
        Protocol := ipTCPIP;
        Server := '127.0.0.1';
        Database := 'C:\Proyectos\POSSrc\frypos_src_20070919\db\frypos.fdb';
        UserName := 'sysdba';
        Password := 'masterkey';
      end;
      fDB.Connected := True;
      //*************************************
      {
      fDB.Params.Add('password='+Pass);
      // DDBC fDB.DatabaseName := DBName;
      fAktDatabase     := DBName;
      fAktPassWord     := Pass;
      fDB.Open;
      }
      result := 1;
    except
    end;
  end;
end;

{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TDB.DBCreateQuery: TFDQuery;
begin
  result := nil;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TDB.DBDestroyQuery: integer;
begin
  result := 0;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
function TDB.DBDisConnect: integer;
begin
  result := 0;

  if (fDB.Connected) then
  begin
    // DDBC if (fTA.InTransaction) then fTA.Commit;
    // DDBC fDB.ForceClose;
    result := 1;
  end;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TDB.Destroy;
begin
  // DDBC if (fTA.InTransaction) then fTA.Commit;

  fSql.Free;
  fTA.Free;
  fDBInfo.Free;
  fDBEvent.Free;
  
  // DDBC if (fDB.Connected) then fDB.ForceClose;
  fDB.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
{ TDBQuery }
constructor TDBQuery.Create;
begin
  DBTA                 := TFDTransaction.Create(nil);
  DBTA.Connection      := GlobalDB.fDB;

  DBSql                := TfdQuery.Create(nil);
  DBSql.Connection     := GlobalDB.fDB;
  DBSql.Transaction    := DBTA;

  if (GlobalDB.fDB.Connected) then DBTA.StartTransaction;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
destructor TDBQuery.Destroy;
begin
  // DDBC if (DBTA.InTransaction) then
  //  DBTA.Commit;
  DBSql.Free;
  DBTA.Free;
  inherited;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TDBQuery.Commit;
begin
  // DDBC if (DBTA.InTransaction) then DBTA.Commit;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TDBQuery.RollBack;
begin
  // DDBC if (DBTA.InTransaction) then DBTA.RollBack;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
procedure TDBQuery.StartTransAction;
begin
  // DDBC if not(DBTA.InTransaction) then DBTA.StartTransaction;
end;
{MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM}
initialization
  GlobalDB := TDB.Create;

finalization
  GlobalDB.Free;

end.
