# movies_flutter

# 🎬 Aplicativo de Gerenciamento de Filmes - Flutter

Projeto final da disciplina **Programação para Dispositivos Móveis** — Curso CC  
Professor: **Thiago Rodrigues**

Desenvolvido por: **João Higor, Caio Amorim e Lucas Guerra**

---

## 📱 Sobre o Projeto

Este aplicativo foi desenvolvido em **Flutter** com o objetivo de **gerenciar o cadastro de filmes** localmente via banco de dados SQLite. Ele permite que o usuário adicione, visualize, edite e exclua filmes com uma interface intuitiva e alinhada ao modelo visual proposto em sala.

---

## ✅ Funcionalidades Implementadas

- Cadastro completo de filmes com os seguintes campos:
  - Título, Gênero, Faixa Etária, Duração, Ano, Nota (0 a 5), Descrição, URL da Imagem
- Validação de todos os campos obrigatórios no formulário
- Avaliação com estrelas (usando `flutter_rating_bar` e `smooth_star_rating_null_safety`)
- Faixa Etária com `DropdownButtonFormField`
- Tela de listagem com:
  - Imagem à esquerda, título, gênero, duração e nota
  - Swipe para deletar (`Dismissible`)
- Tela de exibição de dados do filme
- Edição de dados do filme
- Botão de informação que exibe o nome do grupo via `AlertDialog`

---

## 🧠 Organização do Código

O projeto segue uma **estrutura limpa por camadas**, separando responsabilidade entre arquivos:

lib/
├── controller/ # Comunicação entre views e serviços
├── dao/ # Operações diretas no banco SQLite
├── database/ # Inicialização e configuração do banco
├── model/ # Estrutura de dados (Filme)
├── service/ # Regras de negócio e validação
├── view/ # Telas da aplicação (listagem, formulário, detalhes)
└── main.dart # Ponto de entrada do app e rotas


---

## 📝 Sistema de Comentários Padronizado

Todos os arquivos utilizam um sistema **customizado de comentários**, padronizado com símbolos para facilitar leitura, revisão e rastreabilidade do código:

| Símbolo | Significado                |
|--------|----------------------------|
| `//#`   | Seção ou Organização       |
| `//!`   | Crítico / Atenção          |
| `//@`   | Nota pessoal / Decisão     |
| `//?`   | Dúvida ou pendência        |
| `//$`   | Dica / Hack                |
| `//>`   | Código obsoleto            |
| `//&`   | Referência externa (pacotes, libs) |

> Isso demonstra organização e compromisso com boas práticas.

---

## 🧪 Dependências utilizadas

```yaml
flutter_rating_bar: ^4.0.1
smooth_star_rating_null_safety: ^1.0.4
sqflite: ^2.3.0
path: ^1.8.3

