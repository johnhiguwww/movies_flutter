//& flutter core
import 'package:flutter/material.dart';

//& controller: Intermediário entre view e lógica
import '../controller/filme_controller.dart';

//& model: Estrutura de dados do filme
import '../model/filme.dart';

//& rating bar: Para exibir avaliação com estrelas
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

///# VIEW - Tela principal que lista os filmes
class ListaFilmesView extends StatefulWidget {
  const ListaFilmesView({Key? key}) : super(key: key);

  @override
  State<ListaFilmesView> createState() => _ListaFilmesViewState();
}

class _ListaFilmesViewState extends State<ListaFilmesView> {
  final FilmeController _controller = FilmeController();
  List<Filme> _filmes = [];

  @override
  void initState() {
    super.initState();
    _carregarFilmes(); //$ Carrega a lista ao abrir
  }

  ///# FUNÇÃO - Busca todos os filmes
  Future<void> _carregarFilmes() async {
    final filmes = await _controller.buscarTodosFilmes();
    setState(() => _filmes = filmes);
  }

  ///# ALERTA - Exibe a equipe
  void _mostrarEquipe() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Equipe:'),
        content: const Text('João da Silva\nPedro das Flores'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  ///# MENU - Opções ao tocar no item
  void _mostrarOpcoes(Filme filme) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('Exibir Dados'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/detalhes', arguments: filme);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Alterar'),
            onTap: () async {
              Navigator.pop(context);
              final alterado = await Navigator.pushNamed(
                context,
                '/form',
                arguments: filme,
              );

              if (alterado == true) {
                _carregarFilmes(); //$ Atualiza lista após edição
              }
            },
          ),
        ],
      ),
    );
  }


  ///# DELETE - Exclui filme ao arrastar
  Future<void> _deletarFilme(int id) async {
    await _controller.removerFilme(id);
    _carregarFilmes();
  }

  ///# CONSTRUÇÃO DA TELA
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _mostrarEquipe,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filmes.length,
        itemBuilder: (context, index) {
          final filme = _filmes[index];

          return Dismissible(
            key: Key(filme.id.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => _deletarFilme(filme.id!),
            child: GestureDetector(
              onTap: () => _mostrarOpcoes(filme),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    Image.network(
                      filme.urlImagem,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(filme.titulo,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(filme.genero),
                            Text(filme.duracao),
                            RatingBarIndicator(
                              rating: filme.pontuacao,
                              itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novo = await Navigator.pushNamed(context, '/form');
          if (novo == true) {
            _carregarFilmes(); //$ Atualiza ao voltar do cadastro
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
