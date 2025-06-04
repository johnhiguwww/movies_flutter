//# MODEL - Filme
class Filme {
  int? id;
  String urlImagem;
  String titulo;
  String genero;
  String faixaEtaria;
  String duracao;
  double pontuacao;
  String descricao;
  int ano;

  //# CONSTRUTOR
  Filme({
    this.id,
    required this.urlImagem,
    required this.titulo,
    required this.genero,
    required this.faixaEtaria,
    required this.duracao,
    required this.pontuacao,
    required this.descricao,
    required this.ano,
  });

  //# CONVERSÃO - Objeto para Map (para salvar no banco)
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'urlImagem': urlImagem,
      'titulo': titulo,
      'genero': genero,
      'faixaEtaria': faixaEtaria,
      'duracao': duracao,
      'pontuacao': pontuacao,
      'descricao': descricao,
      'ano': ano,
    };

    if (id != null) map['id'] = id;

    return map;
  }

  //# CONVERSÃO - Map para Objeto (ao buscar do banco)
  factory Filme.fromMap(Map<String, dynamic> map) {
    return Filme(
      id: map['id'],
      urlImagem: map['urlImagem'],
      titulo: map['titulo'],
      genero: map['genero'],
      faixaEtaria: map['faixaEtaria'],
      duracao: map['duracao'],
      pontuacao: map['pontuacao'].toDouble(), //$ Garante que não explode se vier como int
      descricao: map['descricao'],
      ano: map['ano'],
    );
  }
}
