import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_4_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step4 extends StatefulWidget {
  final Step4DTO? defaultValues;
  final Function(Step4DTO step) onFinish;
  final Function() onCancel;
  const Step4(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  final _formKey = GlobalKey<FormState>();

  final vo2MaxController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step4Constants.PERCENTIL_VO2MAX, value: null),
    ResultItemDTO(label: Step4Constants.RESULTADO, value: null),
  ];

  @override
  void initState() {
    super.initState();
    vo2MaxController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      vo2MaxController.text = defaultValues.vo2Max.toString();
    }
  }

  void onCalculareResult() {
    if (vo2MaxController.text.isNotEmpty) {
      var vo2Max = double.tryParse(vo2MaxController.text);
      if (vo2Max != null) {
        setNewValueOnResults(vo2Max);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? vo2Max) {
    var newPercentilVo2Max =
        vo2Max != null ? calculatePercentilVo2Max(vo2Max) : null;
    var newResultado = vo2Max != null ? calculateVo2MaxResultado(vo2Max) : null;

    var neResults = results;
    neResults[0] = neResults[0].copyWithValue(newPercentilVo2Max?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var vo2Max = double.tryParse(vo2MaxController.text);
      var percentilVo2Max = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      if (vo2Max != null && percentilVo2Max != null && resultado != null) {
        var step = Step4DTO(
            vo2Max: vo2Max,
            percentilVo2Max: percentilVo2Max,
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
                      controller: vo2MaxController,
                      placeholder: "VO2 MAX",
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
