import 'package:flutter/material.dart';

import '../widgets/code.dart';

class SolidPrinciplesPage extends StatelessWidget {
  const SolidPrinciplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Princípios SOLID no Flutter', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
          SizedBox(height: 16),
          Card(
            color: Colors.indigo.shade100,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'SOLID é um conjunto de princípios para deixar o código mais organizado, flexível e fácil de manter. '
                'Esses princípios ajudam a criar sistemas escaláveis e de fácil manutenção.', 
                style: TextStyle(fontSize: 15)
              ),
            ),
          ),

          SizedBox(height: 16),
          buildSolidPrinciplesTable(context),
          SizedBox(height: 24),
          Divider(color: Colors.grey),
          SizedBox(height: 24),
          Text(
            '🛒 Exemplo: App de Cadastro de Produtos em Flutter',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 8),
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vamos imaginar um app simples com as seguintes funcionalidades:',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Formulário para cadastrar produtos',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    '• Lista de produtos',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    '• Validação de dados',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    '• Armazenamento local (simulado)',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey), SizedBox(height: 24),

          Text('S – Single Responsibility Principle (Responsabilidade Única)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          Text('Cada classe/módulo deve ter uma única responsabilidade.', style: TextStyle(color: Colors.grey[300])),
          Text('Aplicação: Separar lógica de UI, validação e armazenamento.', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              code1(),
              code2(),
              code3(),
            ],
          ),
          Text('➡️ Cada classe tem uma responsabilidade clara.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),


          Text('O – Open/Closed Principle (Aberto para extensão, fechado para modificação)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          Text('O sistema fica aberto para extensão, mas fechado para alteração.', style: TextStyle(color: Colors.grey[300])),
          Text('Aplicação: Extender tipos de produtos sem alterar a lógica base.', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              code4(),
              code5(),
            ],
          ),
          Text('➡️ Código fechado para modificação, aberto para extensão.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),


          Text('L – Liskov Substitution Principle (Substituição de Liskov)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          Text('Todas as implementações se comportam da mesma forma.', style: TextStyle(color: Colors.grey[300])),
          Text('Aplicação: Usar ProductType sem se preocupar com qual tipo está sendo usado.', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
          code6(),
          Text('➡️ O código funciona com qualquer subtipo de ProductType.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),


          Text('I – Interface Segregation Principle (Segregação de Interfaces)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          Text('Cada classe implementa só o que realmente usa, evitando interfaces genéricas criando interfaces específicas.', style: TextStyle(color: Colors.grey[300])),
          Text('Aplicação: Separar responsabilidades de exibição e atualização.', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
          code7(),
          Text('➡️ Evita interfaces "inchadas" que obrigam métodos inúteis.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),


          Text('D – Dependency Inversion Principle (Inversão de Dependência)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          Text('Dependa de abstrações, não de implementações concretas.', style: TextStyle(color: Colors.grey[300])),
          Text('Aplicação: Usar injeção de dependência para o repositório.', style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              code8(),
              code9(),
            ],
          ),
          Text('➡️ Depende de abstrações, não de implementações.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),

          Text('🧪 Interface de Cadastro com Flutter', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24)),
          code10(),
          SizedBox(height: 8),
          Divider(color: Colors.grey), SizedBox(height: 24),



          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('🧠 Por que usar SOLID no Flutter?', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('\t\tOs princípios SOLID ajudam a evitar os famosos “códigos espaguete” e facilitam a evolução do app sem dores de cabeça:', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              SizedBox(height: 16),
              ..._buildSolidTopics([
                {
                  'title': 'Manutenção facilitada:',
                  'description': 'Cada classe ou widget tem uma função clara, tornando o código mais legível e fácil de modificar.',
                },
                {
                  'title': 'Testabilidade:',
                  'description': 'Separar responsabilidades permite testes mais precisos e independentes.',
                },
                {
                  'title': 'Reutilização de componentes:',
                  'description': 'Widgets e classes bem definidos podem ser reaproveitados em diferentes partes do app.',
                },
                {
                  'title': 'Escalabilidade:',
                  'description': 'À medida que o app cresce, o código continua organizado e compreensível.',
                },
                {
                  'title': 'Colaboração eficiente:',
                  'description': 'Em equipes, cada dev pode trabalhar em partes distintas sem causar conflitos.',
                },
              ]),
            ],
          ),
          SizedBox(height: 24),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('⏰ Quando aplicar SOLID no Flutter?', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('\t\tVocê pode começar a aplicar SOLID desde o início do projeto, mas ele se torna essencial em situações como:', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              SizedBox(height: 16),
              Text('   • Projetos com múltiplas telas e funcionalidades.', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              Text('   • Aplicativos que exigem manutenção contínua ou atualizações frequentes.', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              Text('   • Quando há integração com APIs, banco de dados ou serviços externos.', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              Text('   • Em equipes com mais de um desenvolvedor, para evitar sobreposição de responsabilidades.', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
              Text('   • Ao implementar arquiteturas como Clean Architecture ou MVVM, que se beneficiam diretamente dos princípios SOLID.', style: TextStyle(color: Colors.grey[300], fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildSolidPrinciplesTable(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF1E1E2E), Color(0xFF2A2A3E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withValues(alpha: (0.3 * 255)),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(3),
      },
      children: [
        // Cabeçalho da tabela
        TableRow(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          children: [
            _buildTableCell(context, 'Princípio', isHeader: true),
            _buildTableCell(context, 'Nome', isHeader: true),
            _buildTableCell(context, 'Objetivo', isHeader: true),
          ],
        ),
        // Linhas alternadas
        ..._buildTableRows(context),
      ],
    ),
  );
}

List<TableRow> _buildTableRows(BuildContext context) {
  final rows = [
    ['S', 'Single Responsibility Principle', 'Uma classe deve ter apenas uma responsabilidade'],
    ['O', 'Open/Closed Principle', 'Aberta para extensão, fechada para modificação'],
    ['L', 'Liskov Substitution Principle', 'Subclasses devem poder substituir a classe base'],
    ['I', 'Interface Segregation Principle', 'Interfaces específicas em vez de genéricas'],
    ['D', 'Dependency Inversion Principle', 'Dependa de abstrações, não de implementações'],
  ];

  return rows.asMap().entries.map((entry) {
    final index = entry.key;
    final row = entry.value;
    final isEven = index % 2 == 0;

    return TableRow(
      decoration: BoxDecoration(
        color: isEven ? Color(0xFF1E1E2E) : Color(0xFF2A2A3E),
        borderRadius: index == rows.length - 1
          ? BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )
          : BorderRadius.zero,
      ),
      children: row.map((cell) => _buildTableCell(context, cell)).toList(),
    );
  }).toList();
}

Widget _buildTableCell(BuildContext context, String text, {bool isHeader = false}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: isHeader ? Color(0xFF8E2DE2) : Color(0xFF4A00E0), width: 1.5),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.all(4),
    padding: EdgeInsets.all(12),
    child: Text(
      text,
      style: isHeader
        ? Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
        : TextStyle(color: Colors.grey[300], fontSize: 14),
      textAlign: TextAlign.center,
    ),
  );
}




List<Widget> _buildSolidTopics(List<Map<String, String>> topics) {
  return topics.map((topic) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('   • ${topic['title']}', style: TextStyle( color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.bold)),
          // ignore: prefer_interpolation_to_compose_strings
          Text('      ' + topic['description']!, style: TextStyle(color: Colors.grey[300], fontSize: 16)),
        ],
      ),
    );
  }).toList();
}