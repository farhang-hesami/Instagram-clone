import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram_application/screens/share_bottomSheet.dart';
import 'package:instagram_application/screens/switch_account_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0Xff1C1F2E),
        elevation: 0.0,
        title: Container(
          width: 128.0,
          height: 24.0,
          child: Image.asset(
            'assets/images/moodinger_logo.png',
          ),
        ),
        actions: [
          Container(
            width: 25.0,
            height: 25.0,
            margin: EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SwitchAccountScreen();
                  },
                ));
              },
              child: Image.asset(
                'assets/images/icon_activity_navigation.png',
              ),
            ),
          ),
          Container(
            width: 25.0,
            height: 25.0,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('assets/images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.5,
                          minChildSize: 0.2,
                          maxChildSize: 0.7,
                          builder: (context, scrollController) {
                            return ShareBottomSheet(
                                controller: scrollController);
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text('share'),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 34.0,
                      ),
                      _getHeaderPost(),
                      SizedBox(
                        height: 24.0,
                      ),
                      _getPostContent(),
                    ],
                  );
                },
                childCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 34.0,
            ),
            _getHeaderPost(),
            SizedBox(
              height: 24.0,
            ),
            _getPostContent(),
          ],
        );
      },
    );
  }

  Widget _getPostContent() {
    return Container(
      height: 440.0,
      width: 394.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/post_cover.png',
              ),
            ),
          ),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: Image.asset(
              'assets/images/icon_video.png',
            ),
          ),
          Positioned(
            bottom: 15.0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 16.0,
                  sigmaY: 16.0,
                ),
                child: Container(
                  width: 340.0,
                  height: 46.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15.0),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icon_hart.png',
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '2.6 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              color: Color(0xFFFFFFFF),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 42.0),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/icon_comments.png',
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              color: Color(0xFFFFFFFF),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 42.0),
                      Image.asset(
                        'assets/images/icon_share.png',
                      ),
                      SizedBox(width: 46.0),
                      Image.asset(
                        'assets/images/icon_save.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farhang Hesami',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'GB',
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  'برنامه نویس موبایل و طراح سایت',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xFFF35383),
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('assets/images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xFFF35383),
            strokeWidth: 2,
            dashPattern: [40, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'test1',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Column(
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0Xff1C1F2E),
                ),
                child: Image.asset(
                  'assets/images/icon_plus.png',
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'your story',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
