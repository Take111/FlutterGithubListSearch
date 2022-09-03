import 'package:flutter/material.dart';
import 'package:github_searcher_flutter/model/entity/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      appBar: AppBar(
        title: Text(repository.name),
      ),
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
                  width: 8,
                ),
                Text(repository.owner.login),
                const Spacer(),
                IconWithText(
                  icon: Icons.star_border_outlined,
                  value: repository.star.toString(),
                  unitText: 'Star',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
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
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Spacer(),
                IconWithText(
                  icon: Icons.visibility,
                  value: repository.watchersCount.toString(),
                  unitText: 'Watch',
                ),
                const Spacer(),
                IconWithText(
                  icon: Icons.assessment,
                  value: repository.issues.toString(),
                  unitText: 'Issue',
                ),
                const Spacer(),
                IconWithText(
                  icon: Icons.fork_right,
                  value: repository.forksCount.toString(),
                  unitText: 'Fork',
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.value,
    required this.unitText,
  });

  final IconData icon;
  final String value;
  final String? unitText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 8,
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            unitText == null
                ? const SizedBox(
                    width: 0,
                  )
                : Text(
                    unitText ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
          ],
        )
      ],
    );
  }
}
