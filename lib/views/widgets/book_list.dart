import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/book_details.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.all(getSize(context, 8)),
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              getSize(context, 10),
              getSize(context, 10),
              getSize(context, 10),
              getSize(context, 15),
            ),
            child: InkWell(
              // splashColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetails(
                      book: books[index],
                    ),
                  ),
                );
              },
              // splashColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getSize(context, 10),
                  ),
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
                  padding: EdgeInsets.all(getSize(context, 10)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: getSize(context, 8)),
                        height: getSize(context, 100),
                        width: getSize(context, 80),
                        color: Colors.white,
                        child: Image(
                          loadingBuilder: ((context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          }),
                          image: const NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(getSize(context, 8)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: getSize(context, 200),
                              child: Center(
                                child: Text(
                                  books[index]['title'] ?? "BOOK TITLE",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: getSize(context, 8)),
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
    );
  }
}
