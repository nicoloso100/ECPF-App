import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/DTOs/sign_user_dto.dart';
import 'package:ecpfapp/Requests/ApiRequests/users_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:ecpfapp/Utils/toast_notification.dart';
import 'package:ecpfapp/Widgets/custom_app_bar.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_email_field.dart';
import 'package:ecpfapp/Widgets/default_password_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  void navigateToLoggedHome() {
    Navigator.pushReplacementNamed(context, HomeRoutes.logged);
  }

  void onSignUp() async {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text == repeatPasswordController.text) {
        var params = SignUserDTO(
            email: emailController.text, password: passwordController.text);
        var user = await signUpUser(params);
        if (user != null) {
          await storeSession(user.id);
          navigateToLoggedHome();
        }
      } else {
        showToastNotification(
            text: "Las contraseñas deben coincidir",
            type: ToastNotificationType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Registro de usuarios',
                                style: TextStyle(
                                    color: theme.defaultTextColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 30),
                            Text(
                                'Escribe tu email y tu contraseña para crear tu cuenta',
                                style: TextStyle(
                                    color: theme.defaultTextColor,
                                    fontSize: 20)),
                            const SizedBox(height: 60),
                            Form(
                                key: _formKey,
                                child: Column(children: [
                                  DefaultEmailField(
                                      controller: emailController,
                                      placeholder: "Email"),
                                  const SizedBox(height: 20),
                                  DefaultPasswordField(
                                      controller: passwordController,
                                      placeholder: "Contraseña"),
                                  const SizedBox(height: 20),
                                  DefaultPasswordField(
                                      controller: repeatPasswordController,
                                      placeholder: "Repetir contraseña"),
                                  const SizedBox(height: 20),
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DefaultButton(
                                        text: "Registrarse", onPress: onSignUp),
                                  ],
                                )),
                          ],
                        )))),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Ya tienes cuenta?",
                              style: TextStyle(color: theme.defaultTextColor)),
                          TextSpan(
                              text: " Ingresa",
                              style: TextStyle(
                                  color: theme.accentColor,
                                  decoration: TextDecoration.underline)),
                        ])))
                  ],
                ))
          ],
        )));
  }
}
