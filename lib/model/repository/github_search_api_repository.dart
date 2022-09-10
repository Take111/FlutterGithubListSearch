import 'package:dio/dio.dart';
import 'package:github_searcher_flutter/model/client/github_api_client.dart';
import 'package:github_searcher_flutter/model/entity/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubSearchApiRepositoryProvider =
    Provider<GithubSearchApiRepository>((ref) {
  return GithubSearchApiRepository(ref.read);
});

class GithubSearchApiRepository {
  GithubSearchApiRepository(
    Reader read,
  ) : _client = read(githubSearchApiClientProvider);

  final GithubSearchApiClient _client;

  Future<List<Repository>> fetchRepositories({
    required String word,
    int? page,
  }) async {
    try {
      final result = await _client.fetchRepositories(word, page);
      return result.items;
    } on DioError catch (error) {
      final response = error.response;
      print('DioError ${response?.statusMessage}');
      throw Exception('error');
    }
  }
}
