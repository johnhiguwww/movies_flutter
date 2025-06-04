//& flutter core
import 'package:flutter/material.dart';

//& controller: Comunicação com service
import '../controller/filme_controller.dart';

//& model: Estrutura de dados do filme
import '../model/filme.dart';

//& avaliação com estrelas (nova)
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

///# VIEW - Tela de Cadastro ou Edição de Filme
class FormularioFilmeView extends StatefulWidget {
  final Filme? filmeExistente;

  const FormularioFilmeView({super.key, this.filmeExistente});

  @override
  State<FormularioFilmeView> createState() => _FormularioFilmeViewState();
}

class _FormularioFilmeViewState extends State<FormularioFilmeView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = FilmeController();

  final _titulo = TextEditingController();
  final _genero = TextEditingController();
  final _urlImagem = TextEditingController();
  final _duracao = TextEditingController();
  final _descricao = TextEditingController();
  final _ano = TextEditingController();

  String _faixaEtaria = 'Livre';
  double _pontuacao = 0.0;

  final List<String> _faixas = ['Livre', '10', '12', '14', '16', '18'];

  @override
  void initState() {
    super.initState();
    if (widget.filmeExistente != null) {
      _carregarFilme(widget.filmeExistente!);
    }
  }

  ///# CARREGAR DADOS EM MODO EDIÇÃO
  void _carregarFilme(Filme filme) {
    _titulo.text = filme.titulo;
    _genero.text = filme.genero;
    _urlImagem.text = filme.urlImagem;
    _duracao.text = filme.duracao;
    _descricao.text = filme.descricao;
    _ano.text = filme.ano.toString();
    _faixaEtaria = filme.faixaEtaria;
    _pontuacao = filme.pontuacao;
  }

  ///# SALVAR/ATUALIZAR O FILME
  Future<void> _salvar() async {
    if (_formKey.currentState!.validate()) {
      final filme = Filme(
        id: widget.filmeExistente?.id,
        titulo: _titulo.text.trim(),
        genero: _genero.text.trim(),
        urlImagem: _urlImagem.text.trim(),
        duracao: _duracao.text.trim(),
        descricao: _descricao.text.trim(),
        faixaEtaria: _faixaEtaria,
        ano: int.tryParse(_ano.text.trim()) ?? 0,
        pontuacao: _pontuacao,
      );

      try {
        if (widget.filmeExistente == null) {
          await _controller.adicionarFilme(filme);
        } else {
          await _controller.editarFilme(filme);
        }
        Navigator.pop(context, true);
      } catch (e) {
        _mostrarErro(e.toString());
      }
    }
  }

  ///# ALERTA - Mensagem de erro
  void _mostrarErro(String mensagem) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Erro'),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  ///# FORMULÁRIO VISUAL
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filmeExistente == null ? 'Cadastrar Filme' : 'Editar Filme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ///! URL IMAGEM
              TextFormField(
                controller: _urlImagem,
                decoration: const InputDecoration(labelText: 'Url Imagem'),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              ///! TITULO
              TextFormField(
                controller: _titulo,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              ///!GENERO
              TextFormField(
                controller: _genero,
                decoration: const InputDecoration(labelText: 'Gênero'),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              ///! FAIXA ETARIA
              DropdownButtonFormField<String>(
                value: _faixaEtaria,
                decoration: const InputDecoration(labelText: 'Faixa Etária'),
                items: _faixas
                    .map((faixa) => DropdownMenuItem(value: faixa, child: Text(faixa)))
                    .toList(),
                onChanged: (value) {
                  setState(() => _faixaEtaria = value!);
                },
              ),
              ///! DURAÇÃO
              TextFormField(
                controller: _duracao,
                decoration: const InputDecoration(labelText: 'Duração'),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              ///! AVALIAÇÃO
              const Text('Nota', style: TextStyle(fontSize: 16)),
              RatingBar.builder(
                initialRating: _pontuacao,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) => setState(() => _pontuacao = rating),
              ),
              const SizedBox(height: 10),
              ///! ANO DE LANÇAMENTO
              TextFormField(
                controller: _ano,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              ///! DESCRIÇÃO
              TextFormField(
                controller: _descricao,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvar,
        child: const Icon(Icons.save),
      ),
    );
  }
}
