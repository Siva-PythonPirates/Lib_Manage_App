import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/history.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:lib_management/views/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int selectedPage = 0;

  int bottomSelectedIndex = 0;

  final _pageOptions = [const Journals(), const Books(), const ProfilePage()];

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
          History(),
          Books(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: getSize(context, 70),
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
          height: getSize(context, 55),
          items: [
            Icon(
              Icons.book_online,
              size: getSize(context, getSize(context, 27)),
              color: bgColor,
            ),
            Icon(
              Icons.recent_actors_rounded,
              size: getSize(context, getSize(context, 27)),
              color: bgColor,
            ),
            Icon(
              Icons.person,
              size: getSize(context, getSize(context, 27)),
              color: bgColor,
            ),
          ],
        ),
      ),
    );
  }
}
