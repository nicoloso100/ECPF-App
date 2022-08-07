import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return NeumorphicAppBar(
        leading: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 39,
            child: NeumorphicButton(
                tooltip: "Retroceder",
                onPressed: () => Navigator.pop(context),
                style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.stadium(),
                    shape: NeumorphicShape.concave,
                    intensity: 3,
                    depth: 1),
                child: Center(
                  child: NeumorphicIcon(
                    Icons.arrow_back_ios_sharp,
                    style: NeumorphicStyle(color: theme.accentColor),
                  ),
                )))
      ],
    ));
  }
}
