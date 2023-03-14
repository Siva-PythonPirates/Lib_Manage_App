import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/book_details.dart';
import 'package:lib_management/views/widgets/book_filter_widget.dart';
import 'package:lib_management/views/widgets/search_books.dart';
import '../services/app_constants.dart';
import '../views/widgets/carousel.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int selectedSortOpt = 0;
  @override
  Widget build(BuildContext context) {
    Future<void> dummy() async {}

    AppServices imp = AppServiceImp();

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
                imp.getSize(context, 36),
                imp.getSize(context, 16),
                0,
              ),
              child: Row(
                children: [
                  Image(
                    image: const AssetImage('assets/images/book-stack.png'),
                    height: imp.getSize(context, 45),
                    width: imp.getSize(context, 45),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Books',
                        style: TextStyle(
                          fontSize: imp.getSize(context, 30),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: BookCustomDelegate());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                      ),
                      width: imp.getSize(context, 50),
                      height: imp.getSize(context, 50),
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
            Padding(
              padding: EdgeInsets.fromLTRB(
                imp.getSize(context, 20),
                0,
                imp.getSize(context, 20),
                imp.getSize(context, 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isDismissible: true,
                        context: context,

                        // elevation: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: imp.getSize(context, 420),
                            child: Padding(
                              padding: EdgeInsets.all(
                                imp.getSize(context, 20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksTitle();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 1;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Title A-Z',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 1) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksTitleDesc();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 2;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Title desending Z-A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 2) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksAuthor();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 3;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Author A-Z',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 3) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksAuthorDesc();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 4;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Author desending Z-A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 4) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksDept();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 5;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Dept A-Z',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 5) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortBooksDeptDesc();
                                        setState(() {
                                          books;
                                          selectedSortOpt = 6;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort by Dept desending Z-A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 6) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.resetBookSort();

                                        setState(() {
                                          books;
                                          selectedSortOpt = 0;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Restore Defaults',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: imp.getSize(context, 100),
                      height: imp.getSize(context, 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          Text(
                            '  Sort',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: imp.getSize(context, 40),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 20,
                        isDismissible: true,
                        context: context,

                        // elevation: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: imp.getSize(context, 350),
                            child: Padding(
                              padding: EdgeInsets.all(
                                imp.getSize(context, 20),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: double.infinity,
                                          width: imp.getSize(context, 150),
                                          child: const Center(
                                            child: Text(
                                              'Department',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          color: Colors.black,
                                        ),
                                        Expanded(
                                          child: Scrollbar(
                                            child: ListView.builder(
                                              itemCount: booksFilterOptions.length,
                                              itemBuilder: (context, index) {
                                                return BookFilterWidget(index: index);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: imp.getSize(context, 10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          imp.resetBooksFilter();
                                          setState(() {
                                            books;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 211, 211, 211)),
                                        ),
                                        child: const Text(
                                          'Restore Defaults',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          imp.applyBooksFilter();
                                          setState(() {
                                            books;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Apply Filters'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: imp.getSize(context, 100),
                      height: imp.getSize(context, 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.filter,
                            color: Colors.white,
                          ),
                          Text(
                            '  Filter',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                color: bgColor,
                onRefresh: () {
                  if (tempBooks.isNotEmpty) books = tempBooks;
                  bookFilterSelected = [];
                  filteredBooks = [];
                  setState(() {
                    books;
                  });
                  return dummy();
                },
                child: Scrollbar(
                  child: ListView.builder(
                    padding: EdgeInsets.all(imp.getSize(context, 8)),
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print(books.length);
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          imp.getSize(context, 10),
                          imp.getSize(context, 10),
                          imp.getSize(context, 10),
                          imp.getSize(context, 15),
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
                                imp.getSize(context, 10),
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
                              padding: EdgeInsets.all(imp.getSize(context, 10)),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: imp.getSize(context, 8)),
                                    height: imp.getSize(context, 100),
                                    width: imp.getSize(context, 80),
                                    color: Colors.white,
                                    child: Image(
                                      loadingBuilder: ((context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: bgColor,
                                            ),
                                          );
                                        }
                                      }),
                                      image: const NetworkImage('https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
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
                                  SizedBox(
                                    width: imp.getSize(context, 12),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(imp.getSize(context, 8)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: imp.getSize(context, 200),
                                          child: Center(
                                            child: Text(
                                              books[index]['title'] ?? "BOOK TITLE",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: imp.getSize(context, 8)),
                                          child: SizedBox(
                                            width: imp.getSize(context, 200),
                                            child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'AUTHOR: ${books[index]['Author'] ?? "XXX"}',
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  'DEPT: ${books[index]['Department'] ?? "XXX"}',
                                                  textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
