unit uconexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, vcl.Forms;


type
  TConexao = class
  private
    FConn: TFDConnection;
  public
    constructor Create();
    destructor Destroy; override;
    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

implementation

{ TConexao }


constructor TConexao.Create();
begin
  FConn := TFDConnection.Create(nil);

  FConn.Params.Add('Database=' +  ExtractFilePath(Application.exename)+ 'DB\posto_abc.db');
  FConn.Params.Add('DriverID=SQLite');
  FConn.LoginPrompt := False;
  FConn.Connected;
end;

function TConexao.CriarQuery: TFDQuery;
var
  vQuery: TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := FConn;
  Result := vQuery;
end;

destructor TConexao.Destroy;
begin
  FConn.Connected := False;
  FConn.Close;
  FreeAndNil(FConn);
  inherited;
end;

function TConexao.getConn: TFDConnection;
begin
  Result := FConn;
end;

end.

