import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  HomeAppBarState createState() => HomeAppBarState();
}

class HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return NeumorphicAppBar(
      title: Text("Registros",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: theme.defaultTextColor,
              fontWeight: FontWeight.w700)),
    );
  }
}
