import 'package:ecpfapp/DTOs/step_1_dto.dart';
import 'package:ecpfapp/DTOs/step_2_dto.dart';
import 'package:ecpfapp/DTOs/step_3_dto.dart';
import 'package:ecpfapp/DTOs/step_4_dto.dart';
import 'package:ecpfapp/DTOs/step_5_dto.dart';
import 'package:ecpfapp/DTOs/step_6_dto.dart';
import 'package:ecpfapp/DTOs/step_7_dto.dart';

class NewRecordEntity {
  final String documento;
  final String genero;
  final double talla;
  final double peso;
  final double imc;
  final double percentilImc;
  final double resultadoImc;
  final double porcentajeGrasa;
  final double percentilGrasa;
  final String resultadoGrasa;
  final double perAbdominal;
  final double percentilAbdominales;
  final String resultadoPerAbdominal;
  final double iac;
  final String clasificacionIac;
  final double vo2Max;
  final double percentilVo2Max;
  final String resultadoVo2Max;
  final double fAbdo;
  final double percentilAbdo;
  final String resultadoFAdo;
  final double fBrazos;
  final double percentilFBrazos;
  final String resultadoFBrazos;
  final double sitAndReach;
  final double percentilFlexibilidad;
  final String resultadoSitAndReach;

  NewRecordEntity(
      {required this.documento,
      required this.genero,
      required this.talla,
      required this.peso,
      required this.imc,
      required this.percentilImc,
      required this.resultadoImc,
      required this.porcentajeGrasa,
      required this.percentilGrasa,
      required this.resultadoGrasa,
      required this.perAbdominal,
      required this.percentilAbdominales,
      required this.resultadoPerAbdominal,
      required this.iac,
      required this.clasificacionIac,
      required this.vo2Max,
      required this.percentilVo2Max,
      required this.resultadoVo2Max,
      required this.fAbdo,
      required this.percentilAbdo,
      required this.resultadoFAdo,
      required this.fBrazos,
      required this.percentilFBrazos,
      required this.resultadoFBrazos,
      required this.sitAndReach,
      required this.percentilFlexibilidad,
      required this.resultadoSitAndReach});

  static NewRecordEntity generateFromDTOs(
      {required Step1DTO step1DTO,
      required Step2DTO step2DTO,
      required Step3DTO step3DTO,
      required Step4DTO step4DTO,
      required Step5DTO step5DTO,
      required Step6DTO step6DTO,
      required Step7DTO step7DTO}) {
    return NewRecordEntity(
        documento: step1DTO.documento,
        genero: step1DTO.genero,
        talla: step1DTO.talla,
        peso: step1DTO.peso,
        imc: step1DTO.imc,
        percentilImc: step1DTO.percentilImc,
        resultadoImc: step1DTO.resultado,
        porcentajeGrasa: step2DTO.porcentajeGrasa,
        percentilGrasa: step2DTO.percentilGrasa,
        resultadoGrasa: step2DTO.resultado,
        perAbdominal: step3DTO.perAbdominal,
        percentilAbdominales: step3DTO.percentilAbdominales,
        resultadoPerAbdominal: step3DTO.resultado,
        iac: step3DTO.iac,
        clasificacionIac: step3DTO.clasificacionIac,
        vo2Max: step4DTO.vo2Max,
        percentilVo2Max: step4DTO.percentilVo2Max,
        resultadoVo2Max: step4DTO.resultado,
        fAbdo: step5DTO.fAbdo,
        percentilAbdo: step5DTO.percentilAbdominales,
        resultadoFAdo: step5DTO.resultado,
        fBrazos: step6DTO.fBrazos,
        percentilFBrazos: step6DTO.percentilFBrazos,
        resultadoFBrazos: step6DTO.resultado,
        sitAndReach: step7DTO.sitAndReach,
        percentilFlexibilidad: step7DTO.percentilFlexibilidad,
        resultadoSitAndReach: step7DTO.resultado);
  }
}
