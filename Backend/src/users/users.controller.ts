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
import { UsersService } from './users.service';
import { SignUserDto } from './dto/sign-user.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/signUp')
  async create(@Body() signUserDto: SignUserDto) {
    if (signUserDto.email != null && signUserDto.password != null) {
      return await this.usersService.create(signUserDto);
    } else {
      throw new HttpException(
        'Debe ingresar el usuario y la contraseña',
        HttpStatus.BAD_REQUEST,
      );
    }
  }

  @Post('/signIn')
  async findOne(@Body() signUserDto: SignUserDto) {
    if (signUserDto.email != null && signUserDto.password != null) {
      return await this.usersService.validate(signUserDto);
    } else {
      throw new HttpException(
        'Debe ingresar el usuario y la contraseña',
        HttpStatus.BAD_REQUEST,
      );
    }
  }
}
