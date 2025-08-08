import 'package:flutter/material.dart';
import '../models/crowd_data.dart';

class MapViewScreen extends StatelessWidget {
  final List<CrowdData> locations;

  const MapViewScreen({
    super.key,
    required this.locations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Map'),
      ),
      body: Stack(
        children: [
          // TODO: Implement actual map
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.map,
                  size: 100,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  'Campus Map\n(Coming Soon)',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}