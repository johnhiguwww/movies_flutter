//& flutter core
import 'package:flutter/material.dart';

//& model: Estrutura do Filme a ser exibido
import '../model/filme.dart';

//& avaliação com estrelas
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

///# VIEW - Tela de Detalhes do Filme
class DetalhesFilmeView extends StatelessWidget {
  final Filme filme;

  const DetalhesFilmeView({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                filme.urlImagem,
                height: 180,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    filme.titulo,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${filme.ano}', style: const TextStyle(color: Colors.grey)),
                    Text('${filme.faixaEtaria} anos', style: const TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(filme.genero, style: const TextStyle(fontSize: 14)),
            Text(filme.duracao, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 6),
            SmoothStarRating(
              rating: filme.pontuacao,
              size: 28,
              starCount: 5,
              color: Colors.amber,
              borderColor: Colors.grey,
              allowHalfRating: true,
            ),

            const Divider(height: 20),
            Text(
              filme.descricao,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
