// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repository _$$_RepositoryFromJson(Map<String, dynamic> json) =>
    _$_Repository(
      id: json['id'] as int,
      name: json['name'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      fullName: json['full_name'] as String?,
      description: json['description'] as String?,
      star: json['stargazers_count'] as int,
      watchersCount: json['watchers_count'] as int,
      forksCount: json['forks_count'] as int,
      issues: json['open_issues'] as int,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$_RepositoryToJson(_$_Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'full_name': instance.fullName,
      'description': instance.description,
      'stargazers_count': instance.star,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues': instance.issues,
      'language': instance.language,
    };
