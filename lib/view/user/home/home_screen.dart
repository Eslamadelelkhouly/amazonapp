import 'package:amazonapp/utils/colors.dart';
import 'package:amazonapp/view/user/cart/cart_screen.dart';
import 'package:amazonapp/view/user/menu/menu_screen.dart';
import 'package:amazonapp/view/user/profile/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    // Replace HomeScreen with your actual home page widget
    HomeWidget(),
    ProfileScreen(),
    CartScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        items: const <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.person, size: 25),
          Icon(Icons.shopping_cart, size: 25),
          Icon(Icons.menu, size: 25),
        ],
        color: Colors.white,
        backgroundColor: appBarGradientColor[0], // Replace with a single color
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: white,
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: addressBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
