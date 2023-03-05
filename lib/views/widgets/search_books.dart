import 'package:flutter/material.dart';

import '../../services/app_services.dart';

class BookCustomDelegate extends SearchDelegate {
  BookCustomDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = books.where((book) =>
        book['title']!.toLowerCase().contains(query.toLowerCase()) ||
        book['author']!.toLowerCase().contains(query.toLowerCase()) ||
        book['department']!.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final book = results.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                ),
              ],
            ),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 100,
                        width: 80,
                        color: Colors.deepPurple[300],
                        child: const Image(
                          image: NetworkImage(
                              "https://edit.org/images/cat/book-covers-big-2019101610.jpg" ??
                                  ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Center(
                                child: Text(
                                  book['title'] ?? "TITLE",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Author: ${book['author']}  ',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Dept: ${book['department']}',
                                  ),
                                ],
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
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}

class Book {
  final String title;
  final String author;
  final String department;

  Book(this.title, this.author, this.department);
}
