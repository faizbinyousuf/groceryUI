import 'package:flutter/material.dart';
import 'package:test1/size.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = new TextEditingController();
  final Color color1 = Color(0xF15A22).withOpacity(1);

  String _label;
  FocusNode phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_startedTyping);
  }

  void _startedTyping() {
    setState(() {
      if (_phoneController.text.isNotEmpty) {
        _label = 'Mobile Number';
      } else {
        _label = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 200,
                    color: Color(0xF3C8B9).withOpacity(1),
                  ),
                ), //
                Ink(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),

                Positioned(
                  //left: 160,
                  bottom: 0,
                  right: SizeConfig.blockSizeHorizontal * 38,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.deepOrangeAccent.withOpacity(.5),
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  //left: 160,
                  bottom: 7,
                  right: SizeConfig.blockSizeHorizontal * 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xF15A22).withOpacity(1),
                    ),
                    height: 85,
                    width: 85,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: SizeConfig.blockSizeHorizontal * 42,
                  child: Text(
                    'ME',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey[900]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Please enter your registered mobile number',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                focusNode: phoneFocus,
                keyboardType: TextInputType.number,
                autofocus: false,
                textInputAction: TextInputAction.done,
                controller: _phoneController,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  labelText: _label,
                  labelStyle: TextStyle(
                      color: phoneFocus.hasFocus
                          ? Colors.grey[600]
                          : Colors.grey[600]),
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ButtonTheme(
                height: 45.0,
                minWidth: 90.0,
                child: RaisedButton(
                  onPressed: () {},
                  color: color1,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Signup',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
