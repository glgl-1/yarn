import 'package:hive_ce/hive.dart';

class Needle extends HiveObject {
  String type; // 예: 대바늘, 코바늘
  double size; // mm 단위
  String material; // 예: 대나무, 금속

  Needle({
    required this.type,
    required this.size,
    required this.material,
  });
}
