import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

typedef FutureCallback = Future<void> Function();

class LoadingWall extends SingleChildStatelessWidget {
  final FutureCallback? onStart;

  const LoadingWall({
    Key? key,
    this.onStart,
  }) : super(key: key);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return ChangeNotifierProvider(
      create: (context) {
        final p = LoadingProvider();
        if (onStart != null) p.load(onStart!());
        return p;
      },
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            if (context.select((LoadingProvider p) => p._loading)) ...[
              const Positioned.fill(
                child: ColoredBox(color: Colors.black26),
              ),
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ]
          ],
        );
      },
      child: child,
    );
  }
}

class LoadingProvider extends ChangeNotifier {
  FutureCallback? loader;
  bool _loading = false;

  Future<T> load<T>(Future<T> callback) async {
    try {
      _loading = true;
      notifyListeners();
      final result = await callback;
      notifyListeners();
      _loading = false;
      return result;
    } catch (e) {
      _loading = false;
      notifyListeners();
      rethrow;
    }
  }
}
