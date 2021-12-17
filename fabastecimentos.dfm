object frmAbastecimentos: TfrmAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abastecimentos'
  ClientHeight = 374
  ClientWidth = 737
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
  object dbgAbastecimento: TDBGrid
    Left = 0
    Top = 0
    Width = 737
    Height = 333
    Align = alClient
    DataSource = dm1.dsAbastecimento
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bomba'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 333
    Width = 737
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TButton
      Left = 0
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnFechar: TButton
      Left = 648
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnImprimir: TButton
      Left = 359
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 2
      OnClick = btnImprimirClick
    end
  end
end
