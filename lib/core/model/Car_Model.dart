import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/cardetail/car_detail_view_model.dart';

class CarModel {
  final String name;
  final String price;
  final String image;
  final Color color;
  final StateNotifierProvider<CarDetailViewModel, bool> provider;

  CarModel(this.name, this.price, this.image, this.color, this.provider);
}