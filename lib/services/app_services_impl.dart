import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/models/location.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:provider/provider.dart';
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
        filteredJournal = [...filteredJournal, ...tempjournal.where((element) => element['title']!.contains(query)).toList()];
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
  void sortBooksTitle(BuiltList<Location> books,BuildContext context) {
    // print(books);
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;
    // books1.toList().sort(
    //   (a, b) {
    //     print(a.TITLE!.toLowerCase().compareTo(b.TITLE!.toLowerCase()));
    //     return a.TITLE!.compareTo(b.TITLE!);
    //   },
    // // );
    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.TITLE!);});
  //  BuiltList<Location> locations = BuiltList<Location>([
  //   Location((b) => b..TITLE = "C Programming Language"),
  //   Location((b) => b..TITLE = "Design Patterns"),
  //   Location((b) => b..TITLE = "Clean Code"),
  // ]);

  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((a, b) => a.compareToTitle(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
  print(sortedLocations[12559]);
    // books.rebuild((p0) => p0
    // ..sort(
    //    (a, b) {
    //      print(a.TITLE!.compareTo(b.TITLE!));
    //      return a.TITLE!.compareTo(b.TITLE!);
    //   },
    // )
    // );
    // print(sortedList);
  }

  @override
  void sortBooksTitleDesc(BuiltList<Location> books,BuildContext context) {
     if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;

    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.TITLE!);});


  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((b, a) => a.compareToTitle(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
   
  }

  @override
  void sortBooksAuthor(BuiltList<Location> books,BuildContext context) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;

    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.AUTHORS??"`");});


  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((a, b) => a.compareToAuthor(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
  }

  @override
  void sortBooksAuthorDesc(BuiltList<Location> books,BuildContext context) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;

    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.AUTHORS??"`");});


  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((b, a) => a.compareToAuthor(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
  }

  @override
  void sortBooksDept(BuiltList<Location> books,BuildContext context) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;

    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.PUBLISHER!);});


  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((a, b) => a.compareToDepartment(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
  }

  @override
  void sortBooksDeptDesc(BuiltList<Location> books,BuildContext context) {
    if (tempBooks.isEmpty) {
      createtempbooks(books);
    }
    var books1 = books;

    // List<String> title =[];
    // books1.forEach((p0) {title.add(p0.PUBLISHER!);});


  BuiltList<Location> sortedLocations =
      books1.rebuild((b) => b..sort((b, a) => a.compareToAuthor(b)));
      context.read<MyModel>().updateLocations(sortedLocations);
  }

  @override
  void resetBookSort(BuiltList<Location> books,BuildContext context) {
    context.read<MyModel>().updateLocations(context.read<MyModel>().state.locations!);
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
              return element.TITLE!.contains(query) && (!filteredBooks.contains(element));
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
