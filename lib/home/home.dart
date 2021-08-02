import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';
import 'package:latihan/core/provider/theme_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Beepy",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          centerTitle: true,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.only(top: 50, bottom: 10),
                  child: Image.asset('images/Beep_Beep_Drifting.png',
                      width: double.infinity, height: 319),
                )),
            SizedBox(height: 32,),
            Expanded(
                flex: 0,
                child: FittedBox(
                  child: Text(
                    "Find Your Vehicle",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 16),
            Expanded(
                flex: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  // margin: EdgeInsets.only(bottom: 30),
                  child: AutoSizeText(
                    "Find the perfect vehicle for every occasion!",
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                )),
            SizedBox(height: 30,),
            Consumer(builder: (context, watch, child) {
              final _isValue = watch(changeThemeProvider);
              return Switch(
                  value: _isValue,
                  onChanged: (value) {
                    context.read(changeThemeProvider.notifier).changeTheme();
                    !_isValue
                        ? context.read(themeProvider.notifier).setDark()
                        : context.read(themeProvider.notifier).setLight();
                  });
            }),
            SizedBox(height: 30),
            Consumer(builder: (context, watch, child) {
              final _isValue = watch(changeThemeProvider);
              return
                Container(
                  width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(305, 57), primary: Theme.of(context).buttonColor,),
                  onPressed: () => {
                        Navigator.pushNamed(context, '/carView'),
                      },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  )));
            }),
            SizedBox(
              height: 58,
            )
          ],
        ));
  }
}
