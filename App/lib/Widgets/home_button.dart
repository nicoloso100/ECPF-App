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
          shape: NeumorphicShape.flat,
          color: theme.variantColor,
          depth: 1),
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
