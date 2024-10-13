import 'package:event_management/pages/user/components/event_list_component.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'components/recomendation_component.dart';
import 'components/top_events_component.dart';
import 'event_details_page.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selectedIndex = 0;
  ScrollController _scrollController = ScrollController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          backgroundColor: Colors.black,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home, color: Colors.white, size: 30),
              title: Text('Home', style: TextStyle(color: Colors.green)),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.search, color: Colors.white, size: 30),
              title: Text('Explore', style: TextStyle(color: Colors.green)),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.highlight, color: Colors.white, size: 30),
              title: Text('User', style: TextStyle(color: Colors.green)),
            ),
          ],
        ),
        backgroundColor: Color(0xff000000).withOpacity(0.5),
        appBar: AppBar(
          title: Text(
            "Zap.IO",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                "Trending",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of TopEventsComponent instances
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsPage(
                                    img: 'assets/images/aadhina.jpg',
                                    idx: index+1)));
                      },
                      child: TopEventsComponent(num: index + 1,idx:index+1));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You'd like",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Number of RecommendationComponent instances
                itemBuilder: (context, index) {
                  return RecommendationComponent(
                    idx: index + 15,
                    imageUrl: 'assets/images/aadhina.jpg',
                    location: 'Location ${index + 1}',
                    time: '${(index + 1) * 2}:00 PM',
                    date: 'Oct ${10 + index}, 2024',
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "More for U",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Ensure ListView is within available space
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              itemCount: 4, // Number of EventListComponent instances
              itemBuilder: (context, index) {
                return EventListComponent(idx: index+45,);
              },
            ),
          ],
        ),
      ),
    );
  }
}
