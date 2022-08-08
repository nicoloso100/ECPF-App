import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaultInputField extends StatelessWidget {
  final String? placeholder;
  final bool onlyNumbers;
  final TextEditingController controller;
  const DefaultInputField(
      {Key? key,
      this.placeholder,
      this.onlyNumbers = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 2,
            lightSource: LightSource.topLeft,
            color: theme.baseColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: theme.defaultTextColor, fontSize: 14),
            keyboardType:
                onlyNumbers ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
                isDense: true,
                hintText: placeholder,
                hintStyle: const TextStyle(fontSize: 14),
                border: InputBorder.none),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa un valor';
              }
              return null;
            },
          ),
        ));
  }
}
