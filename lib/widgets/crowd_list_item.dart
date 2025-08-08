import 'package:flutter/material.dart';
import '../models/crowd_data.dart';

class CrowdListItem extends StatelessWidget {
  final CrowdData data;

  const CrowdListItem({
    super.key,
    required this.data,
  });

  Color _getColor() {
    switch (data.color) {
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getIcon() {
    switch (data.population.toLowerCase()) {
      case 'low':
        return Icons.circle;
      case 'medium':
        return Icons.circle;
      case 'high':
        return Icons.circle;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: Icon(
          _getIcon(),
          color: _getColor(),
          size: 24,
        ),
        title: Text(data.name),
        subtitle: Text('${data.population} • Last updated: ${data.lastUpdated}'),
        tileColor: _getColor().withOpacity(0.1),
      ),
    );
  }
}