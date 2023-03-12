import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/view_model/app_provider.dart';
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
                  padding: EdgeInsets.only(top: imp.getSize(context, 180)),
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: imp.getSize(context, 16),
                                    vertical: imp.getSize(context, 10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      imp.getSize(context, 10),
                                    ),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 118, 23, 182),
                                        blurRadius: 5,
                                        spreadRadius: 7,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        imp.getSize(context, 10)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: imp.getSize(context, 8)),
                                          height: imp.getSize(context, 100),
                                          width: imp.getSize(context, 80),
                                          color: Colors.white,
                                          child: Image(
                                            loadingBuilder: ((context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              } else {
                                                return Expanded(
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: bgColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                            }),
                                            image: const NetworkImage(
                                                'https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        // CachedNetworkImage(
                                        //   imageUrl: books[index]['image']!,
                                        //   imageBuilder: (context, imageProvider) => Container(
                                        //     width: double.infinity,
                                        //     height: imp.getSize(context, 140),
                                        //     decoration: BoxDecoration(
                                        //       image: DecorationImage(
                                        //         image: imageProvider,
                                        //         fit: BoxFit.cover,
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   placeholder: (context, url) {
                                        //     return SizedBox(
                                        //       height: imp.getSize(context, 100),
                                        //       width: imp.getSize(context, 80),
                                        //       child: Center(
                                        //         child: CircularProgressIndicator(
                                        //           color: bgColor,
                                        //         ),
                                        //       ),
                                        //     );
                                        //   },
                                        //   errorWidget: (context, url, error) => const Icon(Icons.error),
                                        // ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              imp.getSize(context, 8)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width:
                                                    imp.getSize(context, 200),
                                                child: Center(
                                                  child: Text(
                                                    book['title'] ??
                                                        "BOOK TITLE",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: imp.getSize(
                                                        context, 8)),
                                                child: SizedBox(
                                                  width:
                                                      imp.getSize(context, 200),
                                                  child: Column(
                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'AUTHOR: ${book['Author'] ?? "XXX"}',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(
                                                        'DEPT: ${book['Department'] ?? "XXX"}',
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
