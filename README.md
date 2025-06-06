# 🎬 movies_flutter — Aplicativo de Gerenciamento de Filmes (Flutter)

Projeto final da disciplina **Programação para Dispositivos Móveis**  
Curso: **Ciência da Computação**  
Professor: **Thiago Rodrigues**  

Desenvolvido por: **João Higor, Caio Amorim e Lucas Guerra**

---

## 📽️ Demonstração em Vídeo

Assista ao funcionamento completo do aplicativo no YouTube:  
👉 [https://youtu.be/qKG0qy4UU6Y](https://youtu.be/qKG0qy4UU6Y)

---

## 📱 Sobre o Projeto

Este aplicativo Flutter tem como objetivo **gerenciar o cadastro de filmes localmente usando SQLite**. Ele permite:

- Cadastrar filmes com imagem, título, gênero, ano, faixa etária, nota, descrição e duração
- Visualizar os dados do filme em uma tela estilizada
- Editar ou excluir um filme existente
- Interface fluida, com navegação por rotas nomeadas

---

## ✅ Funcionalidades Implementadas

- Cadastro completo com os seguintes campos:
  - `Título`, `Gênero`, `Faixa Etária`, `Duração`, `Ano`, `Nota`, `Descrição`, `URL da Imagem`
- Validação obrigatória de todos os campos
- Avaliação com estrelas (0 a 5)
- Dropdown para faixa etária
- Tela de listagem com:
  - Imagem, título, gênero, duração e nota
  - Swipe para deletar (`Dismissible`)
- Tela de exibição com detalhes do filme
- Tela de edição pré-preenchida
- Alerta com nome dos integrantes da equipe (`AlertDialog`)

---

## 🧠 Organização do Código

O projeto segue uma **estrutura limpa e separada por camadas**:

```
lib/
├── controller/     # Comunicação entre view e lógica
├── dao/            # Operações no banco SQLite
├── database/       # Instância do banco
├── model/          # Modelo de dados (Filme)
├── service/        # Regras de negócio e validação
├── view/           # Telas (Listagem, Formulário, Detalhes)
└── main.dart       # Entrada da aplicação e rotas
```

---

## 📝 Sistema de Comentários Padronizado

Todos os arquivos seguem um padrão de comentários técnicos com símbolos, para facilitar leitura e manutenção:

| Símbolo | Significado |
|--------|-------------|
| `//#`   | Seção / Organização |
| `//!`   | Alerta / Crítico |
| `//@`   | Nota pessoal / Decisão de projeto |
| `//?`   | Dúvida / Pendência |
| `//$`   | Dica / Hack |
| `//>`   | Obsoleto |
| `//&`   | Referência externa (pacotes, libs) |

> Exemplo:
```dart
//& sqflite: Permite operações com banco SQLite
//? Será que seria melhor usar Firestore futuramente?
//# CRUD - Operações principais
```

---

## 🧪 Dependências utilizadas

```yaml
flutter_rating_bar: ^4.0.1
smooth_star_rating_null_safety: ^1.0.4
sqflite: ^2.3.0
path: ^1.8.3
```

---

## 🚀 Como executar

1. Certifique-se de que o Flutter está instalado (`flutter doctor`)
2. Clone este repositório:
   ```bash
   git clone <link-do-repositorio>
   cd movies_flutter
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Rode no celular ou emulador:
   ```bash
   flutter run
   ```

---

## 👏 Agradecimentos

Agradecemos ao professor **Thiago Rodrigues** pelo suporte e orientação durante o desenvolvimento da disciplina.

---

**João Higor, Caio Amorim e Lucas Guerra**  
*Turma de Ciência da Computação — 2024/2025*