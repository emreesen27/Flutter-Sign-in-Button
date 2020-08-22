# Sign Button

A Flutter plugin for generating sign in buttons for different social media accounts.

## Getting Started

You must add the library as a dependency to your project.
```yaml
dependencies:
 sign_button: ^0.0.3
```

You should then run `flutter packages get`

Now in your Dart code, you can use:

```dart
import 'package:sign_button/sign_button.dart'
```

## Usage Example

It very simple!

```dart
SignButton(
  buttonType: ButtonType.google,
  onPressed: () {
  print('click');
  }).show()
```

<img src = "https://github.com/emreesen27/Flutter-Sign-Button/blob/assets/buttons.png?raw=true">

ButtonSize
```dart
SignButton(
  buttonType: ButtonType.google,
  buttonSize: ButtonSize.large, // small(default), medium, large
  onPressed: () {
  print('click');
  }).show()
```
<img src = "https://github.com/emreesen27/Flutter-Sign-Button/blob/assets/size.png?raw=true">

ImagePosition
```dart
SignButton(
  imagePosition: ImagePosition.left, // left or right
  buttonType: ButtonType.google,
  onPressed: () {
  print('click');
  }).show()
```
<img src = "https://github.com/emreesen27/Flutter-Sign-Button/blob/assets/position.png?raw=true">


## Other properties
- btnText 
- btnColor
- btnTextColor
- elevation
- width // You can change the value of width when the text size becomes too small.
