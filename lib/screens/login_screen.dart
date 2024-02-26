import 'package:flutter/material.dart';
import 'package:instagram_application/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode isFocus1 = FocusNode();
  FocusNode isFocus2 = FocusNode();

  @override
  void initState() {
    super.initState();
    isFocus1.addListener(() {
      setState(() {});
    });
    isFocus2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF323A99),
            Color(0xFFF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getBoxContainer(),
          ],
        ),
      ),
    );
  }

  Widget _getBoxContainer() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Container(
          height: 465.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            color: Color(0xFF1C1F2E),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to  ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'GB',
                        color: Color(0xFFFFFFFF),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/images/mood.png',
                    ),
                  ],
                ),
                SizedBox(height: 34.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: TextField(
                    focusNode: isFocus1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18.0,
                        color: isFocus1.hasFocus
                            ? Color(0xFFF35383)
                            : Color(0xFFFFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC5C5C5),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF35383),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: TextField(
                    focusNode: isFocus2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18.0,
                        color: isFocus2.hasFocus
                            ? Color(0xFFF35383)
                            : Color(0xFFFFFFFF),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC5C5C5),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF35383),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MainScreen();
                      },
                    ));
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0.0,
      child: Column(
        children: [
          Expanded(
            child: Container(
                child: FittedBox(
              child: Image.asset(
                'assets/images/post_image.png',
              ),
              fit: BoxFit.fitHeight,
            )),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    isFocus1.dispose();
    isFocus2.dispose();
    super.dispose();
  }
}
