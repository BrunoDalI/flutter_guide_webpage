// import 'package:flutter/material.dart';
// import '../widgets/app_bar.dart';
// import '../widgets/build_section_tile.dart';
// import 'bloc_page.dart';
// import 'riverpod_page.dart';
// import 'solid_principles_page.dart';
// import 'clean_architecture_page.dart';
// import 'best_practices_page.dart';
// import 'resources_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E2E),
//       appBar: CustomAppBar(),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color.fromARGB(255, 24, 24, 59), Color.fromARGB(255, 22, 46, 110)],
//           ),
//         ),
//         child: ListView(
//           padding: EdgeInsets.all(30),
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Seu Guia Completo de Flutter',
//                     style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.bold, 
//                       color: Colors.white,
//                       fontSize: 28,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Aprenda a criar apps robustos e escaláveis com as melhores práticas do mercado.',
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                       color: Colors.grey[300],
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32),
//             buildSessionTile(
//               context,
//               icon: Icons.shield_outlined,
//               color: Color(0xFF4A00E0),
//               title: 'Princípios SOLID',
//               child: SolidPrinciplesPage(),
//             ),
//             SizedBox(height: 16),
//             buildSessionTile(
//               context,
//               icon: Icons.architecture_outlined,
//               color: Color.fromARGB(255, 5, 146, 0),
//               title: 'Clean Architecture',
//               child: CleanArchitecturePage(),
//             ),
//             SizedBox(height: 16),
//             buildSessionTile(
//               context,
//               icon: Icons.bolt_outlined,
//               color: Color(0xFF8E2DE2),
//               title: 'BLoC',
//               child: BlocPage(),
//             ),
//             SizedBox(height: 16),
//             buildSessionTile(
//               context,
//               icon: Icons.podcasts_outlined,
//               color: Color(0xFFFF5F6D),
//               title: 'Riverpod',
//               child: RiverpodPage(),
//             ),
//             SizedBox(height: 16),
//             buildSessionTile(
//               context,
//               icon: Icons.tips_and_updates_outlined,
//               color: Color.fromARGB(255, 0, 128, 163),
//               title: 'Boas Práticas',
//               child: BestPracticesPage(),
//             ),
//             SizedBox(height: 16),
//             buildSessionTile(
//               context,
//               icon: Icons.link_outlined,
//               color: Color(0xFFff6a00),
//               title: 'Recursos Úteis',
//               child: ResourcesPage(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






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
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 24, 24, 59),
              Color.fromARGB(255, 22, 46, 110),
            ],
          ),
        ),
        child: ListView(
          controller: scrollController, // Adiciona o ScrollController
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
      floatingActionButton: Container(
        width: 50, // Largura do botão
        height: 50, // Altura do botão
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF5F6D), Color(0xFF42A5F5)], // Gradiente na borda
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(35), // Arredondamento total
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: (0.6)), // Sombra escura
              blurRadius: 20, // Intensidade do desfoque
              spreadRadius: 5, // Expansão da sombra
              offset: Offset(0, 10), // Sombra abaixo do botão
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(5), // Espaço interno para criar borda
          decoration: BoxDecoration(
            color: Color(0xFF1E1E2E), // Fundo do botão
            borderRadius: BorderRadius.circular(30), // Arredondamento interno
          ),
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo(
                0, // Leva ao topo
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            backgroundColor: Colors.transparent, // Fundo transparente para usar o Container
            elevation: 0, // Remove sombra padrão do botão
            // child: Icon(Icons.arrow_upward, color: Colors.white),
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Color(0xFFFF5F6D),
                  Color(0xFF42A5F5)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Icon(Icons.arrow_upward, color: Colors.white, size: 24),
            ),
          ),
        ),
      ),
    );
  }
}