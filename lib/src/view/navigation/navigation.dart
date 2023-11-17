import 'package:flutter/material.dart';
import 'package:vendor/src/view/home/home.dart';

int bottomSelectedIndex = 0;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.request_page),
        label: 'Request',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.handshake),
        label: 'Offers',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Orders',
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: PageController(
        initialPage: 0,
        keepPage: true,
      ),
      onPageChanged: (index) {
        setState(() {
          bottomSelectedIndex = index;
        });
      },
      children: const <Widget>[
        HomeScreen(),
        Colored(color: Colors.red),
        Colored(color: Colors.blue),
        Colored(color: Colors.yellow)
      ],
    );
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        items: buildBottomNavBarItems(),
        onTap: (index) {
          bottomTapped(index);
        },
      ),
    );
  }
}

class Colored extends StatelessWidget {
  const Colored({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
