// ignore_for_file: public_member_api_docs, sort_constructors_first



import '../services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? porterPath;
  Movie({
    required this.id,
    required this.name,
    required this.description,
    this.porterPath,
  });

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? porterPath,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      porterPath: porterPath ?? this.porterPath,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      name: map['title'],
      description: map['overview'],
      porterPath: map['poster_path'],
    );
  }

  String posterUrl() {
    return Api().baseImageUrl + porterPath!;
  }
}
