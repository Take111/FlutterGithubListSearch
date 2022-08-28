import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_searcher_flutter/model/entities/client/github_repository_client.dart';
import 'package:github_searcher_flutter/screen/github_list_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GithubListPage extends HookConsumerWidget {
  const GithubListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearch = useState(false);
    final searchText = useState('');
    final repositories = ref.watch(githubRepositoryClientProvider);

    return Scaffold(
      appBar: AppBar(
        title: isSearch.value
            ? TextField(
                onChanged: (value) {
                  searchText.value = value;
                },
                onEditingComplete: () {
                  isSearch.value = false;
                  FocusManager.instance.primaryFocus?.unfocus();

                  ref
                      .read(githubRepositoryClientProvider.notifier)
                      .fetchRepositires(searchText.value);
                },
                cursorColor: Colors.white,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search',
                ),
              )
            : const Text('Github List'),
        actions: [
          IconButton(
            onPressed: () {
              isSearch.value = true;
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: repositories.when(
        data: (items) {
          return items.isEmpty
              ? const Center(
                  child: Text('Repository is not found'),
                )
              : ListView.separated(
                  itemBuilder: (_, index) {
                    final item = items[index];
                    return GithubListContent(item: item);
                  },
                  separatorBuilder: (_, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                  itemCount: items.length,
                );
        },
        error: (error, _) {
          print("error has occured $error");
        },
        loading: () {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
