import 'package:ecpfapp/Constants/assets.dart';
import 'package:ecpfapp/Constants/routing.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ShowRecords extends StatefulWidget {
  const ShowRecords({Key? key}) : super(key: key);

  @override
  State<ShowRecords> createState() => _ShowRecordsState();
}

class _ShowRecordsState extends State<ShowRecords> {
  void onAddRecord() {
    Navigator.pushNamed(context, LoggedRoutes.addRecord);
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Image(
              image: AppAssets.escudo,
              width: 170,
            ),
            const SizedBox(height: 30),
            Text(
              'Registros:',
              style: TextStyle(
                  color: theme.defaultTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ],
        ),
      )),
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: onAddRecord,
        tooltip: 'Crear nuevo registro',
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            shape: NeumorphicShape.concave,
            color: theme.accentColor,
            intensity: 1,
            depth: 4),
        child: Center(
          child: NeumorphicIcon(
            Icons.add,
            size: 30,
            style: NeumorphicStyle(color: theme.defaultTextColor),
          ),
        ),
      ),
    );
  }
}
