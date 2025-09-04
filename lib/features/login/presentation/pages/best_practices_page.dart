import 'package:flutter/material.dart';

class BestPracticesPage extends StatelessWidget {
  const BestPracticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Boas Práticas no Flutter', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
          SizedBox(height: 16),
          _buildPracticeItem(context, 'Estrutura de pastas organizada', 'Mantenha uma estrutura lógica (ex: por feature) para facilitar a navegação e manutenção.'),
          _buildPracticeItem(context, 'Nomeação clara', 'Use nomes descritivos para arquivos, classes e variáveis (ex: `user_repository.dart`, `LoginBloc`).'),
          _buildPracticeItem(context, 'Testes', 'Escreva testes unitários para a lógica de negócio (use cases), testes de widget para a UI e testes de integração para os fluxos completos.'),
          _buildPracticeItem(context, 'Tratamento de Erros', 'Use `Failure` para erros de negócio (ex: "senha incorreta") e `Exception` para erros inesperados (ex: falha de rede).'),
          _buildPracticeItem(context, 'Injeção de Dependência', 'Utilize pacotes como `GetIt` ou `Riverpod` para desacoplar as dependências e facilitar os testes.'),
          _buildPracticeItem(context, 'Performance', 'Use `const` em widgets sempre que possível, evite rebuilds desnecessários com `BlocBuilder` seletivo ou `Selector` do Provider.'),
          _buildPracticeItem(context, 'Widgets Reutilizáveis', 'Crie componentes genéricos para elementos que se repetem na UI (botões, campos de texto, etc).'),
        ],
      ),
    );
  }

  Widget _buildPracticeItem(BuildContext context, String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.indigo.shade800)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
