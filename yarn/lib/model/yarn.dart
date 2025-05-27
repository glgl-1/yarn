import 'package:hive_ce/hive.dart';

class Yarn extends HiveObject {
  String name;
  String brand;
  String color;
  int weight; // g 단위
  double length; // mm 단위
  String material;

  Yarn({
    required this.name,
    required this.brand,
    required this.color,
    required this.weight,
    required this.length,
    required this.material,
  });
}
