import 'package:ecpfapp/Entities/new_record_entity.dart';

class CreateRecordDTO {
  final String userId;
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

  CreateRecordDTO(
      {required this.userId,
      required this.documento,
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

  static CreateRecordDTO getDtoFromEntity(
      NewRecordEntity entity, String userId) {
    return CreateRecordDTO(
        userId: userId,
        documento: entity.documento,
        genero: entity.genero,
        talla: entity.talla,
        peso: entity.peso,
        imc: entity.imc,
        percentilImc: entity.percentilImc,
        resultadoImc: entity.resultadoImc,
        porcentajeGrasa: entity.porcentajeGrasa,
        percentilGrasa: entity.percentilGrasa,
        resultadoGrasa: entity.resultadoGrasa,
        perAbdominal: entity.perAbdominal,
        percentilAbdominales: entity.percentilAbdominales,
        resultadoPerAbdominal: entity.resultadoPerAbdominal,
        iac: entity.iac,
        clasificacionIac: entity.clasificacionIac,
        vo2Max: entity.vo2Max,
        percentilVo2Max: entity.percentilVo2Max,
        resultadoVo2Max: entity.resultadoVo2Max,
        fAbdo: entity.fAbdo,
        percentilAbdo: entity.percentilAbdo,
        resultadoFAdo: entity.resultadoFAdo,
        fBrazos: entity.fBrazos,
        percentilFBrazos: entity.percentilFBrazos,
        resultadoFBrazos: entity.resultadoFBrazos,
        sitAndReach: entity.sitAndReach,
        percentilFlexibilidad: entity.percentilFlexibilidad,
        resultadoSitAndReach: entity.resultadoSitAndReach);
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "documento": documento,
      "genero": genero,
      "talla": talla,
      "peso": peso,
      "imc": imc,
      "percentilImc": percentilImc,
      "resultadoImc": resultadoImc,
      "porcentajeGrasa": porcentajeGrasa,
      "percentilGrasa": percentilGrasa,
      "resultadoGrasa": resultadoGrasa,
      "perAbdominal": perAbdominal,
      "percentilAbdominales": percentilAbdominales,
      "resultadoPerAbdominal": resultadoPerAbdominal,
      "iac": iac,
      "clasificacionIac": clasificacionIac,
      "vo2Max": vo2Max,
      "percentilVo2Max": percentilVo2Max,
      "resultadoVo2Max": resultadoVo2Max,
      "fAbdo": fAbdo,
      "percentilAbdo": percentilAbdo,
      "resultadoFAdo": resultadoFAdo,
      "fBrazos": fBrazos,
      "percentilFBrazos": percentilFBrazos,
      "resultadoFBrazos": resultadoFBrazos,
      "sitAndReach": sitAndReach,
      "percentilFlexibilidad": percentilFlexibilidad,
      "resultadoSitAndReach": resultadoSitAndReach
    };
  }
}
