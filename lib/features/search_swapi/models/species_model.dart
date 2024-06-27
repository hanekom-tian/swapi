import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class SpeciesModel extends SwapiModel {
  final String classification;
  final String designation;
  final String averageHeight;
  final String averageLifespan;
  final String eyeColors;
  final String hairColors;
  final String skinColors;
  final String language;
  final String homeworld;
  final List<String> people;
  final List<String> films;

  SpeciesModel({
    required super.name,
    required super.url,
    required super.created,
    required super.edited,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.averageLifespan,
    required this.eyeColors,
    required this.hairColors,
    required this.skinColors,
    required this.language,
    required this.homeworld,
    required this.people,
    required this.films,
  });

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return SpeciesModel.fromMap(map);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'classification': classification,
      'designation': designation,
      'average_height': averageHeight,
      'average_lifespan': averageLifespan,
      'eye_colors': eyeColors,
      'hair_colors': hairColors,
      'skin_colors': skinColors,
      'language': language,
      'homeworld': homeworld,
      'people': people,
      'films': films,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
    };
  }

  factory SpeciesModel.fromMap(Map<String, dynamic> map) {
    return SpeciesModel(
      name: map['name'],
      url: map['url'],
      classification: map['classification'],
      designation: map['designation'],
      averageHeight: map['average_height'],
      averageLifespan: map['average_lifespan'],
      eyeColors: map['eye_colors'],
      hairColors: map['hair_colors'],
      skinColors: map['skin_colors'],
      language: map['language'],
      homeworld: map['homeworld'],
      people: List<String>.from(map['people'] as List),
      films: List<String>.from(map['films'] as List),
      created: map['created'],
      edited: map['edited'],
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        classification,
        designation,
        averageHeight,
        averageLifespan,
        eyeColors,
        hairColors,
        skinColors,
        language,
        homeworld,
        people,
        films,
        created,
        edited,
      ];

  SpeciesModel copyWith({
    String? name,
    String? url,
    String? classification,
    String? designation,
    String? averageHeight,
    String? averageLifespan,
    String? eyeColors,
    String? hairColors,
    String? skinColors,
    String? language,
    String? homeworld,
    List<String>? people,
    List<String>? films,
    String? created,
    String? edited,
  }) {
    return SpeciesModel(
      name: name ?? this.name,
      url: url ?? this.url,
      classification: classification ?? this.classification,
      designation: designation ?? this.designation,
      averageHeight: averageHeight ?? this.averageHeight,
      averageLifespan: averageLifespan ?? this.averageLifespan,
      eyeColors: eyeColors ?? this.eyeColors,
      hairColors: hairColors ?? this.hairColors,
      skinColors: skinColors ?? this.skinColors,
      language: language ?? this.language,
      homeworld: homeworld ?? this.homeworld,
      people: people ?? this.people,
      films: films ?? this.films,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
    );
  }
}
