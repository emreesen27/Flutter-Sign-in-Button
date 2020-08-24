import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in Button Demo',
      home: MyHomePage(title: 'Sign in Button Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _buttonClick = "click sign in button";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_buttonClick',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 5.0,
              ),
              SignButton(
                  buttonType: ButtonType.apple,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "apple";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.facebook,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "facebook";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.twitter,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "twitter";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.github,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "github";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.google,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "google";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.linkedin,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "linkedIn";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.youtube,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "youtube";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.microsoft,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "microsoft";
                    });
                  }).show(),
              SignButton(
                  buttonType: ButtonType.pinterest,
                  onPressed: () {
                    setState(() {
                      _buttonClick = "pinterest";
                    });
                  }).show(),
              //custom button
              SignButton(
                  buttonType: ButtonType.pinterest,
                  imagePosition: ImagePosition.right,
                  //[buttonSize] You can also use this in combination with [width]. Increases the font and icon size of the button.
                  buttonSize: ButtonSize.large,
                  btnTextColor: Colors.grey,
                  btnColor: Colors.white,
                  width: 140,
                  //[width] Use if you change the text value.
                  btnText: 'Pinterest',
                  onPressed: () {
                    setState(() {
                      _buttonClick = "pinterest";
                    });
                  }).show(),
            ],
          ),
        ),
      ),
    );
  }
}
