unit fprodutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, udm, uproduto;

type
  TfrmProdutos = class(TForm)
    dbgProdutos: TDBGrid;
    Panel2: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnFechar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses fproduto;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
var
  Produto1 : TProduto;
begin
    Produto1 := TProduto.Create;
    Produto1.modo := TModo.Editar;

    Produto1.id := dm1.tbProdutosID.AsInteger;
    Produto1.bomba := dm1.tbProdutosbomba.AsInteger;
    Produto1.descricao := dm1.tbProdutosdescricao.AsString;
    Produto1.valorunitario := dm1.tbProdutosvalorunitario.AsCurrency;
    Produto1.imposto := dm1.tbProdutosimposto.AsCurrency;

    application.CreateForm(tfrmProduto, frmProduto);

    frmProduto.Produto1 := Produto1;

    frmProduto.Showmodal;
    frmProduto.Release;

    dm1.tbProdutos.Open;

end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
var
  Produto1 : TProduto;
begin
    Produto1 := TProduto.Create;
    Produto1.id := dm1.tbProdutosID.asinteger;

    if application.MessageBox('Confirma a exclusão?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
    begin
        dm1.Conexao.Connected := false;
        application.MessageBox(pchar(Produto1.Deletar), 'Mensagem', MB_OK);
        dm1.tbBombas.Open;
    end;

    dm1.tbProdutos.Open;

end;

procedure TfrmProdutos.btnFecharClick(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
var
  Produto1 : TProduto;
begin
    Produto1 := TProduto.Create;
    Produto1.modo := TModo.Inserir;

    application.CreateForm(tfrmProduto, frmProduto);
    frmProduto.Produto1 := Produto1;

    frmProduto.Showmodal;
    frmProduto.Release;

    dm1.tbProdutos.Open;
end;

end.
