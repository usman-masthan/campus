import 'package:flutter/material.dart';
import '../models/crowd_data.dart';
import '../services/crowd_service.dart';
import '../widgets/crowd_list_item.dart';
import 'details_screen.dart';
import 'map_view_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CrowdService _crowdService = CrowdService();
  late List<CrowdData> _crowdData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _crowdData = _crowdService.getCrowdData();
  }

  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final updatedData = await _crowdService.refreshCrowdData();
      setState(() {
        _crowdData = updatedData;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _openLocationDetails(CrowdData data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetailsScreen(location: data),
      ),
    );
  }

  void _openMapView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapViewScreen(locations: _crowdData),
      ),
    );
  }

  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Crowd'),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: _openMapView,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _crowdData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => _openLocationDetails(_crowdData[index]),
                  child: CrowdListItem(data: _crowdData[index]),
                );
              },
            ),
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshData,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}