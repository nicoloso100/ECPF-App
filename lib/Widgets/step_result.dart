import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StepResult extends StatelessWidget {
  final List<ResultItemDTO> result;
  final bool secondaryColor;
  const StepResult(
      {Key? key, required this.result, this.secondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Neumorphic(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            depth: 2,
            lightSource: LightSource.topLeft,
            color: secondaryColor ? theme.accentColor : theme.baseColor),
        child: SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: result
                  .map((e) => Column(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "${e.label} ",
                                style: TextStyle(
                                    color: secondaryColor
                                        ? theme.baseColor
                                        : theme.accentColor,
                                    fontWeight: secondaryColor
                                        ? FontWeight.bold
                                        : FontWeight.normal)),
                            TextSpan(
                                text: e.value ?? "",
                                style: TextStyle(color: theme.defaultTextColor))
                          ])),
                          const SizedBox(height: 5)
                        ],
                      ))
                  .toList()),
        ));
  }
}
