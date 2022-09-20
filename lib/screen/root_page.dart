import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_searcher_flutter/screen/favorite_repositories_page.dart';
import 'package:github_searcher_flutter/screen/github_list_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final widgets = useState<List<Widget>>([
      const GithubListPage(),
      const FavoriteRepositoriesPage(),
    ]);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex.value,
        children: const [
          GithubListPage(),
          FavoriteRepositoriesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '探す',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'お気に入り',
          ),
        ],
        currentIndex: selectedIndex.value,
        onTap: (value) {
          selectedIndex.value = value;
        },
      ),
    );
  }
}
