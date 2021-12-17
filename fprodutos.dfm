object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produtos'
  ClientHeight = 304
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgProdutos: TDBGrid
    Left = 0
    Top = 0
    Width = 617
    Height = 263
    Align = alClient
    DataSource = dm1.dsProdutos
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
        FieldName = 'descricao'
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bombaNr'
        Title.Caption = 'Bomba'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorunitario'
        Title.Caption = 'Valor R$'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imposto'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 263
    Width = 617
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
    object btnExcluir: TButton
      Left = 199
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnEditar: TButton
      Left = 103
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnFechar: TButton
      Left = 520
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
  end
end
