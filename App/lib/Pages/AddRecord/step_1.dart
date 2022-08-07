import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/DTOs/step_1_dto.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_input_field.dart';
import 'package:ecpfapp/Widgets/default_select_field.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step1 extends StatefulWidget {
  final Step1DTO? defaultValues;
  final Function(Step1DTO step) onFinish;
  const Step1({Key? key, required this.onFinish, required this.defaultValues})
      : super(key: key);

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final _formKey = GlobalKey<FormState>();

  final documentoController = TextEditingController();
  final tallaController = TextEditingController();
  final pesoController = TextEditingController();
  String? generoSelection;

  List<ResultItemDTO> results = [
    ResultItemDTO(label: Step1Constants.IMC, value: null),
    ResultItemDTO(label: Step1Constants.PERCENTIL_IMC, value: null),
    ResultItemDTO(label: Step1Constants.RESULTADO, value: null)
  ];

  @override
  void initState() {
    super.initState();
    tallaController.addListener(onCalculareResult);
    pesoController.addListener(onCalculareResult);
    var defaultValues = widget.defaultValues;
    if (defaultValues != null) {
      documentoController.text = defaultValues.documento;
      generoSelection = defaultValues.genero;
      tallaController.text = defaultValues.talla.toString();
      pesoController.text = defaultValues.peso.toString();
    }
  }

  void onCalculareResult() {
    if (tallaController.text.isNotEmpty && pesoController.text.isNotEmpty) {
      var talla = double.tryParse(tallaController.text);
      var peso = double.tryParse(pesoController.text);
      if (talla != null && peso != null) {
        var newIMC = calculateIMC(talla, peso);
        setNewValueOnResults(newIMC);
      } else {
        setNewValueOnResults(null);
      }
    } else {
      setNewValueOnResults(null);
    }
  }

  void setNewValueOnResults(double? newIMC) {
    var newPercentilIMC = newIMC != null ? calculatePercentilIMC(newIMC) : null;
    var newResultado = newIMC != null ? calculateIMCResultado(newIMC) : null;

    var neResults = results;
    neResults[0] = neResults[0].copyWithValue(newIMC?.toString());
    neResults[1] = neResults[1].copyWithValue(newPercentilIMC?.toString());
    neResults[2] = neResults[2].copyWithValue(newResultado?.toString());
    setState(() {
      results = neResults;
    });
  }

  void onFinish() {
    if (_formKey.currentState!.validate() && generoSelection != null) {
      var talla = double.tryParse(tallaController.text);
      var peso = double.tryParse(pesoController.text);
      var imc = double.tryParse(results[0].value ?? "");
      var percentilImc = double.tryParse(results[1].value ?? "");
      var resultado = results[0].value;
      if (talla != null &&
          peso != null &&
          imc != null &&
          percentilImc != null &&
          resultado != null) {
        var step = Step1DTO(
            documento: documentoController.text,
            genero: generoSelection!,
            talla: talla,
            peso: peso,
            imc: imc,
            percentilImc: percentilImc,
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
                    controller: documentoController,
                    placeholder: "Documento de identidad",
                    onlyNumbers: true),
                const SizedBox(height: 20),
                DefaultSelectField(
                    placeholder: "Género",
                    items: generos,
                    defaultValue: generoSelection,
                    onSelect: (String value) => generoSelection = value),
                const SizedBox(height: 20),
                DefaultInputField(
                    controller: tallaController,
                    placeholder: "Talla",
                    onlyNumbers: true),
                const SizedBox(height: 20),
                DefaultInputField(
                    controller: pesoController,
                    placeholder: "Peso",
                    onlyNumbers: true),
                const SizedBox(height: 20),
                StepResult(result: results),
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultButton(text: "Continuar", onPress: onFinish),
                ],
              ))
        ],
      ),
    );
  }
}
