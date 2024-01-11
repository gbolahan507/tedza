// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

class AppStorage {
  static String KsUserBox = "KsUserBox";
  static String path = Directory.current.path;
  static String KsToken = "KsToken";


  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(KsUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(KsUserBox);

  static void saveTokene(String value) {
    _userBox.put(KsToken, value);
  }

  static String getToken() {
    return _userBox.get(KsToken, defaultValue: '');
  }

 
}
