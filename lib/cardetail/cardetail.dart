import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';
import 'package:latihan/core/model/Car_Model.dart';

class CarDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CarModel car = ModalRoute.of(context)!.settings.arguments as CarModel;

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
            child: Icon(Icons.arrow_back_ios)
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
                width: double.infinity,
                height: 260,
                margin: EdgeInsets.only(bottom: 10),
                child: Image.asset(car.image,
                    height: 200, fit: BoxFit.fitWidth,),
              )),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: car.color,
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
                        car.name,
                        style: TextStyle(color: Colors.white, fontSize: 39, fontWeight: FontWeight.w600),
                      ),
                      // margin: EdgeInsets.only(top: 50,left: 20, right: 180),
                      // ),
                      Consumer(builder: (context, watch, child) {
                        final _isPressed = watch(car.provider);
                        return GestureDetector(
                          onTap: () => context
                              .read(car.provider.notifier)
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
                    car.price,
                    style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  margin: EdgeInsets.only(top: 90, left: 20),
                ),
                Container(
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  margin: EdgeInsets.only(top: 140, left: 20),
                ),
                Container(
                  child: Text(
                    "Wanna ride the coolest sport car in the world?",
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  margin: EdgeInsets.only(top: 170, left: 20),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(315, 57), primary: Colors.white),
                      onPressed: () => {},
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.black, backgroundColor: Colors.white),
                      )),
                  margin: EdgeInsets.only(top: 220, left: 30, right: 30, bottom: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
