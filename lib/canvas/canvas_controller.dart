import 'package:flutter/material.dart';
import 'widgets/draggable/line_widget.dart';

class CanvasWidget {
  Offset position;
  final Widget child;

  CanvasWidget({required this.position, required this.child});
}

/// 画布控制器，管理画布状态和组件操作
class CanvasController {
  final List<CanvasWidget> widgets = [];

  /// 添加一个默认的线条组件
  void addLine() {
    widgets.add(
      CanvasWidget(
        position: const Offset(100, 100),
        child: const LineWidget(
          start: Offset(0, 0),
          end: Offset(100, 0),
          color: Colors.blue,
          strokeWidth: 3.0,
        ),
      ),
    );
  }

  /// 清空所有组件
  void clear() {
    widgets.clear();
  }
}
