import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          NoticeCard(
            title: 'Library Hours Extended',
            date: 'August 8, 2025',
            content: 'The main library will remain open until midnight during finals week.',
            priority: NoticePriority.high,
          ),
          SizedBox(height: 16),
          NoticeCard(
            title: 'Cafeteria Menu Update',
            date: 'August 7, 2025',
            content: 'New vegetarian options are now available in the main cafeteria.',
            priority: NoticePriority.medium,
          ),
          SizedBox(height: 16),
          NoticeCard(
            title: 'Wi-Fi Maintenance',
            date: 'August 5, 2025',
            content: 'Campus Wi-Fi will be undergoing maintenance on Saturday from 2AM to 4AM.',
            priority: NoticePriority.low,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Notification settings coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.notifications),
      ),
    );
  }
}

enum NoticePriority { low, medium, high }

class NoticeCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final NoticePriority priority;

  const NoticeCard({
    super.key,
    required this.title,
    required this.date,
    required this.content,
    required this.priority,
  });

  Color _getPriorityColor() {
    switch (priority) {
      case NoticePriority.high:
        return Colors.red.shade100;
      case NoticePriority.medium:
        return Colors.orange.shade100;
      case NoticePriority.low:
        return Colors.blue.shade100;
    }
  }

  IconData _getPriorityIcon() {
    switch (priority) {
      case NoticePriority.high:
        return Icons.priority_high;
      case NoticePriority.medium:
        return Icons.info;
      case NoticePriority.low:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getPriorityColor(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getPriorityIcon()),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
            Text(content),
          ],
        ),
      ),
    );
  }
}