import 'package:elve_tcg_poke/components/common/pokeball_widget.dart';
import 'package:flutter/material.dart';

class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({Key? key}) : super(key: key);

  Widget _tip(String text, TextStyle style) => Row(
        children: [
          PokeballWidget(width: 16.0, height: 16.0),
          const SizedBox(width: 16.0),
          Expanded(child: Text(text, style: style)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1 as TextStyle;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade100),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tip('Min 3 characters required.', style),
            const SizedBox(height: 16.0),
            _tip('Search by Pokemon Name: \'charizard\', \'pikachu\'', style),
            const SizedBox(height: 16.0),
            _tip(
                'Search by incomplete Pokemon name: \'char\', \'pika\'', style),
            const SizedBox(height: 16.0),
            _tip('Search by Pokemon Type: \'water\', \'fire\', \'grass\', ...',
                style),
          ],
        ),
      ),
    );
  }
}
