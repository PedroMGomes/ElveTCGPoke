import 'package:flutter/material.dart';

class ElveCardAppBar extends StatelessWidget {
  const ElveCardAppBar({
    Key? key,
    required this.text,
    required this.opacity,
    required this.color,
  }) : super(key: key);

  final String text;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline4;
    final fontSize = style!.fontSize;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16 - (8.0 * opacity),
        bottom: 22 - (8.0 * opacity),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4 * opacity),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 22 - (4 * opacity),
                color: color,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
          Expanded(
            child: Divider(
              indent: 16,
              endIndent: 16,
              thickness: (2 * opacity),
            ),
          ),
          FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: style.copyWith(fontSize: (fontSize ?? 22) - (6 * opacity)),
            ),
          ),
        ],
      ),
    );
  }
}
