// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_searcher_flutter/model/entities/user.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required int id,
    required String name,
    required User owner,
    @JsonKey(name: 'full_name') String? fullName,
    String? description,
    @JsonKey(name: 'stargazers_count') required int star,
  }) = _Repository;
  const Repository._();

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}
