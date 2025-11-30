import 'package:flutter/material.dart';

/// 通用可拖动组件基类
class DraggableWidget extends StatelessWidget {
  final Offset position;
  final Widget child;
  final Function(Offset) onDragEnd;

  const DraggableWidget({
    super.key,
    required this.position,
    required this.child,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: child,
        childWhenDragging: Opacity(opacity: 0.5, child: child),
        onDragEnd: (details) => onDragEnd(details.offset),
        child: child,
      ),
    );
  }
}
