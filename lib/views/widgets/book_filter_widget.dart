import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';

class BookFilterWidget extends StatefulWidget {
  final int index;

  const BookFilterWidget({super.key, required this.index});

  @override
  State<BookFilterWidget> createState() => _BookFilterWidgetState();
}

class _BookFilterWidgetState extends State<BookFilterWidget> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: booksFilterCatOptions[widget.index].length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(context, 14),
            vertical: getSize(context, 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booksFilterCatOptions[widget.index][index],
              ),
              Checkbox(
                value: (journalFilterSelected.contains(journalFilterOptions[widget.index])) ? true : ischecked,
                onChanged: (value) {
                  setState(() {
                    ischecked = value;
                  });
                  if (ischecked ?? false) {
                    journalFilterSelected.add(journalFilterOptions[widget.index]);
                  } else {
                    if (journalFilterSelected.contains(journalFilterOptions[widget.index])) {
                      journalFilterSelected.remove(journalFilterOptions[widget.index]);
                    }
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
