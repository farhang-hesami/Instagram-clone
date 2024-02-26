import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.controller});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 18.0,
          sigmaY: 18.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.08),
                Color.fromRGBO(255, 255, 255, 0.07),
              ],
            ),
          ),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    height: 5.0,
                    width: 67.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon_share_bottomsheet.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/icon_search.png'),
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.only(top: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.4),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 110,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 90.0),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
              child: Text(
                'Send',
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              'assets/images/profile.png',
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Hesami Code',
          style: TextStyle(
            fontFamily: 'GB',
            fontSize: 12.0,
            color: Color(0xFFFFFFFF),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
