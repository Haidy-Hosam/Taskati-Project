import 'package:hive_ce/hive.dart';

abstract class HiveHelper {
  static late Box userBox;
  static String userBoxKey = 'userBox';
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadedKey = 'isUploaded';


  static Future<void> initt() async {
    userBox = await Hive.openBox(userBoxKey);
  }

    static Future<void> setKeyValue(String name, String image) async {
    await cashdata(nameKey , name);
    await cashdata(imageKey, image);
  }
  static Future<void> cashdata(String key, dynamic value) async {
    await userBox.put(key, value);
  }

  static dynamic getData(String key)  {
     userBox.get(key);
  }

}
