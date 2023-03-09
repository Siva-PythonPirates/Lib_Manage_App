import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

import '../../services/app_constants.dart';

class JournalList extends StatelessWidget {
  const JournalList({super.key});

  @override
  Widget build(BuildContext context) {
    AppServices imp = AppServiceImp();
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.all(imp.getSize(context, 10)),
        itemCount: journal.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                imp.getSize(context, 10),
                imp.getSize(context, 10),
                imp.getSize(context, 10),
                imp.getSize(context, 20)),
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
                    SizedBox(
                      width: double.infinity,
                      height: imp.getSize(context, 140),
                      child: Image(
                        // width: double.infinity,
                        // height: imp.getSize(context, size)(context, 140),
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
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
    );
  }
}
