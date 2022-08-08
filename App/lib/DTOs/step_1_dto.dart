class Step1DTO {
  final String documento;
  final String genero;
  final double talla;
  final double peso;
  final double imc;
  final double percentilImc;
  final String resultado;

  Step1DTO(
      {required this.documento,
      required this.genero,
      required this.talla,
      required this.peso,
      required this.imc,
      required this.percentilImc,
      required this.resultado});
}
