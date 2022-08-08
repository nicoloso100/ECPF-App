import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PointsLineChart extends StatelessWidget {
  final List<charts.Series<LinearGraph, int>> seriesList;
  final bool animate;

  const PointsLineChart(
      {super.key, required this.seriesList, required this.animate});

  @override
  Widget build(BuildContext context) {
    final customTickFormatter =
        charts.BasicNumericTickFormatterSpec((num? value) {
      if (value == 0) {
        return "IMC";
      } else if (value == 1) {
        return "%Grasa";
      } else if (value == 2) {
        return "P.Abdo";
      } else if (value == 3) {
        return "VO2";
      } else if (value == 4) {
        return "F.Abdo";
      } else if (value == 5) {
        return "F.Brazos";
      } else if (value == 6) {
        return "Flex";
      } else {
        return "";
      }
    });

    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(includePoints: true),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        tickProviderSpec:
            charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
      ),
      domainAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              const charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
          tickFormatterSpec: customTickFormatter,
          renderSpec: const charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
            fontSize: 10,
          ))),
    );
  }
}

class LinearGraph {
  final int value;
  final int label;

  LinearGraph(this.value, this.label);
}
