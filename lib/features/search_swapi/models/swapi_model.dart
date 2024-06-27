import 'package:equatable/equatable.dart';

abstract class SwapiModel extends Equatable {
  final String name;
  final String url;
  final DateTime created;
  final DateTime edited;

  SwapiModel({
    required this.name,
    required this.url,
    required String created,
    required String edited,
  })  : created = DateTime.parse(created),
        edited = DateTime.parse(edited);

  @override
  List<Object> get props => [name, url];

  Map<String, dynamic> toMap();

  SwapiModel fromMap(Map<String, dynamic> map);
}
