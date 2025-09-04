import 'package:flutter/material.dart';

Widget buildSessionTile(BuildContext context, {required IconData icon, required Color color, required String title, required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFF1E1E2E),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: color.withValues(alpha: (0.5)), width: 3),
      boxShadow: [
        BoxShadow(
          //color: Color(0xFF42A5F5).withValues(alpha: (0.5 * 255)),
          color: color.withValues(alpha: (0.5)),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
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
    ),
  );
}