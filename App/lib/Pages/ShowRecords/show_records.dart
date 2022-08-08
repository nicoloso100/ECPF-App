import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Models/record_card_model.dart';
import 'package:ecpfapp/Pages/ShowRecords/widgets/record_card.dart';
import 'package:ecpfapp/Requests/ApiRequests/records_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:ecpfapp/Widgets/main_app_bar.dart';
import 'package:ecpfapp/Widgets/full_screen_loading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ShowRecords extends StatefulWidget {
  const ShowRecords({Key? key}) : super(key: key);

  @override
  State<ShowRecords> createState() => _ShowRecordsState();
}

class _ShowRecordsState extends State<ShowRecords> {
  List<RecordCardModel>? records;
  String? userId;

  static const _pageSize = 10;
  final PagingController<int, RecordCardModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      userId ??= await getSession();
      final newItems = await getRecords(userId ?? "", pageKey);
      if (newItems != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      } else {
        _pagingController.itemList = [];
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> refreshPage() async {
    _pagingController.refresh();
  }

  void onAddRecord() {
    Navigator.pushNamed(context, LoggedRoutes.addRecord);
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Scaffold(
      appBar: const MainAppBar(isLogged: true),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Flexible(
                child: RefreshIndicator(
                    color: theme.accentColor,
                    onRefresh: refreshPage,
                    child: PagedListView<int, RecordCardModel>(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(30),
                      pagingController: _pagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<RecordCardModel>(
                        firstPageProgressIndicatorBuilder: (_) =>
                            const FullScreenLoading(),
                        newPageProgressIndicatorBuilder: (_) =>
                            const FullScreenLoading(),
                        noItemsFoundIndicatorBuilder: (context) => Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("No se han encontrado registros guardados.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25, color: theme.accentColor)),
                            const SizedBox(height: 30),
                            Text(
                                "Puedes crear un nuevo registro presionando el botón + de la parte inferior.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: theme.defaultTextColor)),
                            const SizedBox(height: 60),
                          ],
                        )),
                        itemBuilder: (context, item, index) {
                          if (index == 0) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Registros:',
                                    style: TextStyle(
                                        color: theme.defaultTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22),
                                  ),
                                  const SizedBox(height: 30),
                                  RecordCard(record: item)
                                ]);
                          }
                          return RecordCard(record: item);
                        },
                      ),
                    )))
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
            style: NeumorphicStyle(color: theme.baseColor),
          ),
        ),
      ),
    );
  }
}
