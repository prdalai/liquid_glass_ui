# liquid_glass_ui

A Flutter package for building beautiful translucent UI components, inspired by Apple's new Liquid Glass design language (WWDC 2025).

✨ Features

* ✅ Customizable glass containers with blur & opacity
* ✅ Light/Dark mode adaptive
* ✅ Responsive and performant
* ✅ Great for cards, dialogs, backgrounds, and more

📦 Installation

Add this to your pubspec.yaml:

```yaml
dependencies:
  liquid_glass_ui: ^0.0.1
```

🧊 Usage

```dart
import 'package:liquid_glass_ui/liquid_glass_ui.dart';

LiquidGlassContainer(
  blur: 20,
  opacity: 0.2,
  padding: EdgeInsets.all(24),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text("I'm inside a glass box!", style: TextStyle(color: Colors.white)),
    ],
  ),
);
```

🚀 Example

Run this command:

```bash
flutter run --example
```

📷 Preview

> Include screenshots or GIFs here

🔧 Coming Soon

* LiquidGlassButton
* LiquidGlassBottomSheet
* Full screen glass layouts 