unit uproduto;

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
     StrUtils;

type
  TModo = (Inserir, Editar);

  TProduto = class
  private
  public
    id, bomba : integer;
    descricao : String;
    imposto, valorunitario : Currency;
    modo : TModo;
    constructor Create();
    destructor Destroy; override;
    Function Adicionar : String;
    Function Editar : String;
    Function Deletar : String;
    Function FormatarMoeda(valor: string): string;
    Procedure Assign(id: Integer);
  end;

implementation

{ TProduto }

function TProduto.Adicionar: String;
var
  Conexao : TConexao;
  Qry : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;

  try
        Qry.Close;
        Qry.SQL.Add('insert into produto (descricao, bomba, imposto, valorunitario) values (');
        Qry.SQL.Add(':descricao, :bomba, :imposto, :valorunitario)');
        Qry.ParamByName('descricao').AsString := descricao;
        Qry.ParamByName('bomba').AsInteger := bomba;
        Qry.ParamByName('imposto').AsFloat := imposto;
        Qry.ParamByName('valorunitario').AsCurrency := valorunitario;
        Qry.ExecSQL;

        result := 'Produto cadastrado com sucesso!';
  except on E: Exception do
    result := 'Erro ao cadastrar produto: ' + e.Message;
  end;


  Conexao.Destroy;

end;

function TProduto.Editar: String;
var
  Conexao : TConexao;
  Qry : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;

  try
        Qry.Close;
        Qry.SQL.Add('update produto set descricao=:descricao, bomba=:bomba, imposto=:imposto, valorunitario=:valorunitario ');
        Qry.SQL.Add(' where id=:id');
        Qry.ParamByName('descricao').AsString := descricao;
        Qry.ParamByName('bomba').AsInteger := bomba;
        Qry.ParamByName('imposto').AsCurrency := imposto;
        Qry.ParamByName('valorunitario').AsCurrency := valorunitario;
        Qry.ParamByName('id').AsInteger := id;
        Qry.ExecSQL;

        result := 'Produto alterado com sucesso!';
  except on E: Exception do
    result := 'Erro ao cadastrar produto: ' + e.Message;
  end;


  Conexao.Destroy;

end;

function TProduto.FormatarMoeda(valor: string): string;
var
  decimais, centena, milhar, milhoes, bilhoes, trilhoes, quadrilhoes: string;
  i: Integer;
begin
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not(valor[i] in ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 2);
  centena := copy(RightStr(valor, 5), 1, 3);
  milhar := copy(RightStr(valor, 8), 1, 3);
  milhoes := copy(RightStr(valor, 11), 1, 3);
  bilhoes := copy(RightStr(valor, 14), 1, 3);
  trilhoes := copy(RightStr(valor, 17), 1, 3);
  quadrilhoes := LeftStr(valor, Length(valor) - 17);

  case Length(valor) of
    1:
      Result := '0,0' + valor;
    2:
      Result := '0,' + valor;
    6 .. 8:
      begin
        milhar := LeftStr(valor, Length(valor) - 5);
        Result := milhar + '.' + centena + ',' + decimais;
      end;
    9 .. 11:
      begin
        milhoes := LeftStr(valor, Length(valor) - 8);
        Result := milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    12 .. 14:
      begin
        bilhoes := LeftStr(valor, Length(valor) - 11);
        Result := bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    15 .. 17:
      begin
        trilhoes := LeftStr(valor, Length(valor) - 14);
        Result := trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ','
          + decimais;
      end;
    18 .. 20:
      begin
        quadrilhoes := LeftStr(valor, Length(valor) - 17);
        Result := quadrilhoes + '.' + trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.'
          + centena + ',' + decimais;
      end
  else
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais;
  end;

end;


constructor TProduto.Create;
begin
  id := 0;
  descricao := '';
  bomba := 0;
  imposto := 13.00;
  valorunitario := 0.00;
  modo := TModo.Inserir;
end;

function TProduto.Deletar : String;
var
  Conexao : TConexao;
  Qry, QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;
  QryPesquisa := Conexao.CriarQuery;

  try
        QryPesquisa.Close;
        QryPesquisa.SQL.Clear;
        QryPesquisa.SQL.Add('select count(1) as qtd from abastecimento where produto=:id');
        QryPesquisa.ParamByName('id').AsInteger := self.id;
        QryPesquisa.Open;

        if QryPesquisa.FieldByName('qtd').AsInteger>0 then
          raise Exception.CreateFmt('Não será possivel exluir o produto possui abastecimentos : ''%s''', [id.ToString]);
        Qry.Close;
        Qry.SQL.Add('delete from produto where id=:id');
        Qry.ParamByName('id').AsInteger := self.id;
        Qry.ExecSQL;

        result := 'Produto removido com sucesso!';
  except on E: Exception do
    result := 'Erro ao excluir produto : ' + e.message;
  end;


  Conexao.Destroy;

end;

destructor TProduto.Destroy;
begin
  Free;
  inherited;
end;

Procedure TProduto.Assign(id: Integer);
var
  Conexao : TConexao;
  QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  QryPesquisa := Conexao.CriarQuery;

  try
        QryPesquisa.Close;
        QryPesquisa.SQL.Clear;
        QryPesquisa.SQL.Add('select id, descricao, bomba, imposto, valorunitario from produto');
        QryPesquisa.SQL.Add(' where id=:id');
        QryPesquisa.ParamByName('id').AsInteger := id;
        QryPesquisa.Open;

        Self.id := QryPesquisa.FieldByName('id').AsInteger;
        Self.bomba := QryPesquisa.FieldByName('bomba').AsInteger;
        Self.descricao := QryPesquisa.FieldByName('descricao').AsString;
        Self.imposto := QryPesquisa.FieldByName('imposto').AsFloat;
        Self.valorunitario := QryPesquisa.FieldByName('valorunitario').AsCurrency;
  finally
    Conexao.Destroy;

  end;


end;

end.
