import 'package:flutter/material.dart';

/// Error Widget.
class ElveErrorWidget extends StatelessWidget {
  const ElveErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Something unexpected happened!\n\nPlease try again later.',
          maxLines: 6,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
