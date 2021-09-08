import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_demo/resources.dart';
import 'package:github_demo/src/app/theme.dart';

import 'package:github_demo/src/modules/issues/providers/issues_provider.dart';
import 'package:github_demo/src/modules/issues/providers/seen_issues_provider.dart';
import 'package:github_demo/src/modules/issues/widgets/filters_modal_sheet.dart';
import 'package:github_demo/src/modules/issues/widgets/issue_tile.dart';
import 'package:github_demo/src/modules/issues/widgets/sort_modal_sheet.dart';
import 'package:github_demo/src/modules/settings/pages/settings_page.dart';
import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/services/preferences/preferences_repository.dart';

import 'package:github_demo/src/widgets/navigation_bar.dart';
import 'package:github_demo/src/widgets/refresh_control.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';
import 'issue_detail_page.dart';

class IssuesPage extends StatelessWidget {
  const IssuesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return SeenIssuesProvider(
            repository: context.read<PreferencesRepository>(),
          );
        }),
        ChangeNotifierProvider(
          create: (context) {
            final repo = IssuesProvider(
              repository: context.read<GithubRepository>(),
            );
            fetch(repo, context);
            return repo;
          },
        ),
      ],
      child: const IssuesList(),
    );
  }

  Future<void> fetch(IssuesProvider provider, BuildContext context) async {
    try {
      await provider.fetch();
    } catch (e) {
      showAlert(context, '$e');
      rethrow;
    }
  }
}

class IssuesList extends StatefulWidget {
  const IssuesList({Key? key}) : super(key: key);

  @override
  _IssuesListState createState() => _IssuesListState();
}

class _IssuesListState extends State<IssuesList> {
  @override
  Widget build(BuildContext context) {
    final issues = context.select((IssuesProvider p) => p.list);
    // final data = context.select((IssuesProvider p) => p.data?.repository!);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverNavigationBar(
            automaticallyImplyLeading: false,
            title: const Text('Issues'),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (context) {
                    return const SettingsPage();
                  }),
                );
              },
              icon: const Icon(Icons.settings),
            ),
          ),
          SliverRefreshControl(
            onRefresh: () async {
              await context.read<IssuesProvider>().fetch();
            },
          ),
          const SliverFilterToolbar(),
          if (issues == null)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final issue = issues[index];
                  return IssueTile(
                    data: issue,
                    onTap: () => navigateToDetailIssue(context, issue),
                  );
                },
                childCount: issues.length,
              ),
            )
        ],
      ),
    );
  }

  void navigateToDetailIssue(BuildContext context, GIssueData data) {
    context.read<SeenIssuesProvider>().readIssue(data.id);
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (c) {
          return IssueDetailPage(data: data);
        },
      ),
    );
  }
}

const kDefaultSmallButtonPadding =  EdgeInsets.all(8);

class SliverFilterToolbar extends StatelessWidget {
  const SliverFilterToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sorting = context.select((IssuesProvider p) => p.sorting);
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.layout.fullMargin, vertical: 8),
          child: Row(
            children: [
              TextButton(
                style: ButtonStyles.from(
                  context.theme.accentColor,
                  kDefaultSmallButtonPadding,
                ),
                onPressed: () async {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (c) {
                      return ChangeNotifierProvider.value(
                        value: context.watch<IssuesProvider>(),
                        child: const FiltersSheet(),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      FluentIcons.filter_20_regular,
                      size: 20,
                    ),
                    const Gap(8),
                    const Text('Filters'),
                    const Gap(4),
                    if (context.watch<IssuesProvider>().filters.isNotEmpty) ...[
                      const Gap(4),
                      CircleAvatar(
                        radius: 9,
                        backgroundColor:
                            context.theme.accentColor.withOpacity(0.1),
                        child: Text(
                          '${context.watch<IssuesProvider>().filters.length}',
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      )
                    ]
                  ],
                ),
              ),
             const Gap(12),
              TextButton(
                style: ButtonStyles.from(
                  context.theme.accentColor,
                  kDefaultSmallButtonPadding,
                ),
                onPressed: () async {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (c) {
                      return ChangeNotifierProvider.value(
                        value: context.watch<IssuesProvider>(),
                        child: const OrderBottomSheet(),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      FluentIcons.arrow_sort_20_regular,
                      size: 20,
                    ),
                    const Gap(8),
                    Text(Sort.toLocalString(sorting)),
                    const Gap(4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
