import 'package:flutter/material.dart';

/// Single State widget.
class StatWidget extends StatelessWidget {
  const StatWidget({
    Key? key,
    required this.stat,
    required this.value,
    required this.color,
  }) : super(key: key);

  /// stat label.
  final String stat;

  /// stat value.
  final String value;

  /// separator and stat label color.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 68,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  this.stat,
                  style: TextStyle(
                    color: color,
                    letterSpacing: -0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  this.value,
                  maxLines: 5,
                  style: TextStyle(letterSpacing: -0.1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
