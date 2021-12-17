object frmTanque: TfrmTanque
  Left = 0
  Top = 0
  Caption = 'Tanque'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 160
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnOK: TButton
      Left = 136
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object Button1: TButton
      Left = 232
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 160
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 136
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Combust'#237'vel'
    end
    object cboTipoCombustivel: TComboBox
      Left = 136
      Top = 70
      Width = 185
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Gasolina'#11
      Items.Strings = (
        'Gasolina'#11
        'Diesel'#11
        'Etanol')
    end
  end
end
