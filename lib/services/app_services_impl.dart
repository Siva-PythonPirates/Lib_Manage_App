import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_constants.dart';

class AppServiceImp implements AppServices {
  launchURLto(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  double getSize(BuildContext context, double size) {
    double sizeFinal = (MediaQuery.of(context).size.width / (7.8 * 50)) * size;
    return sizeFinal;
  }

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

  void sortJournalDesc() {
    sortJournalAsc();

    journal = journal.reversed.toList();
  }

  void resetJournalSort() {
    journal = tempjournal;
  }

  void createtempjournal() {
    for (var i in journal) {
      tempjournal.add(i);
    }
  }

  void ApplyJournalFilter() {
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

  void resetJournalFilter() {
    journal = tempjournal;
    journalFilterSelected = [];
    filteredJournal = [];
  }

//         BOOK SORTING AND FILTERING            //

  void sortBooksTitle() {
    books.sort(
      (a, b) {
        return a['title']!.compareTo(b['title']!);
      },
    );
  }

  void sortBooksTitleDesc() {
    sortBooksTitle();
    books = books.reversed.toList();
  }

  void sortBooksAuthor() {
    books.sort(
      (a, b) {
        return a['author']!.compareTo(b['author']!);
      },
    );
  }

  void sortBooksAuthorDesc() {
    sortBooksAuthor();
    books = books.reversed.toList();
  }

  void sortBooksDept() {
    books.sort(
      (a, b) {
        return a['department']!.compareTo(b['department']!);
      },
    );
  }

  void sortBooksDeptDesc() {
    sortBooksDept();
    books = books.reversed.toList();
  }
}
