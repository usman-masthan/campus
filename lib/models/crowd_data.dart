class CrowdData {
  final String name;
  final String population;
  final String color;
  final String lastUpdated;

  CrowdData({
    required this.name,
    required this.population,
    required this.color,
    required this.lastUpdated,
  });

  factory CrowdData.fromMap(Map<String, dynamic> map) {
    return CrowdData(
      name: map['name'] as String,
      population: map['population'] as String,
      color: map['color'] as String,
      lastUpdated: map['lastUpdated'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'population': population,
      'color': color,
      'lastUpdated': lastUpdated,
    };
  }
}