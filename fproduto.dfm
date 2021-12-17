object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frmProduto'
  ClientHeight = 319
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 278
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 40
      Top = 72
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 40
      Top = 112
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object Label4: TLabel
      Left = 40
      Top = 152
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label5: TLabel
      Left = 40
      Top = 192
      Width = 39
      Height = 13
      Caption = 'Imposto'
    end
    object dbeBomba: TDBLookupComboBox
      Left = 40
      Top = 129
      Width = 217
      Height = 21
      KeyField = 'ID'
      ListField = 'ListaBomba'
      ListSource = dm1.dsBombas
      TabOrder = 2
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
    object dbeDescricao: TMaskEdit
      Left = 40
      Top = 88
      Width = 336
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = ''
    end
    object dbeValorUnitario: TMaskEdit
      Left = 40
      Top = 168
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      Text = '0,00'
      OnExit = dbeValorUnitarioExit
    end
    object dbeImposto: TMaskEdit
      Left = 40
      Top = 211
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = ''
      OnExit = dbeImpostoExit
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 278
    Width = 519
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
