import 'package:hive_ce/hive.dart';

class MyPattern extends HiveObject {
  String title;
  String description;
  String imagePath; // 도안 이미지 경로
  DateTime createdAt;

  MyPattern({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.createdAt,
  });
}
