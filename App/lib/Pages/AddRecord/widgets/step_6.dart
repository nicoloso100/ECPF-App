import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_6_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step6 extends StatefulWidget {
  final Step6DTO? defaultValues;
  final Function(Step6DTO step) onFinish;
  final Function() onCancel;
  const Step6(
      {Key? key,
      required this.onFinish,
      required this.onCancel,
      required this.defaultValues})
      : super(key: key);

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  final _formKey = GlobalKey<FormState>();

  final fBrazosController = TextEditingController();

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step6Constants.PERCENTIL_F_BRAZOS, value: null),
    ResultItemDTO(label: Step6Constants.RESULTADO, value: null),
  ];

  @override
  void initState() {
    super.initState();
    fBrazosController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      fBrazosController.text = defaultValues.fBrazos.toString();
    }
  }

  void onCalculareResult() {
    if (fBrazosController.text.isNotEmpty) {
      var fBrazos = double.tryParse(fBrazosController.text);
      if (fBrazos != null) {
        setNewValueOnResults(fBrazos);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? fBrazos) {
    var newPercentilFAbdo =
        fBrazos != null ? calculatePercentilFBrazos(fBrazos) : null;
    var newResultado =
        fBrazos != null ? calculateFBrazosResultado(fBrazos) : null;

    var neResults = results;
    neResults[0] = neResults[0].copyWithValue(newPercentilFAbdo?.toString());
    neResults[1] = neResults[1].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate()) {
      var fBrazos = double.tryParse(fBrazosController.text);
      var percentilFBrazos = double.tryParse(results[0].value ?? "");
      var resultado = results[1].value;
      if (fBrazos != null && percentilFBrazos != null && resultado != null) {
        var step = Step6DTO(
            fBrazos: fBrazos,
            percentilFBrazos: percentilFBrazos,
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
                      controller: fBrazosController,
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
