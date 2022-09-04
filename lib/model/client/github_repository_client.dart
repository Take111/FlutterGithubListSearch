import 'package:dio/dio.dart';
import 'package:github_searcher_flutter/model/client/github_api_client.dart';
import 'package:github_searcher_flutter/model/entity/repository.dart';
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
  String? word;
  int page = 1;

  GithubSearchApiRepository get _githubSearchApiRepository =>
      _read(githubSearchApiRepositoryProvider);

  Future<void> fetchRepositories({
    required String word,
    required bool needToLoadState,
  }) async {
    if (needToLoadState) {
      state = const AsyncLoading();
    }
    this.word = word;
    page = 1;
    final result = await AsyncValue.guard(() async {
      final data = await _githubSearchApiRepository.fetchRepositories(
        word: word,
        page: 1,
      );
      return data;
    });
    state = result;
  }

  Future<void> fetchMore() async {
    page += 1;

    final result = await AsyncValue.guard(() async {
      final data = await _githubSearchApiRepository.fetchRepositories(
        word: word ?? '',
        page: page,
      );
      final currentValue = state.value ?? [];
      return currentValue + data;
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
