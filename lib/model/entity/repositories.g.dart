// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repositories _$$_RepositoriesFromJson(Map<String, dynamic> json) =>
    _$_Repositories(
      items: (json['items'] as List<dynamic>)
          .map((e) => Repository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepositoriesToJson(_$_Repositories instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
