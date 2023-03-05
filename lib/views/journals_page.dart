import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/widgets/search_button.dart';

class Journals extends StatefulWidget {
  const Journals({Key? key}) : super(key: key);

  @override
  State<Journals> createState() => _JournalsState();
}

class _JournalsState extends State<Journals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: 50,
                          height: 50,
                          color: Colors.deepPurple.withOpacity(0.5),
                          child: const Center(
                            child: Text(
                              'logo',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'E-Journals',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: JournalCustomDelegate());
                          },
                          child: Container(
                            color: Colors.deepPurple.withOpacity(0.5),
                            width: 50,
                            height: 50,
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    "Click on the link to access the concerned journal (for use in REC Campus only)",
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: journals.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: InkWell(
                        // splashColor: Colors.black,
                        onTap: () async {
                          await launchURLto(journalLinks[index]);
                        },
                        // splashColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            journals[index],
                            style: const TextStyle(
                              color: Colors.black,
                              // decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
