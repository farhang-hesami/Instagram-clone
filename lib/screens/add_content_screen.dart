import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            Container(
              height: 83.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF272B40),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 17.0, left: 17.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16.0,
                        color: Color(0xFFF35383),
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16.0,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 10.0,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/item$index.png'),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 83.0),
        ),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      height: 394.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/post_image.png'),
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 18.0),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'GB',
              fontSize: 24.0,
            ),
          ),
          SizedBox(width: 10.0),
          Image.asset(
            'assets/images/icon_arrow_down.png',
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'GB',
                  fontSize: 16.0,
                ),
              ),
              SizedBox(width: 10.0),
              Image.asset('assets/images/icon_arrow_right_box.png')
            ],
          ),
        ],
      ),
    );
  }
}
