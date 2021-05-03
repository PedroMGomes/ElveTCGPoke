import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

class ElveDraggableContainer extends StatefulWidget {
  ElveDraggableContainer(
      {Key? key, required this.children, this.color = Colors.white})
      : super(key: key);

  final List<Widget> children;
  final Color color;
  @override
  _ElveDraggableContainerState createState() => _ElveDraggableContainerState();
}

class _ElveDraggableContainerState extends State<ElveDraggableContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => DraggableScrollbar(
        heightScrollThumb: 36.0,
        backgroundColor: widget.color,
        // alwaysVisibleScrollThumb: true,
        scrollThumbBuilder: (Color backgroundColor,
                Animation<double> thumbAnimation,
                Animation<double> labelAnimation,
                double height,
                {Text? labelText,
                BoxConstraints? labelConstraints}) =>
            FadeTransition(
          opacity: thumbAnimation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: backgroundColor,
            ),
            width: 8.0,
            height: height,
          ),
        ),
        controller: _scrollController,
        child: ListView(
            padding: const EdgeInsets.only(right: 8.0),
            controller: _scrollController,
            children: widget.children),
      );
}
