import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.pinkAccent,
      Colors.blueGrey,
      Colors.black,
    ];

    return Scaffold(
      body: Material(
        child:
            /* FutureBuilder(
          builder: (contxt, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.done) {
              if (futureSnapshot.hasData) {
                return StatefulBuilder(
                  builder: (contxt, setState) => VxSwiper(
                    scrollDirection: Axis.vertical,
                    height: context.screenHeight,
                    viewportFraction: 1.0,
                    items: futureSnapshot.data.map(
                      (data) =>  */
            VxSwiper(
          scrollDirection: Axis.vertical,
          height: context.screenHeight,
          viewportFraction: 1.0,
          items: [
            AnimatedContainer(
              duration: Duration(
                milliseconds: 100,
              ),
              color: Colors.red,
              height: context.screenHeight,
              width: context.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("QUOTES DEN").shimmer(),
                  Text("Stay Humgry. Stay Foolish."),
                  Icon(Icons.share),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(
                milliseconds: 100,
              ),
              color: colors[Random().nextInt(colors.length)],
              height: context.screenHeight,
              width: context.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("QUOTES DEN").shimmer(),
                  Text("Jack of all trades. King of none."),
                  Icon(Icons.share),
                ],
              ),
            ),
          ],
        ),
      ),
      /* ),
                );
              }
            }
          },
        ),
      ), */
    );
  }
}
