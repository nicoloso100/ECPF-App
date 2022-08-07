import 'package:ecpfapp/Constants/assets.dart';
import 'package:ecpfapp/Constants/routing.dart';
import 'package:ecpfapp/Widgets/home_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = NeumorphicTheme.currentTheme(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: const NeumorphicBoxShape.circle(),
                          depth: 10,
                          intensity: 5,
                          lightSource: LightSource.topLeft,
                          color: theme.variantColor,
                          border: NeumorphicBorder(
                              color: theme.borderColor, width: 5)),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Image(
                          image: AppAssets.escudo,
                          width: 200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Flexible(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    'Estandarización Cuantitativa de Pruebas Físicas (ECPF)',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: theme.defaultTextColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'Proyecto del semillero BrainIt',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: theme.defaultTextColor),
                                  )
                                ]),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    HomeButton(
                                        text: "Ingreso",
                                        onPress: () => Navigator.pushNamed(
                                            context, HomeRoutes.signIn)),
                                    HomeButton(
                                        text: "Usar calculadora",
                                        onPress: () => Navigator.pushNamed(
                                            context, HomeRoutes.showCalculator))
                                  ],
                                )
                              ],
                            )))
                  ],
                ))));
  }
}
