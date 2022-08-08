import { CreateRecordDto } from 'src/records/dto/create-record.dto';

export var isRecordValid = (record: CreateRecordDto) => {
  if (
    record.userId != null &&
    record.documento != null &&
    record.genero != null &&
    record.talla != null &&
    record.peso != null &&
    record.imc != null &&
    record.percentilImc != null &&
    record.resultadoImc != null &&
    record.porcentajeGrasa != null &&
    record.percentilGrasa != null &&
    record.resultadoGrasa != null &&
    record.perAbdominal != null &&
    record.percentilAbdominales != null &&
    record.resultadoPerAbdominal != null &&
    record.iac != null &&
    record.clasificacionIac != null &&
    record.vo2Max != null &&
    record.percentilVo2Max != null &&
    record.resultadoVo2Max != null &&
    record.fAbdo != null &&
    record.percentilAbdo != null &&
    record.resultadoFAdo != null &&
    record.fBrazos != null &&
    record.percentilFBrazos != null &&
    record.resultadoFBrazos != null &&
    record.sitAndReach != null &&
    record.percentilFlexibilidad != null &&
    record.total != null &&
    record.resultado != null &&
    record.resultadoSitAndReach
  ) {
    return true;
  }
  return false;
};
