import 'package:flutter/material.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/book_details.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/profile_page.dart';
import 'package:lib_management/views/widgets/carousel.dart';
import 'package:lib_management/views/journals_page.dart';
import 'package:lib_management/views/favourite_page.dart';
import 'package:lib_management/views/history_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AppServices imp = AppServiceImp();

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
                  Image(
                    height: imp.getSize(context, 150),
                    width: double.infinity,
                    image: const NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          topPicksBooks[i]['title']!,
                          textAlign: TextAlign.center,
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
    for (int i = 0; i < 5; i++) {
      children.add(
        Padding(
          padding: EdgeInsets.all(imp.getSize(context, 10)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    book: favouriteBooks[i],
                  ),
                ),
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
                  Image(
                    height: imp.getSize(context, 150),
                    width: double.infinity,
                    image: const NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          favouriteBooks[i]['title']!,
                          textAlign: TextAlign.center,
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
              builder: (context) => const FavouritePage(),
            ),
          );
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
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                        builder: (context) => const HistoryPage(),
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
                                            builder: (context) => const FavouritePage(),
                                          ),
                                        );
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
    );
  }
}
