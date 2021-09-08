import 'package:flutter/material.dart';
import 'package:github_demo/src/app/theme.dart';
import 'package:github_demo/src/modules/issues/providers/issues_provider.dart';
import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/resources.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSorting = context.select((IssuesProvider p) => p.sorting);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(20),
          FluidMargin(
            child: Text(
              'Sort Issues by',
              style: context.textTheme.headline6,
            ),
          ),
          const Gap(8),
          for (final sorting in Sort.textValues)
            ListTile(
              selected: sorting == currentSorting,
              title: Text(Sort.toLocalString(sorting)),
              onTap: () {
                context.read<IssuesProvider>().updateOrdering(sorting);
                Navigator.of(context).pop();
              },
            ),
          const Gap(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(12),
              for (final sorting in Sort.emojiValues) ...[
                Expanded(
                  child: TextButton(
                    style: ButtonStyles.from(
                      context.textTheme.subtitle1!.color!,
                      const EdgeInsets.all(12),
                    ),
                    onPressed: () {
                      context.read<IssuesProvider>().updateOrdering(sorting);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      Sort.toLocalString(sorting),
                    ),
                  ),
                ),
                const Gap(12),
              ],
            ],
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
