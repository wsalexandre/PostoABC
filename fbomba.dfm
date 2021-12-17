object frmBomba: TfrmBomba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bomba'
  ClientHeight = 211
  ClientWidth = 457
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
    Width = 457
    Height = 170
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 66
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object Label2: TLabel
      Left = 248
      Top = 56
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object SpinNumeroBomba: TSpinEdit
      Left = 248
      Top = 75
      Width = 121
      Height = 22
      MaxValue = 20
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object DBLookupTanque: TDBLookupComboBox
      Left = 66
      Top = 76
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'combustivel'
      ListSource = dm1.dsTanques
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 170
    Width = 457
    Height = 41
    Align = alBottom
    TabOrder = 1
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
end
