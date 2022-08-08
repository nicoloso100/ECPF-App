import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateRecordDto } from './dto/create-record.dto';
import { UpdateRecordDto } from './dto/update-record.dto';
import { Record, RecordDocument } from './entities/record.entity';

const recordsPerPage = 10;

@Injectable()
export class RecordsService {
  constructor(
    @InjectModel(Record.name) private recordModel: Model<RecordDocument>,
  ) {}

  async create(createRecordDto: CreateRecordDto) {
    try {
      createRecordDto.creationDate = new Date();
      const createdRecord = new this.recordModel(createRecordDto);
      createdRecord.save();
      return createdRecord;
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al guardar el registro, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findAll(userId: string, page: number) {
    try {
      let records = await this.recordModel
        .find(
          { user: userId },
          {
            percentilImc: 1,
            porcentajeGrasa: 1,
            percentilAbdominales: 1,
            percentilVo2Max: 1,
            percentilAbdo: 1,
            percentilFBrazos: 1,
            percentilFlexibilidad: 1,
            creationDate: 1,
            total: 1,
            resultado: 1,
          },
        )
        .sort({ creationDate: -1 })
        .skip(page * recordsPerPage)
        .limit(recordsPerPage);
      return records;
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al obtener los registros, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findOne(id: string) {
    let record = null;
    try {
      record = await this.recordModel.findById(id);
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al obtener el detalle del registro, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
    if (record) {
      return record;
    } else {
      throw new HttpException(
        'El ID que ha ingresado no existe',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  async remove(id: string) {
    try {
      await this.recordModel.findByIdAndDelete(id);
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al eliminar el registro, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  update(id: number, updateRecordDto: UpdateRecordDto) {
    return `This action updates a #${id} record`;
  }
}
