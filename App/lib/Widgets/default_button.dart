import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function() onPress;

  const DefaultButton({Key? key, required this.text, required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return NeumorphicButton(
      onPressed: onPress,
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          shape: NeumorphicShape.concave,
          intensity: 3,
          depth: 1),
      child: Text(
        text,
        style: TextStyle(color: theme.accentColor),
      ),
    );
  }
}
