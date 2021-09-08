import 'package:flutter/material.dart';
import 'package:github_demo/resources.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';

typedef CommentData = GIssueDetailsData_repository_issue_comments_edges_node;

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.comment,
    required this.issue,
  }) : super(key: key);

  final CommentData comment;
  final GIssueData issue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: context.textTheme.bodyText1?.color?.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                DateFormat('EEE, MMM d, yyyy - hh:mm').format(
                  DateTime.parse(issue.publishedAt!.value),
                ),
                style: context.textTheme.caption?.mediumEmphasis,
              ),
            ],
          ),
          const Gap(8),
          MarkdownBody(data: comment.body),
          const Gap(8),
          if (issue.author != null)
            Row(
              children: [
                CircleAvatar(
                  radius: 11,
                  foregroundImage: NetworkImage(
                    issue.author!.avatarUrl.value,
                  ),
                ),
                const Gap(8),
                Text('by @${issue.author!.login}'),
              ],
            ),
        ],
      ),
    );
  }
}
