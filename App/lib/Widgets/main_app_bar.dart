import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Requests/HiveRequests/darkmode_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:ecpfapp/Utils/dialog_notification.dart';
import 'package:ecpfapp/Widgets/app_bar_icon.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isLogged;
  const MainAppBar({Key? key, this.isLogged = false}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  MainAppBarState createState() => MainAppBarState();
}

class MainAppBarState extends State<MainAppBar> {
  bool darkmodeEnabled = true;

  @override
  void initState() {
    super.initState();
    loadDefaultDarkmode();
  }

  void loadDefaultDarkmode() async {
    var isDark = await getDarkmode();
    setState(() {
      darkmodeEnabled = isDark ?? true;
    });
  }

  void navigateToHome() {
    var homeNav = homeNavigationKey.currentState;
    if (homeNav != null) {
      homeNav.pushNamed(HomeRoutes.home);
    }
  }

  void onSignOut() {
    showConfirmationDialog(context,
        title: "Cerrar sesión",
        description: "¿Está seguro que desea cerrar la sesión?",
        onOk: () async {
      await deleteSession();
      navigateToHome();
    });
  }

  void onSwitchDarkmode(bool value) async {
    await storeDarkmode(value);
    setState(() {
      darkmodeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return NeumorphicAppBar(
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            darkmodeEnabled ? Icons.nightlight_round : Icons.sunny,
            size: 15,
            color: theme.defaultTextColor,
          ),
          const SizedBox(width: 3),
          SizedBox(
              width: 35,
              height: 20,
              child: NeumorphicSwitch(
                  value: darkmodeEnabled, onChanged: onSwitchDarkmode)),
        ],
      ),
      actions: [
        Visibility(
            visible: widget.isLogged,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBarIcon(
                    text: "Cerrar sesión",
                    icon: Icons.logout,
                    onPress: onSignOut),
                const SizedBox(width: 10)
              ],
            ))
      ],
    );
  }
}
