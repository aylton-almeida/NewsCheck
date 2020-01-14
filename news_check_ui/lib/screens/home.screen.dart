import 'package:flutter/material.dart';
import 'package:news_check/services/news.service.dart';
import 'package:news_check/utils/alerts.dart';
import 'package:news_check/utils/validators.dart';
import 'package:news_check/widgets/OutlinedTextField.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final _controllerSearch = TextEditingController();

  double _btnWidth = 150;

  double _btnHeight = 100;

  double _loaderOpacity = 0;

  double _iconSize = 0;

  IconData _icon = Icons.check_circle;

  Future _handleAnimations(bool isLoading) async {
    if (isLoading) {
      setState(() {
        _btnWidth = 0;
        _btnHeight = 0;
        _iconSize = 0;
      });
      await Future.delayed(Duration(milliseconds: 750));
      setState(() {
        _loaderOpacity = 1.0;
      });
    } else {
      setState(() {
        _loaderOpacity = 0;
      });
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        _iconSize = 50;
        _btnHeight = 100;
        _btnWidth = 150;
      });
    }
  }

  void _handleButtonPressed() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      await _handleAnimations(true);
      bool isValid = await NewsService.validateText(_controllerSearch.text);
      if (isValid)
        setState(() {
          _icon = Icons.check_circle;
        });
      else
        setState(() {
          _icon = Icons.cancel;
        });
      await _handleAnimations(false);
    } else
      Alerts.showSnackBar(_scaffoldKey, 'Fill the search field',
          color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          child: Center(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Image.asset('lib/assets/nameImage.png'),
                  ),
                  Container(
                    height: 100,
                    child: OutlinedTextField(
                      controller: _controllerSearch,
                      autocorrect: true,
                      validator: Validators.require,
                      hintText: 'Search url...',
                      prefixIcon: Icon(Icons.search),
                      onChanged: (_) => _formKey.currentState.validate(),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    height: _btnHeight,
                    width: _btnWidth,
                    curve: Curves.fastOutSlowIn,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: RaisedButton(
                        onPressed: _handleButtonPressed,
                        child: Text(
                          'SEARCH',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: _loaderOpacity,
                    child: CircularProgressIndicator(),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: _iconSize,
                    width: _iconSize,
                    child: Icon(
                      _icon,
                      color: _icon == Icons.check_circle
                          ? Colors.green
                          : Colors.red,
                      size: _iconSize,
                    ),
                  )
                ],
              ),
            ))),
      )),
    );
  }
}
