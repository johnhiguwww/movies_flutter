//& model: Classe com os atributos de um filme
import '../model/filme.dart';

//& service: Camada com regras de negócio e validações
import '../service/filme_service.dart';

///# CONTROLLER - Gerencia ações da View com a lógica do Serviço
class FilmeController {
  final FilmeService _service = FilmeService();

  ///# CRIAR - Adiciona novo filme após validação
  Future<void> adicionarFilme(Filme filme) async {
    await _service.cadastrarFilme(filme);
  }

  ///# ATUALIZAR - Atualiza dados de um filme
  Future<void> editarFilme(Filme filme) async {
    await _service.atualizarFilme(filme);
  }

  ///# LISTAR - Retorna todos os filmes cadastrados
  Future<List<Filme>> buscarTodosFilmes() async {
    return await _service.listarFilmes();
  }

  ///# BUSCAR POR ID - Recupera filme específico
  Future<Filme?> buscarFilmePorId(int id) async {
    return await _service.buscarPorId(id);
  }

  ///# REMOVER - Deleta filme por ID
  Future<void> removerFilme(int id) async {
    await _service.deletarFilme(id);
  }
}
