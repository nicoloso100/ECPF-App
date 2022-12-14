export class CreateRecordDto {
  userId: string;
  documento: string;
  genero: string;
  talla: number;
  peso: number;
  imc: number;
  percentilImc: number;
  resultadoImc: string;
  porcentajeGrasa: number;
  percentilGrasa: number;
  resultadoGrasa: string;
  perAbdominal: number;
  percentilAbdominales: number;
  resultadoPerAbdominal: string;
  iac: number;
  clasificacionIac: string;
  vo2Max: number;
  percentilVo2Max: number;
  resultadoVo2Max: string;
  fAbdo: number;
  percentilAbdo: number;
  resultadoFAdo: string;
  fBrazos: number;
  percentilFBrazos: number;
  resultadoFBrazos: string;
  sitAndReach: number;
  percentilFlexibilidad: number;
  resultadoSitAndReach: string;
  total: number;
  resultado: string;
  creationDate?: Date;
}
