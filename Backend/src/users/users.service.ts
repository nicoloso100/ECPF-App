import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { SignUserDto } from './dto/sign-user.dto';
import { User, UserDocument } from './entities/user.entity';
import * as bcrypt from 'bcryptjs';

@Injectable()
export class UsersService {
  constructor(@InjectModel(User.name) private userModel: Model<UserDocument>) {}

  async create(signUserDto: SignUserDto) {
    const user = await this.userModel.findOne({ email: signUserDto.email });
    if (user) {
      throw new HttpException(
        'El usuario ingresado ya existe',
        HttpStatus.BAD_REQUEST,
      );
    }
    try {
      const password = await bcrypt.hash(signUserDto.password, 10);
      signUserDto.password = password;
      signUserDto.creationDate = new Date();
      const createdStore = new this.userModel(signUserDto);
      await createdStore.save();
      return {
        email: signUserDto.email,
      };
    } catch (error) {
      throw new HttpException(
        'Ha ocurrido un error al registrar al usuario, por favor intentelo nuevamente',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async validate(signUserDto: SignUserDto) {
    const user = await this.userModel.findOne({ email: signUserDto.email });
    if (user) {
      const passMatch = await bcrypt.compare(
        signUserDto.password,
        user.password,
      );
      if (passMatch) {
        return {
          id: user.id,
          email: signUserDto.email,
        };
      } else {
        throw new HttpException(
          'La contraseña ingresada es incorrecta',
          HttpStatus.FORBIDDEN,
        );
      }
    } else {
      throw new HttpException(
        'El usuario ingresado no existe',
        HttpStatus.FORBIDDEN,
      );
    }
  }
}
