import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Constants/steps.dart';
import 'package:ecpfapp/DTOs/result_item_dto.dart';
import 'package:ecpfapp/Models/record_model.dart';
import 'package:ecpfapp/Requests/ApiRequests/records_requests.dart';
import 'package:ecpfapp/Utils/dialog_notification.dart';
import 'package:ecpfapp/Utils/toast_notification.dart';
import 'package:ecpfapp/Widgets/app_bar_icon.dart';
import 'package:ecpfapp/Widgets/custom_app_bar.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/step_result.dart';
import 'package:ecpfapp/Widgets/full_screen_loading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RecordDetails extends StatefulWidget {
  final String? recordId;
  const RecordDetails({Key? key, required this.recordId}) : super(key: key);

  @override
  State<RecordDetails> createState() => _RecordDetailsState();
}

class _RecordDetailsState extends State<RecordDetails> {
  RecordModel? record;

  @override
  void initState() {
    super.initState();
    getRecord();
  }

  void getRecord() async {
    var id = widget.recordId;
    if (id != null) {
      var result = await getRecordDetails(id);
      if (result != null) {
        setState(() {
          record = result;
        });
      }
    } else {
      showToastNotification(
          text:
              "No se ha podido obtener la información del registro, por favor inténtelo nuevamente",
          type: ToastNotificationType.error);
    }
  }

  void navigateToLoogedHome() {
    Navigator.pushReplacementNamed(context, LoggedRoutes.showRecords);
  }

  void onDeleteRecord(String? recordId) {
    if (recordId != null) {
      showConfirmationDialog(context,
          title: "Eliminar registro",
          description: "¿Está seguro que desea eliminar el registro?",
          onOk: () async {
        await deleteRecord(recordId);
        showToastNotification(
            text: "El registro se ha eliminado satisfactoriamente",
            type: ToastNotificationType.success);
        navigateToLoogedHome();
      });
    } else {
      showToastNotification(
          text:
              "No se ha podido obtener la información del registro, por favor inténtelo nuevamente",
          type: ToastNotificationType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    var description = record;
    return Scaffold(
      appBar: CustomAppBar(customOnBack: navigateToLoogedHome, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBarIcon(
                text: "Eliminar",
                icon: Icons.delete_outline,
                onPress: () => onDeleteRecord(description?.id)),
            const SizedBox(width: 10)
          ],
        )
      ]),
      body: SafeArea(
          child: description != null
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(children: [
                        Text(
                          'Detalle del registro:',
                          style: TextStyle(
                              color: theme.defaultTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        )
                      ]),
                      const SizedBox(height: 30),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step1Constants.DOCUMENTO,
                            value: description.documento),
                        ResultItemDTO(
                            label: Step1Constants.GENERO,
                            value: description.genero),
                        ResultItemDTO(
                            label: Step1Constants.TALLA,
                            value: description.talla.toString()),
                        ResultItemDTO(
                            label: Step1Constants.PESO,
                            value: description.peso.toString()),
                        ResultItemDTO(
                            label: Step1Constants.IMC,
                            value: description.imc.toString()),
                        ResultItemDTO(
                            label: Step1Constants.PERCENTIL_IMC,
                            value: description.percentilImc.toString()),
                        ResultItemDTO(
                            label: Step1Constants.RESULTADO,
                            value: description.resultadoImc.toString())
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step2Constants.GRASA,
                            value: description.porcentajeGrasa.toString()),
                        ResultItemDTO(
                            label: Step2Constants.PERCENTIL_GRASA,
                            value: description.percentilGrasa.toString()),
                        ResultItemDTO(
                            label: Step2Constants.RESULTADO,
                            value: description.resultadoGrasa),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step3Constants.PER_ABDOMINAL,
                            value: description.perAbdominal.toString()),
                        ResultItemDTO(
                            label: Step3Constants.PERCENTIL_ABDOMINALES,
                            value: description.percentilAbdominales.toString()),
                        ResultItemDTO(
                            label: Step3Constants.RESULTADO,
                            value: description.resultadoPerAbdominal),
                        ResultItemDTO(
                            label: Step3Constants.IAC,
                            value: description.iac.toString()),
                        ResultItemDTO(
                            label: Step3Constants.CLASIFICACION_IAC,
                            value: description.clasificacionIac),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step4Constants.VO2MAX,
                            value: description.vo2Max.toString()),
                        ResultItemDTO(
                            label: Step4Constants.PERCENTIL_VO2MAX,
                            value: description.percentilVo2Max.toString()),
                        ResultItemDTO(
                            label: Step4Constants.RESULTADO,
                            value: description.resultadoVo2Max),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step5Constants.F_ABDO,
                            value: description.fAbdo.toString()),
                        ResultItemDTO(
                            label: Step5Constants.PERCENTIL_ABDOMINALES,
                            value: description.percentilAbdo.toString()),
                        ResultItemDTO(
                            label: Step5Constants.RESULTADO,
                            value: description.resultadoFAdo),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step6Constants.F_BRAZOS,
                            value: description.fBrazos.toString()),
                        ResultItemDTO(
                            label: Step6Constants.PERCENTIL_F_BRAZOS,
                            value: description.percentilFBrazos.toString()),
                        ResultItemDTO(
                            label: Step6Constants.RESULTADO,
                            value: description.resultadoFBrazos),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(result: [
                        ResultItemDTO(
                            label: Step7Constants.SIT_AND_REACH,
                            value: description.sitAndReach.toString()),
                        ResultItemDTO(
                            label: Step7Constants.PERCENTIL_FLEXIBILIDAD,
                            value:
                                description.percentilFlexibilidad.toString()),
                        ResultItemDTO(
                            label: Step7Constants.RESULTADO,
                            value: description.resultadoSitAndReach),
                      ]),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      StepResult(secondaryColor: true, result: [
                        ResultItemDTO(
                            label: ResultConstants.TOTAL,
                            value: description.total.toString()),
                        ResultItemDTO(
                            label: ResultConstants.RESULTADO,
                            value: description.resultado),
                      ]),
                      const SizedBox(height: 20),
                      DefaultButton(
                          text: "Cerrar", onPress: () => Navigator.pop(context))
                    ],
                  ))
              : const FullScreenLoading()),
    );
  }
}
