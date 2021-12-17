unit umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  Tmain = class(TForm)
    MenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Sair1: TMenuItem;
    anques1: TMenuItem;
    Bombas1: TMenuItem;
    Produtos1: TMenuItem;
    Abastecimento1: TMenuItem;
    procedure anques1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bombas1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  main: Tmain;

implementation

{$R *.dfm}

uses ftanques, fbombas, udm, fprodutos, fabastecimentos;

procedure Tmain.Abastecimento1Click(Sender: TObject);
begin

    dm1.tbProdutos.open;

    application.CreateForm(tfrmabastecimentos, frmabastecimentos);
    frmabastecimentos.showmodal;
    frmabastecimentos.release;

end;

procedure Tmain.anques1Click(Sender: TObject);
begin
    application.CreateForm(tfrmtanques, frmtanques);
    frmtanques.showmodal;
    frmtanques.release;
end;

procedure Tmain.Bombas1Click(Sender: TObject);
begin
    dm1.tbtanques.open;

    application.CreateForm(tfrmbombas, frmbombas);
    frmbombas.showmodal;
    frmbombas.release;

end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  dm1.Conexao.Connected:=false;
  application.Terminate;

end;

procedure Tmain.Produtos1Click(Sender: TObject);
begin
    dm1.tbProdutos.open;

    application.CreateForm(tfrmProdutos, frmProdutos);
    frmProdutos.showmodal;
    frmProdutos.release;

end;

procedure Tmain.Sair1Click(Sender: TObject);
begin

  if application.MessageBox('Sair do sistema?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
     application.Terminate;

end;

end.
