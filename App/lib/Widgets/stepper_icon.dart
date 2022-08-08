import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StepperIcon extends StatelessWidget {
  final int step;
  final int currentStep;
  const StepperIcon({Key? key, required this.currentStep, required this.step})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    Color getCurrentColor() {
      if (step == currentStep + 1) {
        return theme.accentColor;
      }
      return theme.baseColor;
    }

    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: const NeumorphicBoxShape.circle(),
          depth: 3,
          intensity: 1,
          lightSource: LightSource.topLeft,
          color: getCurrentColor()),
      child: Center(
          child: Text(
        step.toString(),
        style: TextStyle(color: theme.baseColor, fontWeight: FontWeight.w700),
      )),
    );
  }
}
