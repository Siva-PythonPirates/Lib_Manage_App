import 'package:flutter/material.dart';
import 'package:lib_management/views/home_page.dart';
import 'package:lib_management/views/widgets/mail_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  TextEditingController mail = TextEditingController(text: "210701@gmail.com");
  TextEditingController password = TextEditingController(text: "Changeme@123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: FittedBox(
                  child: Text(
                    'REC-Library',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              MailField(controller: mail),
              const SizedBox(
                height: 20.0,
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
                  hintText: 'Enter your Password',
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
              const SizedBox(
                height: 40.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 54.0,
                child: ElevatedButton(
                  style:
                      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), shape: MaterialStateProperty.all(const StadiumBorder())),
                  onPressed: () {
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail.text);
                    if (mail.text == '' || password.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Fill all the fields properly",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.white,
                      ));
                    } else {
                      if (emailValid == true) {
                        try {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                            (Route<dynamic> route) => false,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                              "Logged in Successfully",
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.white,
                          ));
                        } on Exception catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              e.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.white,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "Enter a valid Mail-Id",
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                        ));
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password? Change it here',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
