import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:swapi/core/enums.dart';
import 'package:swapi/services/api/api_exception.dart';
import 'package:swapi/services/api/films_api_service.dart';
import 'package:swapi/services/api/people_api_service.dart';
import 'package:swapi/services/api/planets_api_service.dart';
import 'package:swapi/services/api/species_api_service.dart';
import 'package:swapi/services/api/starships_api_service.dart';
import 'package:swapi/services/api/vehicles_api_service.dart';
import 'package:swapi/services/service_locator.dart';

abstract class ApiService {
  final Dio _dio = Dio();
  final String category;
  final String serviceName;

  ApiService({required this.category, required this.serviceName}) {
    _dio.options.baseUrl = dotenv.env['swapiUrl']!;
  }

  Future<List<Map<String, dynamic>>> getAllEntries() async {
    try {
      final response = await _dio.get(category);
      final data = response.data as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(data['results'] as List);
    } catch (e) {
      throw ApiException(
        message: "Error: getAllEntries() failed",
        cause: e,
        serviceName: serviceName,
      );
    }
  }

  Future<List<Map<String, dynamic>>> searchEntry(
      {required String query}) async {
    try {
      final response = await _dio.get('$category/?search=$query');
      final data = response.data as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(data['results'] as List);
    } catch (e) {
      throw ApiException(
        message: "Error: searchEntry(query:$query) failed",
        cause: e,
        serviceName: serviceName,
      );
    }
  }

  Future<Map<String, dynamic>> getEntryById({required String id}) async {
    try {
      final response = await _dio.get('$category/$id/');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw ApiException(
        message: "Error: getEntryById(id:$id) failed",
        cause: e,
        serviceName: serviceName,
      );
    }
  }

  factory ApiService.assignApi(SwapiCategory selectedCategory) {
    switch (selectedCategory) {
      case SwapiCategory.none:
      case SwapiCategory.people:
        return sl<PeopleApiService>();
      case SwapiCategory.films:
        return sl<FilmsApiService>();
      case SwapiCategory.planets:
        return sl<PlanetsApiService>();
      case SwapiCategory.species:
        return sl<SpeciesApiService>();
      case SwapiCategory.starships:
        return sl<StarshipsApiService>();
      case SwapiCategory.vehicles:
        return sl<VehiclesApiService>();
    }
  }
}
