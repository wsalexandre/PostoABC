object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Abastecimento'
  ClientHeight = 267
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 226
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label3: TLabel
      Left = 40
      Top = 75
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label4: TLabel
      Left = 41
      Top = 163
      Width = 26
      Height = 13
      Caption = 'Litros'
    end
    object Label2: TLabel
      Left = 167
      Top = 163
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object dbeProduto: TDBLookupComboBox
      Left = 40
      Top = 92
      Width = 231
      Height = 21
      KeyField = 'ID'
      ListField = 'listaProduto'
      ListSource = dm1.dsProdutos
      TabOrder = 1
    end
    object dbeID: TMaskEdit
      Left = 40
      Top = 45
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = ''
    end
    object dbeLitros: TMaskEdit
      Left = 39
      Top = 179
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
      Text = '0,00'
    end
    object dbeTotal: TMaskEdit
      Left = 167
      Top = 179
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
      Text = '0,00'
    end
    object grpPreco: TGroupBox
      Left = 304
      Top = 63
      Width = 209
      Height = 105
      Caption = 'Pre'#231'o'
      TabOrder = 4
      object DBText1: TDBText
        Left = 40
        Top = 37
        Width = 153
        Height = 54
        DataField = 'valorunitario'
        DataSource = dm1.dsProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rgTipoAbastecimento: TRadioGroup
      Left = 41
      Top = 119
      Width = 230
      Height = 38
      Caption = 'Abastercer'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por litros'
        'Por valor')
      TabOrder = 5
      OnClick = rgTipoAbastecimentoClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 226
    Width = 535
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 167
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object Button1: TButton
      Left = 248
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
