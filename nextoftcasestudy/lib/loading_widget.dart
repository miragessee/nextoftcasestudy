import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loading_notifier.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingNotifier>(
      builder: (context, loadingNotifier, child) {
        return loadingNotifier.isLoading
            ? Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox.shrink();
      },
    );
  }
}
