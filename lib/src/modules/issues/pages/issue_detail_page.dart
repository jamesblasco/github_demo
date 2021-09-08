import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:github_demo/src/modules/issues/providers/issue_provider.dart';
import 'package:github_demo/src/modules/issues/widgets/comment_card.dart';

import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/widgets/navigation_bar.dart';
import 'package:github_demo/resources.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';
import 'package:share_plus/share_plus.dart';

class IssueDetailPage extends StatelessWidget {
  const IssueDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final GIssueData data;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final repo = IssueProvider(
          repository: context.read<GithubRepository>(),
          data: data,
        );
        fetch(repo, context);
        return repo;
      },
      child: const IssueDetailBody(),
    );
  }

  Future<void> fetch(IssueProvider provider, BuildContext context) async {
    try {
      await provider.fetch();
    } catch (e) {
      showAlert(context, '$e');
      rethrow;
    }
  }
}

class IssueDetailBody extends StatelessWidget {
  const IssueDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((IssueProvider p) => p.data);
    final details = context.select((IssueProvider p) => p.details);
    final comments = details?.repository?.issue?.comments.edges;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverNavigationBar(
            child: const SizedBox(),
            title: Text('Issue #${data.number}'),
            trailing: IconButton(
              onPressed: () {
                Share.share(data.url.value);
              },
              icon: const Icon(FluentIcons.share_20_regular),
            ),
          ),
          SliverFluidBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Issue #${data.number}',
                  style: context.textTheme.caption?.mediumEmphasis,
                ),
                const Gap(2),
                Text(
                  data.title,
                  style: context.textTheme.headline6,
                ),
                const Gap(12),
                if (data.author != null)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        foregroundImage: NetworkImage(
                          data.author!.avatarUrl.value,
                        ),
                      ),
                      const Gap(8),
                      Text('by @${data.author!.login}'),
                    ],
                  ),
                const Gap(12),
              ],
            ),
          ),
          if (data.labels!.edges!.isNotEmpty) ...[
            const SliverLabelsBar(),
            const SliverGap(12)
          ],
          if (details != null) ...[
            SliverToBoxAdapter(
              child: Container(
                color: context.textTheme.bodyText1?.color?.withOpacity(0.05),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FluidMargin(
                  child: MarkdownBody(
                    data: details.repository!.issue!.bodyText,
                  ),
                ),
              ),
            ),
            const SliverGap(32),
            SliverFluidBox(
              child: Text(
                'Comments',
                style: context.textTheme.headline6,
              ),
            ),
            const SliverGap(32),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final comment = comments![index].node!;
                  return FluidMargin(
                    child: CommentCard(
                      comment: comment,
                      issue: data,
                    ),
                  );
                },
                childCount: comments!.length,
              ),
            ),
            const SliverGap(100)
          ]
        ],
      ),
    );
  }
}

class SliverLabelsBar extends StatelessWidget {
  const SliverLabelsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.select((IssueProvider p) => p.data);
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FluidMargin(
          child: Row(
            children: [
              for (final tag in data.labels!.edges!.map((e) => e.node!)) ...[
                Chip(
                  label: Text(
                    tag.name,
                    style: context.textTheme.caption,
                  ),
                  padding: const EdgeInsets.all(6),
                ),
                 const Gap(6),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
