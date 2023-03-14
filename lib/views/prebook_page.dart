import 'package:flutter/material.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

class PreBookPage extends StatefulWidget {
  final Map<String, dynamic> book;
  const PreBookPage({super.key, required this.book});

  @override
  State<PreBookPage> createState() => _PreBookPageState();
}

class _PreBookPageState extends State<PreBookPage> {
  AppServices imp = AppServiceImp();
  dynamic borrowDate = DateTime.now();
  int isBorrowDateSelected = 0;
  int isReturnDateSelected = 0;
  dynamic returnDate = 'select date';

  Future<void> selectBorrowDate(context) async {
    var selecteddate = await showDatePicker(
      context: context,
      initialDate: (isBorrowDateSelected == 0) ? DateTime.now() : DateTime.utc(borrowDate.year, borrowDate.month, borrowDate.day),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selecteddate != null) {
      setState(() {
        borrowDate = DateTime.parse(selecteddate.toString());
        isBorrowDateSelected = 1;
      });
    }
  }

  Future<void> selectReturnDate(context, initial) async {
    var selecteddate = await showDatePicker(
      context: context,
      initialDate: (isReturnDateSelected == 0)
          ? DateTime.utc(borrowDate.year, borrowDate.month, borrowDate.day)
          : DateTime.utc(returnDate.year, returnDate.month, returnDate.day),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selecteddate != null) {
      if (selecteddate.isBefore(DateTime.utc(borrowDate.year, borrowDate.month, borrowDate.day))) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            content: Text('Return date should be more than Borrowed Date'),
          ),
        );
      } else {
        setState(() {
          returnDate = DateTime.parse(selecteddate.toString());
          isReturnDateSelected = 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: imp.getSize(context, 230),
              ),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(imp.getSize(context, 15)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: imp.getSize(context, 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber[300]!,
                                blurRadius: 7,
                                spreadRadius: 7,
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(imp.getSize(context, 12)),
                              child: Text(
                                widget.book['title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: imp.getSize(context, 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: imp.getSize(context, 55),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Borrow Date:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: imp.getSize(context, 19),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                selectBorrowDate(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue[300]!,
                                      blurRadius: 6,
                                      spreadRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(
                                      imp.getSize(context, 15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(imp.getSize(context, 12)),
                                    child: Text(
                                      (isBorrowDateSelected == 1) ? "${borrowDate.day}-${borrowDate.month}-${borrowDate.year}" : 'select date',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: imp.getSize(context, 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: imp.getSize(context, 55),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Return Date:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: imp.getSize(context, 19),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (isBorrowDateSelected == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text('Select Borrow date first'),
                                    ),
                                  );
                                } else {
                                  selectReturnDate(context, borrowDate);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(imp.getSize(context, 15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue[300]!,
                                      blurRadius: 6,
                                      spreadRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(
                                      imp.getSize(context, 15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(imp.getSize(context, 12)),
                                    child: Text(
                                      (isReturnDateSelected == 1) ? "${returnDate.day}-${returnDate.month}-${returnDate.year}" : 'select date',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: imp.getSize(context, 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: imp.getSize(context, 55),
                        ),
                        Padding(
                          padding: EdgeInsets.all(imp.getSize(context, 15)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                const StadiumBorder(),
                              ),
                            ),
                            onPressed: () {
                              if (isReturnDateSelected == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text('Select all required dates'),
                                  ),
                                );
                              } else {
                                var historyBook = {
                                  ...widget.book,
                                  'borrowDate': "${borrowDate.day}-${borrowDate.month}-${borrowDate.year}",
                                  'returnDate': "${returnDate.day}-${returnDate.month}-${returnDate.year}"
                                };

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text('PreBook Successfull !'),
                                  ),
                                );

                                historyBooks.add(historyBook);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(imp.getSize(context, 16)),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  color: bgColor,
                                  fontSize: imp.getSize(context, 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  'PreBook',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: imp.getSize(context, 34), color: bgColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
