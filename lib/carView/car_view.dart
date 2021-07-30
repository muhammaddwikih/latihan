import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';

class carView extends StatelessWidget {
  final List<String> names = ['jak', 'tommy'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cars",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Container(
            child: Image.asset('images/Avatar.png'),
            margin: EdgeInsets.only(right: 10),
          ),
        ],
        leading: InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "<",
              style: TextStyle(fontSize: 24),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 812,
              child: ListView(
                shrinkWrap: true,
                children: [
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 182, 120, 83),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 40),
                              child: Text(
                                "Classic Car",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                r"$34/day",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Consumer(builder: (context, watch, child) {
                                    final _isPressed =
                                        watch(classicCarViewModelProvider);
                                    return GestureDetector(
                                      onTap: () => context
                                          .read(classicCarViewModelProvider
                                              .notifier)
                                          .favorite(),
                                      child: Icon(
                                        _isPressed
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: (_isPressed)
                                            ? Colors.yellow
                                            : Colors.white,
                                        size: 33,
                                      ),
                                    );
                                  }),
                                  Container(
                                    child: Image.asset(
                                      'images/Classic_Car.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/classicDetail');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 96, 181, 244),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 40),
                              child: Text(
                                "Sport Car",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                r"$55/day",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Consumer(builder: (context, watch, child) {
                                    final _isPressed =
                                        watch(carDetailViewModelProvider);
                                    return GestureDetector(
                                      onTap: () => context
                                          .read(carDetailViewModelProvider
                                              .notifier)
                                          .favorite(),
                                      child: Icon(
                                        _isPressed
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: (_isPressed)
                                            ? Colors.yellow
                                            : Colors.white,
                                        size: 33,
                                      ),
                                    );
                                  }),
                                  Container(
                                    child: Image.asset(
                                      'images/Sport_Car.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 131, 130, 194),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 40),
                              child: Text(
                                "Flying Car",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                r"$500/day",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Consumer(builder: (context, watch, child) {
                                    final _isPressed =
                                        watch(flyingCarViewModelProvider);
                                    return GestureDetector(
                                      onTap: () => context
                                          .read(flyingCarViewModelProvider
                                              .notifier)
                                          .favorite(),
                                      child: Icon(
                                        _isPressed
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: (_isPressed)
                                            ? Colors.yellow
                                            : Colors.white,
                                        size: 33,
                                      ),
                                    );
                                  }),
                                  Container(
                                    child: Image.asset(
                                      'images/Flying_Car.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/flyingDetail');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 42, 54, 64),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 40),
                              child: Text(
                                "Electric Car",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                r"$45/day",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Consumer(builder: (context, watch, child) {
                                    final _isPressed =
                                        watch(electricCarViewModelProvider);
                                    return GestureDetector(
                                      onTap: () => context
                                          .read(electricCarViewModelProvider
                                              .notifier)
                                          .favorite(),
                                      child: Icon(
                                        _isPressed
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: (_isPressed)
                                            ? Colors.yellow
                                            : Colors.white,
                                        size: 33,
                                      ),
                                    );
                                  }),
                                  Container(
                                    child: Image.asset(
                                      'images/Sport_Car.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/electricDetail');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
