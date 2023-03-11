import 'package:flutter/material.dart';
import 'package:lib_management/views/login_page.dart';
import 'package:lib_management/views/widgets/mail_textfield.dart';

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
  TextEditingController mail = TextEditingController(text: "210701@gmail.com");
  TextEditingController password = TextEditingController(text: "Changeme@123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("/assets/bgimage.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Center(
                child: Text(
                  'REC-Library',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              MailField(controller: mail),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                style: const TextStyle(color: Colors.white),
                obscureText: p,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white54), //<-- SEE HERE
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.white54), //<-- SEE HERE
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
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
              TextFormField(
                controller: password,
                style: const TextStyle(color: Colors.white),
                obscureText: cp,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white), //<-- SEE HERE
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white54), //<-- SEE HERE
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.white54), //<-- SEE HERE
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.white),
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
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 54.0,
                child: ElevatedButton(
                  style:
                      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), shape: MaterialStateProperty.all(const StadiumBorder())),
                  onPressed: () {
                    if (mail.text == '' || password.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Fill all the fields properly",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                      ));
                    }
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                      (Route<dynamic> route) => false,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Logged in Successfully",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                    ));
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
              )
            ]),
          )),
        ));
  }
}
