import 'package:github_searcher_flutter/model/client/github_search_api_repository.dart';
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
