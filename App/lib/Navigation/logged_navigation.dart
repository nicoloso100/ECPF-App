import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Pages/AddRecord/add_record.dart';
import 'package:ecpfapp/Pages/RecordDetails/record_details.dart';
import 'package:ecpfapp/Pages/ShowRecords/show_records.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoggedNavigation extends StatelessWidget {
  const LoggedNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        late Widget page;
        switch (settings.name) {
          case LoggedRoutes.addRecord:
            page = const AddRecordPage(loggeduser: true);
            break;
          case LoggedRoutes.recordDetails:
            var args = settings.arguments as String?;
            page = RecordDetails(recordId: args);
            break;
          default:
            page = const ShowRecords();
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
