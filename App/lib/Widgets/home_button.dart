import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Function() onPress;

  const HomeButton({Key? key, required this.text, required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return NeumorphicButton(
      onPressed: onPress,
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          shape: NeumorphicShape.convex,
          color: theme.variantColor,
          intensity: 3,
          depth: 3),
      child: SizedBox(
          width: 110,
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: theme.accentColor),
          ))),
    );
  }
}
