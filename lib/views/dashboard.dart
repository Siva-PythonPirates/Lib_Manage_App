import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/book_details.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/favorites_page.dart';
import 'package:lib_management/views/profile_page.dart';
import 'package:lib_management/views/widgets/alert_dialog.dart';
import 'package:lib_management/views/widgets/carousel.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:provider/provider.dart';

import 'package:lib_management/views/history.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    AppServices imp = AppServiceImp();
    List<Map<String, String>> favoriteBooks = books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();

    // setState(() {
    // books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
    log(favoriteBooks.toString());

    // context.read<MyModel>().loadFavorites();
    // });

    List<Widget> createTopPicksChildren() {
      List<Widget> children = [];
      for (int i = 0; i < 10; i++) {
        children.add(
          Padding(
            padding: EdgeInsets.all(imp.getSize(context, 10)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetails(
                      book: topPicksBooks[i],
                    ),
                  ),
                ).then(
                  (value) {
                    setState(() {
                      favoriteBooks = books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
                      log(favoriteBooks.toString());

                      // context.read<MyModel>().loadFavorites();
                    });
                  },
                );
              },
              child: Container(
                width: imp.getSize(context, 130),
                height: imp.getSize(context, 200),
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(imp.getSize(context, 10)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: imp.getSize(context, 150),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              imp.getSize(context, 10),
                            ),
                            topRight: Radius.circular(
                              imp.getSize(context, 10),
                            ),
                          ),
                          image: const DecorationImage(
                            image: NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.all(imp.getSize(context, 3)),
                            child: Text(
                              topPicksBooks[i]['title']!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return children;
    }

    List<Widget> createFavouriteBooksChildren() {
      List<Widget> children = [];
      if (favoriteBooks.isNotEmpty) {
        for (int i = 0; i < favoriteBooks.length; i++) {
          children.add(
            Padding(
              padding: EdgeInsets.all(imp.getSize(context, 10)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetails(
                        book: favoriteBooks[i],
                      ),
                    ),
                  ).then(
                    (value) {
                      setState(() {
                        favoriteBooks = books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
                        log(favoriteBooks.toString());

                        // context.read<MyModel>().loadFavorites();
                      });
                    },
                  );
                },
                child: Container(
                  width: imp.getSize(context, 130),
                  height: imp.getSize(context, 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(imp.getSize(context, 10)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: imp.getSize(context, 150),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                imp.getSize(context, 10),
                              ),
                              topRight: Radius.circular(
                                imp.getSize(context, 10),
                              ),
                            ),
                            image: const DecorationImage(
                              image: NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.all(imp.getSize(context, 3)),
                              child: Text(
                                favoriteBooks[i]['title']!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        children.add(
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyFavoritesPage(),
                ),
              ).then((value) {
                setState(() {
                  favoriteBooks = books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
                  log(favoriteBooks.toString());

                  // context.read<MyModel>().loadFavorites();
                });
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: imp.getSize(context, 10)),
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_circle_right_rounded,
                    color: Colors.white,
                    size: imp.getSize(context, 30),
                  ),
                  SizedBox(height: imp.getSize(context, 10)),
                  Text(
                    'See More',
                    style: TextStyle(color: Colors.white, fontSize: imp.getSize(context, 15)),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        children.add(
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Books(),
                ),
              ).then((value) {
                setState(() {
                  favoriteBooks = books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
                  log(favoriteBooks.toString());

                  // context.read<MyModel>().loadFavorites();
                });
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: imp.getSize(context, 10)),
              child: Container(
                width: imp.getSize(context, 130),
                height: imp.getSize(context, 130),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(imp.getSize(context, 10)),
                  color: Colors.white.withOpacity(0.3),
                ),
                // color: Colors.white.withOpacity(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: imp.getSize(context, 30),
                    ),
                    SizedBox(height: imp.getSize(context, 10)),
                    Text(
                      'Add Books',
                      style: TextStyle(color: Colors.white, fontSize: imp.getSize(context, 15)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return children;
    }

    return WillPopScope(
      onWillPop: () {
        return showAlertDialog(context: context, title: 'Exit App ?', content: null, action1: 'Yes', action2: 'No');
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            // color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  imp.getSize(context, 16),
                  imp.getSize(context, 46),
                  imp.getSize(context, 16),
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'REC-Library',
                          style: TextStyle(
                            fontSize: imp.getSize(context, 30),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomCarousel(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(imp.getSize(context, 10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(imp.getSize(context, 8)),
                                child: Material(
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  elevation: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const ProfilePage(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                    child: Ink(
                                      height: imp.getSize(context, 60),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/profilelogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'My Profile',
                                            style: TextStyle(
                                              fontSize: imp.getSize(context, 20),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                            size: imp.getSize(context, 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(imp.getSize(context, 8)),
                                child: Material(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  elevation: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const History(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/historylogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                      ),
                                      height: imp.getSize(context, 60),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'History',
                                            style: TextStyle(
                                              fontSize: imp.getSize(context, 20),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.black,
                                            size: imp.getSize(context, 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: imp.getSize(context, 10),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(imp.getSize(context, 8)),
                                child: Material(
                                  color: Colors.cyan[200],
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  elevation: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Journals(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                    child: Ink(
                                      height: imp.getSize(context, 100),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/journallogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'E-Journal',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: imp.getSize(context, 20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(imp.getSize(context, 8)),
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  elevation: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Books(),
                                        ),
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                    child: Ink(
                                      height: imp.getSize(context, 100),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/booklogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Books',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: imp.getSize(context, 20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(imp.getSize(context, 8)),
                                child: Material(
                                  color: Colors.pink[200],
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  elevation: 20,
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                    child: Ink(
                                      height: imp.getSize(context, 100),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/ebooklogo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'E-Books',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: imp.getSize(context, 20),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: imp.getSize(context, 20),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(imp.getSize(context, 10)),
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Top Picks',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: imp.getSize(context, 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: imp.getSize(context, 10),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: createTopPicksChildren(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: imp.getSize(context, 20),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(imp.getSize(context, 10)),
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Favourites',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: imp.getSize(context, 25),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const MyFavoritesPage(),
                                            ),
                                          ).then((value) {
                                            setState(() {
                                              favoriteBooks =
                                                  books.where((book) => context.read<MyModel>().favorites.contains(book["title"])).toList();
                                              log(favoriteBooks.toString());

                                              // context.read<MyModel>().loadFavorites();
                                            });
                                          });
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: imp.getSize(context, 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: imp.getSize(context, 10),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: createFavouriteBooksChildren(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
