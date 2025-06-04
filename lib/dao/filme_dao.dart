//& sqflite: Permite operações com banco SQLite no Flutter
import 'package:sqflite/sqflite.dart';
//& model: Representa a estrutura do objeto Filme
import '../model/filme.dart';
//& database: Fornece a instância única do banco de dados
import '../database/database.dart';

///# DAO - Classe de acesso direto à tabela 'filmes'
class FilmeDao {
  ///# INSERT - Insere um novo filme no banco
  Future<int> inserirFilme(Filme filme) async {
    final db = await AppDatabase().database;
    return await db.insert('filmes', filme.toMap());
  }

  ///# SELECT - Retorna todos os filmes cadastrados
  Future<List<Filme>> listarFilmes() async {
    final db = await AppDatabase().database;
    final resultado = await db.query('filmes');

    return resultado.map((mapa) => Filme.fromMap(mapa)).toList();
  }

  ///# UPDATE - Atualiza um filme já existente
  Future<int> atualizarFilme(Filme filme) async {
    final db = await AppDatabase().database;

    return await db.update(
      'filmes',
      filme.toMap(),
      where: 'id = ?',
      whereArgs: [filme.id],
    );
  }

  ///# DELETE - Remove um filme com base no ID
  Future<int> deletarFilme(int id) async {
    final db = await AppDatabase().database;

    return await db.delete(
      'filmes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  ///# SELECT BY ID - Busca um filme específico
  Future<Filme?> buscarPorId(int id) async {
    final db = await AppDatabase().database;
    final resultado = await db.query(
      'filmes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (resultado.isNotEmpty) {
      return Filme.fromMap(resultado.first);
    }

    return null; //! Filme não encontrado
  }
}
