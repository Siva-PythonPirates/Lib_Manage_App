import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:lib_management/views/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [const Journals(), const Books(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: SizedBox(
        height: getSize(context, 70),
        child: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          color: Colors.pink[200]!,
          backgroundColor: bgColor,
          buttonBackgroundColor: Colors.white,
          height: getSize(context, 50),
          items: [
            Icon(
              Icons.book_online,
              size: getSize(context, 30),
              color: bgColor,
            ),
            Icon(
              Icons.recent_actors_rounded,
              size: getSize(context, 30),
              color: bgColor,
            ),
            Icon(
              Icons.person,
              size: getSize(context, 30),
              color: bgColor,
            ),
          ],
        ),
      ),
    );
  }
}
