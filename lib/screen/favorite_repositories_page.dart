import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteRepositoriesPage extends HookConsumerWidget {
  const FavoriteRepositoriesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り'),
      ),
      body: Container(
        child: Center(
          child: Text('テキスト'),
        ),
      ),
    );
  }
}
