import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class FilmModel extends SwapiModel {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List<String> species;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> characters;
  final List<String> planets;

  FilmModel({
    required super.url,
    required super.created,
    required super.edited,
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.species,
    required this.starships,
    required this.vehicles,
    required this.characters,
    required this.planets,
  }) : super(name: title);

  @override
  SwapiModel fromMap(Map<String, dynamic> map) {
    return FilmModel.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'species': species,
      'starships': starships,
      'vehicles': vehicles,
      'characters': characters,
      'planets': planets,
      'created': created.toIso8601String(),
      'edited': edited.toIso8601String(),
      'url': url,
    };
  }

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel(
      title: map['title'],
      episodeId: map['episode_id'],
      openingCrawl: map['opening_crawl'],
      director: map['director'],
      producer: map['producer'],
      releaseDate: map['release_date'],
      species: List<String>.from(map['species'] as List),
      starships: List<String>.from(map['starships'] as List),
      vehicles: List<String>.from(map['vehicles'] as List),
      characters: List<String>.from(map['characters'] as List),
      planets: List<String>.from(map['planets'] as List),
      created: map['created'],
      edited: map['edited'],
      url: map['url'],
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        species,
        starships,
        vehicles,
        characters,
        planets,
        created,
        edited,
      ];

  FilmModel copyWith({
    String? url,
    String? title,
    int? episodeId,
    String? openingCrawl,
    String? director,
    String? producer,
    String? releaseDate,
    List<String>? species,
    List<String>? starships,
    List<String>? vehicles,
    List<String>? characters,
    List<String>? planets,
    String? created,
    String? edited,
  }) {
    return FilmModel(
      url: url ?? this.url,
      title: title ?? this.title,
      episodeId: episodeId ?? this.episodeId,
      openingCrawl: openingCrawl ?? this.openingCrawl,
      director: director ?? this.director,
      producer: producer ?? this.producer,
      releaseDate: releaseDate ?? this.releaseDate,
      species: species ?? this.species,
      starships: starships ?? this.starships,
      vehicles: vehicles ?? this.vehicles,
      characters: characters ?? this.characters,
      planets: planets ?? this.planets,
      created: created ?? this.created.toIso8601String(),
      edited: edited ?? this.edited.toIso8601String(),
    );
  }
}
