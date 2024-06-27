import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swapi/core/enums.dart';
import 'package:swapi/features/search_swapi/view_model/swapi_search_view_model.dart';
import 'package:swapi/features/search_swapi/views/swapi_list_view.dart';

class SwapiScreen extends ConsumerWidget {
  const SwapiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swapiSearchViewModel =
        ref.watch(swapiSearchViewModelProvider.notifier);
    final swapiSearchState = ref.watch(swapiSearchViewModelProvider);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: swapiSearchState.selectedCategory == SwapiCategory.none
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: SwapiCategory.values
                  .map((category) => category != SwapiCategory.none
                      ? TextButton(
                          onPressed: () => swapiSearchViewModel.selectCategory(
                            selectedCategory: category,
                          ),
                          child: Text(category.name),
                        )
                      : const SizedBox.shrink())
                  .toList(),
            )
          : const SwapiListView(),
    );
  }
}
