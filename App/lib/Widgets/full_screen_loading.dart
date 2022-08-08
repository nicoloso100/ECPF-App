import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator(color: theme.accentColor)]));
  }
}
