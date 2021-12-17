unit fabastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, udm, uabastecimento, uhelper;

type
  TfrmAbastecimento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeProduto: TDBLookupComboBox;
    dbeID: TMaskEdit;
    dbeLitros: TMaskEdit;
    pnlBottom: TPanel;
    btnOK: TButton;
    Button1: TButton;
    dbeTotal: TMaskEdit;
    Label2: TLabel;
    grpPreco: TGroupBox;
    DBText1: TDBText;
    rgTipoAbastecimento: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rgTipoAbastecimentoClick(Sender: TObject);
  private
    { Private declarations }
    Abastecimento1 : TAbastecimento;
    procedure TipoAbastecimento(tipo : integer);
    procedure RestauraEdits;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnOKClick(Sender: TObject);
begin

  TipoAbastecimento(rgTipoAbastecimento.ItemIndex);

  if application.MessageBox('Confirma a dados?', 'Pergunta', MB_ICONQUESTION+MB_YESNO) = IDYes then
  begin

    dm1.Conexao.Connected := False;

    Abastecimento1.produto := dbeProduto.KeyValue;

    Abastecimento1.Adicionar;

    RestauraEdits;

  end;

end;

procedure TfrmAbastecimento.Button1Click(Sender: TObject);
begin
  modalresult := -1;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  RestauraEdits;

  dm1.tbProdutos.Open;
  dbeProduto.KeyValue := dm1.tbProdutosID.AsInteger;
  Abastecimento1 := TAbastecimento.Create;


end;

procedure TfrmAbastecimento.RestauraEdits;
begin

        dm1.tbProdutos.Open;
        dbeLitros.Text := '0,00';
        dbeTotal.Text := '0,00';
        rgTipoAbastecimento.ItemIndex :=0;
        dbeLitros.Enabled := true;

end;

procedure TfrmAbastecimento.rgTipoAbastecimentoClick(Sender: TObject);
begin

  case rgTipoAbastecimento.ItemIndex of

    0 :
      begin
        dbeTotal.Text := '0,00';
        dbeLitros.Text := '0,00';
        dbeLitros.Enabled := true;
        dbeLitros.SetFocus;
      end;

    1 :
      begin
        dbeTotal.Text := '0,00';
        dbeLitros.Text := '0,00';
        dbeTotal.Enabled := true;
        dbeTotal.SetFocus;
      end;

  end;


end;

procedure TfrmAbastecimento.TipoAbastecimento(tipo: integer);
begin

  Abastecimento1.quantidade := StrToCurr( dbeLitros.Text );
  Abastecimento1.total := StrToCurr( dbeTotal.Text );
  Abastecimento1.valor := dm1.tbProdutosvalorunitario.Value;
  Abastecimento1.produto := dm1.tbProdutosID.AsInteger;

  case tipo of
    0 :
        if Abastecimento1.quantidade >0 then
        begin
           Abastecimento1.total := Abastecimento1.quantidade * Abastecimento1.valor;
            dbeTotal.Text := FormatarMoeda(currtostr(Abastecimento1.total));
        end;

    1 :
        if StrToCurr(StringReplace(StringReplace(dbeTotal.Text, '.', '', [rfReplaceAll]),'.', '', [rfReplaceAll]))>0 then
        begin
           Abastecimento1.quantidade := (Abastecimento1.total / Abastecimento1.valor);
            dbeLitros.Text := FormatFloat('####.000', Abastecimento1.quantidade);  //CurrToStr(Abastecimento1.quantidade);
        end;

  end;



end;

end.
