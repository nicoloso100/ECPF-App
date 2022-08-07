import 'package:dio/dio.dart';
import 'package:ecpfapp/Constants/api.dart';
import 'package:ecpfapp/DTOs/sign_user_dto.dart';
import 'package:ecpfapp/Models/sign_user_model.dart';
import 'package:ecpfapp/Utils/dio_errors.dart';
import 'package:ecpfapp/Utils/toast_notification.dart';

Future<SignUserModel?> signUpUser(SignUserDTO params) async {
  try {
    var response =
        await Dio().post("$baseAPI${UsersEndpoints.signUp}", data: params);
    showToastNotification(
        text: "El usuario ha sido registrado exitosamente",
        type: ToastNotificationType.success);
    return SignUserModel.fromJson(response.data);
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
    return null;
  }
}

Future<SignUserModel?> signInUser(SignUserDTO params) async {
  try {
    var response =
        await Dio().post("$baseAPI${UsersEndpoints.signIn}", data: params);
    return SignUserModel.fromJson(response.data);
  } catch (e) {
    showToastNotification(
        text: getErrorMessage(e), type: ToastNotificationType.error);
    return null;
  }
}
