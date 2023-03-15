import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/models/location.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:provider/provider.dart';

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

  AppServices imp = AppServiceImp();

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
    BuiltList<Location> books = context.read<MyModel>().state.locations!;
    final results = books.where((book) =>
        book.TITLE!.toLowerCase().contains(query.toLowerCase()) ||
        book.AUTHORS!.toLowerCase().contains(query.toLowerCase()) ||
        book.PUBLISHER!.toLowerCase().contains(query.toLowerCase()));
    return ListView.builder(
      padding: EdgeInsets.all(imp.getSize(context, 8)),
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final book = results.elementAt(index);
        return Padding(
          padding: EdgeInsets.all(imp.getSize(context, 8)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(imp.getSize(context, 10)),
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
                  padding: EdgeInsets.all(imp.getSize(context, 10)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: imp.getSize(context, 8)),
                        height: imp.getSize(context, 100),
                        width: imp.getSize(context, 80),
                        color: Colors.deepPurple[300],
                        child: const Image(
                          image: NetworkImage(
                              "https://edit.org/images/cat/book-covers-big-2019101610.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: imp.getSize(context, 12),
                      ),
                      Padding(
                        padding: EdgeInsets.all(imp.getSize(context, 10)),
                        child: Column(
                          children: [
                            SizedBox(
                              width: imp.getSize(context, 200),
                              child: Center(
                                child: Text(
                                  book.TITLE ?? "TITLE",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: imp.getSize(context, 200),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Author: ${book.AUTHORS}  ',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Publisher: ${book.PUBLISHER}',
                                    textAlign: TextAlign.center,
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
