import 'package:ecpfapp/Constants/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future storeDarkmode(bool id) async {
  try {
    var box = await getDarkmodeBox();
    box.put(HiveKeys.darkmode, id);
  } catch (_) {}
}

Future<bool?> getDarkmode() async {
  try {
    var box = await getDarkmodeBox();
    var darkmode = box.get(HiveKeys.darkmode);
    return darkmode;
  } catch (_) {
    return null;
  }
}

Future<Box<bool>> getDarkmodeBox() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(HiveBoxes.darkmodeBox)) {
    await Hive.openBox<bool>(HiveBoxes.darkmodeBox);
  }
  return Hive.box<bool>(HiveBoxes.darkmodeBox);
}
