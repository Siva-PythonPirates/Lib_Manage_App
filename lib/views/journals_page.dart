import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/views/widgets/journal_filter_widget.dart';
import 'package:lib_management/views/widgets/search_button.dart';

import '../views/widgets/carousel.dart';

class Journals extends StatefulWidget {
  const Journals({Key? key}) : super(key: key);

  @override
  State<Journals> createState() => _JournalsState();
}

class _JournalsState extends State<Journals> {
  Future<void> dummy() async {}

  int selectedSortOpt = 0;

  // List<String> filterOptions = [];

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
              padding: EdgeInsets.fromLTRB(
                getSize(context, 16),
                getSize(context, 36),
                getSize(context, 16),
                0,
              ),
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
                  Expanded(
                    child: Center(
                      child: Text(
                        'E-Journals',
                        style: TextStyle(
                          fontSize: getSize(context, 30),
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
                        borderRadius: BorderRadius.circular(getSize(context, 15)),
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
            Padding(
              padding: EdgeInsets.fromLTRB(
                getSize(context, 20),
                0,
                getSize(context, 20),
                getSize(context, 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isDismissible: true,
                        context: context,

                        // elevation: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: getSize(context, 180),
                            child: Padding(
                              padding: EdgeInsets.all(
                                getSize(context, 20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        sortJournalAsc();

                                        setState(() {
                                          journal;
                                          // journalLinks;
                                          // Navigator.pop(context);
                                          selectedSortOpt = 1;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort Alphabetically A-Z',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 1) ? Colors.blue : Colors.black,
                                            // color:
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        sortJournalDesc();

                                        setState(() {
                                          journal;
                                          // journalLinks;
                                          selectedSortOpt = 2;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sort Alphabetically desending Z-A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (selectedSortOpt == 2) ? Colors.blue : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        resetJournalSort();

                                        setState(() {
                                          journal;
                                          selectedSortOpt = 0;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Center(
                                        child: Text(
                                          'Restore Defaults',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: getSize(context, 100),
                      height: getSize(context, 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          Text(
                            '  Sort',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getSize(context, 40),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 20,
                        isDismissible: true,
                        context: context,

                        // elevation: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: getSize(context, 350),
                            child: Padding(
                              padding: EdgeInsets.all(
                                getSize(context, 20),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: double.infinity,
                                          width: getSize(context, 150),
                                          child: const Center(
                                            child: Text(
                                              'Publisher',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const VerticalDivider(
                                          color: Colors.black,
                                        ),
                                        Expanded(
                                          child: Scrollbar(
                                            child: ListView.builder(
                                              itemCount: journalFilterOptions.length,
                                              itemBuilder: (context, index) {
                                                return JournalFilterWidget(index);

                                                // return padding
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getSize(context, 10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          resetJournalFilter();
                                          setState(() {
                                            journal;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 211, 211, 211)),
                                        ),
                                        child: const Text(
                                          'Restore Defaults',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          ApplyJournalFilter();
                                          setState(() {
                                            journal;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Apply Filters'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: getSize(context, 100),
                      height: getSize(context, 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.filter,
                            color: Colors.white,
                          ),
                          Text(
                            '  Filter',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  if (tempjournal.isNotEmpty) journal = tempjournal;
                  journalFilterSelected = [];
                  filteredJournal = [];
                  setState(() {
                    journal;
                  });
                  return dummy();
                },
                child: Scrollbar(
                  child: ListView.builder(
                    padding: EdgeInsets.all(getSize(context, 10)),
                    itemCount: journal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(getSize(context, 10), getSize(context, 10), getSize(context, 10), getSize(context, 20)),
                        child: InkWell(
                          onTap: () async {
                            await launchURLto(journal[index]['link']!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 118, 23, 182),
                                  blurRadius: 8,
                                  spreadRadius: 9,
                                  // offset: Offset(5, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(getSize(context, 15)),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: getSize(context, 140),
                                  child: Image(
                                    // width: double.infinity,
                                    // height: getSize(context, 140),
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      return child;
                                    },
                                    loadingBuilder: ((context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const Expanded(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                    }),
                                    image: const NetworkImage(
                                      'https://images.unsplash.com/photo-1550517355-375c103a6a81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(getSize(context, 12)),
                                  child: Text(
                                    journal[index]['title']!,
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
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
