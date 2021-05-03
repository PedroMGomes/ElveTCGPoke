import 'package:flutter/material.dart';

class ElveButton extends StatelessWidget {
  const ElveButton(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.color,
      this.padding = const EdgeInsets.all(16.0)})
      : super(key: key);

  final Color color;
  final String text;
  final Function onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              offset: const Offset(1.0, 1.0),
              color: color,
            )
          ],
          color: color,
        ),
        padding: padding,
        child: Text(text,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontStyle: FontStyle.italic,
                )),
      ),
    );
  }
}
