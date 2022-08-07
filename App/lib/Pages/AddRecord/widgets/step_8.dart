import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/Entities/new_record_entity.dart';
import 'package:ecpfapp/Utils/calculations.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Step8 extends StatelessWidget {
  final bool loggeduser;
  final NewRecordEntity? result;
  final Function() onFinish;
  final Function() onCancel;

  const Step8(
      {Key? key,
      this.result,
      required this.onFinish,
      required this.onCancel,
      required this.loggeduser})
      : super(key: key);

  double getSuma() {
    var res = result;
    if (res != null) {
      var suma = res.percentilAbdo +
          res.percentilAbdominales +
          res.percentilFBrazos +
          res.percentilFlexibilidad +
          res.percentilGrasa +
          res.percentilImc +
          res.percentilVo2Max;
      var total = calculateTotal(suma);
      return total;
    }
    return 0;
  }

  String getTotal() {
    var suma = getSuma();
    return suma.toString();
  }

  String getResultado() {
    var suma = getSuma();
    if (suma >= 0) {
      return calculateTotalResultado(suma);
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step1Constants.DOCUMENTO,
                            value: result!.documento),
                        ResultItemDTO(
                            label: Step1Constants.GENERO,
                            value: result!.genero),
                        ResultItemDTO(
                            label: Step1Constants.TALLA,
                            value: result!.talla.toString()),
                        ResultItemDTO(
                            label: Step1Constants.PESO,
                            value: result!.peso.toString()),
                        ResultItemDTO(
                            label: Step1Constants.IMC,
                            value: result!.imc.toString()),
                        ResultItemDTO(
                            label: Step1Constants.PERCENTIL_IMC,
                            value: result!.percentilImc.toString()),
                        ResultItemDTO(
                            label: Step1Constants.RESULTADO,
                            value: result!.resultadoImc)
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step2Constants.GRASA,
                            value: result!.porcentajeGrasa.toString()),
                        ResultItemDTO(
                            label: Step2Constants.PERCENTIL_GRASA,
                            value: result!.percentilGrasa.toString()),
                        ResultItemDTO(
                            label: Step2Constants.RESULTADO,
                            value: result!.resultadoGrasa),
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step3Constants.PER_ABDOMINAL,
                            value: result!.perAbdominal.toString()),
                        ResultItemDTO(
                            label: Step3Constants.PERCENTIL_ABDOMINALES,
                            value: result!.percentilAbdominales.toString()),
                        ResultItemDTO(
                            label: Step3Constants.RESULTADO,
                            value: result!.resultadoPerAbdominal),
                        ResultItemDTO(
                            label: Step3Constants.IAC,
                            value: result!.iac.toString()),
                        ResultItemDTO(
                            label: Step3Constants.CLASIFICACION_IAC,
                            value: result!.clasificacionIac),
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step4Constants.VO2MAX,
                            value: result!.vo2Max.toString()),
                        ResultItemDTO(
                            label: Step4Constants.PERCENTIL_VO2MAX,
                            value: result!.percentilVo2Max.toString()),
                        ResultItemDTO(
                            label: Step4Constants.RESULTADO,
                            value: result!.resultadoVo2Max),
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step5Constants.F_ABDO,
                            value: result!.fAbdo.toString()),
                        ResultItemDTO(
                            label: Step5Constants.PERCENTIL_ABDOMINALES,
                            value: result!.percentilAbdo.toString()),
                        ResultItemDTO(
                            label: Step5Constants.RESULTADO,
                            value: result!.resultadoFAdo),
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step6Constants.F_BRAZOS,
                            value: result!.fBrazos.toString()),
                        ResultItemDTO(
                            label: Step6Constants.PERCENTIL_F_BRAZOS,
                            value: result!.percentilFBrazos.toString()),
                        ResultItemDTO(
                            label: Step6Constants.RESULTADO,
                            value: result!.resultadoFBrazos),
                      ]
                    : []),
            const Divider(),
            StepResult(
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: Step7Constants.SIT_AND_REACH,
                            value: result!.sitAndReach.toString()),
                        ResultItemDTO(
                            label: Step7Constants.PERCENTIL_FLEXIBILIDAD,
                            value: result!.percentilFlexibilidad.toString()),
                        ResultItemDTO(
                            label: Step7Constants.RESULTADO,
                            value: result!.resultadoSitAndReach),
                      ]
                    : []),
            const Divider(),
            StepResult(
                secondaryColor: true,
                result: result != null
                    ? [
                        ResultItemDTO(
                            label: ResultConstants.TOTAL, value: getTotal()),
                        ResultItemDTO(
                            label: ResultConstants.RESULTADO,
                            value: getResultado()),
                      ]
                    : []),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultButton(text: "Retroceder", onPress: onCancel),
                    DefaultButton(
                        text: loggeduser ? "Guardar" : "Cerrar",
                        onPress: onFinish),
                  ],
                ))
          ],
        ));
  }
}
