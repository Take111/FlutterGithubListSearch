import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:github_searcher_flutter/model/entities/repository.dart';

part 'repositories.freezed.dart';
part 'repositories.g.dart';

@freezed
class Repositories with _$Repositories {
  const factory Repositories({
    required List<Repository> items,
  }) = _Repositories;
  const Repositories._();

  factory Repositories.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesFromJson(json);
}
