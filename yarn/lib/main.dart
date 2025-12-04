import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:yarn/model/mypattern.dart';
import 'package:yarn/model/needle.dart';
import 'package:yarn/model/project.dart';
import 'package:yarn/model/yarn.dart';
import 'package:yarn/view/home.dart';
import 'package:yarn/adapters/hive_registrar.g.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapters(); // 자동 생성된 어댑터 전체 등록

  await Hive.openBox<Yarn>('yarn');
  await Hive.openBox<Needle>('needle');
  await Hive.openBox<MyPattern>('pattern');
  await Hive.openBox<Project>('project');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static const seedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true, // 머터리얼3 디자인 사용
        colorSchemeSeed: seedColor,  // 내가 정한 시드칼라를 씀
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: seedColor,
      ),
      home: const Home()
      // const SplashScreen()
    );
  }
}

