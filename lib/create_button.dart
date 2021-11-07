import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  //required
  /// [buttonType] sets the style and icons of the button.
  ButtonType buttonType;

  //required
  /// [onPressed] Send a function to trigger the button.
  VoidCallback? onPressed;

  //not required, default left
  /// [imagePosition] set the position of the icon.(left or right)
  ImagePosition? imagePosition;

  //not required, default 5.0
  /// [elevation] set the button's elevation value.
  double elevation;

  //not required, default small
  /// [buttonSize] set the size of the button. (small medium large)
  ButtonSize buttonSize;

  //not required, Gets value according to buttonType.
  /// [btnColor] Set the background color of the button.
  Color? btnColor;

  //not required, Gets value according to buttonType.
  /// [btnDisabledColor] Set the background color of the disabled button.
  Color? btnDisabledColor;

  //not required, Gets value according to buttonType.
  /// [btnTextColor] set the button's text color.
  Color? btnTextColor;

  //not required, Gets value according to buttonType.
  /// [btnDisabledTextColor] set the disabled button's text color.
  Color? btnDisabledTextColor;

  //not required, Gets value according to buttonType.
  /// [btnText] set the button's text.
  String? btnText;

  //not required, Gets value according to buttonSize.
  /// You can change the value of [width] when the text size becomes too small.
  double? width;

  //not required, Gets value according to buttonSize.
  /// [padding] set the button's padding value.
  double? padding;

  /// [_image] value cannot be assigned.Gets value according to [buttonType].
  Widget? _image;

  /// [_fontSize] value cannot be assigned.Gets value according to [buttonSize].
  double? _fontSize;

  /// [_imageSize] value cannot be assigned.Gets value according to [buttonSize].
  double? _imageSize;

  //not required, button shape.
  /// [shape] set the button's shape.
  ShapeBorder? shape;

  //not required, button model.
  /// [mini] It automatically takes value according to the selected constructor.
  bool mini;

  SignInButton({
    required this.buttonType,
    required this.onPressed,
    this.imagePosition: ImagePosition.left,
    this.buttonSize: ButtonSize.small,
    this.btnColor,
    this.btnDisabledColor,
    this.btnTextColor,
    this.btnDisabledTextColor,
    this.btnText,
    this.elevation: 5.0,
    this.width,
    this.padding,
    this.shape,
  }) : mini = false;

  SignInButton.mini({
    required this.buttonType,
    required this.onPressed,
    this.buttonSize: ButtonSize.small,
    this.btnColor,
    this.btnDisabledColor,
    this.elevation: 5.0,
    this.padding,
  }) : mini = true;

  bool get _enabled => onPressed != null;

  bool get _disabled => !_enabled;

  @override
  Widget build(BuildContext context) {
    _setButtonSize();
    _createStyle(context);
    return !mini
        ? MaterialButton(
            color: btnColor,
            disabledColor: btnDisabledColor,
            shape: shape ?? StadiumBorder(),
            onPressed: onPressed,
            elevation: elevation,
            child: Container(
              width: width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: imagePosition == ImagePosition.left
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(padding!),
                    child:
                        imagePosition == ImagePosition.left ? _image : _text(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(padding!),
                    child:
                        imagePosition == ImagePosition.left ? _text() : _image,
                  ),
                ],
              ),
            ),
          )
        : MaterialButton(
            onPressed: onPressed,
            color: btnColor,
            disabledColor: btnDisabledColor,
            child: _image,
            elevation: elevation,
            padding: EdgeInsets.all(padding!),
            shape: CircleBorder(),
          );
  }

  Widget _text() {
    return Text(
      btnText!,
      style: TextStyle(
        fontSize: _fontSize,
        color: _enabled ? btnTextColor : btnDisabledTextColor,
      ),
    );
  }

  void _setButtonSize() {
    if (buttonSize == ButtonSize.small) {
      padding ??= !mini ? 5.0 : 6.0;
      width ??= 200;
      _fontSize = 15.0;
      _imageSize = !mini ? 24.0 : 30.0;
    } else if (buttonSize == ButtonSize.medium) {
      padding ??= !mini ? 5.5 : 6.5;
      width ??= 220;
      _fontSize = 17.0;
      _imageSize = !mini ? 28.0 : 34.0;
    } else {
      padding ??= !mini ? 6.0 : 7.0;
      width ??= 250;
      _fontSize = 19.0;
      _imageSize = !mini ? 32.0 : 38.0;
    }
  }

  void _createStyle(BuildContext context) {
    btnDisabledColor ??= Theme.of(context).disabledColor.withOpacity(0.12);
    btnDisabledTextColor ??= Theme.of(context).disabledColor.withOpacity(0.38);

    _image = Image.asset(
      'images/${describeEnum(buttonType)}.png',
      package: 'sign_button',
      width: _imageSize,
      height: _imageSize,
    );

    if (_disabled) {
      _image = ColorFiltered(
        colorFilter: ColorFilter.matrix(<double>[
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0.2126,0.7152,0.0722,0,0,
          0,0,0,1,0,
        ]),
        child: _image,
      );
    }

    switch (buttonType) {
      case ButtonType.facebook:
        btnText ??= 'Sign in with Facebook';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF1877F2);
        break;

      case ButtonType.facebookDark:
        btnText ??= 'Sign in with Facebook';
        btnTextColor ??= Colors.white;
        btnColor ??= Colors.black;
        break;

      case ButtonType.github:
        btnText ??= 'Sign in with Github';
        btnTextColor ??= Colors.black87;
        btnColor ??= Colors.white;
        break;

      case ButtonType.githubDark:
        btnText ??= "Sign in with Github";
        btnTextColor ??= Colors.white70;
        btnColor ??= Color(0xff212121);
        break;

      case ButtonType.pinterest:
        btnText ??= 'Sign in with Pinterest';
        btnTextColor ??= Colors.white;
        btnColor ??= Colors.redAccent;
        break;

      case ButtonType.apple:
        btnText ??= 'Sign in with Apple';
        btnTextColor ??= Colors.black;
        btnColor ??= Color(0xfff7f7f7);
        break;

      case ButtonType.appleDark:
        btnText ??= 'Sign in with Apple';
        btnTextColor ??= Colors.white;
        btnColor ??= Colors.black;
        break;

      case ButtonType.twitter:
        btnText ??= 'Sign in with Twitter';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF1DA1F2);
        break;

      case ButtonType.linkedin:
        btnText ??= 'Sign in with LinkedIn';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF3282B8);
        break;

      case ButtonType.google:
        btnText ??= 'Sign in with Google';
        btnTextColor ??= Colors.black;
        btnColor ??= Color(0xfff7f7f7);
        break;

      case ButtonType.googleDark:
        btnText ??= 'Sign in with Google';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF4285F4);
        break;

      case ButtonType.youtube:
        btnText ??= 'Sign in with Youtube';
        btnTextColor ??= Colors.black;
        btnColor ??= Colors.white;
        break;

      case ButtonType.microsoft:
        btnText ??= 'Sign in with Microsoft';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF2F2F2F);
        break;

      case ButtonType.tumblr:
        btnText ??= 'Sign in with Tumblr';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF0F4C75);
        break;

      case ButtonType.mail:
        btnText ??= 'Sign in with Mail';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF20639B);
        break;

      case ButtonType.reddit:
        btnText ??= 'Sign in with Reddit';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFFC85417);
        break;

      case ButtonType.yahoo:
        btnText ??= 'Sign in with Yahoo';
        btnTextColor ??= Colors.white;
        btnColor ??= Color(0xFF7C5295);
        break;

      case ButtonType.amazon:
        btnText ??= 'Sign in with Amazon';
        btnTextColor ??= Colors.black87;
        btnColor ??= Colors.white;
        break;

      case ButtonType.quora:
        btnText ??= 'Sign in with Quora';
        btnTextColor ??= Colors.black87;
        btnColor ??= Colors.white;
        break;

      case ButtonType.instagram:
        btnText ??= 'Sign in with Instagram';
        btnTextColor ??= Colors.black87;
        btnColor ??= Colors.white;
        break;
    }
  }
}
