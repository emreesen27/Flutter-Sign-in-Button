import 'package:flutter/material.dart';
import 'constants.dart';

class SignButton {
  //values ​​of the variables are assigned later. You don't need to value it.
  ButtonType buttonType;
  ImagePosition imagePosition;
  ButtonSize buttonSize;
  Function onPressed;
  Color btnColor, btnTextColor;
  String btnText;
  double elevation, width;

  /// these variables take values ​​according to the button type selected.
  /// [_image], [_fontSize], [_imageSize], [_buttonWidth], [_btnColor], [_btnTextColor], [_btnText]
  Widget _image;
  double _fontSize, _imageSize, _buttonWidth;
  Color _btnColor, _btnTextColor;
  String _btnText;

  /// [buttonType] sets the style and icons of the button.
  /// [imagePosition] set the position of the icon.(left or right)
  /// [buttonSize] set the size of the button. (small medium large)
  /// You can change the value of [width] when the text size becomes too small.
  SignButton({
    this.btnText,
    this.btnColor,
    this.btnTextColor,
    this.width,
    this.buttonSize = ButtonSize.small,
    this.imagePosition = ImagePosition.left,
    this.elevation = 8.0,
    @required this.buttonType,
    @required this.onPressed,
  });

  /// [buttonType], [onPressed] are required.
  ///You must call the "show()" method to view the SignButton class you have defined.
  Widget show() {
    _setButtonSize();
    _createStyle();

    assert(onPressed != null, 'onPressed is null');
    assert(buttonType != null, 'buttonType is null');

    return MaterialButton(
      color: btnColor ?? _btnColor,
      shape: StadiumBorder(),
      onPressed: onPressed,
      elevation: elevation,
      child: Container(
        width: width ?? _buttonWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: imagePosition == ImagePosition.left
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: imagePosition == ImagePosition.left
                  ? _image
                  : Text(
                      btnText ?? _btnText,
                      style: TextStyle(
                        fontSize: _fontSize,
                        color: btnTextColor ?? _btnTextColor,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: imagePosition == ImagePosition.left
                  ? Text(
                      btnText ?? _btnText,
                      style: TextStyle(
                        fontSize: _fontSize,
                        color: btnTextColor ?? _btnTextColor,
                      ),
                    )
                  : _image,
            ),
          ],
        ),
      ),
    );
  }

  void _setButtonSize() {
    if (buttonSize == ButtonSize.small) {
      _fontSize = 15.0;
      _imageSize = 24.0;
      _buttonWidth = 200;
    } else if (buttonSize == ButtonSize.medium) {
      _fontSize = 17.0;
      _imageSize = 28.0;
      _buttonWidth = 220;
    } else {
      _fontSize = 19.0;
      _imageSize = 32.0;
      _buttonWidth = 250;
    }
  }

  void _createStyle() {
    if (buttonType == ButtonType.facebook) {
      _btnText = 'Sign in with Facebook';
      _btnTextColor = Colors.white;
      _btnColor = Colors.blueAccent;
      _image = Image.asset(
        'images/facebook.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.github) {
      _btnText = 'Sign in with Github';
      _btnTextColor = Colors.white;
      _btnColor = Color(0xee393e46);
      _image = Image.asset(
        'images/github.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.pinterest) {
      _btnText = 'Sign in with Pinterest';
      _btnTextColor = Colors.white;
      _btnColor = Colors.redAccent;
      _image = Image.asset(
        'images/pinterest.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.apple) {
      _btnText = 'Sign in with Apple';
      _btnTextColor = Colors.black;
      _btnColor = Color(0xfff7f7f7);
      _image = Image.asset(
        'images/apple.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.twitter) {
      _btnText = 'Sign in with Twitter';
      _btnTextColor = Colors.white;
      _btnColor = Colors.lightBlueAccent;
      _image = Image.asset(
        'images/twitter.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.linkedin) {
      _btnText = 'Sign in with LinkedIn';
      _btnTextColor = Colors.white;
      _btnColor = Colors.blueGrey;
      _image = Image.asset(
        'images/linkedin.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    } else if (buttonType == ButtonType.google) {
      _btnText = 'Sign in with Google';
      _btnTextColor = Colors.black;
      _btnColor = Color(0xfff7f7f7);
      _image = Image.asset(
        'images/google.png',
        package: 'sign_button',
        width: _imageSize,
        height: _imageSize,
      );
    }
  }
}
