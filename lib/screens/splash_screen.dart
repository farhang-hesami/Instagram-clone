import 'package:flutter/material.dart';
import 'package:instagram_application/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/patternf.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Container(
                width: 155.0,
                height: 77.0,
                child: Image.asset(
                  'assets/images/logo_splash.png',
                ),
              ),
            ),
            Positioned(
              bottom: 32.0,
              child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'GB',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Hesami Code',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontFamily: 'GB',
                      ),
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
