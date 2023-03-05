import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/journals_page.dart';
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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover),
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
          backgroundColor: bgColor,
          height: 50,
          items: [
            Icon(
              Icons.book_online,
              size: 30,
              color: bgColor,
            ),
            Icon(
              Icons.recent_actors_rounded,
              size: 30,
              color: bgColor,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: bgColor,
            ),
            // label: 'Books'),
          ],
        ),
      ),
    );
  }
}
