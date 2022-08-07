import 'package:dio/dio.dart';
import 'package:ecpfapp/Constants/api.dart';
import 'package:ecpfapp/DTOs/create_record_dto.dart';
import 'package:ecpfapp/Models/record_model.dart';
import 'package:ecpfapp/Utils/dio_errors.dart';
import 'package:ecpfapp/Utils/toast_notification.dart';

Future<RecordModel?> createRecord(CreateRecordDTO params) async {
  try {
    var response = await Dio()
        .post("$baseAPI${RecordsEndpoints.createRecord}", data: params);
    showToastNotification(
        text: "El registro se ha creado exitosamente",
        type: ToastNotificationType.success);
    return RecordModel.fromJson(response.data);
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
    return null;
  }
}
