import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';

import '../../services/app_constants.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  AppServices imp = AppServiceImp();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: imp.getSize(context, 20),
      ),
      child: Column(
        children: [
          CarouselSlider(
            items: [0, 1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  // setState(() {
                  //   index = i;
                  // });

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.pink[200], borderRadius: BorderRadius.circular(10), boxShadow: const []),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          quotes[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: imp.getSize(context, 14),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              onScrolled: (value) {
                setState(() {
                  index = value!.toInt();
                  index = index % 5;
                });
              },
              height: imp.getSize(context, 70),
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 600),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 9, 5, 0),
                child: Icon(
                  (index != 0) ? Icons.circle_outlined : Icons.circle,
                  color: Colors.white,
                  size: imp.getSize(context, 7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 9, 5, 0),
                child: Icon(
                  (index != 1) ? Icons.circle_outlined : Icons.circle,
                  color: Colors.white,
                  size: imp.getSize(context, 7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 9, 5, 0),
                child: Icon(
                  (index != 2) ? Icons.circle_outlined : Icons.circle,
                  color: Colors.white,
                  size: imp.getSize(context, 7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 9, 5, 0),
                child: Icon(
                  (index != 3) ? Icons.circle_outlined : Icons.circle,
                  color: Colors.white,
                  size: imp.getSize(context, 7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 9, 5, 0),
                child: Icon(
                  (index != 4) ? Icons.circle_outlined : Icons.circle,
                  color: Colors.white,
                  size: imp.getSize(context, 7),
                ),
              ),
            ],
          )
        ],
      ),
    );
  } // scrollDirection: Axis.horizontal,
}
