import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/build_section_tile.dart';
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
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 24, 24, 59), Color.fromARGB(255, 22, 46, 110)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(30),
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
            buildSessionTile(
              context,
              icon: Icons.shield_outlined,
              color: Color(0xFF4A00E0),
              title: 'Princípios SOLID',
              child: SolidPrinciplesPage(),
            ),
            SizedBox(height: 16),
            buildSessionTile(
              context,
              icon: Icons.architecture_outlined,
              color: Color.fromARGB(255, 5, 146, 0),
              title: 'Clean Architecture',
              child: CleanArchitecturePage(),
            ),
            SizedBox(height: 16),
            buildSessionTile(
              context,
              icon: Icons.bolt_outlined,
              color: Color(0xFF8E2DE2),
              title: 'BLoC',
              child: BlocPage(),
            ),
            SizedBox(height: 16),
            buildSessionTile(
              context,
              icon: Icons.podcasts_outlined,
              color: Color(0xFFFF5F6D),
              title: 'Riverpod',
              child: RiverpodPage(),
            ),
            SizedBox(height: 16),
            buildSessionTile(
              context,
              icon: Icons.tips_and_updates_outlined,
              color: Color.fromARGB(255, 0, 128, 163),
              title: 'Boas Práticas',
              child: BestPracticesPage(),
            ),
            SizedBox(height: 16),
            buildSessionTile(
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
}
