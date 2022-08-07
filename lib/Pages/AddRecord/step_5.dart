import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_5_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step5 extends StatefulWidget {
  final Step5DTO? defaultValues;
  final Function(Step5DTO step) onFinish;
  final Function() onCancel;
  const Step5(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final _formKey = GlobalKey<FormState>();

  final fAbdoController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step5Constants.PERCENTIL_ABDOMINALES, value: null),
    ResultItemDTO(label: Step5Constants.RESULTADO, value: null),
  ];

  @override
  void initState() {
    super.initState();
    fAbdoController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      fAbdoController.text = defaultValues.fAbdo.toString();
    }
  }

  void onCalculareResult() {
    if (fAbdoController.text.isNotEmpty) {
      var fAbdo = double.tryParse(fAbdoController.text);
      if (fAbdo != null) {
        setNewValueOnResults(fAbdo);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? fAbdo) {
    var newPercentilAbdominales =
        fAbdo != null ? calculatePercentilAbdo(fAbdo) : null;
    var newResultado = fAbdo != null ? calculateAbdoResultado(fAbdo) : null;

    var neResults = results;
    neResults[0] =
        neResults[0].copyWithValue(newPercentilAbdominales?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var fAbdo = double.tryParse(fAbdoController.text);
      var percentilAbdominales = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      if (fAbdo != null && percentilAbdominales != null && resultado != null) {
        var step = Step5DTO(
            fAbdo: fAbdo,
            percentilAbdominales: percentilAbdominales,
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
                      controller: fAbdoController,
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
