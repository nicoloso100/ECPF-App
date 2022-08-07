import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_3_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step3 extends StatefulWidget {
  final Step3DTO? defaultValues;
  final double talla;
  final Function(Step3DTO step) onFinish;
  final Function() onCancel;
  const Step3(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.talla,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final _formKey = GlobalKey<FormState>();

  final perAbdominalController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step3Constants.PERCENTIL_ABDOMINALES, value: null),
    ResultItemDTO(label: Step3Constants.RESULTADO, value: null),
    ResultItemDTO(label: Step3Constants.IAC, value: null),
    ResultItemDTO(label: Step3Constants.CLASIFICACION_IAC, value: null),
  ];

  @override
  void initState() {
    super.initState();
    perAbdominalController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      perAbdominalController.text = defaultValues.perAbdominal.toString();
    }
  }

  void onCalculareResult() {
    if (perAbdominalController.text.isNotEmpty) {
      var perAbdominal = double.tryParse(perAbdominalController.text);
      if (perAbdominal != null) {
        setNewValueOnResults(perAbdominal);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? perAbdominal) {
    var newPercentilAbdominales = perAbdominal != null
        ? calculatePercentilAbdominales(perAbdominal)
        : null;
    var newResultado = perAbdominal != null
        ? calculateAbdominalesResultado(perAbdominal)
        : null;
    var newIAC =
        perAbdominal != null ? calculateIAC(perAbdominal, widget.talla) : null;
    var newClasificacionIAC =
        newIAC != null ? calculateClasificacionIAC(newIAC) : null;

    var neResults = results;
    neResults[0] =
        neResults[0].copyWithValue(newPercentilAbdominales?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    neResults[2] = neResults[2].copyWithValue(newIAC?.toString());
    neResults[3] = neResults[3].copyWithValue(newClasificacionIAC?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var perAbdominal = double.tryParse(perAbdominalController.text);
      var percentilAbdominales = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      var iac = double.tryParse(results[2].value ?? "");
      var clasificacionIac = results[3].value;
      if (perAbdominal != null &&
          percentilAbdominales != null &&
          resultado != null &&
          iac != null &&
          clasificacionIac != null) {
        var step = Step3DTO(
            perAbdominal: perAbdominal,
            percentilAbdominales: percentilAbdominales,
            resultado: resultado,
            iac: iac,
            clasificacionIac: clasificacionIac);
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
                      controller: perAbdominalController,
                      placeholder: "PER. ABDOMINAL",
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
