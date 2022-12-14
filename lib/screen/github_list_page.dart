import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_searcher_flutter/model/client/github_repository_client.dart';
import 'package:github_searcher_flutter/screen/github_detail_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transparent_image/transparent_image.dart';

class GithubListPage extends HookConsumerWidget {
  const GithubListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearch = useState(false);
    final searchText = useState('');
    final repositories = ref.watch(githubRepositoryControllerProvider);
    final refreshController = useState(RefreshController());
    final scrollController = useScrollController();

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
                      .read(githubRepositoryControllerProvider.notifier)
                      .fetchRepositories(
                        word: searchText.value,
                        needToLoadState: true,
                      );
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
                  child: Text(
                    'Repository???????????????\n?????????????????????????????????????????????\n????????????????????????????????????',
                    textAlign: TextAlign.center,
                  ),
                )
              : SmartRefresher(
                  enablePullUp: true,
                  controller: refreshController.value,
                  header: CustomHeader(
                    builder: (context, mode) {
                      return const CupertinoActivityIndicator();
                    },
                  ),
                  footer: CustomFooter(
                    builder: (context, mode) {
                      return const CupertinoActivityIndicator();
                    },
                  ),
                  onRefresh: () async {
                    await ref
                        .read(githubRepositoryControllerProvider.notifier)
                        .fetchRepositories(
                          word: searchText.value,
                          needToLoadState: false,
                        );
                    refreshController.value.refreshCompleted();
                  },
                  onLoading: () async {
                    await ref
                        .read(githubRepositoryControllerProvider.notifier)
                        .fetchMore();
                    refreshController.value.loadComplete();
                  },
                  child: ListView.separated(
                    controller: scrollController,
                    itemBuilder: (_, index) {
                      final item = items[index];
                      final language = item.language ?? 'none';
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) {
                                return GithubDetailPage(repository: item);
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: ClipRRect(
                                      child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: item.owner.avatarUrl ?? '',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    item.owner.login,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        item.description == null
                                            ? const SizedBox(height: 0)
                                            : Text(
                                                item.description ?? '',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_border_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${item.star}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    language,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                    itemCount: items.length,
                  ),
                );
        },
        error: (error, _) {
          return const Center(
            child: Text(
              'Error????????????????????? ?????????????????????????????????',
            ),
          );
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
