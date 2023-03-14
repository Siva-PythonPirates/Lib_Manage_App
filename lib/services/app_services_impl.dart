import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/models/location.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_constants.dart';

class AppServiceImp implements AppServices {
  @override
  launchURLto(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  double getSize(BuildContext context, double size) {
    double sizeFinal = (MediaQuery.of(context).size.width / (7.8 * 50)) * size;
    return sizeFinal;
  }

  @override
  void sortJournalAsc() {
    if (tempjournal.isEmpty) {
      createtempjournal();
    }
    journal.sort(
      (a, b) {
        return a['title']!.compareTo(b['title']!);
      },
    );
  }

  @override
  void sortJournalDesc() {
    sortJournalAsc();

    journal = journal.reversed.toList();
  }

  @override
  void resetJournalSort() {
    if (tempjournal.isNotEmpty) journal = tempjournal;
  }

  @override
  void createtempjournal() {
    for (var i in journal) {
      tempjournal.add(i);
    }
  }

  @override
  void applyJournalFilter() {
    if (tempjournal.isEmpty) {
      createtempjournal();
    }
    filteredJournal = [];
    if (journalFilterSelected.isNotEmpty) {
      for (var query in journalFilterSelected) {
        print(query);
        filteredJournal = [
          ...filteredJournal,
          ...tempjournal
              .where((element) => element['title']!.contains(query))
              .toList()
        ];
      }
      journal = filteredJournal;
      print(journal);
    }
  }

  @override
  void resetJournalFilter() {
    if (tempjournal.isNotEmpty) journal = tempjournal;
    journalFilterSelected = [];
    filteredJournal = [];
  }

//         BOOK SORTING           //

  void createtempbooks(BuiltList<Location> books) {
    /*for (var i in books) {
      tempBooks.(i);
    }*/
    tempBooks = books;
  }

  @override
  void sortBooksTitle(BuiltList<Location> books) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    books.toList().sort(
      (a, b) {
        return a.TITLE!.compareTo(b.TITLE!);
      },
    );
  }

  @override
  void sortBooksTitleDesc(BuiltList<Location> books) {
    sortBooksTitle(books);
    books = books.reversed.toBuiltList();
  }

  @override
  void sortBooksAuthor(BuiltList<Location> books) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    books.toList().sort(
      (a, b) {
        return a.AUTHORS!.compareTo(b.AUTHORS!);
      },
    );
  }

  @override
  void sortBooksAuthorDesc(BuiltList<Location> books) {
    sortBooksAuthor(books);
    books = books..reversed.toList();
  }

  @override
  void sortBooksDept(BuiltList<Location> books) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    books.toList().sort(
      (a, b) {
        return a.PUBLISHER!.compareTo(b.PUBLISHER!);
      },
    );
  }

  @override
  void sortBooksDeptDesc(BuiltList<Location> books) {
    sortBooksDept(books);
    books = books.reversed.toBuiltList();
  }

  @override
  void resetBookSort(BuiltList<Location> books) {
    if (tempBooks.isNotEmpty) books = tempBooks;
  }

  //             BOOK FILTERING         //

  @override
  BuiltList<Location> applyBooksFilter(BuiltList<Location> books) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    BuiltList<Location> filteredBooks = BuiltList();
    if (bookFilterSelected.isNotEmpty) {
      for (var category in booksFilterCategory) {
        // List<Map<String,String>> tempFilteredBooks=[];
        for (var query in bookFilterSelected[category]!) {
          print(query);
          filteredBooks = [
            ...books.where((element) {
              return element.TITLE!.contains(query) &&
                  (!filteredBooks.contains(element));
            }).toList()
          ].toBuiltList();
        }
      }
      books = filteredBooks;
      print(filteredBooks);
      print(books.length);
      return books;
    }
    return BuiltList();
  }

  @override
  void resetBooksFilter(BuiltList<Location> books) {
    if (tempBooks.isNotEmpty) {
      books = tempBooks;
      print(tempBooks);
      bookFilterSelected = {'Department': [], 'Author': []};
      filteredBooks = [];
    }
  }
}
