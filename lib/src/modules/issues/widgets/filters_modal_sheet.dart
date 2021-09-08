import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:github_demo/src/modules/issues/providers/issues_provider.dart';
import 'package:github_demo/src/providers/user_provider.dart';
import 'package:github_demo/resources.dart';

class FiltersSheet extends StatelessWidget {
  const FiltersSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = context.watch<IssuesProvider>().filters;
    final user = context.watch<UserProvider>().data;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: context.layout.fullMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Filters', style: context.textTheme.headline6),
            const Gap(20),
            ChipsInput(
              key: ValueKey('Filters${filters.length}'),
              initialValue: filters,
              decoration: const InputDecoration(
                hintText: "Filters",
              ),
              findSuggestions: (String query) {
                return <String>[
                  query,
                ];
              },
              onChanged: (List<String> data) {
                context.read<IssuesProvider>().updateFilters(data);
              },
              allowChipEditing: true,
              chipBuilder: (context, state, String tag) {
                return InputChip(
                  key: ObjectKey(tag),
                  label: Text(tag),
                  onDeleted: () => state.deleteChip(tag),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              },
              suggestionBuilder: (context, state, String tag) {
                return ListTile(
                  tileColor: context.theme.accentColor.withOpacity(0.1),
                  key: ObjectKey(tag),
                  title: Text(tag),
                  onTap: () => state.selectSuggestion(tag),
                );
              },
            ),
            const Gap(12),
            const Divider(),
            const Gap(12),
            const Text('Suggested Filters'),
            const Gap(20),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final filter in [
                  ...suggestedFilters,
                  if (user != null) ...[
                    'author:${user.viewer.login}',
                    'mentions:${user.viewer.login}',
                    'assignee:${user.viewer.login}',
                    'commenter:${user.viewer.login}',
                    'involves:${user.viewer.login}',
                  ]
                ].where(
                  (element) => !filters.contains(element),
                ))
                  InputChip(
                    onPressed: () {
                      context.read<IssuesProvider>().addFilter(filter);
                    },
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add,
                          size: 18,
                        ),
                        Text(filter),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> suggestedFilters = [
  'is:closed',
  'is:open',
  'is:locked',
  'is:unlocked',
  //'archived:false',
  //'archived:true'
];
