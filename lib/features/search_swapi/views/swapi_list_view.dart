import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:swapi/core/enums.dart';
import 'package:swapi/features/search_swapi/models/swapi_model.dart';
import 'package:swapi/features/search_swapi/view_model/swapi_search_view_model.dart';
import 'package:swapi/features/search_swapi/views/swapi_details_view.dart';

class SwapiListView extends ConsumerWidget {
  const SwapiListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swapiSearchViewModel =
        ref.watch(swapiSearchViewModelProvider.notifier);
    final swapiSearchState = ref.watch(swapiSearchViewModelProvider);
    final List<SwapiModel> models = switch (swapiSearchState.selectedCategory) {
      SwapiCategory.none => [],
      SwapiCategory.people => swapiSearchState.people,
      SwapiCategory.films => swapiSearchState.films,
      SwapiCategory.planets => swapiSearchState.planets,
      SwapiCategory.species => swapiSearchState.species,
      SwapiCategory.starships => swapiSearchState.starships,
      SwapiCategory.vehicles => swapiSearchState.vehicles,
    };
    Timer? debounce;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => swapiSearchViewModel.selectCategory(
              selectedCategory: SwapiCategory.none),
        ),
        title: TextField(
          onChanged: (search) {
            if (debounce?.isActive ?? false) debounce?.cancel();
            debounce = Timer(
              const Duration(seconds: 2),
              () {
                switch (swapiSearchState.selectedCategory) {
                  case SwapiCategory.none:
                    break;
                  case SwapiCategory.people:
                    swapiSearchViewModel.searchPeople(search: search);
                  case SwapiCategory.films:
                    swapiSearchViewModel.searchFilms(search: search);
                  case SwapiCategory.planets:
                    swapiSearchViewModel.searchPlanet(search: search);
                  case SwapiCategory.species:
                    swapiSearchViewModel.searchSpecies(search: search);
                  case SwapiCategory.starships:
                    swapiSearchViewModel.searchStarships(search: search);
                  case SwapiCategory.vehicles:
                    swapiSearchViewModel.searchVehicles(search: search);
                }
              },
            );
          },
        ),
      ),
      body: swapiSearchState.loading
          ? const Text("Loading...")
          : ListView.builder(
              shrinkWrap: true,
              itemCount: models.length,
              itemBuilder: (BuildContext context, int index) {
                final model = models[index];
                return ListTile(
                  title: Text(model.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SwapiDetailsView(
                          selectedModel: model,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
