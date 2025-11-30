import 'package:flutter/material.dart';
import 'canvas_controller.dart';
import 'widgets/draggable/draggable_widget.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  final CanvasController _controller = CanvasController();
  final double _canvasWidth = 1920; // 固定画布宽度
  final double _canvasHeight = 1080; // 固定画布高度
  int? _selectedComponentIndex; // 当前选中的组件索引

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: const Text('UI 画布'),
      ),
      body: Row(
        children: [
          // 左侧面板
          Container(
            width: 300,
            color: Colors.grey[200],
            child: Column(
              children: [
                // 上部分：可添加组件列表
                Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text('添加线条'),
                        onTap: () {
                          _controller.addLine();
                          setState(() {});
                        },
                      ),
                      // 可以在这里添加更多组件
                    ],
                  ),
                ),
                const Divider(height: 1), // 分隔线
                // 下部分：已添加组件列表
                Expanded(
                  child: ListView.builder(
                    itemCount: _controller.widgets.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('组件 ${index + 1}'),
                        selected: _selectedComponentIndex == index,
                        selectedTileColor: Colors.blue[100],
                        onTap: () {
                          setState(() {
                            _selectedComponentIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // 中间画布
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9, // 强制保持 16:9 比例
                child: Container(
                  width: _canvasWidth,
                  height: _canvasHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB0BEC5), // 设置背景颜色（灰蓝色）
                    border: Border.all(
                      color: Colors.black, // 设置边界颜色
                      width: 4.0, // 设置边界宽度
                    ),
                  ),
                  child: Stack(
                    children: _controller.widgets.asMap().entries.map((entry) {
                      final index = entry.key;
                      final widget = entry.value;
                      return DraggableWidget(
                        position: widget.position,
                        onDragEnd: (newPosition) {
                          if (_selectedComponentIndex == index) {
                            setState(() {
                              widget.position = _snapToGrid(newPosition);
                            });
                          }
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedComponentIndex = index;
                            });
                          },
                          child: Opacity(
                            opacity: _selectedComponentIndex == index
                                ? 1.0
                                : 0.6,
                            child: widget.child,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          // 右侧属性面板
          Container(
            width: 300,
            color: Colors.grey[200],
            child: Center(
              child: Text(
                _selectedComponentIndex != null
                    ? '属性面板（组件 ${_selectedComponentIndex! + 1}）'
                    : '请选择一个组件',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 将组件位置吸附到最近的网格点
  Offset _snapToGrid(Offset position) {
    const double gridSizeX = 10; // 网格单位（X轴）
    const double gridSizeY = 10; // 网格单位（Y轴）

    double snappedX = (position.dx / gridSizeX).round() * gridSizeX;
    double snappedY = (position.dy / gridSizeY).round() * gridSizeY;

    // 确保组件位置不超出画布范围
    snappedX = snappedX.clamp(0, _canvasWidth);
    snappedY = snappedY.clamp(0, _canvasHeight);

    return Offset(snappedX, snappedY);
  }
}
