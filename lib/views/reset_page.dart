import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/views/home_page.dart';
import 'package:lib_management/views/widgets/mail_textfield.dart';

import '../services/app_constants.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool p = true;
  bool cp = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var using1 = Icons.remove_red_eye;
  AppServices imp = AppServiceImp();

  TextEditingController mail = TextEditingController(text: "210701@gmail.com");
  TextEditingController password = TextEditingController(text: "Changeme@123");
  TextEditingController password2 = TextEditingController(text: "Changeme@123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      imp.getSize(context, 30), 0, imp.getSize(context, 30), 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 1.8,
                        ),
                        MailField(controller: mail),
                        SizedBox(
                          height: imp.getSize(context, 20),
                        ),
                        TextFormField(
                          controller: password,
                          style: const TextStyle(color: Colors.white),
                          obscureText: p,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'New Password',

                            // labelText: 'Enter e-mail',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.white), //<-- SEE HERE
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white54), //<-- SEE HERE
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 4,
                                  color: Colors.white54), //<-- SEE HERE
                            ),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            hintText: 'Change Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (p == false) {
                                      p = true;
                                    } else {
                                      p = false;
                                    }
                                    if (using == openeye) {
                                      using = closeeye;
                                    } else {
                                      using = openeye;
                                    }
                                  });
                                },
                                icon: Icon(
                                  using,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: imp.getSize(context, 20),
                        ),
                        TextFormField(
                          controller: password2,
                          style: const TextStyle(color: Colors.white),
                          obscureText: cp,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.white), //<-- SEE HERE
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white54), //<-- SEE HERE
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 4,
                                  color: Colors.white54), //<-- SEE HERE
                            ),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (cp == false) {
                                      cp = true;
                                    } else {
                                      cp = false;
                                    }
                                    if (using1 == openeye) {
                                      using1 = closeeye;
                                    } else {
                                      using1 = openeye;
                                    }
                                  });
                                },
                                icon: Icon(
                                  using1,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: imp.getSize(context, 40),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: imp.getSize(context, 54),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                    const StadiumBorder())),
                            onPressed: () {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(mail.text);
                              if (mail.text == '' || password.text == '') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Fill all the fields properly",
                                    style: TextStyle(color: bgColor),
                                  ),
                                  backgroundColor: Colors.white,
                                ));
                              } else {
                                if (emailValid == true &&
                                    password.text == password2.text) {
                                  try {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  } on Exception catch (e) {
                                    print(e);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Passwords don't match",
                                        style: TextStyle(color: bgColor),
                                      ),
                                      backgroundColor: Colors.white,
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Enter a valid Mail-Id or Check if passwords match",
                                      style: TextStyle(color: bgColor),
                                    ),
                                    backgroundColor: Colors.white,
                                  ));
                                }
                              }
                            },
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                  color: bgColor,
                                  fontSize: imp.getSize(context, 25)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: imp.getSize(context, 30),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: imp.getSize(context, 200),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                Text(
                                  '  Go Back',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -MediaQuery.of(context).size.width -
                  imp.getSize(context, 120),
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
              top: imp.getSize(context, 60),
              left: imp.getSize(context, 90),
              child: Text(
                'REC-Library',
                style: TextStyle(
                    fontSize: imp.getSize(context, 40),
                    color: bgColor,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
