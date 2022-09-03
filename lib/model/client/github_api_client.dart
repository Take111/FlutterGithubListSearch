import 'package:dio/dio.dart';
import 'package:github_searcher_flutter/model/entity/repositories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'github_api_client.g.dart';

final githubSearchApiClientProvider = Provider(
  (ref) {
    return GithubSearchApiClient(
      Dio(),
      baseUrl: 'https://api.github.com/search',
    );
  },
);

@RestApi()
abstract class GithubSearchApiClient {
  factory GithubSearchApiClient(
    Dio dio, {
    String baseUrl,
  }) = _GithubSearchApiClient;

  @GET('/repositories')
  Future<Repositories> fetchRepositories(
    @Query('q') String word,
    @Query('page') int? page,
  );
}
