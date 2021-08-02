import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';
import 'package:latihan/core/model/Car_Model.dart';

class carView extends StatelessWidget {
  final List<String> names = ['jak', 'tommy'];
  final List<CarModel> car = [
    new CarModel("Classic Car", r"$34/day", "images/Classic_Car.png",
        Color(0xFFB67853), classicCarViewModelProvider),
    new CarModel("Sport Car", r"$55/day", "images/Sport_Cars.png",
        Color(0xFF60B5F4), carDetailViewModelProvider),
    new CarModel("Flying Car", r"$500/day", "images/Flying_Car.png",
        Color(0xFF8382C2), flyingCarViewModelProvider),
    new CarModel("Electric Car", r"$45/day", "images/Sport_Car.png",
        Color(0xFF2A3640), electricCarViewModelProvider)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cars",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        actions: [
          Container(
            child: Image.asset('images/Avatar.png'),
            margin: EdgeInsets.only(right: 10),
          ),
        ],
        leading: InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child:Icon(Icons.arrow_back_ios),
            // Text(
            //   "<",
            //   style: TextStyle(fontSize: 24),
            // ),
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
                child: ListView.builder(
                    itemCount: car.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: car[index].color,
                                borderRadius: BorderRadius.circular(10),
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
                                    car[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(left: 40, top: 20),
                                  child: Text(
                                    car[index].price,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Consumer(
                                          builder: (context, watch, child) {
                                        final _isPressed =
                                            watch(car[index].provider);
                                        return GestureDetector(
                                          onTap: () => context
                                              .read(
                                                  car[index].provider.notifier)
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
                                          car[index].image,
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
                          Navigator.pushNamed(context, '/detail',
                              arguments: car[index]);
                        },
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
