import 'package:ecpfapp/Constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastNotificationType { error, success }

void showToastNotification(
    {required String text, required ToastNotificationType type}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: type == ToastNotificationType.error
          ? AppColors.toastErrorColor
          : AppColors.toastSuccessColor,
      textColor: type == ToastNotificationType.error
          ? AppColors.toastTextColor
          : AppColors.toastTextColor,
      fontSize: 14);
}
