import 'package:flutter/material.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lib_management/views/reset_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [const Journals(), const Books(), const Reset()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login_bg.jpg'), fit: BoxFit.cover),
        ),
        child: _pageOptions[selectedPage],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          backgroundColor: const Color.fromRGBO(34, 4, 88, 1),
          height: 50,
          items: const [
            Icon(
              Icons.book_online,
              size: 30,
            ),
            Icon(
              Icons.recent_actors_rounded,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
            // label: 'Books'),
          ],
        ),
      ),
    );
    //     selectedItemColor: Colors.white,
    //     showSelectedLabels: true,
    //     showUnselectedLabels: false,
    //     elevation: 5.0,
    //     unselectedItemColor: Colors.white60,
    //     currentIndex: selectedPage,
    //     backgroundColor: Colors.black,
    //     onTap: (index) {
    //       setState(() {
    //         selectedPage = index;
    //       });
    //     },
    //   ),
    // ));
  }
}
