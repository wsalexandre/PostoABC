unit fabastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, udm, frelatorio;

type
  TfrmAbastecimentos = class(TForm)
    dbgAbastecimento: TDBGrid;
    Panel2: TPanel;
    btnNovo: TButton;
    btnFechar: TButton;
    btnImprimir: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbastecimentos: TfrmAbastecimentos;

implementation

{$R *.dfm}

uses fabastecimento;

procedure TfrmAbastecimentos.btnFecharClick(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmAbastecimentos.btnImprimirClick(Sender: TObject);
begin
      dm1.tbAbastecimentosRel.Open;

      frmRelatorio := TfrmRelatorio.Create(Self);
      frmRelatorio.RLR_Abastecimento.Preview;
end;

procedure TfrmAbastecimentos.btnNovoClick(Sender: TObject);
begin

    application.CreateForm(tfrmabastecimento, frmabastecimento);
    frmabastecimento.showmodal;
    frmabastecimento.release;

    dm1.tbAbastecimentos.Open;

end;

procedure TfrmAbastecimentos.FormShow(Sender: TObject);
begin

  dm1.tbAbastecimentos.open;

end;

end.
