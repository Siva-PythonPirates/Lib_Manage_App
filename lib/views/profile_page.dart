import 'package:flutter/material.dart';
import 'package:lib_management/views/reset_page.dart';

import '../services/app_services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: DecorationImage(image: AssetImage('assets/images/login_bg.jpg'), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 500,
                      ),
                      Text(
                        "Peaky Blinders",
                        style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.width / 2.2,
            left: MediaQuery.of(context).size.width / 3.2,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: bgColor, width: 5), shape: BoxShape.circle, color: Colors.white),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: bgColor,
                  size: 120,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 1.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                      child: Icon(
                        Icons.person,
                        color: bgColor,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Peaky Blinders",
                        style: TextStyle(color: bgColor, fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: bgColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                      child: Icon(
                        Icons.mail,
                        color: bgColor,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "210701@gmail.com",
                        style: TextStyle(color: bgColor, fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: bgColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: bgColor,
                            size: 40,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(color: bgColor, fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: bgColor,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: MediaQuery.of(context).size.width / 5,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(bgColor), shape: MaterialStateProperty.all(const StadiumBorder())),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Reset()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
