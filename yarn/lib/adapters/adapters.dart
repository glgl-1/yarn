import 'package:hive_ce/hive.dart';
import 'package:yarn/model/mypattern.dart';
import 'package:yarn/model/needle.dart';
import 'package:yarn/model/project.dart';
import 'package:yarn/model/yarn.dart';

part 'adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Yarn>(),
  AdapterSpec<Needle>(),
  AdapterSpec<MyPattern>(),
  AdapterSpec<Project>(),
])
class HiveAdapters {}
