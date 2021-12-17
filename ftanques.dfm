object frmTanques: TfrmTanques
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tanques'
  ClientHeight = 299
  ClientWidth = 652
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
  object Panel2: TPanel
    Left = 0
    Top = 258
    Width = 652
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnFechar: TButton
      Left = 568
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnNovo: TButton
      Left = 0
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnExcluir: TButton
      Left = 81
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
  object dbgTanques: TDBGrid
    Left = 0
    Top = 0
    Width = 652
    Height = 258
    Align = alClient
    DataSource = dm1.dsTanques
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'combustivel'
        Title.Caption = 'Combust'#237'vel'
        Width = 103
        Visible = True
      end>
  end
end
