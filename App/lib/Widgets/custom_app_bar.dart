import 'package:ecpfapp/Widgets/app_bar_icon.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function()? customOnBack;
  final List<Widget>? actions;
  const CustomAppBar({Key? key, this.customOnBack, this.actions})
      : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(70);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBarIcon(
              text: "Regresar",
              icon: Icons.arrow_back_ios_sharp,
              onPress: widget.customOnBack ?? () => Navigator.pop(context))
        ],
      ),
      actions: widget.actions,
    );
  }
}
