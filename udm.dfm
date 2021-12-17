object dm1: Tdm1
  OldCreateOrder = False
  Height = 447
  Width = 735
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\PostoABC\posto_abc.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 32
  end
  object tbTanques: TFDTable
    IndexFieldNames = 'ID'
    Connection = Conexao
    TableName = 'tanque'
    Left = 144
    Top = 32
    object tbTanquesID: TFDAutoIncField
      DisplayWidth = 15
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbTanquescombustivel: TStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Required = True
      Size = 30
    end
  end
  object dsTanques: TDataSource
    DataSet = tbTanques
    Left = 248
    Top = 32
  end
  object dsBombas: TDataSource
    DataSet = tbBombas
    Left = 248
    Top = 96
  end
  object tbBombas: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select b.id, t.id as TanqueNR, t.combustivel as Combustivel, '#11
      'b.numero as BombaNr, '#11
      '("Bomba" || b.numero || " - " || t.combustivel) as listaBomba '#11
      'from '#11
      'bomba as b left join tanque as t on b.tanque=t.ID')
    Left = 152
    Top = 96
    object tbBombasTanqueNR: TFDAutoIncField
      FieldName = 'TanqueNR'
      Origin = 'TanqueNR'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbBombasCombustivel: TStringField
      FieldName = 'Combustivel'
      Origin = 'Combustivel'
      Required = True
      Size = 15
    end
    object tbBombasBombaNr: TIntegerField
      FieldName = 'BombaNr'
      Origin = 'BombaNr'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbBombasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbBombasListaBomba: TWideStringField
      FieldName = 'ListaBomba'
      Origin = 'ListaBomba'
      Size = 32767
    end
  end
  object tbProdutos: TFDQuery
    CachedUpdates = True
    Connection = Conexao
    SQL.Strings = (
      'select p.id, p.descricao, p.bomba, p.valorunitario, p.imposto, '
      
        '(p.descricao || " - Bomba: " || b.numero) as listaProduto, b.num' +
        'ero as bombaNr'
      'from produto as p  '
      'left join bomba as b on p.bomba=b.id')
    Left = 152
    Top = 160
    object tbProdutosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
    end
    object tbProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 60
    end
    object tbProdutosbomba: TIntegerField
      DisplayLabel = 'Bomba'
      FieldName = 'bomba'
      LookupDataSet = tbBombas
      LookupKeyFields = 'ID'
      LookupResultField = 'BombaNr'
      Origin = 'bomba'
      Required = True
    end
    object tbProdutosvalorunitario: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valorunitario'
      Origin = 'valorunitario'
      currency = True
      Precision = 13
      Size = 3
    end
    object tbProdutosimposto: TBCDField
      DisplayLabel = 'Imposto'
      FieldName = 'imposto'
      Origin = 'imposto'
      Precision = 13
      Size = 3
    end
    object tbProdutoslistaProduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'listaProduto'
      Origin = 'listaProduto'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object tbProdutosbombaNr: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bombaNr'
      Origin = 'numero'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = tbProdutos
    Left = 248
    Top = 160
  end
  object tbAbastecimentos: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select a.id, b.numero as bomba, b.tanque, a.produto, p.descricao' +
        ', '
      
        'p.imposto, strftime('#39'%d/%m/%Y'#39', a.datahora) as data, a.quantidad' +
        'e, a.valor, a.total, a.excluido, '
      '((p.imposto*a.total)/100) as vlrimposto '
      'from abastecimento as a '
      'left join produto as p on a.produto=p.ID '
      'left join bomba as b on p.bomba=b.id ')
    Left = 152
    Top = 232
    object tbAbastecimentosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbAbastecimentosbomba: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bomba Nr.'
      FieldName = 'bomba'
      Origin = 'numero'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAbastecimentostanque: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tanque'
      FieldName = 'tanque'
      Origin = 'tanque'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAbastecimentosproduto: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'produto'
      Origin = 'produto'
    end
    object tbAbastecimentosdescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object tbAbastecimentosimposto: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imposto %'
      FieldName = 'imposto'
      Origin = 'imposto'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '##0.00'
      Precision = 13
      Size = 3
    end
    object tbAbastecimentosquantidade: TBCDField
      DisplayLabel = 'Quantidade Lts.'
      FieldName = 'quantidade'
      Origin = 'quantidade'
      DisplayFormat = '######0.00'
      Precision = 13
      Size = 3
    end
    object tbAbastecimentosvalor: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
      Precision = 13
      Size = 2
    end
    object tbAbastecimentostotal: TBCDField
      DisplayLabel = 'Total R$'
      FieldName = 'total'
      Origin = 'total'
      currency = True
      Precision = 13
      Size = 2
    end
    object tbAbastecimentosexcluido: TStringField
      DisplayLabel = 'Exclu'#237'do'
      FieldName = 'excluido'
      Origin = 'excluido'
      FixedChar = True
      Size = 1
    end
    object tbAbastecimentosvlrimposto: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Vlr. Imposto'
      FieldName = 'vlrimposto'
      Origin = 'vlrimposto'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = tbAbastecimentos
    Left = 248
    Top = 232
  end
  object tbAbastecimentosRel: TFDQuery
    AggregatesActive = True
    Connection = Conexao
    SQL.Strings = (
      
        'select a.id, b.numero as bomba, b.tanque, a.produto, p.descricao' +
        ', '
      
        'p.imposto, strftime('#39'%d/%m/%Y'#39', a.datahora) as data, sum(a.quant' +
        'idade) as quantidadetotal, a.valor, sum(a.total) as total,   '
      'sum(((p.imposto*a.total)/100)) as vlrimpostototal '
      'from abastecimento as a '
      'left join produto as p on a.produto=p.ID '
      'left join bomba as b on p.bomba=b.id '
      'group by date(a.datahora),  b.tanque, b.numero ')
    Left = 152
    Top = 304
    object tbAbastecimentosRelID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tbAbastecimentosRelbomba: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'bomba'
      Origin = 'numero'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAbastecimentosReltanque: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tanque'
      Origin = 'tanque'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAbastecimentosRelproduto: TIntegerField
      FieldName = 'produto'
      Origin = 'produto'
    end
    object tbAbastecimentosReldescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object tbAbastecimentosRelimposto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'imposto'
      Origin = 'imposto'
      ProviderFlags = []
      ReadOnly = True
      Precision = 13
      Size = 3
    end
    object tbAbastecimentosReldata: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = 'data'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object tbAbastecimentosRelquantidadetotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'quantidadetotal'
      Origin = 'quantidadetotal'
      ProviderFlags = []
      ReadOnly = True
    end
    object tbAbastecimentosReltotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
    object tbAbastecimentosRelvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      currency = True
      Precision = 13
      Size = 2
    end
    object tbAbastecimentosRelvlrimpostototal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'vlrimpostototal'
      Origin = 'vlrimpostototal'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object dsAbastecimentosRel: TDataSource
    DataSet = tbAbastecimentosRel
    Left = 248
    Top = 304
  end
end
