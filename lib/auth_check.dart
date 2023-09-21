import 'package:flutter/material.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:homefit/br/login_page.dart';
import 'package:homefit/en/login_page(en).dart';
import 'package:homefit/br/bottomnavbar.dart';
import 'package:homefit/en/bottomnavbar(en).dart';
import 'package:homefit/br/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import '../services/auth_firebase.dart';
import 'package:homefit/br/get_collection.dart';
import 'package:intro/intro.dart';
import 'package:introduction_screen/introduction_screen.dart';

class AuthCheck extends StatefulWidget {
  late String language;
  AuthCheck({Key? key, required this.language}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  late String email;
  var isSignup;

  completedTutorial() async {
    firestoreService service = firestoreService();
    List dataUser = await service.getData('usuarios');
    for (int i = 0; i < dataUser.length; i++) {
      if ((dataUser[i]['Email'] == email)) {
        if (dataUser[i]['Singup'] == true) {
          var id = dataUser[i].id;
          await service.updateSign(id, 'usuarios', false);
        }
      }
    }
  }

  introdutionPrimary() {
    List<PageViewModel> listPages = [
      PageViewModel(
          title: "Seja Bem Vindo(a)!!",
          body:
              "O HOMEFIT é um protocolo remoto de exercícios para dor crônica. O treinamento de 8 semanas incluem materiais que trazem:",
          image: Image.asset("lib/assets/pt/introductionimage/screen1.png")),
      PageViewModel(
          title: "Materiais do Protocolo",
          body: "Vídeos de Exercícios\n"
              "\n"
              "Vídeos Educativos\n"
              "\n"
              "Materiais Auxiliares",
          image: Image.asset("lib/assets/pt/introductionimage/screen2.png")),
      PageViewModel(
          title: "Objetivo do Protocolo",
          body:
              "Tem como objetivo que o paciente compreenda sua dor e utilize as técnicas de enfrentamento, modulando assim a dor, reduzindo seu impacto e promovendo mudanças para um estilo de vida mais ativo e saudável.",
          image: Image.asset("lib/assets/pt/introductionimage/screen3.png")),
    ];
    return IntroductionScreen(
      pages: listPages,
      showBackButton: true,
      showNextButton: false,
      done: const Text("Começar o tutorial"),
      back: const Text("Voltar"),
      onDone: () {
        completedTutorial();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Intro(
            controller: IntroController(stepCount: 3),
            child: buttomNavBar(),
          );
        }));
      },
    );
  }

  Future<bool> verificationSignup() async {
    firestoreService service = firestoreService();
    List dataUser = await service.getData('usuarios');
    for (int i = 0; i < dataUser.length; i++) {
      if ((dataUser[i]['Email'] == email)) {
        if (dataUser[i]['Singup'] == true) {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }

  loading() {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void initState() {
    super.initState();
    final LocalNotification _localNotificationService = LocalNotification();
    _localNotificationService.initialize();
    _localNotificationService.messageListener(context);
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.instance.getInitialMessage().then((message) {});
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        _localNotificationService.display(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("on message opened app");
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null) if (widget.language == 'pt') {
      return LoginPage();
    } else {
      return LoginPageEn();
    }
    else {
      if (widget.language == 'pt') {
        email = auth.usuario!.email!;
        return FutureBuilder(
            future: verificationSignup(),
            builder: ((context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  return introdutionPrimary();
                } else {
                  return buttomNavBar();
                }
              } else {
                return SizedBox(
                  height: 0,
                );
              }
            }));
      } else {
        return buttomNavBarEn();
      }
    }
  }
}
