# rm_ui

A new Flutter project.

```shell
flutter run -d web-server --web-port 8080
```

```text
rm_ui/
├── lib/
│   ├── main.dart                # 应用程序入口，初始化应用程序并加载主画布页面。
│   ├── canvas/
│   │   ├── canvas_page.dart     # 画布页面，提供绘制 UI 组件的主界面。
│   │   ├── canvas_controller.dart # 管理画布状态和组件操作的控制器。
│   │   └── widgets/
│   │       ├── draggable_widget.dart # 可拖动的 UI 组件基类。
│   │       ├── button_widget.dart    # 按钮组件的实现。
│   │       ├── text_widget.dart      # 文本组件的实现。
│   │       └── container_widget.dart # 容器组件的实现。
│   ├── code_generator/
│   │   ├── code_generator.dart  # 核心代码生成逻辑，根据画布组件生成模板代码。
│   │   └── templates/
│   │       ├── flutter_template.dart # Flutter 代码模板。
│   │       └── html_template.dart    # HTML 代码模板（可选）。
│   ├── utils/
│   │   ├── constants.dart       # 项目中使用的常量定义。
│   │   └── helpers.dart         # 通用工具函数。
│   └── models/
│       ├── ui_component.dart    # 定义 UI 组件的模型类。
│       └── canvas_state.dart    # 定义画布状态的模型类。
├── assets/
│   ├── images/                  # 存放应用中使用的图片资源。
│   └── fonts/                   # 存放应用中使用的字体资源。
├── test/
│   ├── canvas_test.dart         # 测试画布页面的功能。
│   ├── code_generator_test.dart # 测试代码生成逻辑。
│   └── widget_tests.dart        # 测试各个 UI 组件的功能。
├── pubspec.yaml                 # Flutter 项目配置文件，声明依赖包和资源。
└── README.md                    # 项目说明文档，介绍项目功能和使用方法。
```