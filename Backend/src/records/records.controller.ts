import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { RecordsService } from './records.service';
import { CreateRecordDto } from './dto/create-record.dto';
import { UpdateRecordDto } from './dto/update-record.dto';
import { isRecordValid } from 'src/utils/record_validator';

@Controller('records')
export class RecordsController {
  constructor(private readonly recordsService: RecordsService) {}

  @Post('/create-record')
  async create(@Body() createRecordDto: CreateRecordDto) {
    if (isRecordValid(createRecordDto)) {
      return await this.recordsService.create(createRecordDto);
    } else {
      throw new HttpException(
        'El formulario está incompleto',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  @Get('/get-all-records/:id/:page')
  async findAll(@Param('id') id: string, @Param('page') page: number) {
    if (id != null && page != null) {
      return await this.recordsService.findAll(id, page);
    } else {
      throw new HttpException(
        'Debe ingresar el ID del usuario y la paginación',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  @Get('/get-record/:id')
  async findOne(@Param('id') id: string) {
    if (id != null) {
      return await this.recordsService.findOne(id);
    } else {
      throw new HttpException(
        'Debe ingresar el ID del registro',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  @Delete('/delete-record/:id')
  async remove(@Param('id') id: string) {
    if (id != null) {
      await this.recordsService.remove(id);
    } else {
      throw new HttpException(
        'Debe ingresar el ID del registro',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRecordDto: UpdateRecordDto) {
    return this.recordsService.update(+id, updateRecordDto);
  }
}
