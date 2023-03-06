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
List<String> journalLinks = [
  "https://ieeexplore.ieee.org/Xplore/home.jsp",
  "https://asmedigitalcollection.asme.org/journals",
  "https://ascelibrary.org/",
  "https://www.sciencedirect.com/",
  "https://jgateplus.com/home/",
  "https://jgateplus.com/home/",
  "https://search.ebscohost.com/"
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
