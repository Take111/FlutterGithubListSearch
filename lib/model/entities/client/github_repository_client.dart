// ignore_for_file: inference_failure_on_function_invocation,
// ignore_for_file: unused_local_variable, implicit_dynamic_method
// ignore_for_file: implicit_dynamic_map_literal, implicit_dynamic_variable

import 'dart:convert';

import 'package:github_searcher_flutter/model/entities/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final githubRepositoryClientProvider = StateNotifierProvider.autoDispose<
    GithubRepositoryClient, AsyncValue<List<Repository>>>((ref) {
  return GithubRepositoryClient();
});

class GithubRepositoryClient
    extends StateNotifier<AsyncValue<List<Repository>>> {
  GithubRepositoryClient() : super(const AsyncValue.loading());

  Future<void> fetchRepositires(String word) async {
    final response = await http.get(
      Uri.parse('https://api.github.com/search/repositories?q=$word'),
    );

    if (response.statusCode == 200) {
      final body = response.body;

      final result = await AsyncValue.guard(() async {
        final data = (json.decode(response.body)
            as Map<String, dynamic>)['items'] as List<dynamic>;
        return data
            .map(
              (dynamic e) => Repository.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      });
      state = result;
    } else {
      state = AsyncError(Exception("Errorだよ"));
    }
  }
}
