import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/widgets/journal_filter_widget.dart';
import 'package:lib_management/views/widgets/search_button.dart';

import '../services/app_constants.dart';
import '../views/widgets/carousel.dart';

class Journals extends StatefulWidget {
  const Journals({Key? key}) : super(key: key);

  @override
  State<Journals> createState() => _JournalsState();
}

class _JournalsState extends State<Journals> {
  Future<void> dummy() async {}

  int selectedSortOpt = 0;
  AppServices imp = AppServiceImp();

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
                imp.getSize(context, 16),
                imp.getSize(context, 36),
                imp.getSize(context, 16),
                0,
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: imp.getSize(context, 50),
                    height: imp.getSize(context, 50),
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
                          fontSize: imp.getSize(context, 30),
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
                        borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                      ),
                      width: imp.getSize(context, 50),
                      height: imp.getSize(context, 50),
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
                imp.getSize(context, 20),
                0,
                imp.getSize(context, 20),
                imp.getSize(context, 20),
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
                              imp.getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: imp.getSize(context, 180),
                            child: Padding(
                              padding: EdgeInsets.all(
                                imp.getSize(context, 20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        imp.sortJournalAsc();

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
                                        imp.sortJournalDesc();

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
                                        imp.resetJournalSort();

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
                      width: imp.getSize(context, 100),
                      height: imp.getSize(context, 35),
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
                    width: imp.getSize(context, 40),
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
                              imp.getSize(context, 30),
                            ),
                            topRight: Radius.circular(
                              imp.getSize(context, 30),
                            ),
                          ),
                        ),
                        builder: (context) {
                          return SizedBox(
                            height: imp.getSize(context, 350),
                            child: Padding(
                              padding: EdgeInsets.all(
                                imp.getSize(context, 20),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: double.infinity,
                                          width: imp.getSize(context, 150),
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
                                    height: imp.getSize(context, 10),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          imp.resetJournalFilter();
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
                                          imp.applyJournalFilter();
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
                      width: imp.getSize(context, 100),
                      height: imp.getSize(context, 35),
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
                    padding: EdgeInsets.all(imp.getSize(context, 10)),
                    itemCount: journal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            imp.getSize(context, 10), imp.getSize(context, 10), imp.getSize(context, 10), imp.getSize(context, 20)),
                        child: InkWell(
                          onTap: () async {
                            await imp.launchURLto(journal[index]['link']!);
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
                              borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              children: [
                                // CachedNetworkImage(
                                //   imageUrl: 'https://event.asme.org/Events/media/library/images/POWER/Logo_Power-Division_100-Year-03.png',
                                //   imageBuilder: (context, imageProvider) => Container(
                                //     width: double.infinity,
                                //     height: imp.getSize(context, 140),
                                //     decoration: BoxDecoration(
                                //       image: DecorationImage(
                                //         image: imageProvider,
                                //         fit: BoxFit.cover,
                                //       ),
                                //     ),
                                //   ),
                                //   placeholder: (context, url) {
                                //     return Expanded(
                                //       child: Center(
                                //         child: CircularProgressIndicator(
                                //           color: bgColor,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                                // ),

                                SizedBox(
                                  width: double.infinity,
                                  height: imp.getSize(context, 140),
                                  child: Image(
                                    // width: double.infinity,
                                    // height: imp.getSize(context, size)(context, 140),
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      return child;
                                    },
                                    loadingBuilder: ((context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Expanded(
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: bgColor,
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                                    image: NetworkImage(
                                      journal[index]['image']!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(imp.getSize(context, 12)),
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
