import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateRecordDto } from './dto/create-record.dto';
import { UpdateRecordDto } from './dto/update-record.dto';
import { Record, RecordDocument } from './entities/record.entity';

@Injectable()
export class RecordsService {
  constructor(
    @InjectModel(Record.name) private recordModel: Model<RecordDocument>,
  ) {}

  create(createRecordDto: CreateRecordDto) {
    try {
      createRecordDto.creationDate = new Date();
      const createdRecord = new this.recordModel(createRecordDto);
      createdRecord.save();
      return createRecordDto;
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al guardar el registro, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  findAll() {
    return `This action returns all records`;
  }

  findOne(id: number) {
    return `This action returns a #${id} record`;
  }

  update(id: number, updateRecordDto: UpdateRecordDto) {
    return `This action updates a #${id} record`;
  }

  remove(id: number) {
    return `This action removes a #${id} record`;
  }
}
