// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'bloc_page.dart';
import 'riverpod_page.dart';
import 'solid_principles_page.dart';
import 'clean_architecture_page.dart';
import 'best_practices_page.dart';
import 'resources_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F23),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2), Color(0xFF4A00E0), Color(0xFF8E2DE2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
           children: [
            Icon(Icons.menu_book_outlined, color: Colors.white),
            SizedBox(width: 8),
            Text('Guia Flutter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ],
        ),
        centerTitle: true, // Centraliza o título
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //colors: [Color(0xFF0F0F23), Color(0xFF16213E)],
            colors: [Color.fromARGB(255, 24, 24, 59), Color.fromARGB(255, 22, 46, 110)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seu Guia Completo de Flutter',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aprenda a criar apps robustos e escaláveis com as melhores práticas do mercado.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[300],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            _buildSessionTile(
              context,
              icon: Icons.shield_outlined,
              color: Color(0xFF4A00E0),
              title: 'Princípios SOLID',
              child: SolidPrinciplesPage(),
            ),
            SizedBox(height: 16),
            _buildSessionTile(
              context,
              icon: Icons.architecture_outlined,
              color: Color.fromARGB(255, 5, 146, 0),
              title: 'Clean Architecture',
              child: CleanArchitecturePage(),
            ),
            SizedBox(height: 16),
            _buildSessionTile(
              context,
              icon: Icons.bolt_outlined,
              color: Color(0xFF8E2DE2),
              title: 'BLoC',
              child: BlocPage(),
            ),
            SizedBox(height: 16),
            _buildSessionTile(
              context,
              icon: Icons.podcasts_outlined,
              color: Color.fromARGB(255, 226, 45, 166),
              title: 'Riverpod',
              child: RiverpodPage(),
            ),
            SizedBox(height: 16),
            _buildSessionTile(
              context,
              icon: Icons.tips_and_updates_outlined,
              color: Color.fromARGB(255, 0, 128, 163),
              title: 'Boas Práticas',
              child: BestPracticesPage(),
            ),
            SizedBox(height: 16),
            _buildSessionTile(
              context,
              icon: Icons.link_outlined,
              color: Color(0xFFff6a00),
              title: 'Recursos Úteis',
              child: ResourcesPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionTile(BuildContext context, {required IconData icon, required Color color, required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: color, size: 28),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: color)),
          iconColor: color,
          collapsedIconColor: color,
          children: [
            Container(
              color: Color(0xFF1E1E2E),
              padding: const EdgeInsets.all(16.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
