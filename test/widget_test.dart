// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_searcher_flutter/model/entity/repositories.dart';
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
}
