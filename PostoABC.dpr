program PostoABC;

uses
  Vcl.Forms,
  umain in 'umain.pas' {main},
  udm in 'udm.pas' {dm1: TDataModule},
  uproduto in 'uproduto.pas',
  uconexao in 'uconexao.pas',
  utanque in 'utanque.pas',
  ubomba in 'ubomba.pas',
  ftanques in 'ftanques.pas' {frmTanques},
  ftanque in 'ftanque.pas' {frmTanque},
  fbomba in 'fbomba.pas' {frmBomba},
  fbombas in 'fbombas.pas' {frmBombas},
  fprodutos in 'fprodutos.pas' {frmProdutos},
  fproduto in 'fproduto.pas' {frmProduto},
  uabastecimento in 'uabastecimento.pas',
  fabastecimentos in 'fabastecimentos.pas' {frmAbastecimentos},
  fabastecimento in 'fabastecimento.pas' {frmAbastecimento},
  uhelper in 'uhelper.pas',
  frelatorio in 'C:\Users\Notebook\AppData\Roaming\Microsoft\Windows\Network Shortcuts\frelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(Tmain, main);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.Run;
end.
