import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia BLoC no Flutter'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
    padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📌 O que é o BLoC no Flutter?', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo)),
            SizedBox(height: 8),
            Text('O BLoC (Business Logic Component) é um padrão de gerenciamento de estado. Ele ajuda a separar a lógica de negócio da interface (UI).'),
            SizedBox(height: 8),
            Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('A UI (Widgets) só mostra coisas na tela.\nO BLoC decide como reagir a ações do usuário, validações, chamadas à API, etc.\nIsso deixa o código mais organizado, testável e fácil de manter.', style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 16),
            Text('📂 Estrutura principal do BLoC', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo)),
            SizedBox(height: 8),
            Text('Quando você cria um bloc, normalmente ele gera três arquivos principais:'),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('event.dart'), backgroundColor: Colors.indigo.shade100),
                Chip(label: Text('state.dart'), backgroundColor: Colors.indigo.shade100),
                Chip(label: Text('bloc.dart'), backgroundColor: Colors.indigo.shade100),
              ],
            ),
            SizedBox(height: 16),
            Text('event.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo)),
            Text('Representa o que aconteceu na aplicação. Cada ação vira um evento.'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('abstract class LoginEvent {}\n\nclass LoginSubmitted extends LoginEvent {\n  final String email;\n  final String senha;\n  LoginSubmitted(this.email, this.senha);\n}', style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
              ),
            ),
            SizedBox(height: 16),
            Text('state.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo)),
            Text('Representa em qual situação a tela está no momento. É imutável.'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('abstract class LoginState {}\n\nclass LoginInitial extends LoginState {}\n\nclass LoginLoading extends LoginState {}\n\nclass LoginSuccess extends LoginState {}\n\nclass LoginFailure extends LoginState {\n  final String mensagem;\n  LoginFailure(this.mensagem);\n}', style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
              ),
            ),
            SizedBox(height: 16),
            Text('bloc.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo)),
            Text('É onde você liga os eventos aos estados.'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('class LoginBloc extends Bloc<LoginEvent, LoginState> {\n  LoginBloc() : super(LoginInitial()) {\n    on<LoginSubmitted>((event, emit) async {\n      emit(LoginLoading());\n      // Simulação de login\n      await Future.delayed(Duration(seconds: 2));\n      if (event.email == "teste@email.com" && event.senha == "1234") {\n        emit(LoginSuccess());\n      } else {\n        emit(LoginFailure("Usuário ou senha inválidos"));\n      }\n    });\n  }\n}', style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
              ),
            ),
            SizedBox(height: 24),
            Text('🎯 E na UI como usamos?', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo)),
            SizedBox(height: 8),
            Text('No widget, você pode usar:'),
            SizedBox(height: 8),
            Text('BlocBuilder → Reconstrói a UI quando o estado muda.'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('BlocBuilder<LoginBloc, LoginState>(\n  builder: (context, state) {\n    if (state is LoginLoading) {\n      return CircularProgressIndicator();\n    } else if (state is LoginFailure) {\n      return Text("Erro: mensagem");\n    }\n    return ElevatedButton(\n      onPressed: () {\n        context.read<LoginBloc>().add(LoginSubmitted("email", "senha"));\n      },\n      child: Text("Login"),\n    );\n  },\n)', style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
              ),
            ),
            SizedBox(height: 16),
            Text('BlocListener → Escuta mudanças de estado para efeitos colaterais (snackbar, navegação, etc), sem reconstruir a UI.'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('BlocListener<LoginBloc, LoginState>(\n  listener: (context, state) {\n    if (state is LoginSuccess) {\n      ScaffoldMessenger.of(context).showSnackBar(\n        SnackBar(content: Text("Login feito com sucesso!")),\n      );\n      Navigator.pushNamed(context, "/home");\n    }\n  },\n  child: LoginFormWidget(),\n)', style: TextStyle(fontFamily: 'monospace', fontSize: 14)),
              ),
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 8),
            Text('✅ Resumindo', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.indigo)),
            SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                Chip(label: Text('Event'), backgroundColor: Colors.indigo.shade100),
                Chip(label: Text('State'), backgroundColor: Colors.indigo.shade100),
                Chip(label: Text('Bloc'), backgroundColor: Colors.indigo.shade100),
                Chip(label: Text('BlocListener'), backgroundColor: Colors.indigo.shade100),
              ],
            ),
            SizedBox(height: 8),
            Text('Event → O que aconteceu (ação do usuário ou sistema).'),
            Text('State → Em qual situação a tela está.'),
            Text('Bloc → Recebe eventos, processa e emite estados.'),
            Text('BlocListener → Reage a estados sem rebuild da UI (snackbar, navegação, etc).'),
          ],
        ),
      ),
    );
  }
}
