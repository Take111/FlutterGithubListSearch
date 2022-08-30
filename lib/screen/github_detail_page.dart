import 'package:github_searcher_flutter/model/entities/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class GithubDetailPage extends HookConsumerWidget {
  const GithubDetailPage({
    super.key,
    required this.repository,
  });

  final Repository repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: ClipRRect(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: repository.owner.avatarUrl ?? '',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(repository.owner.login),
              ],
            ),
            Text(
              repository.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            repository.description == null
                ? const SizedBox(height: 0)
                : Text(
                    repository.description ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_border_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 4,
                ),
                Row(
                  children: [
                    Text(
                      '${repository.star}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'Star',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
