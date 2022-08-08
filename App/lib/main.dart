import 'package:ecpfapp/Constants/colors.dart';
import 'package:ecpfapp/Constants/hive.dart';
import 'package:ecpfapp/Navigation/home_navigation.dart';
import 'package:ecpfapp/Requests/HiveRequests/darkmode_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool ready = false;
  bool isLogged = false;

  @override
  void initState() {
    super.initState();
    onPrepareApp();
  }

  void onPrepareApp() async {
    await getDarkmodeBox();
    var session = await getSession();
    setState(() {
      ready = true;
      isLogged = session != null ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ready) {
      return ValueListenableBuilder(
          valueListenable: Hive.box<bool>(HiveBoxes.darkmodeBox).listenable(),
          builder: (BuildContext context, Box<bool> box, _) {
            var isDarkMode = true;
            var darkMode = box.get(HiveKeys.darkmode);
            isDarkMode = darkMode ?? true;

            isDarkMode
                ? SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.light)
                : SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.dark);

            return NeumorphicApp(
              debugShowCheckedModeBanner: false,
              title: 'ECPF-App',
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: NeumorphicThemeData(
                  textTheme: GoogleFonts.karlaTextTheme(),
                  baseColor: AppColors.lightPrimary,
                  accentColor: AppColors.lightSecundary,
                  shadowLightColor: AppColors.lightShadow,
                  variantColor: AppColors.lightVariant,
                  defaultTextColor: AppColors.lightText,
                  lightSource: LightSource.topLeft),
              darkTheme: NeumorphicThemeData(
                textTheme: GoogleFonts.karlaTextTheme(),
                baseColor: AppColors.darkPrimary,
                accentColor: AppColors.darkSecundary,
                shadowLightColor: AppColors.darkShadow,
                defaultTextColor: AppColors.darkText,
                variantColor: AppColors.darkVariant,
                lightSource: LightSource.topLeft,
              ),
              home: HomeNavigation(logged: isLogged),
            );
          });
    } else {
      return Container(color: Colors.white);
    }
  }
}
