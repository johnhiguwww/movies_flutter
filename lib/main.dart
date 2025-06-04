//& flutter core
import 'package:flutter/material.dart';

//& views
import 'view/lista_filmes_view.dart';
import 'view/formulario_filme_view.dart';
import 'view/detalhes_filme_view.dart';

//& model: Necessário para passar como argumento nas rotas
import 'model/filme.dart';

///# MAIN - Ponto de entrada do app
void main() {
  //# Necessário para inicializar FFI
  sqfliteFfiInit();

  //# Define o factory global para usar o banco de dados SQLite com FFI
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

///# ROOT WIDGET
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Filmes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, //$ Tema padrão azul
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListaFilmesView(),
        '/form': (context) {
          final filme = ModalRoute.of(context)?.settings.arguments as Filme?;
          return FormularioFilmeView(filmeExistente: filme);
        },
        '/detalhes': (context) {
          final filme = ModalRoute.of(context)?.settings.arguments as Filme;
          return DetalhesFilmeView(filme: filme);
        },
      },
    );
  }
}


/*
================================================================================
SISTEMA DE COMENTÁRIOS PERSONALIZADO - PADRÃO DO PROJETO
================================================================================

Este projeto utiliza um sistema padronizado de comentários para organização,
análise e manutenção do código. Abaixo estão os símbolos e seus significados:

//#  Seção / Organização
    → Usado para dividir o código em blocos lógicos ou indicar regiões principais.

//!  Atenção / Crítico
    → Marcação de trechos sensíveis, perigosos ou que requerem cuidado extra.

//@  Nota Pessoal / Decisão
    → Comentários explicando decisões de implementação ou justificativas pessoais.

//?  Dúvida / Pendência
    → Trechos que devem ser revisados, otimizados ou estão em análise futura.

//$  Hack / Dica / Atalho
    → Dicas úteis, alternativas inteligentes ou truques específicos de código.

//>  Deprecated / Obsoleto
    → Código que será removido ou substituído futuramente (legado).

//&  Referência externa
    → Usado em imports para documentar pacotes e bibliotecas utilizadas.

================================================================================
*/
