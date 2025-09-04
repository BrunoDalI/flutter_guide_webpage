import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class CleanArchitecturePage extends StatelessWidget {
  const CleanArchitecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Arquitetura Limpa no Flutter', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
          SizedBox(height: 16),
          Card(
            color: Colors.indigo.shade50,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('A ideia é dividir responsabilidades em camadas independentes. Cada camada tem sua função e depende somente da anterior (ou de contratos/interfaces).', style: TextStyle(fontSize: 15)),
            ),
          ),
          SizedBox(height: 24),
          Text('1. Domain (Regras de Negócio)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          SizedBox(height: 8),
          Text('🔹 O que é: É o coração da aplicação. Aqui ficam as regras de negócio puras, sem depender de Flutter, pacotes externos ou APIs.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Text('🔹 Responsabilidades:', style: TextStyle(color: Colors.grey[300])),
          _buildCodeCard(
            '''
- Entities: modelos de negócio (ex: User, Product, Order).
- UseCases / Interactors: ações do negócio (ex: LoginUser, GetProducts, RegisterClient).
- Repositories (abstrações): contratos/Interfaces que definem o que o app precisa (ex: IAuthRepository com login, logout).
'''
          ),
          SizedBox(height: 8),
          Text('⚠️ Importante: nada aqui deve importar http, sqflite, Firebase ou widgets do Flutter.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 24),
          Text('2. Data (Implementação dos repositórios)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          SizedBox(height: 8),
          Text('🔹 O que é: É a camada que conversa com o mundo externo (API, banco de dados, cache, local storage).', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Text('🔹 Responsabilidades:', style: TextStyle(color: Colors.grey[300])),
          _buildCodeCard(
            '''
- Models (DTOs): conversão entre JSON ↔ Entities (ex: UserModel.fromJson).
- Repositories (implementação): implementam os contratos do domain (ex: AuthRepositoryImpl usa http para logar).
- Data Sources:
  - RemoteDataSource: comunicação com API.
  - LocalDataSource: comunicação com banco local (SQLite, Hive, SharedPreferences).
'''
          ),
          SizedBox(height: 8),
          Text('⚠️ Importante: o Data depende do Domain (porque implementa os repositórios), mas o Domain não sabe nada sobre Data.', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 24),
          Text('3. Presentation (UI e Estado)', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          SizedBox(height: 8),
          Text('🔹 O que é: A camada que o usuário interage. Trabalha com Widgets e Gerência de Estado (Bloc, Riverpod, MobX, Provider, etc).', style: TextStyle(color: Colors.grey[300])),
          SizedBox(height: 8),
          Text('🔹 Responsabilidades:', style: TextStyle(color: Colors.grey[300])),
          _buildCodeCard(
            '''
- Widgets / Pages: telas e componentes visuais.
- State Management: controladores de estado (Bloc, Cubit, Controller, ChangeNotifier).
- Input do usuário → UseCase → Resultado → Renderização na tela.
'''
          ),
          SizedBox(height: 16),
          Text('Exemplo de fluxo:', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          Card(
            color: Colors.indigo.shade50,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Usuário clica em Login.'),
                  Text('UI chama LoginBloc.add(LoginEvent(...)).'),
                  Text('O Bloc aciona o use case LoginUser.'),
                  Text('O use case chama o AuthRepository (contrato) → DataLayer → API.'),
                  Text('O resultado volta para o Bloc → que atualiza o State → a UI reage.'),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Text('Exemplo de estrutura de pastas:', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
          _buildHighlightView(
'''
lib/
  features/
    login/
      domain/
        entities/
        usecases/
        repositories/
      data/
        models/
        datasources/
        repositories/
      presentation/
        bloc/
        pages/
        widgets/
'''
          ),
          SizedBox(height: 24),
          Divider(),
          SizedBox(height: 8),
          Text('Resumindo cada camada:', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
          SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              Chip(label: Text('Domain'), backgroundColor: Colors.indigo.shade100),
              Chip(label: Text('Data'), backgroundColor: Colors.indigo.shade100),
              Chip(label: Text('Presentation'), backgroundColor: Colors.indigo.shade100),
            ],
          ),
          SizedBox(height: 8),
          Text('Domain: regras do negócio, independente de frameworks.', style: TextStyle(color: Colors.grey[300])),
          Text('Data: implementação de acesso a dados (API, banco, cache).', style: TextStyle(color: Colors.grey[300])),
          Text('Presentation: UI + gerência de estado.', style: TextStyle(color: Colors.grey[300])),
        ],
      ),
    );
  }

  Widget _buildCodeCard(String text) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(text, style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
      ),
    );
  }

  Widget _buildHighlightView(String code) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF282A36),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Color(0xFFBD93F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: HighlightView(
        code,
        language: 'yaml',
        theme: draculaTheme,
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontFamily: 'monospace', fontSize: 15),
      ),
    );
  }
}
