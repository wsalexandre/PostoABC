unit uabastecimento;

interface

uses System.SysUtils,
     uconexao,
     FireDAC.Stan.Param,
     FireDAC.DatS,
     FireDAC.DApt.Intf,
     FireDAC.DApt,
     Data.DB,
     FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     StrUtils,
     uproduto,
     uhelper;

type

  TAbastecimento = class
  private
    bomba : Integer;
  public
    id, produto : integer;
    quantidade, total, valor : Double;
    datahora : TDate;
    excluido : String;
    constructor Create();
    destructor Destroy; override;
    Function Adicionar : String;
    Function Cancelar : String;
  end;

implementation

{ TAbastecimento }

function TAbastecimento.Adicionar: String;
var
  Conexao : TConexao;
  Qry : TFDQuery;
  Produto1 : TProduto;
begin

  Conexao := TConexao.Create;

  Produto1 := TProduto.Create;

  Produto1.Assign(produto);

  Qry := Conexao.CriarQuery;

  try

        if quantidade<=0 then
          raise Exception.CreateFmt('Não será lançar abastecimento, quantidade igual ou menor a zero : ''%s''', [Produto1.descricao]);

        if produto1.valorunitario<=0 then
          raise Exception.CreateFmt('Não será lançar abastecimento, valor de produto incorreto : ''%s''', [Produto1.descricao]);

        Qry.Close;
        Qry.SQL.Add('insert into abastecimento (bomba, produto, quantidade, valor, total, excluido, datahora) values (');
        Qry.SQL.Add(':bomba, :produto, :quantidade, :valor, :total, :excluido, :datahora)');
        Qry.ParamByName('bomba').AsInteger := Produto1.bomba;
        Qry.ParamByName('produto').AsInteger := Produto1.id;
        Qry.ParamByName('quantidade').AsFloat := quantidade;
        Qry.ParamByName('valor').AsFloat := Produto1.valorunitario;
        Qry.ParamByName('total').AsFloat := Produto1.valorunitario * quantidade;
        Qry.ParamByName('excluido').AsString := excluido;
        Qry.ParamByName('datahora').AsDateTime := datahora;
        Qry.ExecSQL;

        result := 'Abastecimento lançado com sucesso!';
  except on E: Exception do
    result := 'Erro ao lançar abastecimento : ' + e.Message;
  end;


  Conexao.Destroy;

end;

function TAbastecimento.Cancelar: String;
var
  Conexao : TConexao;
  Qry : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;

  try
        Qry.Close;
        Qry.SQL.Add('update abastecimento set excluido=:excluido ');
        Qry.SQL.Add(' where id=:id');
        Qry.ParamByName('id').AsInteger := id;
        Qry.ParamByName('excluido').AsString := 'S';
        Qry.ExecSQL;

        result := 'Abastecimento excluído!';
  except on E: Exception do
    result := 'Erro ao excluir abastecimento: ' + e.Message;
  end;

  Conexao.Destroy;

end;

constructor TAbastecimento.Create;
begin
  id := 0;
  bomba := 0;
  produto := 0;
  quantidade := 0;
  valor := 0.00;
  total := 0.00;
  datahora := now;
  excluido := 'N';
end;

destructor TAbastecimento.Destroy;
begin

  inherited;
end;

end.
