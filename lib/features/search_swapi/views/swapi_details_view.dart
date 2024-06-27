import 'package:flutter/material.dart';
import 'package:swapi/features/search_swapi/models/swapi_model.dart';

class SwapiDetailsView extends StatelessWidget {
  final SwapiModel selectedModel;
  const SwapiDetailsView({required this.selectedModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: selectedModel.props.length,
        itemBuilder: (BuildContext context, int index) {
          final property = selectedModel.toMap();
          final key = property.keys.toList()[index];
          final value = property.values.toList()[index];
          return Text("$key: $value");
        },
      ),
    );
  }
}
