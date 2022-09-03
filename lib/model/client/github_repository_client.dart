import 'package:dio/dio.dart';
import 'package:github_searcher_flutter/model/client/github_api_client.dart';
import 'package:github_searcher_flutter/model/entities/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubRepositoryControllerProvider = StateNotifierProvider.autoDispose<
    GithubRepositoryController, AsyncValue<List<Repository>>>(
  (ref) {
    return GithubRepositoryController(ref.read);
  },
);

class GithubRepositoryController
    extends StateNotifier<AsyncValue<List<Repository>>> {
  GithubRepositoryController(this._read) : super(const AsyncValue.data([]));

  final Reader _read;

  GithubSearchApiRepository get _githubSearchApiRepository =>
      _read(githubSearchApiRepositoryProvider);

  Future<void> fetchRepositories(String word, int? page) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(() async {
      final data = await _githubSearchApiRepository.fetchRepositories(
        word: word,
        page: 1,
      );
      return data;
    });
    state = result;
  }
}

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
