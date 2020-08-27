import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'size.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:test1/screens/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color color1 = Color(0xF15A22).withOpacity(1);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
            SizedBox(
              height: 120,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Welcome to',
                  style: TextStyle(
                    color: color1,
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Grocery Shopping',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: color1,
//                fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: () {},
                  color: color1,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 7),
                    GestureDetector(
                      onTap: () {
                        var route = MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
