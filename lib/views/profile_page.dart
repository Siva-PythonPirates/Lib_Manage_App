import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:lib_management/view_model/app_provider.dart';
import 'package:lib_management/views/reset_page.dart';
import 'package:lib_management/views/widgets/alert_dialog.dart';
import 'package:provider/provider.dart';

import '../services/app_constants.dart';
import '../services/app_services.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppServices imp = AppServiceImp();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -MediaQuery.of(context).size.width - 20,
              left: -MediaQuery.of(context).size.width / 4,
              child: Container(
                height: MediaQuery.of(context).size.width * 2,
                width: MediaQuery.of(context).size.width * 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: imp.getSize(context, 530),
                      ),
                      Text(
                        login==1?"Student":"Staff",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: imp.getSize(context, 40),
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: imp.getSize(context, 20),
                      ),
                      Text(
                        login==1?((context.read<MyModel>().state.mail)?.substring(0, 9)   ?? " "):(context.read<MyModel>().state.mail ?? " "),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: imp.getSize(context, 30),
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              )),
/*
          Positioned(
            top: MediaQuery.of(context).size.width / 2.2,
            left: MediaQuery.of(context).size.width / 3.2,
            child: Container(
              height: imp.getSize(context, 150),
              width: imp.getSize(context, 150),
              decoration: BoxDecoration(
                  border: Border.all(color: bgColor, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: bgColor,
                  size: imp.getSize(context, 120),
                ),
              ),
            ),
          ),
*/
          Positioned(
            top: MediaQuery.of(context).size.width / 1.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: imp.getSize(context, 8),
                          horizontal: imp.getSize(context, 24)),
                      child: Icon(
                        Icons.person,
                        color: bgColor,
                        size: imp.getSize(context, 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        login==1?((context.read<MyModel>().state.mail)?.substring(0, 9)   ?? " "):(context.read<MyModel>().state.mail ?? " "),
                        style: TextStyle(
                            color: bgColor,
                            fontSize: imp.getSize(context, 20),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: imp.getSize(context, 1),
                  color: bgColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: imp.getSize(context, 8),
                          horizontal: imp.getSize(context, 24)),
                      child: Icon(
                        Icons.mail,
                        color: bgColor,
                        size: imp.getSize(context, 40),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(imp.getSize(context, 8)),
                      child: Text(
                        login==1?((context.read<MyModel>().state.mail)   ?? " "):(context.read<MyModel>().state.mail ?? " "),
                        style: TextStyle(
                            color: bgColor,
                            fontSize: imp.getSize(context, 18),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: imp.getSize(context, 8), horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: imp.getSize(context, 1),
                  color: bgColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: imp.getSize(context, 8),
                          horizontal: imp.getSize(context, 24)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: bgColor,
                            size: imp.getSize(context, 40),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(imp.getSize(context, 8)),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: bgColor,
                            fontSize: imp.getSize(context, 20),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: imp.getSize(context, 8), horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: imp.getSize(context, 1),
                  color: bgColor,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: imp.getSize(context, 40),
            left: MediaQuery.of(context).size.width / 4.8,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(bgColor),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Reset()),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(imp.getSize(context, 16)),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: imp.getSize(context, 20),
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
          Positioned(
            right: imp.getSize(context, 20),
            top: imp.getSize(context, 40),
            child: MaterialButton(
              onPressed: () async {
                final shouldLogout = await showAlertDialog(
                    context: context,
                    title: 'Logout',
                    content: 'Do you want to Logout?',
                    action1: 'Yes',
                    action2: 'No');
                if (shouldLogout) {
                  // await context.read<MyModel>().updateLogin(false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: imp.getSize(context, 10),
                  ),
                  Text(
                    "LogOut",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: imp.getSize(context, 20)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
