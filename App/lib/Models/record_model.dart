class RecordModel {
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
  final DateTime creationDate;

  RecordModel(
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
      required this.resultadoSitAndReach,
      required this.creationDate});

  factory RecordModel.fromJson(Map<String, dynamic> json) => RecordModel(
      userId: json['userId'],
      documento: json['documento'],
      genero: json['genero'],
      talla: json['talla'].toDouble(),
      peso: json['peso'].toDouble(),
      imc: json['imc'].toDouble(),
      percentilImc: json['percentilImc'].toDouble(),
      resultadoImc: json['resultadoImc'].toDouble(),
      porcentajeGrasa: json['porcentajeGrasa'].toDouble(),
      percentilGrasa: json['percentilGrasa'].toDouble(),
      resultadoGrasa: json['resultadoGrasa'],
      perAbdominal: json['perAbdominal'].toDouble(),
      percentilAbdominales: json['percentilAbdominales'].toDouble(),
      resultadoPerAbdominal: json['resultadoPerAbdominal'],
      iac: json['iac'].toDouble(),
      clasificacionIac: json['clasificacionIac'],
      vo2Max: json['vo2Max'].toDouble(),
      percentilVo2Max: json['percentilVo2Max'].toDouble(),
      resultadoVo2Max: json['resultadoVo2Max'],
      fAbdo: json['fAbdo'].toDouble(),
      percentilAbdo: json['percentilAbdo'].toDouble(),
      resultadoFAdo: json['resultadoFAdo'],
      fBrazos: json['fBrazos'].toDouble(),
      percentilFBrazos: json['percentilFBrazos'].toDouble(),
      resultadoFBrazos: json['resultadoFBrazos'],
      sitAndReach: json['sitAndReach'].toDouble(),
      percentilFlexibilidad: json['percentilFlexibilidad'].toDouble(),
      resultadoSitAndReach: json['resultadoSitAndReach'],
      creationDate: DateTime.parse(json['creationDate']));
}
