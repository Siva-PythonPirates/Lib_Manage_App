import 'package:flutter/material.dart';

import '../services/app_services.dart';

class Department extends StatefulWidget {
  const Department({super.key});
  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  String dropdownvalue = 'CSE';
  var items = ['CSE', 'IT', 'ECE'];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _rollnoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: bgColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: [
              TextFormField(
                controller: _rollnoController,
                style: TextStyle(color: bgColor),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name',
                  labelStyle: TextStyle(
                    color: bgColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bgColor,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.white54), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: bgColor), //<-- SEE HERE
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: bgColor),
                  ),
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: bgColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _rollnoController,
                style: TextStyle(color: bgColor),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Registered Number',
                  labelStyle: TextStyle(
                    color: bgColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bgColor,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.white54), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 3, color: bgColor), //<-- SEE HERE
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: bgColor),
                  ),
                  prefixIcon: Icon(
                    Icons.numbers_outlined,
                    color: bgColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, width: 2, color: bgColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Choose Department',
                          style: TextStyle(color: bgColor),
                        ),
                      ),
                      DropdownButton(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        iconEnabledColor: bgColor,
                        autofocus: true,
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                        ),
                        items: items.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(color: bgColor),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
