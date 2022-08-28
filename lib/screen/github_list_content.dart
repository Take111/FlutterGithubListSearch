import 'package:flutter/material.dart';
import 'package:github_searcher_flutter/model/entities/repository.dart';
import 'package:transparent_image/transparent_image.dart';

class GithubListContent extends StatelessWidget {
  const GithubListContent({
    super.key,
    required this.item,
  });

  final Repository item;

  @override
  Widget build(BuildContext context) {
    final language = item.language ?? 'none';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
