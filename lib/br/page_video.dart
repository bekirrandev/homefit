import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:homefit/br/formulario.dart';
import 'package:homefit/br/appbar_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PageVideo extends StatefulWidget {
  String semana;
  String url;
  String path;
  PageVideo({
    Key? key,
    required this.semana,
    required this.url,
    required this.path,
  }) : super(key: key);

  @override
  State<PageVideo> createState() => _PageVideoState();
}

class _PageVideoState extends State<PageVideo> {
  late double valor_pergunta1 = 0.0;
  late double valor_pergunta2 = 0.0;
  late double valor_pergunta3 = 0.0;
  late double valor_pergunta4 = 0.0;
  late String _semana = widget.semana;
  final depoimento = TextEditingController();
  final p1 = TextEditingController();
  final p2 = TextEditingController();
  final p3 = TextEditingController();
  final p4 = TextEditingController();
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;
  String today = DateFormat('dd/MM/yyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    initializeVideoPlayerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);

    void infoVideoPlayer() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Orientações sobre o Vídeo Player do Homefit'),
                content: Text(
                    '• Aguarde o vídeo carregar (Dica: quando estiver carregado a tela ficará escura.)\n'
                    '\n'
                    '• Com o vídeo carregado. Dê play tocando em cima do vídeo player (observação: o vídeo player é a telinha escura)\n'
                    '\n'
                    '• Com o vídeo ja inicializado você consegue pausar da mesma forma: tocando em cima do vídeo player\n'
                    '\n'
                    '• A barra vermelha indica em que momento está o vídeo.\n'
                    '\n'
                    '• Pule para qualquer momento do vídeo arrastando a barra vermelha logo abaixo'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Entendi'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    }

    void infoNotes() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Orientações sobre As anotações'),
                content: Text(
                    '• O icone de calendário é uma funcionalidade que será desenvolvida. Por enquanto, a use como consulta\n'
                    '\n'
                    '• Para salvar suas anotações clique no botão flutuante no canto inferior direito\n'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Entendi'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    }

    void sucess_save() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Anotação salva com Sucesso'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    }

    void confirmed_save(String semana) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Deseja Salvar Suas Anotações de Hoje?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Não'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Sim'),
                    onPressed: () async {
                      final collection =
                          FirebaseFirestore.instance.collection('formulario');
                      await collection.add({
                        'Semana': semana,
                        'Date': today,
                        'Email': auth.usuario!.email,
                        'P1': p1.text == "" ? '0' : p1.text,
                        'P2': p2.text == "" ? '0' : p2.text,
                        'P3': p3.text == "" ? '0' : p3.text,
                        'P4': p4.text == "" ? '0' : p4.text,
                        'P5': depoimento.text,
                      });
                      Navigator.of(context).pop();
                      return sucess_save();
                    },
                  )
                ]);
          });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                "lib/assets/logo.png",
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
              ),
              campoProfile(),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Color.fromRGBO(3, 128, 136, 1),
                  Colors.white
                ])),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.pause();
            confirmed_save(
              widget.semana,
            );
          },
          backgroundColor: Color.fromRGBO(3, 128, 136, 1),
          child: Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
              ),
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/buttomnavigator');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      onTap: () {
                        infoVideoPlayer();
                      },
                      child: Row(
                        children: [
                          Text(
                            'Clique aqui para orientações\n'
                            'sobre o video player',
                            style: TextStyle(
                                fontSize: 10, color: Colors.blueAccent),
                          ),
                          Icon(
                            Icons.help,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Semana $_semana',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.path), fit: BoxFit.cover)),
                child: FutureBuilder(
                  future: initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return InkWell(
                        onTap: () {
                          if (controller.value.isPlaying) {
                            controller.pause();
                          } else {
                            controller.play();
                          }
                        },
                        child: AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: Stack(
                              children: [
                                VideoPlayer(controller),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    VideoProgressIndicator(
                                      controller,
                                      allowScrubbing: true,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      onTap: () {
                        infoNotes();
                      },
                      child: Row(
                        children: [
                          Text(
                            'Clique aqui para orientações\n'
                            'sobre as anotações',
                            style: TextStyle(
                                fontSize: 10, color: Colors.blueAccent),
                          ),
                          Icon(
                            Icons.help,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text('Anotações: ', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
              formulario(
                valor_pergunta1: valor_pergunta1,
                valor_pergunta2: valor_pergunta2,
                valor_pergunta3: valor_pergunta3,
                valor_pergunta4: valor_pergunta4,
                depoimento: depoimento,
                controller: controller,
                p1: p1,
                p2: p2,
                p3: p3,
                p4: p4,
              ),
            ],
          ),
        ));
  }
}
