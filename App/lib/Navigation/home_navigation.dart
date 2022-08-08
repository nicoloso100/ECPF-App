import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Navigation/logged_navigation.dart';
import 'package:ecpfapp/Pages/AddRecord/add_record.dart';
import 'package:ecpfapp/Pages/Home/home.dart';
import 'package:ecpfapp/Pages/SignIn/sign_in.dart';
import 'package:ecpfapp/Pages/SignUp/sign_up.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeNavigation extends StatelessWidget {
  final bool logged;
  const HomeNavigation({Key? key, required this.logged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeNavigationKey,
      initialRoute: logged ? HomeRoutes.logged : HomeRoutes.home,
      onGenerateRoute: (RouteSettings settings) {
        late Widget page;
        switch (settings.name) {
          case HomeRoutes.showCalculator:
            page = const AddRecordPage(loggeduser: false);
            break;
          case HomeRoutes.signIn:
            page = const SignInPage();
            break;
          case HomeRoutes.signUp:
            page = const SignUpPage();
            break;
          case HomeRoutes.logged:
            page = const LoggedNavigation();
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
