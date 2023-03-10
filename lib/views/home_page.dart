import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/dashboard.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:lib_management/views/profile_page.dart';

import '../services/app_constants.dart';
import '../services/app_services_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int selectedPage = 0;

  int bottomSelectedIndex = 0;
  AppServices imp = AppServiceImp();

  final _pageOptions = [const DashBoard(), const Journals(), const Books(), const ProfilePage()];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: const <Widget>[
          DashBoard(),
          Journals(),
          Books(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: imp.getSize(context, 70),
        child: CurvedNavigationBar(
          index: bottomSelectedIndex,
          onTap: (index) {
            setState(() {
              // selectedPage = index;
              bottomSelectedIndex = index;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          color: Colors.pink[200]!,
          backgroundColor: bgColor,
          buttonBackgroundColor: Colors.white,
          height: imp.getSize(context, 55),
          items: [
            Icon(
              Icons.home,
              size: imp.getSize(context, 27),
              color: bgColor,
            ),
            Icon(
              Icons.book_online,
              size: imp.getSize(context, imp.getSize(context, 27)),
              color: bgColor,
            ),
            Icon(
              Icons.book,
              size: imp.getSize(context, imp.getSize(context, 27)),
              color: bgColor,
            ),
            Icon(
              Icons.person,
              size: imp.getSize(context, imp.getSize(context, 27)),
              color: bgColor,
            ),
          ],
        ),
      ),
    );
  }
}
