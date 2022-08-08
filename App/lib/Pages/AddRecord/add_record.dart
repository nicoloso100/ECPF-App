import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/DTOs/create_record_dto.dart';
import 'package:ecpfapp/DTOs/step_1_dto.dart';
import 'package:ecpfapp/DTOs/step_2_dto.dart';
import 'package:ecpfapp/DTOs/step_3_dto.dart';
import 'package:ecpfapp/DTOs/step_4_dto.dart';
import 'package:ecpfapp/DTOs/step_5_dto.dart';
import 'package:ecpfapp/DTOs/step_6_dto.dart';
import 'package:ecpfapp/DTOs/step_7_dto.dart';
import 'package:ecpfapp/Entities/new_record_entity.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_1.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_2.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_3.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_4.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_5.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_6.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_7.dart';
import 'package:ecpfapp/Pages/AddRecord/widgets/step_8.dart';
import 'package:ecpfapp/Requests/ApiRequests/records_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:ecpfapp/Utils/dialog_notification.dart';
import 'package:ecpfapp/Utils/toast_notification.dart';
import 'package:ecpfapp/Widgets/custom_app_bar.dart';
import 'package:ecpfapp/Widgets/stepper_icon.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddRecordPage extends StatefulWidget {
  final bool loggeduser;
  const AddRecordPage({Key? key, required this.loggeduser}) : super(key: key);

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  int currentStep = 0;
  Step1DTO? step1DTO;
  Step2DTO? step2DTO;
  Step3DTO? step3DTO;
  Step4DTO? step4DTO;
  Step5DTO? step5DTO;
  Step6DTO? step6DTO;
  Step7DTO? step7DTO;
  NewRecordEntity? result;

  void onStepCancel() {
    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
    }
  }

  void onStepContinue() {
    setState(() {
      currentStep = currentStep + 1;
    });
  }

  void onStepTapped(int tappedStep) {
    if (tappedStep < currentStep) {
      setState(() {
        currentStep = tappedStep;
      });
    }
  }

  void onFinishStep1(Step1DTO step) {
    step1DTO = step;
    onStepContinue();
  }

  void onFinishStep2(Step2DTO step) {
    step2DTO = step;
    onStepContinue();
  }

  void onFinishStep3(Step3DTO step) {
    step3DTO = step;
    onStepContinue();
  }

  void onFinishStep4(Step4DTO step) {
    step4DTO = step;
    onStepContinue();
  }

  void onFinishStep5(Step5DTO step) {
    step5DTO = step;
    onStepContinue();
  }

  void onFinishStep6(Step6DTO step) {
    step6DTO = step;
    onStepContinue();
  }

  void onFinishStep7(Step7DTO step) {
    step7DTO = step;
    if (step1DTO != null &&
        step2DTO != null &&
        step3DTO != null &&
        step4DTO != null &&
        step5DTO != null &&
        step6DTO != null &&
        step7DTO != null) {
      setState(() {
        result = NewRecordEntity.generateFromDTOs(
          step1DTO: step1DTO!,
          step2DTO: step2DTO!,
          step3DTO: step3DTO!,
          step4DTO: step4DTO!,
          step5DTO: step5DTO!,
          step6DTO: step6DTO!,
          step7DTO: step7DTO!,
        );
      });
      onStepContinue();
    }
  }

  void onReturnToRecordList() {
    Navigator.pushReplacementNamed(context, LoggedRoutes.showRecords);
  }

  void onSave(double total, String resultado) async {
    if (widget.loggeduser) {
      var session = await getSession();
      if (session != null) {
        var entity = result;
        if (entity != null) {
          var params = CreateRecordDTO.getDtoFromEntity(
              entity, session, total, resultado);
          var record = await createRecord(params);
          if (record != null) {
            onReturnToRecordList();
          }
        } else {
          () => showToastNotification(
              text: "El formualrio no se encuentra completo",
              type: ToastNotificationType.error);
        }
      } else {
        () => showToastNotification(
            text:
                "No se ha encontrado el ID de la sesión, por favor cierre sesión e ingrese nuevamente",
            type: ToastNotificationType.error);
      }
    } else {
      Navigator.pop(context);
    }
  }

  void onBack() {
    if (widget.loggeduser) {
      showConfirmationDialog(context,
          title: "Salir",
          description:
              "¿Está seguro que desea salir de la creación de un registro? Perderá todos los datos ingresados",
          onOk: () async {
        onReturnToRecordList();
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Scaffold(
      appBar: CustomAppBar(customOnBack: onBack),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            widget.loggeduser ? 'Agregar nuevo registro' : 'Calculadora',
            style: TextStyle(
                color: theme.defaultTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          Flexible(
              child: EnhanceStepper(
                  currentStep: currentStep,
                  onStepTapped: onStepTapped,
                  stepIconSize: 25,
                  physics: const ClampingScrollPhysics(),
                  steps: <EnhanceStep>[
                    EnhanceStep(
                      icon: StepperIcon(step: 1, currentStep: currentStep),
                      title: Text('Información básica',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step1(
                          defaultValues: step1DTO, onFinish: onFinishStep1),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 2, currentStep: currentStep),
                      title: Text('Grasa',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step2(
                          defaultValues: step2DTO,
                          onFinish: onFinishStep2,
                          onCancel: onStepCancel),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 3, currentStep: currentStep),
                      title: Text('Abdominal e IAC',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step3(
                          defaultValues: step3DTO,
                          onFinish: onFinishStep3,
                          onCancel: onStepCancel,
                          talla: step1DTO != null ? step1DTO!.talla : 0),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 4, currentStep: currentStep),
                      title: Text('VO2 MAX',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step4(
                          defaultValues: step4DTO,
                          onFinish: onFinishStep4,
                          onCancel: onStepCancel),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 5, currentStep: currentStep),
                      title: Text('F. Abdo',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step5(
                          defaultValues: step5DTO,
                          onFinish: onFinishStep5,
                          onCancel: onStepCancel),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 6, currentStep: currentStep),
                      title: Text('F. Brazos',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step6(
                          defaultValues: step6DTO,
                          onFinish: onFinishStep6,
                          onCancel: onStepCancel),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 7, currentStep: currentStep),
                      title: Text('Sit and Reach',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step7(
                          defaultValues: step7DTO,
                          onFinish: onFinishStep7,
                          onCancel: onStepCancel),
                    ),
                    EnhanceStep(
                      icon: StepperIcon(step: 8, currentStep: currentStep),
                      title: Text('Resultado total',
                          style: TextStyle(color: theme.defaultTextColor)),
                      content: Step8(
                          loggeduser: widget.loggeduser,
                          result: result,
                          onFinish: onSave,
                          onCancel: onStepCancel),
                    ),
                  ],
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Container();
                  }))
        ],
      )),
    );
  }
}
