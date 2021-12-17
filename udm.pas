unit udm;

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
  Tdm1 = class(TDataModule)
    Conexao: TFDConnection;
    tbTanques: TFDTable;
    dsTanques: TDataSource;
    tbTanquesID: TFDAutoIncField;
    dsBombas: TDataSource;
    tbBombas: TFDQuery;
    tbBombasTanqueNR: TFDAutoIncField;
    tbBombasCombustivel: TStringField;
    tbBombasBombaNr: TIntegerField;
    tbBombasID: TFDAutoIncField;
    tbProdutos: TFDQuery;
    dsProdutos: TDataSource;
    tbProdutosID: TFDAutoIncField;
    tbProdutosdescricao: TStringField;
    tbProdutosbomba: TIntegerField;
    tbProdutosvalorunitario: TBCDField;
    tbProdutosimposto: TBCDField;
    tbBombasListaBomba: TWideStringField;
    tbAbastecimentos: TFDQuery;
    dsAbastecimento: TDataSource;
    tbProdutoslistaProduto: TWideStringField;
    tbTanquescombustivel: TStringField;
    tbProdutosbombaNr: TIntegerField;
    tbAbastecimentosID: TFDAutoIncField;
    tbAbastecimentosbomba: TIntegerField;
    tbAbastecimentostanque: TIntegerField;
    tbAbastecimentosproduto: TIntegerField;
    tbAbastecimentosdescricao: TStringField;
    tbAbastecimentosimposto: TBCDField;
    tbAbastecimentosquantidade: TBCDField;
    tbAbastecimentosvalor: TBCDField;
    tbAbastecimentostotal: TBCDField;
    tbAbastecimentosexcluido: TStringField;
    tbAbastecimentosvlrimposto: TFloatField;
    tbAbastecimentosRel: TFDQuery;
    dsAbastecimentosRel: TDataSource;
    tbAbastecimentosRelID: TFDAutoIncField;
    tbAbastecimentosRelbomba: TIntegerField;
    tbAbastecimentosReltanque: TIntegerField;
    tbAbastecimentosRelproduto: TIntegerField;
    tbAbastecimentosReldescricao: TStringField;
    tbAbastecimentosRelimposto: TBCDField;
    tbAbastecimentosReldata: TWideStringField;
    tbAbastecimentosRelquantidadetotal: TLargeintField;
    tbAbastecimentosRelvalor: TBCDField;
    tbAbastecimentosReltotal: TFloatField;
    tbAbastecimentosRelvlrimpostototal: TFloatField;
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm1.ConexaoBeforeConnect(Sender: TObject);
begin


  Conexao.Params.Clear;
  Conexao.Params.Add('Database=' +  ExtractFilePath(Application.exename)+ 'DB\posto_abc.db');
  Conexao.Params.Add('DriverID=SQLite');
  Conexao.LoginPrompt := False;


end;

end.
