import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

import '../../services/app_constants.dart';

class BookFilterShowCatOpt extends StatefulWidget {
  final int bookFilterCatOptionIndex;

  const BookFilterShowCatOpt(
      {super.key, required this.bookFilterCatOptionIndex});

  @override
  State<BookFilterShowCatOpt> createState() => _BookFilterShowCatOptState();
}

class _BookFilterShowCatOptState extends State<BookFilterShowCatOpt> {
  AppServices imp = AppServiceImp();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          itemCount:
              booksFilterCatOptions[widget.bookFilterCatOptionIndex].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: imp.getSize(context, 12),
                vertical: imp.getSize(context, 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      booksFilterCatOptions[widget.bookFilterCatOptionIndex]
                          [index],
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      setState(() {
                        // ischecked = value;
                      });
                      //   if (ischecked ?? false) {
                      //     journalFilterSelected.add(journalFilterOptions[widget.index]);
                      //   } else {
                      //     if (journalFilterSelected.contains(journalFilterOptions[widget.index])) {
                      //       journalFilterSelected.remove(journalFilterOptions[widget.index]);
                      //     }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
