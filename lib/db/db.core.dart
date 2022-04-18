import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DBCore {
  DBCore({this.databases = const []});

  HiveInterface get _db => Hive;
  late Directory directory;
  final List<BaseDB> databases;

  Future<void> init() async {
    directory = await getTemporaryDirectory();
    _db.init(directory.path);
    databases.forEach((element) => Get.put(element));
    Get.put(this);
  }

  static DBCore get instance => Get.find<DBCore>();

  static HiveInterface get db => instance._db;

  static void clear() {
    instance.databases.forEach((element) => element.inst().clear());
  }
}

abstract class BaseDB {
  Box get box => DBCore.db.box(runtimeType.toString());
  void clear() => box.clear();
  BaseDB inst();
}

class ExampleDB extends BaseDB {
  static ExampleDB get instance => Get.find<ExampleDB>();
  @override
  BaseDB inst() => instance;

  List<String>? get data {
    final data = box.get('data');
    if (data != null) {
      try {
        return data as List<String>;
      } catch (err) {}
    }
    return null;
  }

  void setData(List<String> data) {
    box.put('data', data);
  }
}
