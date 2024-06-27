import 'package:equatable/equatable.dart';
import 'package:swapi/core/enums.dart';
import 'package:swapi/features/search_swapi/models/film_model.dart';
import 'package:swapi/features/search_swapi/models/person_model.dart';
import 'package:swapi/features/search_swapi/models/planet_model.dart';
import 'package:swapi/features/search_swapi/models/species_model.dart';
import 'package:swapi/features/search_swapi/models/starship_model.dart';
import 'package:swapi/features/search_swapi/models/vehicle_model.dart';
import 'package:swapi/services/api/api_service.dart';

class SwapiSearchStateModel extends Equatable {
  final bool loading;
  final ApiService apiService;
  final SwapiCategory selectedCategory;
  final List<PersonModel> people;
  final List<FilmModel> films;
  final List<PlanetModel> planets;
  final List<SpeciesModel> species;
  final List<StarshipModel> starships;
  final List<VehicleModel> vehicles;

  SwapiSearchStateModel({
    required this.loading,
    required this.selectedCategory,
    required this.people,
    required this.films,
    required this.planets,
    required this.species,
    required this.starships,
    required this.vehicles,
  }) : apiService = ApiService.assignApi(selectedCategory);

  factory SwapiSearchStateModel.empty() {
    return SwapiSearchStateModel(
      loading: false,
      selectedCategory: SwapiCategory.none,
      people: const [],
      films: const [],
      planets: const [],
      species: const [],
      starships: const [],
      vehicles: const [],
    );
  }

  SwapiSearchStateModel copyWith({
    bool? loading,
    SwapiCategory? selectedCategory,
    List<PersonModel>? people,
    List<FilmModel>? films,
    List<PlanetModel>? planets,
    List<SpeciesModel>? species,
    List<StarshipModel>? starships,
    List<VehicleModel>? vehicles,
  }) {
    return SwapiSearchStateModel(
      loading: loading ?? this.loading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      people: people ?? this.people,
      films: films ?? this.films,
      planets: planets ?? this.planets,
      species: species ?? this.species,
      starships: starships ?? this.starships,
      vehicles: vehicles ?? this.vehicles,
    );
  }

  @override
  List<Object> get props => [
        loading,
        selectedCategory,
        people,
        films,
        planets,
        species,
        starships,
        vehicles,
        selectedCategory,
      ];
}
