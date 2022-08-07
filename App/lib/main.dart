import 'package:ecpfapp/Constants/colors.dart';
import 'package:ecpfapp/Navigation/home_navigation.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool logged = false;

  @override
  void initState() {
    super.initState();
    onPrepareApp();
  }

  void onPrepareApp() async {
    var session = await getSession();
    if (session != null) {
      setState(() {
        ready = true;
        logged = true;
      });
    } else {
      setState(() {
        ready = true;
        logged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    NeumorphicTheme.isUsingDark(context)
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light)
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'ECPF-App',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
          // textTheme: GoogleFonts.assistantTextTheme(),
          // baseColor: AppColors.lightPrimary,
          // accentColor: AppColors.lightSecundary,
          // shadowLightColor: AppColors.lightShadow,
          // defaultTextColor: AppColors.lightText,
          // lightSource: LightSource.topLeft
          textTheme: GoogleFonts.assistantTextTheme(),
          baseColor: AppColors.darkPrimary,
          accentColor: AppColors.darkSecundary,
          shadowLightColor: AppColors.darkShadow,
          defaultTextColor: AppColors.darkText,
          borderColor: AppColors.darkBorder,
          lightSource: LightSource.topLeft),
      darkTheme: NeumorphicThemeData(
          textTheme: GoogleFonts.karlaTextTheme(),
          baseColor: AppColors.darkPrimary,
          accentColor: AppColors.darkSecundary,
          shadowLightColor: AppColors.darkShadow,
          defaultTextColor: AppColors.darkText,
          borderColor: AppColors.darkBorder,
          lightSource: LightSource.topLeft,
          variantColor: AppColors.darkVariant),
      home: HomeNavigation(ready: ready, logged: logged),
    );
  }
}
