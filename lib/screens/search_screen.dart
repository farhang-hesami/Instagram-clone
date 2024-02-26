import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getContent(),
            ),
            SliverToBoxAdapter(
              child: _getBoxSearch(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _getContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Image.asset('assets/images/icon_search.png'),
              suffixIcon: Image.asset('assets/images/icon_scan.png'),
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
              fillColor: Color(0xFF272B40),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBoxSearch() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      height: 23.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Color(0xFF272B40),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 4.0,
                ),
                child: Text(
                  "farhang $index",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'GM',
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
