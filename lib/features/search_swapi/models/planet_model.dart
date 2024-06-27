import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class PlanetModel extends SwapiModel {
  final String diameter;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String gravity;
  final String population;
  final String climate;
  final String terrain;
  final String surfaceWate;
  final List<String> residents;
  final List<String> films;

  PlanetModel({
    required super.name,
    required super.url,
    required super.created,
    required super.edited,
    required this.diameter,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.gravity,
    required this.population,
    required this.climate,
    required this.terrain,
    required this.surfaceWate,
    required this.residents,
    required this.films,
  });

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return PlanetModel.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
      'diameter': diameter,
      'rotation_period': rotationPeriod,
      'orbital_period': orbitalPeriod,
      'gravity': gravity,
      'population': population,
      'climate': climate,
      'terrain': terrain,
      'surface_water': surfaceWate,
      'residents': residents,
      'films': films,
    };
  }

  factory PlanetModel.fromMap(Map<String, dynamic> map) {
    return PlanetModel(
      name: map['name'],
      url: map['url'],
      created: map['created'],
      edited: map['edited'],
      diameter: map['diameter'],
      rotationPeriod: map['rotation_period'],
      orbitalPeriod: map['orbital_period'],
      gravity: map['gravity'],
      population: map['population'],
      climate: map['climate'],
      terrain: map['terrain'],
      surfaceWate: map['surface_water'],
      residents: List<String>.from(map['residents'] as List),
      films: List<String>.from(map['films'] as List),
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        diameter,
        rotationPeriod,
        orbitalPeriod,
        gravity,
        population,
        climate,
        terrain,
        surfaceWate,
        residents,
        films,
      ];

  PlanetModel copyWith({
    String? created,
    String? edited,
    String? name,
    String? url,
    String? diameter,
    String? rotationPeriod,
    String? orbitalPeriod,
    String? gravity,
    String? population,
    String? climate,
    String? terrain,
    String? surfaceWate,
    List<String>? residents,
    List<String>? films,
  }) {
    return PlanetModel(
      name: name ?? this.name,
      url: url ?? this.url,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
      diameter: diameter ?? this.diameter,
      rotationPeriod: rotationPeriod ?? this.rotationPeriod,
      orbitalPeriod: orbitalPeriod ?? this.orbitalPeriod,
      gravity: gravity ?? this.gravity,
      population: population ?? this.population,
      climate: climate ?? this.climate,
      terrain: terrain ?? this.terrain,
      surfaceWate: surfaceWate ?? this.surfaceWate,
      residents: residents ?? this.residents,
      films: films ?? this.films,
    );
  }
}
