import 'package:flutter/material.dart';
import 'package:instagram_application/screens/moodels/enum/acctivity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70.0,
              child: TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
                indicatorWeight: 3,
                indicatorColor: Color(0xFFF35383),
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'GB',
                ),
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 20.0,
            ),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'GB',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(AvtivityStatus.likes);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 20.0,
            ),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'GB',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(AvtivityStatus.followBack);
            },
            childCount: 3,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(AvtivityStatus.following);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 20.0,
            ),
            child: Text(
              'This week',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'GB',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(AvtivityStatus.followBack);
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget _getRow(AvtivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
      child: Row(
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: Color(0xFFF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 7.0),
          SizedBox(
            width: 40.0,
            height: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hesami Code",
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12.0,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12.0,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 10.0,
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getAcctionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getAcctionActivityRow(AvtivityStatus status) {
    switch (status) {
      case AvtivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          onPressed: () {},
          child: Text('Follow'),
        );
      case AvtivityStatus.likes:
        return SizedBox(
          height: 45.0,
          width: 85.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 2.0,
                color: Color(0xFFC5C5C5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Message',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'GB',
                color: Color(0xffC5C5C5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );

      case AvtivityStatus.following:
        return SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/item8.png'),
            ),
          ),
        );

      default:
        return SizedBox(
          height: 45.0,
          width: 85.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 2.0,
                color: Color(0xFFC5C5C5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Message',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'GB',
                color: Color(0xffC5C5C5),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }
}
