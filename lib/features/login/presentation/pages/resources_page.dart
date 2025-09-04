import 'package:flutter/material.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Recursos Úteis', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
          // SizedBox(height: 16),
          // _buildResourceItem(context, '📚 Documentação oficial Flutter', 'https://docs.flutter.dev'),
          // _buildResourceItem(context, '🧱 Bloc Library', 'https://bloclibrary.dev'),
          // _buildResourceItem(context, '🏗️ Clean Architecture (Uncle Bob)', 'https://github.com/unclebob'),
          // _buildResourceItem(context, '📖 Effective Dart', 'https://dart.dev/guides/language/effective-dart'),
          // _buildResourceItem(context, '🎯 Flutter Best Practices', 'https://flutter.dev/docs/development/data-and-backend/state-mgmt/options'),
        ],
      ),
    );
  }

  // Widget _buildResourceItem(BuildContext context, String title, String url) {
  //   return Card(
  //     margin: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: ListTile(
  //       title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo.shade800)),
  //       subtitle: Text(url, style: TextStyle(color: Colors.grey[600])),
  //       trailing: Icon(Icons.open_in_new, color: Colors.indigo),
  //       onTap: () {
  //         // Aqui você pode implementar a abertura do link
  //       },
  //     ),
  //   );
  // }
}
