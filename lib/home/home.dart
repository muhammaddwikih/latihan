import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';
import 'package:latihan/core/provider/theme_provider.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Beepy",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 50, bottom: 10),
                  child: Image.asset('images/Beep_Beep_Drifting.png',
                      width: double.infinity, height: 200),
                )),
            Expanded(
                flex: 0,
                child: FittedBox(
                  child: Text(
                    "Find Your Vehicle",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 16),
            Expanded(
                flex: 0,
                child: Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(bottom: 30),
                  child: AutoSizeText(
                    "Find the perfect vehicle for every occasion!",
                    maxLines: 2,
                    style: TextStyle(fontSize: 12),
                  ),
                )),
            Consumer(builder: (context, watch, child) {
              final _isValue = watch(changeThemeProvider);
              return Switch(
                  value: _isValue,
                  onChanged: (value) {
                    context.read(changeThemeProvider.notifier).changeTheme();
                    _isValue
                        ? context.read(themeProvider.notifier).setLight()
                        : context.read(themeProvider.notifier).setDark();
                  });
            }),
            SizedBox(height: 16),
            Consumer(builder: (context, watch, child) {
              final _isValue = watch(changeThemeProvider);
              return
                Container(
                  width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      primary: (_isValue) ? Colors.blue : Colors.orange),
                  onPressed: () => {
                        Navigator.pushNamed(context, '/carView'),
                      },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  )));
            }),
            // Expanded(
            //     flex: 0,
            //     child: Container(
            //       width: double.infinity,
            //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //       child: ElevatedButton(
            //           style:
            //               ElevatedButton.styleFrom(minimumSize: Size(150, 50)),
            //           onPressed: () => {
            //                 Navigator.pushNamed(context, '/detail'),
            //               },
            //           child: Text(
            //             "Continue",
            //             style: TextStyle(color: Colors.white),
            //           )),
            //     )),
            SizedBox(
              height: 30,
            )
          ],
        ));
  }
}
