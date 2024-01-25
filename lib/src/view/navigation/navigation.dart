import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/src/view/home/home.dart';
import 'package:vendor/src/view/offers/offers.dart';

import '../requests/requests.dart';

int bottomSelectedIndex = 0;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<StatefulWidget> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/imgs/home.svg',
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/imgs/requests.svg',
        ),
        label: 'Request',
      ),
      BottomNavigationBarItem(
        icon: $AssetsImgsGen().offersImg.image(),
        label: 'Offers',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/imgs/orders.svg',
        ),
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
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          bottomSelectedIndex = index;
        });
      },
      children: <Widget>[
        const HomeScreen(),
        const Requests(),
        OffersScreen(),
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
        type: BottomNavigationBarType.fixed,
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
