import 'package:flutter/material.dart';
import 'package:nartaqi/offers.dart';
import 'package:nartaqi/services_page.dart';
import 'package:nartaqi/writers.dart';
import 'contacts.dart';
import 'home_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 4;
  final PageController _pageController = PageController(initialPage: 4,);
  final List<Widget> _screen = [
   ContactsPage(),
    WritersPage(),
    ServicesPage(),
    OffersPage(),
    HomePage(),

  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTapped(int selectedIndex ) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex : _selectedIndex,
        onTap: _onTapped,
        style: TabStyle.reactCircle,
        elevation: 5,
        backgroundColor: Color(0xff292929),
        height: MediaQuery.of(context).size.height*.07,
        activeColor: Color(0xFFF9A826),
        items: [
          TabItem(icon: Icons.alternate_email,title: 'تواصل معنا',),
          TabItem(icon: Icons.history_edu,title: 'كتاب الدار'),
          TabItem(icon: Icons.local_library,title: 'الخدمات',),
          TabItem(icon: Icons.sell,title: 'العروض',),
          TabItem(icon: Icons.house,title: 'الرئيسية',),
        ],
      ),
    );
  }
}
