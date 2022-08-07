import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_7_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step7 extends StatefulWidget {
  final Step7DTO? defaultValues;
  final Function(Step7DTO step) onFinish;
  final Function() onCancel;
  const Step7(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  final _formKey = GlobalKey<FormState>();

  final sitAndReachController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: "PERCENTIL FLEXIBILIDAD:", value: null),
    ResultItemDTO(label: "RESULTADO:", value: null),
  ];

  @override
  void initState() {
    super.initState();
    sitAndReachController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      sitAndReachController.text = defaultValues.sitAndReach.toString();
    }
  }

  void onCalculareResult() {
    if (sitAndReachController.text.isNotEmpty) {
      var sitAndReach = double.tryParse(sitAndReachController.text);
      if (sitAndReach != null) {
        setNewValueOnResults(sitAndReach);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? sitAndReach) {
    var newPercentilFAbdo =
        sitAndReach != null ? calculatePercentilSitAndReach(sitAndReach) : null;
    var newResultado =
        sitAndReach != null ? calculateSitAndReachResultado(sitAndReach) : null;

    var neResults = results;
    neResults[0] = neResults[0].copyWithValue(newPercentilFAbdo?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var sitAndReach = double.tryParse(sitAndReachController.text);
      var percentilFlexibilidad = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      if (sitAndReach != null &&
          percentilFlexibilidad != null &&
          resultado != null) {
        var step = Step7DTO(
            sitAndReach: sitAndReach,
            percentilFlexibilidad: percentilFlexibilidad,
            resultado: resultado);
        widget.onFinish(step);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(children: [
                  DefaultInputField(
                      controller: sitAndReachController,
                      placeholder: "F ABDO",
                      onlyNumbers: true),
                  const SizedBox(height: 20),
                  StepResult(result: results),
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultButton(text: "Retroceder", onPress: widget.onCancel),
                    DefaultButton(text: "Continuar", onPress: onFinish),
                  ],
                ))
          ],
        ));
  }
}
