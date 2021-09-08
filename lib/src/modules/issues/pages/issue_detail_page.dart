import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:github_demo/src/modules/issues/providers/issue_provider.dart';

import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/utils/alert.dart';
import 'package:github_demo/src/widgets/navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';
import 'package:github_demo/src/utils/theme.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';
import 'package:share_plus/share_plus.dart';

class IssueDetailPage extends StatelessWidget {
  final GIssueData data;
  const IssueDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

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
          SliverToBoxAdapter(
            child: FluidMargin(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Issue #${data.number}',
                    style: context.textTheme.caption?.mediumEmphasis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    data.title,
                    style: context.textTheme.headline6,
                  ),
                  const SizedBox(height: 12),
                  if (data.author != null)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          foregroundImage: NetworkImage(
                            data.author!.avatarUrl.value,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('by @${data.author!.login}'),
                      ],
                    ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (data.labels!.edges!.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FluidMargin(
                  child: Row(
                    children: [
                      for (final tag
                          in data.labels!.edges!.map((e) => e.node!)) ...[
                        Chip(
                          label: Text(
                            tag.name,
                            style: context.textTheme.caption,
                          ),
                          padding: const EdgeInsets.all(6),
                        ),
                        const SizedBox(width: 6),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
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
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: FluidMargin(
                child: Text(
                  'Comments',
                  style: context.textTheme.headline6,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final comment =
                    details.repository!.issue!.comments.edges![index].node!;
                return FluidMargin(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: context.textTheme.bodyText1?.color
                            ?.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              DateFormat('EEE, MMM d, yyyy - hh:mm').format(
                                DateTime.parse(data.publishedAt!.value),
                              ),
                              style: context.textTheme.caption?.mediumEmphasis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        MarkdownBody(data: comment.body),
                        const SizedBox(height: 8),
                        if (data.author != null)
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 11,
                                foregroundImage: NetworkImage(
                                  data.author!.avatarUrl.value,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('by @${data.author!.login}'),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }, childCount: details.repository!.issue!.comments.edges!.length),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ]
        ],
      ),
    );
  }
}
