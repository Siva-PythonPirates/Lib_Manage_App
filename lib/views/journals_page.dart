import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';

class Journals extends StatefulWidget {
  const Journals({Key? key}) : super(key: key);

  @override
  State<Journals> createState() => _JournalsState();
}

class _JournalsState extends State<Journals> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("E-Journals"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Click on the link to access the concerned journal (for use in REC Campus only)",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: journals.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        await launchURLto(journalLinks[index]);
                      },
                      child: Text(
                        journals[index],
                        style: const TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
