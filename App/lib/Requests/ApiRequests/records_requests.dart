import 'package:dio/dio.dart';
import 'package:ecpfapp/Constants/api.dart';
import 'package:ecpfapp/DTOs/create_record_dto.dart';
import 'package:ecpfapp/Models/record_card_model.dart';
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

Future<List<RecordCardModel>?> getRecords(String userId, int page) async {
  try {
    var response =
        await Dio().get("$baseAPI${RecordsEndpoints.getRecords}/$userId/$page");
    var list = List<RecordCardModel>.from(response.data.map((x) {
      return RecordCardModel.fromJson(x);
    }));
    return list;
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
    return null;
  }
}

Future<RecordModel?> getRecordDetails(String recordId) async {
  try {
    var response =
        await Dio().get("$baseAPI${RecordsEndpoints.getRecord}/$recordId");
    return RecordModel.fromJson(response.data);
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
    return null;
  }
}

Future deleteRecord(String recordId) async {
  try {
    await Dio().delete("$baseAPI${RecordsEndpoints.deleteRecord}/$recordId");
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
  }
}
