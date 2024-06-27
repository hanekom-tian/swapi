import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class PersonModel extends SwapiModel {
  final String birthYear;
  final String eyeColor;
  final List<String> films;
  final String gender;
  final String hairColor;
  final String height;
  final String homeworld;
  final String mass;
  final String skinColor;
  final List<String> species;
  final List<String> starships;
  final List<String> vehicles;

  PersonModel({
    required super.name,
    required super.url,
    required super.created,
    required super.edited,
    required this.birthYear,
    required this.eyeColor,
    required this.films,
    required this.gender,
    required this.hairColor,
    required this.height,
    required this.homeworld,
    required this.mass,
    required this.skinColor,
    required this.species,
    required this.starships,
    required this.vehicles,
  });

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return PersonModel.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'birth_year': birthYear,
      'eye_color': eyeColor,
      'films': films,
      'gender': gender,
      'hair_color': hairColor,
      'height': height,
      'homeworld': homeworld,
      'mass': mass,
      'skin_color': skinColor,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
      'species': species,
      'starships': starships,
      'vehicles': vehicles,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      url: map['url'],
      name: map['name'],
      birthYear: map['birth_year'],
      eyeColor: map['eye_color'],
      films: List<String>.from(map['films'] as List),
      gender: map['gender'],
      hairColor: map['hair_color'],
      height: map['height'],
      homeworld: map['homeworld'],
      mass: map['mass'],
      skinColor: map['skin_color'],
      created: map['created'],
      edited: map['edited'],
      species: List<String>.from(map['species'] as List),
      starships: List<String>.from(map['starships'] as List),
      vehicles: List<String>.from(map['vehicles'] as List),
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        birthYear,
        eyeColor,
        films,
        gender,
        hairColor,
        height,
        homeworld,
        mass,
        skinColor,
        created,
        edited,
        species,
        starships,
        vehicles,
      ];

  PersonModel copyWith({
    String? name,
    String? url,
    String? birthYear,
    String? eyeColor,
    List<String>? films,
    String? gender,
    String? hairColor,
    String? height,
    String? homeworld,
    String? mass,
    String? skinColor,
    String? created,
    String? edited,
    List<String>? species,
    List<String>? starships,
    List<String>? vehicles,
  }) {
    return PersonModel(
      name: name ?? this.name,
      url: url ?? this.url,
      birthYear: birthYear ?? this.birthYear,
      eyeColor: eyeColor ?? this.eyeColor,
      films: films ?? this.films,
      gender: gender ?? this.gender,
      hairColor: hairColor ?? this.hairColor,
      height: height ?? this.height,
      homeworld: homeworld ?? this.homeworld,
      mass: mass ?? this.mass,
      skinColor: skinColor ?? this.skinColor,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
      species: species ?? this.species,
      starships: starships ?? this.starships,
      vehicles: vehicles ?? this.vehicles,
    );
  }
}
