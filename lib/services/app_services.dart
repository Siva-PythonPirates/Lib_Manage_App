import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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

Color bgColor = const Color.fromRGBO(34, 4, 88, 1);
List<String> journals = [
  "IEEE",
  "ASME - American society of Mechanical Engineers",
  "ASCE - American Society of Civil Engineers",
  "Elsevier (Science Direct)- Biotechnology (Back File)",
  "J-GATE- Engineering & Technology",
  "J-GATE- Management Sciences",
  "EBSCO–Business Source Elite"
];

List<Map<String, String>> journal = [
  {'title': 'IEEE', 'link': 'https://ieeexplore.ieee.org/Xplore/home.jsp'},
  {'title': 'ASME - American society of Mechanical Engineers', 'link': 'https://asmedigitalcollection.asme.org/journals'},
  {'title': 'ASCE - American Society of Civil Engineers', 'link': 'https://ascelibrary.org/'},
  {'title': 'Elsevier (Science Direct)- Biotechnology (Back File)', 'link': 'https://www.sciencedirect.com/'},
  {'title': 'J-GATE- Engineering & Technology', 'link': 'https://jgateplus.com/home/'},
  {'title': 'J-GATE- Management Sciences', 'link': 'https://jgateplus.com/home/'},
  {'title': 'EBSCO–Business Source Elite', 'link': 'https://search.ebscohost.com/'},
];

List<String> journalLinks = [
  "https://ieeexplore.ieee.org/Xplore/home.jsp",
  "https://asmedigitalcollection.asme.org/journals",
  "https://ascelibrary.org/",
  "https://www.sciencedirect.com/",
  "https://jgateplus.com/home/",
  "https://jgateplus.com/home/",
  "https://search.ebscohost.com/"
];

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

List<String> journalFilterOptions = [
  'IEEE',
  'ASME',
  'ASCE',
  'Elsevier',
  'J-GATE',
  'EBSCO',
];

List<String> journalFilterSelected = [];

List<Map<String, String>> tempjournal = [];

List<Map<String, String>> filteredJournal = [];

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

      filteredJournal = [...filteredJournal, ...tempjournal.where((element) => element['title']!.contains(query)).toList()];
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

//         BOOK SORING AND FILTERING            //

List<String> booksFilterCategory = [
  'Department',
  'Author',
];

List<String> booksFilterCategoryDeptOptions = [
  'Science',
  'Economics',
  'Language and writing',
  'philosophy',
  'psycholology',
  'Political Science',
];

List<String> booksFilterCategoryAuthorOptions = [
  'Plato',
  'Thomas',
  'Adam Smith',
  'Stephen Hawking',
  'Charles Darvin',
  'William Strunk',
  'E.B.White',
  'Gregory',
  'Richard',
  'Sigmund Freud',
  'Jean',
];

List<List<String>> booksFilterCatOptions = [
  [...booksFilterCategoryDeptOptions],
  [...booksFilterCategoryAuthorOptions],
];

List<Map<String, String>> books = [
  {
    'title': 'The Structure of Scientific Revolutions',
    'author': 'Thomas S. Kuhn',
    'department': 'Science',
    'image': 'https://images.pexels.com/photos/276743/pexels-photo-276743.jpeg'
  },
  {
    'title': 'The Wealth of Nations',
    'author': 'Adam Smith',
    'department': 'Economics',
    'image': 'https://images.pexels.com/photos/276792/pexels-photo-276792.jpeg'
  },
  {
    'title': 'A Brief History of Time',
    'author': 'Stephen Hawking',
    'department': 'Science',
    'image': 'https://images.pexels.com/photos/276943/pexels-photo-276943.jpeg'
  },
  {
    'title': 'The Origin of Species',
    'author': 'Charles Darwin',
    'department': 'Science',
    'image': 'https://images.pexels.com/photos/276944/pexels-photo-276944.jpeg'
  },
  {
    'title': 'The Elements of Style',
    'author': 'William Strunk Jr. and E.B. White',
    'department': 'Language and Writing',
    'image': 'https://images.pexels.com/photos/276757/pexels-photo-276757.jpeg'
  },
  {
    'title': 'Principles of Economics',
    'author': 'N. Gregory Mankiw',
    'department': 'Economics',
    'image': 'https://images.pexels.com/photos/276761/pexels-photo-276761.jpeg'
  },
  {
    'title': 'The Selfish Gene',
    'author': 'Richard Dawkins',
    'department': 'Science',
    'image': 'https://images.pexels.com/photos/276942/pexels-photo-276942.jpeg'
  },
  {
    'title': 'The Republic',
    'author': 'Plato',
    'department': 'Philosophy',
    'image': 'https://images.pexels.com/photos/276947/pexels-photo-276947.jpeg'
  },
  {
    'title': 'The Interpretation of Dreams',
    'author': 'Sigmund Freud',
    'department': 'Psychology',
    'image': 'https://images.pexels.com/photos/276799/pexels-photo-276799.jpeg'
  },
  {
    'title': 'The Social Contract',
    'author': 'Jean-Jacques Rousseau',
    'department': 'Political Science',
    'image': 'https://images.pexels.com/photos/276741/pexels-photo-276741.jpeg'
  },
];

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
