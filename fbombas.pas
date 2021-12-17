unit fbombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, udm,
  Vcl.StdCtrls, Vcl.ExtCtrls, ubomba;

type
  TfrmBombas = class(TForm)
    Panel2: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    dbgBombas: TDBGrid;
    btnEditar: TButton;
    btnFechar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBombas: TfrmBombas;

implementation

{$R *.dfm}

uses fbomba;

procedure TfrmBombas.btnEditarClick(Sender: TObject);
var
  Bomba1 : TBomba;
begin
    Bomba1 := TBomba.Create;

    Bomba1.modo := TModo.Editar;
    Bomba1.id := dm1.tbBombasID.asinteger;
    Bomba1.tanque := dm1.tbBombasTanqueNR.asinteger;
    Bomba1.numero := dm1.tbBombasBombaNr.asinteger;

    application.CreateForm(tfrmbomba, frmbomba);

    frmBomba.Bomba1 := Bomba1;

    frmbomba.showmodal;
    frmbomba.release;

    dm1.tbBombas.Open;

end;

procedure TfrmBombas.btnExcluirClick(Sender: TObject);
var
  Bomba1 : TBomba;
begin
    Bomba1 := TBomba.Create;
    Bomba1.id := dm1.tbBombasID.asinteger;

    if application.MessageBox('Confirma a exclusão?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
    begin
        application.MessageBox(pchar(Bomba1.Deletar), 'Mensagem', MB_OK);
        dm1.tbBombas.Refresh;
    end;
end;

procedure TfrmBombas.btnFecharClick(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmBombas.btnNovoClick(Sender: TObject);
var
  Bomba1 : TBomba;
begin
    Bomba1 := TBomba.Create;
    Bomba1.modo := TModo.Inserir;

    application.CreateForm(tfrmbomba, frmbomba);

    frmBomba.Bomba1 := Bomba1;

    frmbomba.showmodal;
    frmbomba.release;

    dm1.tbTanques.Open;
    dm1.tbBombas.open;
end;

procedure TfrmBombas.FormShow(Sender: TObject);
begin
  dm1.tbBombas.open;
end;

end.
