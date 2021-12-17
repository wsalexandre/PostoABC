unit utanque;

interface

uses System.SysUtils,
     uconexao,
     FireDAC.Stan.Param,
     FireDAC.DatS,
     FireDAC.DApt.Intf,
     FireDAC.DApt,
     Data.DB,
     FireDAC.Comp.DataSet,
     FireDAC.Comp.Client, TypInfo;

type
  TModo = (Inserir, Editar);

  TTanque = class
  private
  public
    id : integer;
    combustivel : String;
    Modo : TModo;
    constructor Create();
    destructor Destroy; override;
    Function Adicionar : String;
    Function Editar : String;
    Function Deletar : String;
    Function GetByID(id: Integer): TTanque;
  end;

implementation

{ TPath }

function TTanque.Adicionar: String;
var
  Conexao : TConexao;
  Qry, QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;

  try

        Qry.Close;
        Qry.SQL.Add('insert into tanque (combustivel) values (');
        Qry.SQL.Add(':combustivel)');
        Qry.ParamByName('combustivel').AsString := Self.combustivel;
        Qry.ExecSQL;

        result := 'Tanque cadastrado com sucesso!';
  except on E: Exception do
    result := 'Erro ao cadastrar tanque';
  end;


  Conexao.Destroy;
end;

function TTanque.Editar: String;
begin

  try
      raise Exception.CreateFmt('Opção não implementada : ''%s''', ['Editar']);
  except on E: Exception do
      result := 'Erro ' + e.Message;
  end;

end;

constructor TTanque.Create;
begin
  id := 0;
  combustivel := 'Gasolina';
end;

function TTanque.Deletar: String;
begin
  try
      raise Exception.CreateFmt('Opção não implementada : ''%s''', ['Excluir']);
  except on E: Exception do
      result := 'Erro ' + e.Message;
  end;
end;

destructor TTanque.Destroy;
begin
  Free;
  inherited;
end;

function TTanque.GetByID(id: Integer): TTanque;
var
  Conexao : TConexao;
  QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  QryPesquisa := Conexao.CriarQuery;

  try

        QryPesquisa.Close;
        QryPesquisa.SQL.Clear;
        QryPesquisa.SQL.Add('select id, combustivel from tanque');
        QryPesquisa.SQL.Add(' where id=:id');
        QryPesquisa.ParamByName('id').AsInteger := id;
        QryPesquisa.Open;

        if QryPesquisa.FieldByName('id').AsInteger>0 then
        begin
          Self.id := QryPesquisa.FieldByName('id').AsInteger;
          Self.combustivel :=  QryPesquisa.FieldByName('combustivel').AsString;
        end
        else Self := Nil;

        Result := Self;
  finally
    Conexao.Destroy;
  end;

end;

end.
