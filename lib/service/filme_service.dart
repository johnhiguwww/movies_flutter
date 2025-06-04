//& model: Representa a estrutura do objeto Filme
import '../model/filme.dart';

//& dao: Responsável pelas operações diretas com o banco
import '../dao/filme_dao.dart';

///# SERVICE - Regras de negócio e validação do Filme
class FilmeService {
  final FilmeDao _dao = FilmeDao();

  ///# VALIDAÇÃO + INSERÇÃO
  Future<void> cadastrarFilme(Filme filme) async {
    //! Se algum campo obrigatório estiver vazio/null, lançar erro
    _validarCampos(filme);

    await _dao.inserirFilme(filme);
  }

  ///# VALIDAÇÃO + ATUALIZAÇÃO
  Future<void> atualizarFilme(Filme filme) async {
    if (filme.id == null) {
      throw Exception('ID do filme é obrigatório para atualização.');
    }

    _validarCampos(filme);

    await _dao.atualizarFilme(filme);
  }

  ///# LISTAGEM de filmes
  Future<List<Filme>> listarFilmes() async {
    return await _dao.listarFilmes();
  }

  ///# EXCLUSÃO de filme
  Future<void> deletarFilme(int id) async {
    await _dao.deletarFilme(id);
  }

  ///# BUSCA específica por ID
  Future<Filme?> buscarPorId(int id) async {
    return await _dao.buscarPorId(id);
  }

  ///# REGIÃO - VALIDAÇÃO DE CAMPOS
  void _validarCampos(Filme filme) {
    if (filme.titulo.trim().isEmpty ||
        filme.genero.trim().isEmpty ||
        filme.faixaEtaria.trim().isEmpty ||
        filme.duracao.trim().isEmpty ||
        filme.descricao.trim().isEmpty ||
        filme.urlImagem.trim().isEmpty ||
        filme.ano == 0 ||
        filme.pontuacao < 0 || filme.pontuacao > 5) {
      throw Exception('Todos os campos devem ser preenchidos corretamente.');
    }
  }
}
