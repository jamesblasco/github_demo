import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_demo/src/modules/issues/providers/seen_issues_provider.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';
import 'package:github_demo/resources.dart';

class IssueTile extends StatelessWidget {
  final VoidCallback? onTap;
  final GIssueData data;
  const IssueTile({
    Key? key,
    this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seen = context.select((SeenIssuesProvider p) => p.contains(data.id));
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: context.layout.fullMargin,
      ),
      selected: seen,
      minLeadingWidth: 16,
      leading: Text('#${data.number}'),
      title: Text(
        data.title,
        maxLines: 2,
      ),
      selectedTileColor: context.theme.primaryColor.withOpacity(0.1),
      subtitle: data.author == null
          ? null
          : Row(
              children: [
                CircleAvatar(
                  radius: 9,
                  foregroundImage: NetworkImage(
                    data.author!.avatarUrl.value,
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(child:Text(
                  'by @${data.author!.login} - ' +
                      DateFormat('MMM d, yyyy').format(
                        DateTime.parse(data.publishedAt!.value),
                      ),
                ),),
                const SizedBox(width: 8),
                if (data.labels!.edges!.isNotEmpty)
                  Chip(
                    backgroundColor:
                        context.textTheme.caption?.color?.withOpacity(0.05),
                    label: Text(
                      '+${data.labels!.edges!.length}',
                      style: context.textTheme.caption?.copyWith(fontSize: 10),
                    ),
                    padding: const EdgeInsets.all(0),
                    visualDensity: const VisualDensity(vertical: -4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
              ],
            ),
      onTap: onTap,
    );
  }
}
