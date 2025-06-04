import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

///# DATABASE - Configuração SQLite local
class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();  //$ Singleton pattern

  factory AppDatabase() => _instance;

  AppDatabase._internal();

  static Database? _database;

  ///# Getter principal - retorna instância ativa do banco
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();  //! Criação inicial do banco
    return _database!;
  }

  ///# INICIALIZAÇÃO - Define caminho e abre/cria o banco
  Future<Database> _initDatabase() async {
    final caminhoBanco = await getDatabasesPath(); //$ Caminho padrão Android/iOS
    final path = join(caminhoBanco, 'filmes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _criarBanco,
    );
  }

  ///# MIGRAÇÃO - Criação da tabela 'filmes'
  Future<void> _criarBanco(Database db, int version) async {
    await db.execute('''
      CREATE TABLE filmes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        urlImagem TEXT NOT NULL,         //# URL do cartaz
        titulo TEXT NOT NULL,            //# Nome do filme
        genero TEXT NOT NULL,            //# Gênero (ex: ação)
        faixaEtaria TEXT NOT NULL,       //# Classificação indicativa
        duracao TEXT NOT NULL,           //# Ex: "2h10min"
        pontuacao REAL NOT NULL,         //# Nota de 0 a 5
        descricao TEXT NOT NULL,         //# Sinopse
        ano INTEGER NOT NULL             //# Ano de lançamento
      )
    ''');
  }
}
