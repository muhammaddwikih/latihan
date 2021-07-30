import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';

class ElectricCarDetail extends StatelessWidget {
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
                width: double.infinity,
                height: 260,
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset('images/Sport_Car.png',
                    width: double.infinity, height: 200),
              )),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 54, 64),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: double.infinity,
                  height: 300,
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   child:
                      Text(
                        "Electric Car",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      // margin: EdgeInsets.only(top: 50,left: 20, right: 180),
                      // ),
                      Consumer(builder: (context, watch, child) {
                        final _isPressed = watch(electricCarViewModelProvider);
                        return GestureDetector(
                          onTap: () => context
                              .read(electricCarViewModelProvider.notifier)
                              .favorite(),
                          child: Icon(
                            _isPressed
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: (_isPressed) ? Colors.yellow : Colors.white,
                            size: 33,
                          ),
                        );
                      }),
                    ],
                  ),
                ),


                Container(
                  child: Text(
                    r"$45/day",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  margin: EdgeInsets.only(top: 90, left: 20),
                ),
                Container(
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.only(top: 140, left: 20),
                ),
                Container(
                  child: Text(
                    "Wanna ride the coolest sport car in the world?",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  margin: EdgeInsets.only(top: 170, left: 20),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50), primary: Colors.white),
                      onPressed: () => {},
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.black, backgroundColor: Colors.white),
                      )),
                  margin: EdgeInsets.only(top: 220, left: 20, right: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}