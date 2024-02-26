import 'dart:ui';
import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF98BFC),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/patternf.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 256,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3.0,
                        sigmaY: 3.0,
                      ),
                      child: Container(
                        width: 340.0,
                        height: 352.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 32.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/profile.png',
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Hesami Code',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Confirm'),
                            ),
                            SizedBox(height: 32.0),
                            Text(
                              'switch account',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 132.0, bottom: 63.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an acoount ? /',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'GB',
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'GB',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
