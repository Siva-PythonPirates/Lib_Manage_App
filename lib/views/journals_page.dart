import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/widgets/search_button.dart';

import '../views/widgets/carousel.dart';

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
          // color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
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
                            showSearch(context: context, delegate: JournalCustomDelegate());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
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
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: journals.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 118, 23, 182),
                            blurRadius: 8,
                            spreadRadius: 9,
                            // offset: Offset(5, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await launchURLto(journalLinks[index]);
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              Image(
                                width: double.infinity,
                                height: getSize(context, 150),
                                image: const NetworkImage(
                                  'https://images.unsplash.com/photo-1550517355-375c103a6a81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
                                ),
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  journals[index],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    // decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
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
