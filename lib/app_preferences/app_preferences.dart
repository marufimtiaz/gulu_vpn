import 'package:hive_flutter/hive_flutter.dart';

class AppPreferences {
  static late Box boxOfData;
  static Future<void> initHive() async {
    await Hive.initFlutter();

    boxOfData = await Hive.openBox('data');
  }

  static bool get isModeDark => boxOfData.get('isModeDark') ?? false;
  static set isModeDark(bool value) => boxOfData.put('isModeDark', value);
}