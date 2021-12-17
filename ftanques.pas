unit ftanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udm, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, utanque;

type
  TfrmTanques = class(TForm)
    Panel2: TPanel;
    btnFechar: TButton;
    dbgTanques: TDBGrid;
    btnNovo: TButton;
    btnExcluir: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    Tanques : TTanque;
  public
    { Public declarations }
  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

uses ftanque;

procedure TfrmTanques.btnExcluirClick(Sender: TObject);
var
  Tanque1 : TTanque;
begin

  Tanque1 := TTanque.Create;
  Tanque1.GetByID(dm1.tbTanquesID.AsInteger);

    if application.MessageBox('Confirma a exclusão?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
    begin
        application.MessageBox(pchar(Tanque1.Deletar), 'Mensagem', MB_OK);
        dm1.tbBombas.Open;
    end;

  dm1.tbTanques.Refresh;

end;

procedure TfrmTanques.btnFecharClick(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmTanques.btnNovoClick(Sender: TObject);
begin
    application.CreateForm(tfrmtanque, frmtanque);
    frmtanque.Modo := TModo.Inserir;
    frmtanque.showmodal;
    frmtanque.release;

    dm1.tbTanques.Refresh;
end;

procedure TfrmTanques.FormShow(Sender: TObject);
begin
  dm1.tbTanques.Open;
end;

end.
