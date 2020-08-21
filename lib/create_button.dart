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
  double elevation;

  Widget _image;
  double _fontSize, _imageSize;
  Color _btnColor, _btnTextColor;
  String _btnText;

  /// [buttonType] sets the style and icons of the button.
  /// [imagePosition] set the position of the icon.(left or right)
  /// [buttonSize] set the size of the button. (small medium large)

  /// [buttonType], [onPressed] are required.
  SignButton({
    this.btnText,
    this.btnColor,
    this.btnTextColor,
    this.buttonSize = ButtonSize.medium,
    this.imagePosition = ImagePosition.right,
    this.elevation = 8.0,
    @required this.buttonType,
    @required this.onPressed,
  });


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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imagePosition == ImagePosition.left
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: _image,
                  )
                : Container(),
            Text(
              btnText ?? _btnText,
              style: TextStyle(
                fontSize: _fontSize,
                color: btnTextColor ?? _btnTextColor,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            imagePosition == ImagePosition.right
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: _image,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _setButtonSize() {
    if (buttonSize == ButtonSize.small) {
      _fontSize = 16.0;
      _imageSize = 24.0;
    } else if (buttonSize == ButtonSize.medium) {
      _fontSize = 18.0;
      _imageSize = 32.0;
    } else {
      _fontSize = 20.0;
      _imageSize = 40.0;
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
