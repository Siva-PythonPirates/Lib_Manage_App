import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

import '../../services/app_constants.dart';

class BookFilterWidget extends StatefulWidget {
  final int index;
  final String bookFilterCatOption;

  const BookFilterWidget({
    super.key,
    required this.bookFilterCatOption,
    required this.index,
  });

  @override
  State<BookFilterWidget> createState() => _BookFilterWidgetState();
}

class _BookFilterWidgetState extends State<BookFilterWidget> {
  bool? ischecked = false;
  AppServices imp = AppServiceImp();

  @override
  Widget build(BuildContext context) {
    String option = booksFilterCatOptions[widget.bookFilterCatOption]![widget.index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: imp.getSize(context, 14), vertical: imp.getSize(context, 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              option,
            ),
          ),
          Checkbox(
            value: (bookFilterSelected[widget.bookFilterCatOption]!.contains(option)) ? true : ischecked,
            onChanged: (value) {
              setState(() {
                ischecked = value;
              });
              if (ischecked ?? false) {
                bookFilterSelected[widget.bookFilterCatOption]!.add(option);
              } else {
                if (bookFilterSelected[widget.bookFilterCatOption]!.contains(option)) {
                  bookFilterSelected[widget.bookFilterCatOption]!.remove(option);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
