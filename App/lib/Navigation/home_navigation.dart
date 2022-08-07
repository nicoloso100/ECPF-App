import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Pages/AddRecord/add_record.dart';
import 'package:ecpfapp/Pages/home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        late Widget page;
        switch (settings.name) {
          case HomeRoutes.addRecord:
            page = const AddRecordPage();
            break;
          default:
            page = const HomePage();
        }
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return page;
            });
      },
    );
  }
}
