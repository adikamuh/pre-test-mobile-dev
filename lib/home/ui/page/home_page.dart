import 'package:flutter/material.dart';
import 'package:pre_test_mobile_dev/books/ui/page/books_page.dart';
import 'package:pre_test_mobile_dev/cart/ui/page/cart_page.dart';
import 'package:pre_test_mobile_dev/favorite/ui/page/favorite_page.dart';
import 'package:pre_test_mobile_dev/profile/ui/page/profile_page.dart';
import 'package:pre_test_mobile_dev/settings/ui/page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  void _pageChanged(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _pageChanged(index);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _pageChanged,
          children: const [
            ProfilePage(),
            BooksPage(),
            CartPage(),
            FavoritePage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.shade100,
        currentIndex: _curIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            // backgroundColor: Colors.deepPurple,
            label: "Books",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            // backgroundColor: Colors.deepPurple,
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            // backgroundColor: Colors.deepPurple,
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            // backgroundColor: Colors.deepPurple,
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
