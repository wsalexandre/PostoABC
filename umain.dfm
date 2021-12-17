object main: Tmain
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 453
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MenuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object MenuPrincipal: TMainMenu
    Left = 296
    Top = 152
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object anques1: TMenuItem
        Caption = 'Tanques'
        OnClick = anques1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    object Abastecimento1: TMenuItem
      Caption = 'Abastecimento'
      OnClick = Abastecimento1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
