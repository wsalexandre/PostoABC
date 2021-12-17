unit ubomba;

interface

uses System.SysUtils,
     uconexao,
     FireDAC.Stan.Param,
     FireDAC.DatS,
     FireDAC.DApt.Intf,
     FireDAC.DApt,
     Data.DB,
     FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

type
  TModo = (Inserir, Editar);

  TBomba = class
  private
  public
    tanque, numero, id : integer;
    modo : TModo;
    constructor Create();
    destructor Destroy; override;
    Function Adicionar : String;
    Function Editar : String;
    Function Deletar : String;
    Function GetByID(id: Integer): TBomba;
  end;

implementation

{ TBomba }

function TBomba.Adicionar: String;
var
  Conexao : TConexao;
  Qry, QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;
  QryPesquisa := Conexao.CriarQuery;

  try
//    if Conexao.GetConn.Connected then
    begin
        QryPesquisa.Close;
        QryPesquisa.SQL.Clear;
        QryPesquisa.SQL.Add('select count(1) as qtd from bomba where tanque=:tanque');
        QryPesquisa.SQL.Add(' and numero=:numero');
        QryPesquisa.ParamByName('tanque').AsInteger := self.tanque;
        QryPesquisa.ParamByName('numero').AsInteger := self.numero;
        QryPesquisa.Open;

        if QryPesquisa.FieldByName('qtd').AsInteger>0 then
          raise Exception.CreateFmt('Bomba já cadastrada : ''%s''', [self.numero.ToString]);

        Qry.Close;
        Qry.SQL.Add('insert into bomba (tanque, numero) values (');
        Qry.SQL.Add(':tanque, :numero)');
        Qry.ParamByName('tanque').AsInteger := Self.tanque;
        Qry.ParamByName('numero').AsInteger := Self.numero;
        Qry.ExecSQL;

        result := 'Bomba cadastrada com sucesso!';
    end;
  except on E: Exception do
    result := 'Erro no cadastro da bomba: ' + e.Message;
  end;


  Conexao.Destroy;

end;

function TBomba.Editar: String;
var
  Conexao : TConexao;
  Qry : TFDQuery;
begin

  Conexao := TConexao.Create;

  Qry := Conexao.CriarQuery;

  try

        Qry.Close;
        Qry.SQL.Add('update bomba set numero=:numero ');
        Qry.SQL.Add(' where id=:id');
        Qry.ParamByName('numero').AsInteger := self.numero;
        Qry.ParamByName('id').AsInteger := self.id;
        Qry.ExecSQL;

        result := 'Bomba alterada com sucesso!';
  except on E: Exception do
    result := 'Erro ao alterar a bomba: ' + e.Message;
  end;


  Conexao.Destroy;

end;

constructor TBomba.Create;
begin
    tanque := 0;
    numero := 0;
    modo := TModo.Inserir;
end;

function TBomba.Deletar: String;
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
        QryPesquisa.SQL.Add('select count(1) as qtd from abastecimento where bomba=:bombaid');
        QryPesquisa.ParamByName('bombaid').AsInteger := id;
        QryPesquisa.Open;

        if QryPesquisa.FieldByName('qtd').AsInteger>0 then
          raise Exception.CreateFmt('A bomba possui abastecimentos : ''%s''', [id.ToString]);

        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('delete from bomba where id=:id');
        Qry.ParamByName('id').AsInteger := id;
        Qry.ExecSQL;

        result := 'Bomba removida com sucesso!';
  except on E: Exception do
    result := 'Erro ao remover a bomba: ' + e.message;
  end;


  Conexao.Destroy;

end;

destructor TBomba.Destroy;
begin
  Free;
  inherited;
end;

function TBomba.GetByID(id : Integer): TBomba;
var
  Conexao : TConexao;
  QryPesquisa : TFDQuery;
begin

  Conexao := TConexao.Create;

  QryPesquisa := Conexao.CriarQuery;

  try
//    if Conexao.Connect.Connected then
    begin

        QryPesquisa.Close;
        QryPesquisa.SQL.Clear;
        QryPesquisa.SQL.Add('select numero, tanque from bomba');
        QryPesquisa.SQL.Add(' where id=:id');
        QryPesquisa.ParamByName('id').AsInteger := id;
        QryPesquisa.Open;

        if QryPesquisa.FieldByName('numero').AsInteger>0 then
        begin
          Self.numero := QryPesquisa.FieldByName('numero').AsInteger;
          Self.tanque := QryPesquisa.FieldByName('tanque').AsInteger;
          Self.id := id;
        end
        else Self := Nil;

        Result := Self;
    end;
  finally

    conexao.Destroy;

  end;

end;

end.
