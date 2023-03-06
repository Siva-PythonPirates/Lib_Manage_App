import 'package:flutter/material.dart';
import 'package:lib_management/views/widgets/search_books.dart';

import '../services/app_services.dart';
import '../views/widgets/carousel.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: getSize(context, 50),
                          height: getSize(context, 50),
                          color: Colors.deepPurple.withOpacity(0.5),
                          child: const Center(
                            child: Text(
                              'logo',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Books',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: BookCustomDelegate(),
                            );
                          },
                          // borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            width: getSize(context, 50),
                            height: getSize(context, 50),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const CustomCarousel(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: InkWell(
                      // splashColor: Colors.black,
                      onTap: () {},
                      // splashColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 118, 23, 182),
                              blurRadius: 5,
                              spreadRadius: 7,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 7),
                                height: getSize(context, 100),
                                width: getSize(context, 80),
                                color: Colors.deepPurple[300],
                                child: const Image(
                                  image: NetworkImage(
                                      'https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: getSize(context, 200),
                                      child: Center(
                                        child: Text(
                                          books[index]['title'] ?? "BOOK TITLE",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: SizedBox(
                                        width: getSize(context, 200),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'AUTHOR: ${books[index]['author'] ?? "XXX"}',
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              'DEPT: ${books[index]['department'] ?? "XXX"}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
