
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';

class JournalFilterWidget extends StatefulWidget {
  final int index;

  const JournalFilterWidget(this.index, {super.key});

  @override
  State<JournalFilterWidget> createState() => _JournalFilterWidgetState();
}

class _JournalFilterWidgetState extends State<JournalFilterWidget> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(context, 14),
        vertical: getSize(context, 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            journalFilterOptions[widget.index],
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
  }
}
