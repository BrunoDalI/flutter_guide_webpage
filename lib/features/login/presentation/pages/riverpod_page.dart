import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class RiverpodPage extends StatelessWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('📌 O que é o BLoC no Flutter?', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
            SizedBox(height: 8),
            Text('O BLoC (Business Logic Component) é um padrão de gerenciamento de estado. Ele ajuda a separar a lógica de negócio da interface (UI).', style: TextStyle(color: Colors.grey[300])),
            SizedBox(height: 8),
            Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('A UI (Widgets) só mostra coisas na tela.\nO BLoC decide como reagir a ações do usuário, validações, chamadas à API, etc.\nIsso deixa o código mais organizado, testável e fácil de manter.', style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 16),
            Text('📂 Estrutura principal do BLoC', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
            SizedBox(height: 8),
            Text('Quando você cria um bloc, normalmente ele gera três arquivos principais:', style: TextStyle(color: Colors.grey[300])),
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
            Text('event.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
            Text('Representa o que aconteceu na aplicação. Cada ação vira um evento.', style: TextStyle(color: Colors.grey[300])),
            _buildHighlightView(
'''
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String senha;
  LoginSubmitted(this.email, this.senha);
}
'''
            ),
            SizedBox(height: 16),
            Text('state.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
            Text('Representa em qual situação a tela está no momento. É imutável.', style: TextStyle(color: Colors.grey[300])),
            _buildHighlightView(
'''
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String mensagem;
  LoginFailure(this.mensagem);
}
'''
            ),
            SizedBox(height: 16),
            Text('bloc.dart', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
            Text('É onde você liga os eventos aos estados.', style: TextStyle(color: Colors.grey[300])),
            _buildHighlightView(
'''
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      // Simulação de login
      await Future.delayed(Duration(seconds: 2));
      if (event.email == "teste@email.com" && event.senha == "1234") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Usuário ou senha inválidos"));
      }
    });
  }
}
'''
            ),
            SizedBox(height: 24),
            Text('🎯 E na UI como usamos?', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
            SizedBox(height: 8),
            Text('No widget, você pode usar:', style: TextStyle(color: Colors.grey[300])),
            SizedBox(height: 8),
            Text('BlocBuilder → Reconstrói a UI quando o estado muda.', style: TextStyle(color: Colors.grey[300])),
            _buildHighlightView(
'''
BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    if (state is LoginLoading) {
      return CircularProgressIndicator();
    } else if (state is LoginFailure) {
      return Text("Erro: \${state.mensagem}");
    }
    return ElevatedButton(
      onPressed: () {
        context.read<LoginBloc>().add(LoginSubmitted("email", "senha"));
      },
      child: Text("Login"),
    );
  },
)
'''
            ),
            SizedBox(height: 16),
            Text('BlocListener → Escuta mudanças de estado para efeitos colaterais (snackbar, navegação, etc), sem reconstruir a UI.', style: TextStyle(color: Colors.grey[300])),
            _buildHighlightView(
'''
BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login feito com sucesso!")),
      );
      Navigator.pushNamed(context, "/home");
    }
  },
  child: LoginFormWidget(),
)
'''
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 8),
            Text('✅ Resumindo', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
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
            Text('Event → O que aconteceu (ação do usuário ou sistema).', style: TextStyle(color: Colors.grey[300])),
            Text('State → Em qual situação a tela está.', style: TextStyle(color: Colors.grey[300])),
            Text('Bloc → Recebe eventos, processa e emite estados.', style: TextStyle(color: Colors.grey[300])),
            Text('BlocListener → Reage a estados sem rebuild da UI (snackbar, navegação, etc).', style: TextStyle(color: Colors.grey[300])),
          ],
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
        language: 'dart',
        theme: draculaTheme,
        padding: EdgeInsets.all(16),
        textStyle: TextStyle(fontFamily: 'monospace', fontSize: 15),
      ),
    );
  }
}
