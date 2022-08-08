import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void showConfirmationDialog(BuildContext context,
    {required String title,
    required String description,
    required Function() onOk}) {
  var theme = NeumorphicTheme.currentTheme(context);

  AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.BOTTOMSLIDE,
          title: title,
          desc: description,
          btnCancelOnPress: () => {},
          btnCancelText: "Cancelar",
          btnOkText: "Sí",
          titleTextStyle:
              TextStyle(color: theme.defaultTextColor, fontSize: 18),
          descTextStyle: TextStyle(color: theme.defaultTextColor),
          buttonsTextStyle: TextStyle(color: theme.variantColor),
          dialogBackgroundColor: theme.variantColor,
          btnOkOnPress: onOk,
          btnOkColor: theme.accentColor,
          btnCancelColor: theme.accentColor.withAlpha(200))
      .show();
}
