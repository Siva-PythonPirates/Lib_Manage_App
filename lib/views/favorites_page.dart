import 'package:flutter/material.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:lib_management/views/book_details.dart';
import 'package:provider/provider.dart';

import '../services/app_constants.dart';

class MyFavoritesPage extends StatefulWidget {
  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteBooks = books
        .where(
            (book) => context.read<MyModel>().favorites.contains(book["title"]))
        .toList();

    context.read<MyModel>().loadFavorites();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      body: favoriteBooks.isEmpty
          ? Center(
              child: Text('No favorite books yet'),
            )
          : ListView.builder(
              itemCount: favoriteBooks.length,
              itemBuilder: (context, index) {
                final book = favoriteBooks[index];

                return Dismissible(
                  key: Key(book["title"] ?? "null"),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                  ),
                  onDismissed: (direction) {
                    context
                        .read<MyModel>()
                        .removeFromFavorites(book["title"] ?? "null");
                  },
                  child: ListTile(
                    leading: Image.network(
                      book['image'] ?? "",
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(book['title'] ?? ''),
                    subtitle: Text("Author"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetails(book: book),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
