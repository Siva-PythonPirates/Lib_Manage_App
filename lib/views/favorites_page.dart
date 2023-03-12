import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
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
    AppServices imp = AppServiceImp();
    final List<Map<String, String>> favoriteBooks = books
        .where(
            (book) => context.read<MyModel>().favorites.contains(book["title"]))
        .toList();
    print(favoriteBooks);

    context.read<MyModel>().loadFavorites();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Expanded(
              child: Scrollbar(
                child: Padding(
                  padding: EdgeInsets.only(top: imp.getSize(context, 200)),
                  child: favoriteBooks.isEmpty
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
                                context.read<MyModel>().removeFromFavorites(
                                    book["title"] ?? "null");
                              },
                              child: Container(
                                color: Colors.white,
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
                                        builder: (context) =>
                                            BookDetails(book: book),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.width - 100,
              left: -MediaQuery.of(context).size.width / 4,
              child: Container(
                height: MediaQuery.of(context).size.width * 2,
                width: MediaQuery.of(context).size.width * 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: imp.getSize(context, imp.getSize(context, 60)),
              left: imp.getSize(context, imp.getSize(context, 20)),
              child: SizedBox(
                width: imp.getSize(context, 350),
                height: imp.getSize(context, 152),
                child: Flexible(
                  child: Text(
                    'Favorites',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: imp.getSize(context, 34),
                        color: bgColor,
                        fontWeight: FontWeight.bold),
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
