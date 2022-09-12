import 'package:flutter_test/flutter_test.dart';
import 'package:github_searcher_flutter/model/entity/repository.dart';
import 'package:github_searcher_flutter/model/entity/user.dart';
import 'package:mockito/mockito.dart';

import 'mock.mocks.dart';

void main() {
  final mockRepository = MockGithubSearchApiRepository();

  final repositoryList = <Repository>[
    const Repository(
      id: 0,
      name: 'Swift',
      owner: User(login: 'Apple'),
      star: 0,
      watchersCount: 0,
      forksCount: 0,
      issues: 0,
    )
  ];

  test('success fetchRepositories', () async {
    when(mockRepository.fetchRepositories())
        .thenAnswer((realInvocation) async => repositoryList);
    expect(await mockRepository.fetchRepositories(), repositoryList);
    verify(mockRepository.fetchRepositories());
  });

  test('failure fetchRepositories', () async {
    when(mockRepository.fetchRepositories()).thenThrow(Exception('Error'));
    expect(mockRepository.fetchRepositories, throwsException);
    verify(mockRepository.fetchRepositories());
  });
}
