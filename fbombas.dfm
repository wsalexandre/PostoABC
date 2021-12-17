object frmBombas: TfrmBombas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Bombas'
  ClientHeight = 201
  ClientWidth = 447
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
    Top = 160
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 0
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
      Left = 193
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnEditar: TButton
      Left = 97
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnFechar: TButton
      Left = 360
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
  end
  object dbgBombas: TDBGrid
    Left = 0
    Top = 0
    Width = 447
    Height = 160
    Align = alClient
    DataSource = dm1.dsBombas
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
        FieldName = 'TanqueNR'
        Title.Caption = 'Tanque N'#186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Combustivel'
        Title.Caption = 'Combust'#237'vel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BombaNr'
        Title.Caption = 'N'#250'mero da Bomba'
        Width = 109
        Visible = True
      end>
  end
end
