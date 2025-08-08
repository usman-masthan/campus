import 'package:flutter/material.dart';
import '../models/crowd_data.dart';

class LocationDetailsScreen extends StatelessWidget {
  final CrowdData location;

  const LocationDetailsScreen({
    super.key,
    required this.location,
  });

  Color _getStatusColor() {
    switch (location.color) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: _getStatusColor(),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${location.population} Crowd',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last Updated: ${location.lastUpdated}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Typical Crowd Patterns',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Morning: Low'),
              subtitle: Text('8:00 AM - 11:00 AM'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Afternoon: Medium to High'),
              subtitle: Text('11:00 AM - 3:00 PM'),
            ),
            const ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Evening: Medium'),
              subtitle: Text('3:00 PM - 6:00 PM'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement notification setup
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notifications coming soon!'),
                    ),
                  );
                },
                child: const Text('Set Crowd Alert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}