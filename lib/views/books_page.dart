import 'package:flutter/material.dart';
import 'package:lib_management/views/book_details.dart';
import 'package:lib_management/views/widgets/book_filter_cat_opt.dart';
import 'package:lib_management/views/widgets/search_books.dart';
import '../services/app_services.dart';
import '../views/widgets/carousel.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  Future<void> dummy() async {}
  int selectedcat = 0;
  int selectedSortOpt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                getSize(context, 16),
                getSize(context, 36),
                getSize(context, 16),
                0,
              ),
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
                  Expanded(
                    child: Center(
                      child: Text(
                        'Books',
                        style: TextStyle(
                          fontSize: getSize(context, 30),
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
                        borderRadius: BorderRadius.circular(
                          getSize(context, 15),
                        ),
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
            Padding(
              padding: EdgeInsets.fromLTRB(
                getSize(context, 20),
                0,
                getSize(context, 20),
                getSize(context, 20),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,

                      // elevation: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getSize(context, 30),
                          ),
                          topRight: Radius.circular(
                            getSize(context, 30),
                          ),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: getSize(context, 420),
                          child: Padding(
                            padding: EdgeInsets.all(
                              getSize(context, 20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      sortBooksTitle();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 1;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Title A-Z',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 1) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);
                                      sortBooksTitleDesc();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 2;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Title desending Z-A',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 2) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);
                                      sortBooksAuthor();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 3;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Author A-Z',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 3) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);
                                      sortBooksAuthorDesc();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 4;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Author desending Z-A',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 4) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);
                                      sortBooksDept();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 5;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Dept A-Z',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 5) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);
                                      sortBooksDeptDesc();
                                      setState(() {
                                        books;
                                        selectedSortOpt = 6;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sort by Dept desending Z-A',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (selectedSortOpt == 6) ? Colors.deepOrange : Colors.black,
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
                                      Navigator.pop(context);

                                      setState(() {
                                        books;
                                        selectedSortOpt = 0;
                                      });
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
                    width: getSize(context, 100),
                    height: getSize(context, 35),
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
                  width: getSize(context, 40),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 20,
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getSize(context, 30),
                          ),
                          topRight: Radius.circular(
                            getSize(context, 30),
                          ),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return SizedBox(
                              height: getSize(context, 350),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  getSize(context, 20),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: double.infinity,
                                            width: getSize(context, 150),
                                            child: ListView.builder(
                                              itemCount: booksFilterCategory.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    selectedcat = index;
                                                    setState(() {
                                                      selectedcat;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Container(
                                                      height: 60,
                                                      decoration: (selectedcat == index)
                                                          ? BoxDecoration(
                                                              borderRadius: BorderRadius.circular(getSize(context, 25)),
                                                              color: const Color.fromARGB(255, 235, 232, 232))
                                                          : null,
                                                      child: Center(
                                                        child: Padding(
                                                          padding: EdgeInsets.all(getSize(context, 5)),
                                                          child: Expanded(
                                                            child: Text(
                                                              booksFilterCategory[index],
                                                              style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const VerticalDivider(
                                            color: Colors.black,
                                          ),
                                          BookFilterShowCatOpt(bookFilterCatOptionIndex: selectedcat),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: getSize(context, 10),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            resetJournalFilter();
                                            setState(() {
                                              journal;
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
                                            ApplyJournalFilter();
                                            setState(() {
                                              journal;
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
                    );
                  },
                  child: Container(
                    width: getSize(context, 100),
                    height: getSize(context, 35),
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
              ]),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => dummy(),
                child: Scrollbar(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
