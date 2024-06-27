import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class StarshipModel extends SwapiModel {
  final String model;
  final String starshipClass;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String crew;
  final String passengers;
  final String maxAtmospheringSpeed;
  final String hyperdriveRating;
  final String mglt;
  final String cargoCapacity;
  final String consumables;
  final List<String> films;
  final List<String> pilots;

  StarshipModel({
    required super.name,
    required super.url,
    required super.created,
    required super.edited,
    required this.model,
    required this.starshipClass,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.crew,
    required this.passengers,
    required this.maxAtmospheringSpeed,
    required this.hyperdriveRating,
    required this.mglt,
    required this.cargoCapacity,
    required this.consumables,
    required this.films,
    required this.pilots,
  });

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return StarshipModel.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'model': model,
      'starship_class': starshipClass,
      'manufacturer': manufacturer,
      'cost_in_credits': costInCredits,
      'length': length,
      'crew': crew,
      'passengers': passengers,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'hyperdrive_rating': hyperdriveRating,
      'MGLT': mglt,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'films': films,
      'pilots': pilots,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
    };
  }

  factory StarshipModel.fromMap(Map<String, dynamic> map) {
    return StarshipModel(
      name: map['name'],
      url: map['url'],
      model: map['model'],
      starshipClass: map['starship_class'],
      manufacturer: map['manufacturer'],
      costInCredits: map['cost_in_credits'],
      length: map['length'],
      crew: map['crew'],
      passengers: map['passengers'],
      maxAtmospheringSpeed: map['max_atmosphering_speed'],
      hyperdriveRating: map['hyperdrive_rating'],
      mglt: map['MGLT'],
      cargoCapacity: map['cargo_capacity'],
      consumables: map['consumables'],
      films: List<String>.from(map['films'] as List),
      pilots: List<String>.from(map['pilots'] as List),
      created: map['created'],
      edited: map['edited'],
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        model,
        starshipClass,
        manufacturer,
        costInCredits,
        length,
        crew,
        passengers,
        maxAtmospheringSpeed,
        hyperdriveRating,
        mglt,
        cargoCapacity,
        consumables,
        films,
        pilots,
        created,
        edited,
      ];

  StarshipModel copyWith({
    String? name,
    String? url,
    String? model,
    String? starshipClass,
    String? manufacturer,
    String? costInCredits,
    String? length,
    String? crew,
    String? passengers,
    String? maxAtmospheringSpeed,
    String? hyperdriveRating,
    String? mglt,
    String? cargoCapacity,
    String? consumables,
    List<String>? films,
    List<String>? pilots,
    String? created,
    String? edited,
  }) {
    return StarshipModel(
      name: name ?? this.name,
      url: url ?? this.url,
      model: model ?? this.model,
      starshipClass: starshipClass ?? this.starshipClass,
      manufacturer: manufacturer ?? this.manufacturer,
      costInCredits: costInCredits ?? this.costInCredits,
      length: length ?? this.length,
      crew: crew ?? this.crew,
      passengers: passengers ?? this.passengers,
      maxAtmospheringSpeed: maxAtmospheringSpeed ?? this.maxAtmospheringSpeed,
      hyperdriveRating: hyperdriveRating ?? this.hyperdriveRating,
      mglt: mglt ?? this.mglt,
      cargoCapacity: cargoCapacity ?? this.cargoCapacity,
      consumables: consumables ?? this.consumables,
      films: films ?? this.films,
      pilots: pilots ?? this.pilots,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
    );
  }
}
