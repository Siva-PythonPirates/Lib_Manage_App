import 'package:flutter/material.dart';
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
    journal = tempjournal;
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
        filteredJournal = [...filteredJournal, ...tempjournal.where((element) => element['title']!.contains(query)).toList()];
      }
      journal = filteredJournal;
      print(journal);
    }
  }

  @override
  void resetJournalFilter() {
    journal = tempjournal;
    journalFilterSelected = [];
    filteredJournal = [];
  }

//         BOOK SORTING           //

  void createtempbooks() {
    for (var i in books) {
      tempBooks.add(i);
    }
  }

  @override
  void sortBooksTitle() {
    if (tempBooks.isEmpty) {
      createtempbooks();
    }
    books.sort(
      (a, b) {
        return a['title']!.compareTo(b['title']!);
      },
    );
  }

  @override
  void sortBooksTitleDesc() {
    sortBooksTitle();
    books = books.reversed.toList();
  }

  @override
  void sortBooksAuthor() {
    if (tempBooks.isEmpty) {
      createtempbooks();
    }
    books.sort(
      (a, b) {
        return a['Author']!.compareTo(b['Author']!);
      },
    );
  }

  @override
  void sortBooksAuthorDesc() {
    sortBooksAuthor();
    books = books.reversed.toList();
  }

  @override
  void sortBooksDept() {
    if (tempBooks.isEmpty) {
      createtempbooks();
    }
    books.sort(
      (a, b) {
        return a['Department']!.compareTo(b['Department']!);
      },
    );
  }

  @override
  void sortBooksDeptDesc() {
    sortBooksDept();
    books = books.reversed.toList();
  }

  @override
  void resetBookSort() {
    books = tempBooks;
  }

  //             BOOK FILTERING         //

  @override
  List<Map<String, String>> applyBooksFilter() {
    if (tempBooks.isEmpty) {
      createtempbooks();
    }
    filteredBooks = [];
    if (bookFilterSelected.isNotEmpty) {
      for (var category in booksFilterCategory) {
        // List<Map<String,String>> tempFilteredBooks=[];
        for (var query in bookFilterSelected[category]!) {
          print(query);
          filteredBooks = [...books.where((element) => element[category]!.contains(query)).toList()];
        }
      }
      books = filteredBooks;
      print(filteredBooks);
      print(books.length);
      return books;
    }
    return [];
  }

  @override
  void resetBooksFilter() {
    books = tempBooks;
    print(tempBooks);
    bookFilterSelected = {'Department': [], 'Author': []};
    filteredBooks = [];
  }
}
