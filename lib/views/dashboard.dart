import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/books_page.dart';
import 'package:lib_management/views/profile_page.dart';
import 'package:lib_management/views/widgets/carousel.dart';
import 'package:lib_management/views/journals_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AppServices imp = AppServiceImp();

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
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  child: Ink(
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
                                    child: Center(
                                      child: Text(
                                        'Journals',
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
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: imp.getSize(context, 25),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: imp.getSize(context, 10),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   scrollDirection: Axis.horizontal,
                                      //   itemCount: 4,
                                      //   itemBuilder: (context, index) {
                                      //     return Padding(
                                      //       padding: EdgeInsets.all(imp.getSize(context, 10)),
                                      //       child: Container(
                                      //         width: imp.getSize(context, 130),
                                      //         height: imp.getSize(context, 200),
                                      //         color: Colors.white,
                                      //       ),
                                      //     );
                                      //   },
                                      // ),
                                    ],
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
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: imp.getSize(context, 25),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: imp.getSize(context, 10),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(imp.getSize(context, 10)),
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
                                              const Expanded(
                                                child: Center(
                                                  child: SingleChildScrollView(
                                                    physics: BouncingScrollPhysics(),
                                                    child: Text(
                                                      'Chronicles and doraemon and shinchan ',
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      // ListView.builder(
                                      //   shrinkWrap: true,
                                      //   scrollDirection: Axis.horizontal,
                                      //   itemCount: 4,
                                      //   itemBuilder: (context, index) {
                                      //     return Padding(
                                      //       padding: EdgeInsets.all(imp.getSize(context, 10)),
                                      //       child: Container(
                                      //         width: imp.getSize(context, 130),
                                      //         height: imp.getSize(context, 200),
                                      //         color: Colors.white,
                                      //       ),
                                      //     );
                                      //   },
                                      // ),
                                    ],
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
