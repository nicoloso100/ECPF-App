import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaultEmailField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController controller;
  const DefaultEmailField(
      {Key? key, this.placeholder, required this.controller})
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
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                isDense: true,
                hintText: placeholder,
                hintStyle: const TextStyle(fontSize: 14),
                border: InputBorder.none),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa el email';
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Ingrese un email válido';
              }
              return null;
            },
          ),
        ));
  }
}
