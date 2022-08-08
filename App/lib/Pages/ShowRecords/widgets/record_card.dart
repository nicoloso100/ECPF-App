import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Models/record_card_model.dart';
import 'package:ecpfapp/Utils/dates.dart';
import 'package:ecpfapp/Widgets/record_chart.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RecordCard extends StatelessWidget {
  final RecordCardModel record;

  const RecordCard({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    List<charts.Series<LinearGraph, int>> _createSampleData() {
      final data = [
        LinearGraph(0, record.percentilImc.round()),
        LinearGraph(1, record.porcentajeGrasa.round()),
        LinearGraph(2, record.percentilAbdominales.round()),
        LinearGraph(3, record.percentilVo2Max.round()),
        LinearGraph(4, record.percentilAbdo.round()),
        LinearGraph(5, record.percentilFBrazos.round()),
        LinearGraph(6, record.percentilFlexibilidad.round()),
      ];

      return [
        charts.Series<LinearGraph, int>(
          id: 'Graph',
          colorFn: (_, __) => charts.Color(
              r: theme.accentColor.red,
              g: theme.accentColor.green,
              b: theme.accentColor.blue),
          domainFn: (LinearGraph sales, _) => sales.value,
          measureFn: (LinearGraph sales, _) => sales.label,
          data: data,
        )
      ];
    }

    void onRecordDetails(String recordId) {
      Navigator.pushNamed(context, LoggedRoutes.recordDetails,
          arguments: recordId);
    }

    return Neumorphic(
        margin: const EdgeInsets.only(bottom: 40),
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
            depth: 10,
            lightSource: LightSource.topLeft,
            color: theme.variantColor,
            border: const NeumorphicBorder(width: 2)),
        child: SizedBox(
            width: double.infinity,
            height: 320,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => onRecordDetails(record.id),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "FECHA: ",
                                        style: TextStyle(
                                            color: theme.accentColor,
                                            fontSize: 11)),
                                    TextSpan(
                                        text: dateToString(record.creationDate),
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: theme.defaultTextColor)),
                                  ])),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "IMC: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text:
                                        record.percentilImc.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "% GRASA: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.porcentajeGrasa
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "P. ABDOMINAL: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.percentilAbdominales
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "VO2 MAX: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.percentilVo2Max
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "F. ABDOMINAL: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text:
                                        record.percentilAbdo.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "F. BRAZOS: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.percentilFBrazos
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "FLEXIBILIDAD: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.percentilFlexibilidad
                                        .toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "TOTAL: ",
                                    style: TextStyle(
                                        color: theme.accentColor,
                                        fontSize: 11)),
                                TextSpan(
                                    text: record.total.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: theme.defaultTextColor)),
                              ])),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "RESULTADO: ",
                                        style: TextStyle(
                                            color: theme.accentColor,
                                            fontSize: 15)),
                                    TextSpan(
                                        text: record.resultado,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: theme.defaultTextColor)),
                                  ])),
                            ]),
                      ])),
                  SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: PointsLineChart(
                          seriesList: _createSampleData(), animate: false))
                ],
              ),
            )));
  }
}
