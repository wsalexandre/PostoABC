unit fbomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Samples.Spin, udm, ubomba;

type

  TfrmBomba = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pnlBottom: TPanel;
    btnOK: TButton;
    Button1: TButton;
    SpinNumeroBomba: TSpinEdit;
    Label2: TLabel;
    DBLookupTanque: TDBLookupComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Bomba1 : TBomba;
    { Public declarations }
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}

procedure TfrmBomba.btnOKClick(Sender: TObject);
begin

  if application.MessageBox('Confirma a dados?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
  begin
    dm1.Conexao.Connected :=false;

    Bomba1.tanque := DBLookupTanque.KeyValue;
    Bomba1.numero := SpinNumeroBomba.Value;

    if ord(Bomba1.Modo)=0 then
      Application.MessageBox(pchar(Bomba1.Adicionar), 'Mensagem', MB_OK)
    else
      Application.MessageBox(pchar(Bomba1.Editar), 'Mensagem', MB_OK);

      modalresult := -1;
  end;

end;

procedure TfrmBomba.Button1Click(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmBomba.FormShow(Sender: TObject);
begin

  DBLookupTanque.KeyValue := Bomba1.tanque;
  DBLookupTanque.Enabled := Bomba1.modo = TModo.Inserir;
  SpinNumeroBomba.Value := Bomba1.numero;


end;

end.
