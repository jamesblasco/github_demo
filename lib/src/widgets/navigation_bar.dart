import 'dart:math';
import 'dart:ui';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_demo/src/utils/theme.dart';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

const double _kNavbarHeight = 44;
const double _kNavbarExtendedHeight = 52;

class SliverNavigationBar extends StatelessWidget {
  final Widget? title;
  final Widget? child;
  final Widget? leading;
  final Widget? trailing;
  final bool automaticallyImplyLeading;
  final bool pinned;
  final bool crop;

  final bool extended;

  const SliverNavigationBar({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.child,
    this.pinned = true,
    this.crop = true,
    this.extended = true,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topSafeArea = MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      pinned: pinned,
      delegate: _NavigationSliverDelegate(
        title: title,
        child: child,
        leading: leading,
        trailing: trailing,
        topSafeArea: topSafeArea,
        automaticallyImplyLeading: automaticallyImplyLeading,
        crop: crop,
        extended: extended,
      ),
    );
  }
}

class _NavigationSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget? leading;
  final Widget? trailing;
  final Widget? child;
  final Widget? title;
  final double topSafeArea;
  final bool automaticallyImplyLeading;
  final bool crop;
  final bool extended;

  _NavigationSliverDelegate({
    this.title,
    this.leading,
    this.trailing,
    this.child,
    this.extended = true,
    this.topSafeArea = 0,
    this.crop = true,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final height = maxExtent - shrinkOffset;

    final proportion = 2 - (maxExtent / height);
    final progress = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    //final blur = min((0.6 - progress) * 12, 12.0);
    const blur = 12.0;
    final widgetChild = child ??
        (title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: title,
              )
            : null);
    final double cropOffset = crop ? minExtent : 0;
    final bool canPop = Navigator.of(context).canPop();

    Widget? leadingChild() {
      if (leading != null) return leading;
      if (automaticallyImplyLeading) {
        if (canPop) {
          return const BackButton();
        }
      }
    }

    return SizedBox(
      height: maxExtent,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          // Child
          Positioned(
            top: cropOffset,
            left: 0,
            height: maxExtent,
            right: 0,
            child: Stack(
              children: [
                if (widgetChild != null)
                  Positioned(
                    top: -cropOffset - shrinkOffset,
                    left: 0,
                    right: 0,
                    height: maxExtent,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      child: FluidMargin(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: progress == 0 ? 0 : 1,
                          child: DefaultTextStyle(
                            style: context.textTheme.headline4!,
                            child: widgetChild,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (progress < 0.5)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: minExtent,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: minExtent,
            child: IgnorePointer(
              ignoring: progress > 0.5,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: progress > 0.5 ? 0 : 1,
                child: Container(
                  height: 1,
                  color: context.theme.scaffoldBackgroundColor.withOpacity(0.9),
                ),
              ),
            ),
          ),
          Positioned(
            top: topSafeArea,
            left: 0,
            right: 0,
            height: _kNavbarHeight,
            child: NavigationToolbar(
              leading: leadingChild(),
              middle: title != null
                  ? AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: progress > 0.5 ? 0 : 1,
                      child: DefaultTextStyle(
                        style: context.textTheme.headline6!,
                        child: title!,
                      ),
                    )
                  : null,
              trailing: trailing,
              centerMiddle: true,
              middleSpacing: 6.0,
            ),
          ),
          Positioned(
            top: minExtent - 1,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: progress > 0.5 ? 0 : 1,
              child: Container(
                height: 1,
                color: context.textTheme.bodyText1!.color!.withOpacity(0.1),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get minExtent => _kNavbarHeight + topSafeArea;

  @override
  double get maxExtent => extended
      ? _kNavbarHeight + _kNavbarExtendedHeight + topSafeArea
      : minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SliverExpandableTiqBar extends StatelessWidget {
  final Widget title;
  final Widget? header;
  final bool showBackButton;
  final bool pinned;

  const SliverExpandableTiqBar({
    Key? key,
    required this.title,
    this.header,
    this.showBackButton = false,
    this.pinned = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      pinned: pinned,
      delegate: showBackButton
          ? TiqBarWithBackButtonSliverDelegate(
              title: title,
              topSafeArea: paddingTop,
            )
          : TiqBarSliverDelegate(
              title: title,
              header: header,
              height: 92,
              topSafeArea: paddingTop,
            ),
    );
  }
}

class TiqBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget? header;
  final Widget title;
  final double topSafeArea;
  final double height;

  TiqBarSliverDelegate({
    required this.title,
    this.header,
    this.height = 100,
    this.topSafeArea = 0,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = maxExtent - shrinkOffset;
    final proportion = 2 - (maxExtent / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    final animated = shrinkOffset > 10;
    final blur = min(shrinkOffset / 2, 10.0);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: <Widget>[
          if (animated)
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            color: animated
                ? context.theme.appBarTheme.color?.withOpacity(0.8)
                : context.theme.appBarTheme.color?.withOpacity(0),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FluidMargin(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 10),
                  if (header != null)
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: percent < 0.95 ? 0 : 1,
                      child: DefaultTextStyle(
                        style: context.textTheme.subtitle1!,
                        child: header!,
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: percent < 0.7
                          ? context.textTheme.headline6!
                          : context.textTheme.headline4!,
                      child: title,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: percent > 0.1 ? 0 : 1,
              child: Container(
                height: 1,
                color: context.textTheme.bodyText1!.color!.withOpacity(0.1),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight + topSafeArea;

  @override
  double get maxExtent => height + topSafeArea;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TiqBarWithBackButtonSliverDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget title;
  final double topSafeArea;

  TiqBarWithBackButtonSliverDelegate({
    required this.title,
    this.topSafeArea = 0,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = maxExtent - shrinkOffset;
    final proportion = 2 - (maxExtent / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: maxExtent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: percent < 0.1
            ? context.theme.appBarTheme.color
            : context.theme.scaffoldBackgroundColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: topSafeArea,
              left: 0,
              right: 0,
              child: SizedBox(
                height: kToolbarHeight,
                child: Center(
                  child: DefaultTextStyle(
                    style: context.textTheme.headline6!,
                    child: title,
                  ),
                ),
              ),
            ),
            if (Navigator.canPop(context))
              Positioned(
                bottom: 0,
                left: -18 + MediaQuery.of(context).padding.left,
                child: Container(
                  height: kToolbarHeight,
                  alignment: Alignment.centerLeft,
                  child: FluidMargin(
                    child: IconButton(
                      iconSize: 20,
                      icon: const Icon(FluentIcons.chevron_left_20_regular),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: percent > 0.1 ? 0 : 1,
                child: Container(
                  height: 1,
                  color: context.textTheme.bodyText1!.color!.withOpacity(0.1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight + topSafeArea;

  @override
  double get maxExtent => kToolbarHeight + topSafeArea;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
