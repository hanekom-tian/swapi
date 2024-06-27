import 'package:get_it/get_it.dart';
import 'package:swapi/services/api/films_api_service.dart';
import 'package:swapi/services/api/people_api_service.dart';
import 'package:swapi/services/api/planets_api_service.dart';
import 'package:swapi/services/api/species_api_service.dart';
import 'package:swapi/services/api/starships_api_service.dart';
import 'package:swapi/services/api/vehicles_api_service.dart';

final sl = GetIt.instance;

void registerServices() {
  sl.registerLazySingleton<FilmsApiService>(() => FilmsApiService());
  sl.registerLazySingleton<PeopleApiService>(() => PeopleApiService());
  sl.registerLazySingleton<PlanetsApiService>(() => PlanetsApiService());
  sl.registerLazySingleton<SpeciesApiService>(() => SpeciesApiService());
  sl.registerLazySingleton<StarshipsApiService>(() => StarshipsApiService());
  sl.registerLazySingleton<VehiclesApiService>(() => VehiclesApiService());
}
