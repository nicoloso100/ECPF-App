import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { RecordsModule } from './records/records.module';

@Module({
  imports: [
    MongooseModule.forRoot('mongodb://localhost:27017/ecpf'),
    UsersModule,
    RecordsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
