import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:lib_management/models/location.dart';

//final readModel = context.read<MyModel>().state;

Color bgColor = const Color.fromRGBO(34, 4, 88, 1);
List<Location> historyBooks = [];
int? login;
bool loading = false;

List<Map<String, String>> favdate = [];

List<String> quotes = [
  '"Books are a uniquely portable magic." – Stephen King',
  '"Share your knowledge. It is a way to achieve immortality —Dalai Lama"',
  '“There is no friend as loyal as a book.” ― Ernest Hemingway',
  '"We are drowning in information but starved for knowledge." - John Naisbitt',
  '"The only good is knowledge, and the only evil is ignorance." - Herodotus'
];

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
  {
    'title': 'IEEE',
    'link': 'https://ieeexplore.ieee.org/Xplore/home.jsp',
    'image': 'https://wireless.engineering.nyu.edu/wp-content/uploads/2016/07/ieee-banner.jpg',
  },
  {
    'title': 'ASME - American society of Mechanical Engineers',
    'link': 'https://asmedigitalcollection.asme.org/journals',
    'image': 'https://event.asme.org/Events/media/library/images/POWER/Logo_Power-Division_100-Year-03.png',
  },
  {
    'title': 'J-GATE- Management Sciences',
    'link': 'https://jgateplus.com/home/',
    'image': 'https://www.jagranimages.com/images/newimg/18042020/18_04_2020-j_gate_20203111.jpg',
  },
  {
    'title': 'ASCE - American Society of Civil Engineers',
    'link': 'https://ascelibrary.org/',
    'image': 'https://www.uvu.edu/engineering/images/asce_logo.png',
  },
  {
    'title': 'Elsevier (Science Direct)- Biotechnology (Back File)',
    'link': 'https://www.sciencedirect.com/',
    'image': 'https://typeset.io/resources/content/images/2022/10/Elsevier.png',
  },
  {
    'title': 'J-GATE- Engineering & Technology',
    'link': 'https://jgateplus.com/home/',
    'image': 'https://www.jagranimages.com/images/newimg/18042020/18_04_2020-j_gate_20203111.jpg',
  },
  {
    'title': 'EBSCO–Business Source Elite',
    'link': 'https://search.ebscohost.com/',
    'image': 'https://storage.googleapis.com/seamk-production/2017/09/ebscohost_logo_cmyk.png',
  },
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

// List<Map<String, List<String>>> booksFilterCatOptions = [
//   {
//     'Department': [...booksFilterCategoryDeptOptions]
//   },
//   {
//     'Author': [...booksFilterCategoryAuthorOptions],
//   }
// ];

Map<String, List<String>> booksFilterCatOptions = {
  'Department': [...booksFilterCategoryDeptOptions],
  'Author': [...booksFilterCategoryAuthorOptions],
};

/*
List<Map<String, String>> books = [
  {
    'title': 'The Structure of Scientific Revolutions',
    'Author': 'Thomas S. Kuhn',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276743/pexels-photo-276743.jpeg'
  },
  {
    'title': 'The Wealth of Nations',
    'Author': 'Adam Smith',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276792/pexels-photo-276792.jpeg'
  },
  {
    'title': 'A Brief History of Time',
    'Author': 'Stephen Hawking',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276943/pexels-photo-276943.jpeg'
  },
  {
    'title': 'The Origin of Species',
    'Author': 'Charles Darwin',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276944/pexels-photo-276944.jpeg'
  },
  {
    'title': 'The Elements of Style',
    'Author': 'William Strunk Jr. and E.B. White',
    'Department': 'Language and Writing',
    'image': 'https://images.pexels.com/photos/276757/pexels-photo-276757.jpeg'
  },
  {
    'title': 'Principles of Economics',
    'Author': 'N. Gregory Mankiw',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276761/pexels-photo-276761.jpeg'
  },
  {
    'title': 'The Selfish Gene',
    'Author': 'Richard Dawkins',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276942/pexels-photo-276942.jpeg'
  },
  {
    'title': 'The Republic',
    'Author': 'Plato',
    'Department': 'Philosophy',
    'image': 'https://images.pexels.com/photos/276947/pexels-photo-276947.jpeg'
  },
  {
    'title': 'The Interpretation of Dreams',
    'Author': 'Sigmund Freud',
    'Department': 'Psychology',
    'image': 'https://images.pexels.com/photos/276799/pexels-photo-276799.jpeg'
  },
  {
    'title': 'The Social Contract',
    'Author': 'Jean-Jacques Rousseau',
    'Department': 'Political Science',
    'image': 'https://images.pexels.com/photos/276741/pexels-photo-276741.jpeg'
  },
];
*/

Map<String, List<String>> bookFilterSelected = {
  'Department': [],
  'Author': [],
};

BuiltList<Location> tempBooks = BuiltList();

List<Map<String, String>> filteredBooks = [];

//            BOOKS FOR TOP PICKS

List<Map<String, String>> topPicksBooks = [
  {
    'title': 'The Structure of Scientific Revolutions',
    'Author': 'Thomas S. Kuhn',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276743/pexels-photo-276743.jpeg'
  },
  {
    'title': 'The Wealth of Nations',
    'Author': 'Adam Smith',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276792/pexels-photo-276792.jpeg'
  },
  {
    'title': 'A Brief History of Time',
    'Author': 'Stephen Hawking',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276943/pexels-photo-276943.jpeg'
  },
  {
    'title': 'The Origin of Species',
    'Author': 'Charles Darwin',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276944/pexels-photo-276944.jpeg'
  },
  {
    'title': 'The Elements of Style',
    'Author': 'William Strunk Jr. and E.B. White',
    'Department': 'Language and Writing',
    'image': 'https://images.pexels.com/photos/276757/pexels-photo-276757.jpeg'
  },
  {
    'title': 'Principles of Economics',
    'Author': 'N. Gregory Mankiw',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276761/pexels-photo-276761.jpeg'
  },
  {
    'title': 'The Selfish Gene',
    'Author': 'Richard Dawkins',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276942/pexels-photo-276942.jpeg'
  },
  {
    'title': 'The Republic',
    'Author': 'Plato',
    'Department': 'Philosophy',
    'image': 'https://images.pexels.com/photos/276947/pexels-photo-276947.jpeg'
  },
  {
    'title': 'The Interpretation of Dreams',
    'Author': 'Sigmund Freud',
    'Department': 'Psychology',
    'image': 'https://images.pexels.com/photos/276799/pexels-photo-276799.jpeg'
  },
  {
    'title': 'The Social Contract',
    'Author': 'Jean-Jacques Rousseau',
    'Department': 'Political Science',
    'image': 'https://images.pexels.com/photos/276741/pexels-photo-276741.jpeg'
  },
];

//              MY FAVOURITES BOOKS

List<Map<String, String>> favouriteBooks = [
  {
    'title': 'The Structure of Scientific Revolutions',
    'Author': 'Thomas S. Kuhn',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276743/pexels-photo-276743.jpeg'
  },
  {
    'title': 'The Wealth of Nations',
    'Author': 'Adam Smith',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276792/pexels-photo-276792.jpeg'
  },
  {
    'title': 'A Brief History of Time',
    'Author': 'Stephen Hawking',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276943/pexels-photo-276943.jpeg'
  },
  {
    'title': 'The Origin of Species',
    'Author': 'Charles Darwin',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276944/pexels-photo-276944.jpeg'
  },
  {
    'title': 'The Elements of Style',
    'Author': 'William Strunk Jr. and E.B. White',
    'Department': 'Language and Writing',
    'image': 'https://images.pexels.com/photos/276757/pexels-photo-276757.jpeg'
  },
  {
    'title': 'Principles of Economics',
    'Author': 'N. Gregory Mankiw',
    'Department': 'Economics',
    'image': 'https://images.pexels.com/photos/276761/pexels-photo-276761.jpeg'
  },
  {
    'title': 'The Selfish Gene',
    'Author': 'Richard Dawkins',
    'Department': 'Science',
    'image': 'https://images.pexels.com/photos/276942/pexels-photo-276942.jpeg'
  },
  {
    'title': 'The Republic',
    'Author': 'Plato',
    'Department': 'Philosophy',
    'image': 'https://images.pexels.com/photos/276947/pexels-photo-276947.jpeg'
  },
  {
    'title': 'The Interpretation of Dreams',
    'Author': 'Sigmund Freud',
    'Department': 'Psychology',
    'image': 'https://images.pexels.com/photos/276799/pexels-photo-276799.jpeg'
  },
  {
    'title': 'The Social Contract',
    'Author': 'Jean-Jacques Rousseau',
    'Department': 'Political Science',
    'image': 'https://images.pexels.com/photos/276741/pexels-photo-276741.jpeg'
  },
];
