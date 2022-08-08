class RecordCardModel {
  final String id;
  final double percentilImc;
  final double porcentajeGrasa;
  final double percentilAbdominales;
  final double percentilVo2Max;
  final double percentilAbdo;
  final double percentilFBrazos;
  final double percentilFlexibilidad;
  final double total;
  final String resultado;
  final DateTime creationDate;

  RecordCardModel(
      {required this.id,
      required this.percentilImc,
      required this.porcentajeGrasa,
      required this.percentilAbdominales,
      required this.percentilVo2Max,
      required this.percentilAbdo,
      required this.percentilFBrazos,
      required this.percentilFlexibilidad,
      required this.total,
      required this.resultado,
      required this.creationDate});

  factory RecordCardModel.fromJson(Map<String, dynamic> json) =>
      RecordCardModel(
          id: json['_id'],
          percentilImc: json['percentilImc'].toDouble(),
          porcentajeGrasa: json['porcentajeGrasa'].toDouble(),
          percentilAbdominales: json['percentilAbdominales'].toDouble(),
          percentilVo2Max: json['percentilVo2Max'].toDouble(),
          percentilAbdo: json['percentilAbdo'].toDouble(),
          percentilFBrazos: json['percentilFBrazos'].toDouble(),
          percentilFlexibilidad: json['percentilFlexibilidad'].toDouble(),
          total: json['total'].toDouble(),
          resultado: json['resultado'],
          creationDate: DateTime.parse(json['creationDate']));
}
