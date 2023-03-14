import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

import '../../services/app_constants.dart';

class BookFilterWidget extends StatefulWidget {
  final int index;

  const BookFilterWidget({super.key, required this.index});

  @override
  State<BookFilterWidget> createState() => _BookFilterWidgetState();
}

class _BookFilterWidgetState extends State<BookFilterWidget> {
  bool? ischecked = false;
  AppServices imp = AppServiceImp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: imp.getSize(context, 10),
        vertical: imp.getSize(context, 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              booksFilterOptions[widget.index],
            ),
          ),
          Checkbox(
            value: (bookFilterSelected.contains(booksFilterOptions[widget.index])) ? true : ischecked,
            onChanged: (value) {
              setState(() {
                ischecked = value;
              });
              if (ischecked ?? false) {
                bookFilterSelected.add(booksFilterOptions[widget.index]);
              } else {
                if (bookFilterSelected.contains(booksFilterOptions[widget.index])) {
                  bookFilterSelected.remove(booksFilterOptions[widget.index]);
                }
              }
            },
          )
        ],
      ),
    );
  }
}
