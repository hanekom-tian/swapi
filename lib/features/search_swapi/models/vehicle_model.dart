import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class VehicleModel extends SwapiModel {
  final String model;
  final String vehicleClass;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String crew;
  final String passengers;
  final String maxAtmospheringSpeed;
  final String cargoCapacity;
  final String consumables;
  final List<String> films;
  final List<String> pilots;

  VehicleModel({
    required super.name,
    required super.url,
    required super.created,
    required super.edited,
    required this.model,
    required this.vehicleClass,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.crew,
    required this.passengers,
    required this.maxAtmospheringSpeed,
    required this.cargoCapacity,
    required this.consumables,
    required this.films,
    required this.pilots,
  });

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return VehicleModel.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'model': model,
      'vehicle_class': vehicleClass,
      'manufacturer': manufacturer,
      'cost_in_credits': costInCredits,
      'length': length,
      'crew': crew,
      'passengers': passengers,
      'max_atmosphering_speed': maxAtmospheringSpeed,
      'cargo_capacity': cargoCapacity,
      'consumables': consumables,
      'films': films,
      'pilots': pilots,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      name: map['name'],
      url: map['url'],
      model: map['model'],
      vehicleClass: map['vehicle_class'],
      manufacturer: map['manufacturer'],
      costInCredits: map['cost_in_credits'],
      length: map['length'],
      crew: map['crew'],
      passengers: map['passengers'],
      maxAtmospheringSpeed: map['max_atmosphering_speed'],
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
        vehicleClass,
        manufacturer,
        costInCredits,
        length,
        crew,
        passengers,
        maxAtmospheringSpeed,
        cargoCapacity,
        consumables,
        films,
        pilots,
        created,
        edited,
      ];

  VehicleModel copyWith({
    String? name,
    String? url,
    String? model,
    String? vehicleClass,
    String? manufacturer,
    String? costInCredits,
    String? length,
    String? crew,
    String? passengers,
    String? maxAtmospheringSpeed,
    String? cargoCapacity,
    String? consumables,
    List<String>? films,
    List<String>? pilots,
    String? created,
    String? edited,
  }) {
    return VehicleModel(
      name: name ?? this.name,
      url: url ?? this.url,
      model: model ?? this.model,
      vehicleClass: vehicleClass ?? this.vehicleClass,
      manufacturer: manufacturer ?? this.manufacturer,
      costInCredits: costInCredits ?? this.costInCredits,
      length: length ?? this.length,
      crew: crew ?? this.crew,
      passengers: passengers ?? this.passengers,
      maxAtmospheringSpeed: maxAtmospheringSpeed ?? this.maxAtmospheringSpeed,
      cargoCapacity: cargoCapacity ?? this.cargoCapacity,
      consumables: consumables ?? this.consumables,
      films: films ?? this.films,
      pilots: pilots ?? this.pilots,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
    );
  }
}
