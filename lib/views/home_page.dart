import 'package:flutter/material.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/journals_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [Journals(), Books()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book_online,
                    size: 30,
                  ),
                  label: 'E-Journal'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.recent_actors_rounded,
                    size: 30,
                  ),
                  label: 'Books'),
            ],
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 5.0,
            unselectedItemColor: Colors.white60,
            currentIndex: selectedPage,
            backgroundColor: Colors.black,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
          ),
        ));
  }
}
