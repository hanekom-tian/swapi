import 'dart:developer';

import 'package:swapi/core/enums.dart';
import 'package:swapi/features/search_swapi/models/film_model.dart';
import 'package:swapi/features/search_swapi/models/person_model.dart';
import 'package:swapi/features/search_swapi/models/planet_model.dart';
import 'package:swapi/features/search_swapi/models/species_model.dart';
import 'package:swapi/features/search_swapi/models/starship_model.dart';
import 'package:swapi/features/search_swapi/models/swapi_search_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi/features/search_swapi/models/vehicle_model.dart';

final swapiSearchViewModelProvider =
    StateNotifierProvider<SwapiSearchViewModel, SwapiSearchStateModel>(
        (ref) => SwapiSearchViewModel(SwapiSearchStateModel.empty()));

class SwapiSearchViewModel extends StateNotifier<SwapiSearchStateModel> {
  SwapiSearchViewModel(super.state);

  Future<void> selectCategory({required SwapiCategory selectedCategory}) async {
    state = state.copyWith(selectedCategory: selectedCategory);
    switch (state.selectedCategory) {
      case SwapiCategory.none:
        break;
      case SwapiCategory.people:
        await fetchAllPeople();
      case SwapiCategory.films:
        await fetchAllFilms();
      case SwapiCategory.planets:
        await fetchAllPlanets();
      case SwapiCategory.species:
        await fetchAllSpecies();
      case SwapiCategory.starships:
        await fetchAllStarships();
      case SwapiCategory.vehicles:
        await fetchAllVehicles();
    }
  }

  Future<void> fetchAllPeople() async {
    try {
      state = state.copyWith(loading: true);
      final List<PersonModel> people = (await state.apiService.getAllEntries())
          .map((e) => PersonModel.fromMap(e))
          .toList();
      state = state.copyWith(
        people: people,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchAllFilms() async {
    try {
      state = state.copyWith(loading: true);
      final List<FilmModel> films = (await state.apiService.getAllEntries())
          .map((e) => FilmModel.fromMap(e))
          .toList();
      state = state.copyWith(
        films: films,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchAllPlanets() async {
    try {
      state = state.copyWith(loading: true);
      final List<PlanetModel> planets = (await state.apiService.getAllEntries())
          .map((e) => PlanetModel.fromMap(e))
          .toList();
      state = state.copyWith(
        planets: planets,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchAllSpecies() async {
    try {
      state = state.copyWith(loading: true);
      final List<SpeciesModel> species =
          (await state.apiService.getAllEntries())
              .map((e) => SpeciesModel.fromMap(e))
              .toList();
      state = state.copyWith(
        species: species,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchAllStarships() async {
    try {
      state = state.copyWith(loading: true);
      final List<StarshipModel> starships =
          (await state.apiService.getAllEntries())
              .map((e) => StarshipModel.fromMap(e))
              .toList();
      state = state.copyWith(
        starships: starships,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> fetchAllVehicles() async {
    try {
      state = state.copyWith(loading: true);
      final List<VehicleModel> vehicles =
          (await state.apiService.getAllEntries())
              .map((e) => VehicleModel.fromMap(e))
              .toList();
      state = state.copyWith(
        vehicles: vehicles,
        loading: false,
      );
    } catch (e) {
      log("ViewModel - ERROR: ${e.toString()}");
      state = state.copyWith(loading: false);
    }
  }

  Future<void> searchPeople({required String search}) async {
    try {
      if (state.people.isNotEmpty) {
        final PersonModel person = state.people.firstWhere((person) =>
            person.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(people: [person]);
      } else {
        await fetchAllPeople();
        await searchPeople(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<PersonModel> people =
            (await state.apiService.searchEntry(query: search))
                .map((e) => PersonModel.fromMap(e))
                .toList();
        state = state.copyWith(
          people: people,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }

  Future<void> searchFilms({required String search}) async {
    try {
      if (state.films.isNotEmpty) {
        final FilmModel film = state.films.firstWhere(
            (film) => film.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(films: [film]);
      } else {
        await fetchAllFilms();
        await searchFilms(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<FilmModel> films =
            (await state.apiService.searchEntry(query: search))
                .map((e) => FilmModel.fromMap(e))
                .toList();
        state = state.copyWith(
          films: films,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }

  Future<void> searchPlanet({required String search}) async {
    try {
      if (state.planets.isNotEmpty) {
        final PlanetModel planet = state.planets.firstWhere((planet) =>
            planet.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(planets: [planet]);
      } else {
        await fetchAllPlanets();
        await searchPlanet(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<PlanetModel> planets =
            (await state.apiService.searchEntry(query: search))
                .map((e) => PlanetModel.fromMap(e))
                .toList();
        state = state.copyWith(
          planets: planets,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }

  Future<void> searchSpecies({required String search}) async {
    try {
      if (state.species.isNotEmpty) {
        final SpeciesModel species = state.species.firstWhere((species) =>
            species.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(species: [species]);
      } else {
        await fetchAllSpecies();
        await searchSpecies(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<SpeciesModel> species =
            (await state.apiService.searchEntry(query: search))
                .map((e) => SpeciesModel.fromMap(e))
                .toList();
        state = state.copyWith(
          species: species,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }

  Future<void> searchStarships({required String search}) async {
    try {
      if (state.starships.isNotEmpty) {
        final StarshipModel starship = state.starships.firstWhere((starship) =>
            starship.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(starships: [starship]);
      } else {
        await fetchAllStarships();
        await searchStarships(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<StarshipModel> starships =
            (await state.apiService.searchEntry(query: search))
                .map((e) => StarshipModel.fromMap(e))
                .toList();
        state = state.copyWith(
          starships: starships,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }

  Future<void> searchVehicles({required String search}) async {
    try {
      if (state.vehicles.isNotEmpty) {
        final VehicleModel vehicle = state.vehicles.firstWhere((vehicle) =>
            vehicle.name.toLowerCase().contains(search.toLowerCase()));
        state = state.copyWith(vehicles: [vehicle]);
      } else {
        await fetchAllVehicles();
        await searchVehicles(search: search);
      }
    } catch (e) {
      if (e is StateError && e.message == "No element") {
        state = state.copyWith(loading: true);
        final List<VehicleModel> vehicles =
            (await state.apiService.searchEntry(query: search))
                .map((e) => VehicleModel.fromMap(e))
                .toList();
        state = state.copyWith(
          vehicles: vehicles,
          loading: false,
        );
      } else {
        state = state.copyWith(loading: false);
        log("ViewModel - ERROR: ${e.toString()}");
      }
    }
  }
}
