unit fproduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, udm, uproduto;

type
  TfrmProduto = class(TForm)
    Panel1: TPanel;
    pnlBottom: TPanel;
    btnOK: TButton;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeBomba: TDBLookupComboBox;
    dbeID: TMaskEdit;
    dbeDescricao: TMaskEdit;
    dbeValorUnitario: TMaskEdit;
    dbeImposto: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbeValorUnitarioExit(Sender: TObject);
    procedure dbeImpostoExit(Sender: TObject);
  private
    { Private declarations }
  public
    Produto1 : TProduto;
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

procedure TfrmProduto.btnOKClick(Sender: TObject);
begin

  //Sem usar o rxCurrEdit tive uma certa dificuldade
  dbeImposto.Text := Produto1.FormatarMoeda(dbeImposto.Text);
  dbeValorUnitario.Text := Produto1.FormatarMoeda(dbeValorUnitario.Text);


  if application.MessageBox('Confirma a dados?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
  begin
    dm1.Conexao.Connected :=false;

    Produto1.id := strtoint(dbeID.Text);
    Produto1.bomba := dbeBomba.KeyValue;
    Produto1.descricao := dbeDescricao.Text;
    Produto1.valorunitario := StrToCurr(  StringReplace(StringReplace(dbeValorUnitario.Text, '.', '', [rfReplaceAll]),'.', '', [rfReplaceAll]) );
    Produto1.imposto :=  StrToCurr(  StringReplace(StringReplace(dbeImposto.Text, '.', '', [rfReplaceAll]),'.', '', [rfReplaceAll]));


    if ord(Produto1.Modo)=0 then
      Application.MessageBox(pchar(Produto1.Adicionar), 'Mensagem', MB_OK)
    else
      Application.MessageBox(pchar(Produto1.Editar), 'Mensagem', MB_OK);

      modalresult := -1;
  end;

end;

procedure TfrmProduto.Button1Click(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmProduto.dbeImpostoExit(Sender: TObject);
begin
  dbeImposto.Text := Produto1.FormatarMoeda(dbeImposto.Text);
end;

procedure TfrmProduto.dbeValorUnitarioExit(Sender: TObject);
begin
  dbeValorUnitario.Text := Produto1.FormatarMoeda(dbeValorUnitario.Text);
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  dm1.tbBombas.Open;

  dbeID.Text := Produto1.id.ToString;
  dbeid.Enabled := false;

  dbeDescricao.Text := Produto1.descricao;
  dbeBomba.KeyValue := Produto1.bomba;

  if Produto1.valorunitario>0 then
    dbeValorUnitario.Text := Produto1.FormatarMoeda( currtostr(Produto1.valorunitario) );

  dbeImposto.Text := Produto1.FormatarMoeda( currtostr(Produto1.imposto * 100) );

end;

end.
