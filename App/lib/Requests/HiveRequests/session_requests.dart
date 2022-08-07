import 'package:ecpfapp/Constants/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future storeSession(String id) async {
  try {
    var box = await getSessionBox();
    box.put(HiveKeys.session, id);
  } catch (_) {}
}

Future<String?> getSession() async {
  try {
    var box = await getSessionBox();
    var session = box.get(HiveKeys.session);
    return session;
  } catch (_) {
    return null;
  }
}

Future<Box<String>> getSessionBox() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(HiveBoxes.sessionBox)) {
    await Hive.openBox<String>(HiveBoxes.sessionBox);
  }
  return Hive.box<String>(HiveBoxes.sessionBox);
}
