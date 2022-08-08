import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppBarIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPress;
  const AppBarIcon(
      {Key? key, required this.text, required this.icon, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return SizedBox(
        width: 39,
        child: NeumorphicButton(
            tooltip: text,
            onPressed: onPress,
            style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.stadium(),
                shape: NeumorphicShape.concave,
                intensity: 3,
                depth: 1),
            child: Center(
              child: NeumorphicIcon(
                icon,
                style: NeumorphicStyle(color: theme.accentColor),
              ),
            )));
  }
}
