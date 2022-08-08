import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose, { Document } from 'mongoose';
import { User } from 'src/users/entities/user.entity';

export type RecordDocument = Record & Document;

@Schema()
export class Record {
  @Prop({ type: mongoose.Schema.Types.ObjectId, ref: 'User' })
  userId: User;

  @Prop({ required: true })
  documento: string;

  @Prop({ required: true })
  genero: string;

  @Prop({ required: true })
  talla: number;

  @Prop({ required: true })
  peso: number;

  @Prop({ required: true })
  imc: number;

  @Prop({ required: true })
  percentilImc: number;

  @Prop({ required: true })
  resultadoImc: string;

  @Prop({ required: true })
  porcentajeGrasa: number;

  @Prop({ required: true })
  percentilGrasa: number;

  @Prop({ required: true })
  resultadoGrasa: string;

  @Prop({ required: true })
  perAbdominal: number;

  @Prop({ required: true })
  percentilAbdominales: number;

  @Prop({ required: true })
  resultadoPerAbdominal: string;

  @Prop({ required: true })
  iac: number;

  @Prop({ required: true })
  clasificacionIac: string;

  @Prop({ required: true })
  vo2Max: number;

  @Prop({ required: true })
  percentilVo2Max: number;

  @Prop({ required: true })
  resultadoVo2Max: string;

  @Prop({ required: true })
  fAbdo: number;

  @Prop({ required: true })
  percentilAbdo: number;

  @Prop({ required: true })
  resultadoFAdo: string;

  @Prop({ required: true })
  fBrazos: number;

  @Prop({ required: true })
  percentilFBrazos: number;

  @Prop({ required: true })
  resultadoFBrazos: string;

  @Prop({ required: true })
  sitAndReach: number;

  @Prop({ required: true })
  percentilFlexibilidad: number;

  @Prop({ required: true })
  resultadoSitAndReach: string;

  @Prop({ required: true })
  total: number;

  @Prop({ required: true })
  resultado: string;

  @Prop({ required: true })
  creationDate: Date;
}

export const RecordSchema = SchemaFactory.createForClass(Record);
