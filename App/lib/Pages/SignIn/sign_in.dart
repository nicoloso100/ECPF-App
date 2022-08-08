import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/DTOs/sign_user_dto.dart';
import 'package:ecpfapp/Requests/ApiRequests/users_requests.dart';
import 'package:ecpfapp/Requests/HiveRequests/session_requests.dart';
import 'package:ecpfapp/Widgets/custom_app_bar.dart';
import 'package:ecpfapp/Widgets/default_button.dart';
import 'package:ecpfapp/Widgets/default_email_field.dart';
import 'package:ecpfapp/Widgets/default_password_field.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void navigateToLoggedHome() {
    Navigator.pushReplacementNamed(context, HomeRoutes.logged);
  }

  void onSignIn() async {
    if (_formKey.currentState!.validate()) {
      var params = SignUserDTO(
          email: emailController.text, password: passwordController.text);
      var user = await signInUser(params);
      if (user != null) {
        await storeSession(user.id);
        navigateToLoggedHome();
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
                            Text('Ingreso de usuarios',
                                style: TextStyle(
                                    color: theme.defaultTextColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 30),
                            Text(
                                'Escribe tu email y tu contraseña, también puedes crear tu cuenta si aún no cuentas con una',
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
                                ])),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    DefaultButton(
                                        text: "Ingresar", onPress: onSignIn),
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
                        onTap: () =>
                            Navigator.pushNamed(context, HomeRoutes.signUp),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "¿Aún no tienes cuenta?",
                              style: TextStyle(color: theme.defaultTextColor)),
                          TextSpan(
                              text: " Registrate",
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
