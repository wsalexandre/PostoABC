unit ftanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, utanque;

type
  TModo = (Inserir, Editar);

  TfrmTanque = class(TForm)
    pnlBottom: TPanel;
    Panel1: TPanel;
    btnOK: TButton;
    Button1: TButton;
    Label1: TLabel;
    cboTipoCombustivel: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Modo : TModo;
  end;

var
  frmTanque: TfrmTanque;

implementation

{$R *.dfm}

procedure TfrmTanque.btnOKClick(Sender: TObject);
var
  Tanque1 : TTanque;
begin

  if application.MessageBox('Confirma dados?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
  begin
    Tanque1 := Tanque1.Create;
    Tanque1.combustivel := cboTipoCombustivel.Text;

    if ord(Self.Modo)=0 then
      Tanque1.Adicionar;

      modalresult := -1;
  end;

end;

procedure TfrmTanque.Button1Click(Sender: TObject);
begin
    ModalResult := -1;
end;

end.
