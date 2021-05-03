import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/material.dart';

class ElveGrid extends StatelessWidget {
  const ElveGrid(
      {Key? key, required this.children, this.childAspectRatio = 0.5})
      : super(key: key);

  final double childAspectRatio;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GridView(
        // set `shrinkWrap` to contain nested scrolling child with unbound dimensions.
        shrinkWrap: true,
        // Setting `primary` to true to remove the child nested scroll.
        primary: true,
        // To remove the scrolling effect entirely.
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ElveTheme.getGridCrossAxisCount(constraints.maxWidth),
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        children: children,
      ),
    );
  }
}
