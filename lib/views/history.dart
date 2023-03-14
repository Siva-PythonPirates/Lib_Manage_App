import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/models/location.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:provider/provider.dart';

import '../services/app_services.dart';
import '../view_model/app_provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  AppServices imp = AppServiceImp();
  bool bookstatus = true;

  @override
  Widget build(BuildContext context) {
    BuiltList<Location> books = context.read<MyModel>().state.locations!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Scrollbar(
              child: Padding(
                padding: EdgeInsets.only(top: imp.getSize(context, 210)),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(imp.getSize(context, 8)),
                  itemCount: books.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                        imp.getSize(context, 10),
                        imp.getSize(context, 10),
                        imp.getSize(context, 10),
                        imp.getSize(context, 15),
                      ),
                      child: InkWell(
                        // splashColor: Colors.black,
                        onTap: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetails(
                                book: books[index],
                              ),
                            ),
                          );*/
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              imp.getSize(context, 10),
                            ),
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 118, 23, 182),
                                blurRadius: 5,
                                spreadRadius: 7,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(imp.getSize(context, 10)),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: imp.getSize(context, 8)),
                                  height: imp.getSize(context, 130),
                                  width: imp.getSize(context, 90),
                                  color: Colors.white,
                                  child: Image(
                                    loadingBuilder:
                                        ((context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                                    image: const NetworkImage(
                                        'https://edit.org/images/cat/book-covers-big-2019101610.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: imp.getSize(context, 10),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(imp.getSize(context, 8)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: imp.getSize(context, 200),
                                        child: Center(
                                          child: Text(
                                            books[index].TITLE ?? "BOOK TITLE",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: imp.getSize(context, 8)),
                                        child: SizedBox(
                                          width: imp.getSize(context, 200),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Borrow Date: 05/08/2023',
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Due Date: 05/08/2023',
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 8),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    style: BorderStyle.none,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      imp.getSize(context, 18),
                                                    ),
                                                  ),
                                                  color: Colors.green
                                                      .withOpacity(0.7),
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    'Status: Not yet Borrowed',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.width - 100,
              left: -MediaQuery.of(context).size.width / 4,
              child: Container(
                height: MediaQuery.of(context).size.width * 2,
                width: MediaQuery.of(context).size.width * 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: imp.getSize(context, imp.getSize(context, 60)),
              left: imp.getSize(context, imp.getSize(context, 20)),
              child: SizedBox(
                width: imp.getSize(context, 350),
                height: imp.getSize(context, 152),
                child: Text(
                  'History',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: imp.getSize(context, 34),
                      color: bgColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
