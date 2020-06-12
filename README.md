# EasyLoader

The easiest way to handle a simple full screen loader in Flutter. Written in Dart. Fully customizable.

![Screenshot](https://raw.githubusercontent.com/aligorithm/assets/master/ezgif-3-faf66acba323.gif)
## Getting Started

Add this to your package's `pubspec.yaml` file

```yaml
dependencies:
  easy_loader: ^1.0.2
```

## Usage

Next, you just have to import the package using:

```dart
import 'package:easy_loader/easy_loader.dart';
```

Then wrap your body within a `Stack` and place the `EasyLoader()` widget at the end of the `Stack`

```dart
  Widget build(BuildContext context) {
    return Scaffold(
      //// Wrap your body in a stack
      body: Stack(
        children: <Widget>[
          Center(
            child: Text("Lorem Ipsum"),
          ),
          //// Put the loader widget at the end of the stack. You can set it to appear based on a boolean. E.g. a loading flag.
          EasyLoader(image: AssetImage('assets/loading.png'),)
        ],
      ),
    );
  }
```

All done! You can customize other things like the icon size, background color, icon color and the animation by passing the values into the constructor.
