import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_2_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step2 extends StatefulWidget {
  final Step2DTO? defaultValues;
  final Function(Step2DTO step) onFinish;
  final Function() onCancel;
  const Step2(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final _formKey = GlobalKey<FormState>();

  final grasaController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step2Constants.PERCENTIL_GRASA, value: null),
    ResultItemDTO(label: Step2Constants.RESULTADO, value: null),
  ];

  @override
  void initState() {
    super.initState();
    grasaController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      grasaController.text = defaultValues.porcentajeGrasa.toString();
    }
  }

  void onCalculareResult() {
    if (grasaController.text.isNotEmpty) {
      var grasa = double.tryParse(grasaController.text);
      if (grasa != null) {
        setNewValueOnResults(grasa);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? grasa) {
    var newPercentilGrasa =
        grasa != null ? calculatePercentilGrasa(grasa) : null;
    var newResultado = grasa != null ? calculateGrasaResultado(grasa) : null;

    var neResults = results;
    neResults[0] = neResults[0].copyWithValue(newPercentilGrasa?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var grasa = double.tryParse(grasaController.text);
      var percentilGrasa = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      if (grasa != null && percentilGrasa != null && resultado != null) {
        var step = Step2DTO(
            porcentajeGrasa: grasa,
            percentilGrasa: percentilGrasa,
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
                      controller: grasaController,
                      placeholder: "% DE GRASA",
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
