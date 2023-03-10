import 'package:flutter/material.dart';
import 'package:lib_management/services/app_constants.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

class TopPicksPage extends StatefulWidget {
  const TopPicksPage({super.key});

  @override
  State<TopPicksPage> createState() => _TopPicksPageState();
}

class _TopPicksPageState extends State<TopPicksPage> {
  @override
  Widget build(BuildContext context) {
    AppServices imp = AppServiceImp();

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: -MediaQuery.of(context).size.width - 120,
              left: -MediaQuery.of(context).size.width / 4,
              child: Container(
                height: MediaQuery.of(context).size.width * 2,
                width: MediaQuery.of(context).size.width * 1.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              )),
          Positioned(
            top: imp.getSize(context, imp.getSize(context, 60)),
            child: SizedBox(
              width: imp.getSize(context, 350),
              height: imp.getSize(context, 152),
              child: Flexible(
                child: Text(
                  'Top Picks',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: imp.getSize(context, 34), color: bgColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: imp.getSize(context, imp.getSize(context, 240)),
            child: InkWell(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
