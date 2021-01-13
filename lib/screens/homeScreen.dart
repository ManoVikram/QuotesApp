import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:share/share.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../models/quotesAPI.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.yellow,
      Colors.pinkAccent,
      Colors.purple,
      Colors.blueGrey,
      Colors.black,
    ];

    return Scaffold(
      body: Material(
        child: FutureBuilder(
          future: context.watch<Quotes>().fetchQuotes(),
          builder: (contxt, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.done) {
              if (futureSnapshot.hasData) {
                print(futureSnapshot.data);
                return StatefulBuilder(
                  builder: (contxt, setState) => VxSwiper(
                    scrollDirection: Axis.vertical,
                    height: context.screenHeight,
                    viewportFraction: 1.0,
                    items: [
                      ...futureSnapshot.data
                          .map(
                            (data) => AnimatedContainer(
                              duration: Duration(
                                milliseconds: 100,
                              ),
                              color: colors[Random().nextInt(colors.length)],
                              height: context.screenHeight,
                              width: context.screenWidth,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "QUOTES DEN",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).shimmer(),
                                    Column(
                                      children: [
                                        AutoSizeText(
                                          data.quote,
                                          maxLines: 10,
                                          textScaleFactor: 1.5,
                                          softWrap: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 10.0,
                                                offset: Offset(5, 5),
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "~${data.author}",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Share();
                                      },
                                      child: Container(
                                        height: 36,
                                        width: 36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Colors.orangeAccent,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.share,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                );
              }
              return Center(
                child: Text("No Data Found"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
