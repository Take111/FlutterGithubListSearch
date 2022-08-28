import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_searcher_flutter/model/entities/client/github_repository_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

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
                  print("onEditingComplete");
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
          return ListView.separated(
            itemBuilder: (_, index) {
              final item = items[index];
              return Container(
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
                              image: 'https://picsum.photos/250?image=9',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'apple',
                          style: TextStyle(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tetris',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'A C implementation of Tetris using Pennsim through LC4',
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
                      children: const [
                        Icon(
                          Icons.star_border_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '1000',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Swift',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) {
              return const Divider(
                height: 1,
              );
            },
            itemCount: 3,
          );
        },
        error: (error, _) {
          print("error has occured $error");
        },
        loading: () {
          print("loading");
        },
      ),
    );
  }
}
