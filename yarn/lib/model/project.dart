import 'package:hive_ce/hive.dart';

class Project extends HiveObject {
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  int progress; // 0~100
  int? patternId; // 연결된 도안 ID
  List<int> yarnIds; // 사용한 털실 id 리스트
  List<int> needleIds; // 사용한 바늘 id 리스트

  Project({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.progress,
    this.patternId,
    required this.yarnIds,
    required this.needleIds,
  });
}
