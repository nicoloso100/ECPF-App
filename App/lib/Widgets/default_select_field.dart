import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultSelectField extends StatefulWidget {
  final String? placeholder;
  final List<String> items;
  final Function(String) onSelect;
  final String? defaultValue;
  const DefaultSelectField(
      {Key? key,
      this.placeholder,
      required this.items,
      required this.onSelect,
      this.defaultValue})
      : super(key: key);

  @override
  State<DefaultSelectField> createState() => _DefaultSelectedFieldState();
}

class _DefaultSelectedFieldState extends State<DefaultSelectField> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
  }

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
            child: DropdownButtonFormField<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward, size: 15),
              style: TextStyle(color: theme.defaultTextColor, fontSize: 14),
              decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: widget.placeholder,
                  hintStyle: const TextStyle(fontSize: 14),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  border: InputBorder.none),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  widget.onSelect(newValue);
                  setState(() {
                    dropdownValue = newValue;
                  });
                }
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.karla(),
                  ),
                );
              }).toList(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa un valor';
                }
                return null;
              },
            )));
  }
}
