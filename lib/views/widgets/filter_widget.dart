import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';

class FilterWidget extends StatefulWidget {
  final int index;

  const FilterWidget(this.index, {super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(context, 14),
        vertical: getSize(context, 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            journalFilterOptions[widget.index],
          ),
          Checkbox(
            value: ischecked,
            onChanged: (value) {
              setState(() {
                ischecked = value;
              });
            },
          )
        ],
      ),
    );
  }
}
