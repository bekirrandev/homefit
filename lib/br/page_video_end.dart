import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

import 'appbar_profile.dart';

class PageVideoEnd extends StatefulWidget {
  String semana;
  String url;
  String path;
  PageVideoEnd(
      {Key? key, required this.url, required this.path, required this.semana})
      : super(key: key);

  @override
  State<PageVideoEnd> createState() => _PageVideoEndState();
}

class _PageVideoEndState extends State<PageVideoEnd> {
  late VideoPlayerController controller;
  late Future<void> _initializeVideoPlayerFuture;
  late String semana = widget.semana;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
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
                          style:
                              TextStyle(fontSize: 10, color: Colors.blueAccent),
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Semana $semana',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
            ),
            Container(
              height: 229,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.path), fit: BoxFit.cover)),
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      child: Column(
                        children: [
                          InkWell(
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
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: InputDecorator(
                decoration: InputDecoration(
                    labelText: 'Tópicos Educação em Dor Semana $semana',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: semana == '1'
                        ? Text(
                            '• Conceitos sobre a origem da dor:  Por que sentimos dor?\n'
                            '• Por que algumas dores não melhoram?\n'
                            '• Como controlar a dor\n'
                            '• 3 minutos para pensar sobre a dor\n'
                            '• Lista de pensamentos e sentimentos que afetam sua dor')
                        : semana == '2'
                            ? Text('• "Sistema de alarme sensível"\n'
                                '• Receptores de perigo\n'
                                '• Dor X Lesão\n'
                                '• Fatores que influenciam a dor\n'
                                '• Entendendo a dor em menos de 5 minutos\n'
                                '•  Lista de pensamentos e sentimentos que afetam sua dor')
                            : semana == '3'
                                ? Text('• Receptores de dor\n'
                                    '• Fatores que perturbam o sistema de alarme\n'
                                    '• Pensamentos e emoções que afetam o sistema nervoso\n'
                                    '• Cinesiofobia\n'
                                    '• Retorno às atividades')
                                : semana == '4'
                                    ? Text(
                                        '• Sistema inibitório e excitatório\n'
                                        '• Regulação do sistema de alarme\n'
                                        '• Substâncias analgésicas endógenas\n'
                                        '• Regulação do sistema de alarme\n'
                                        '• Fatores que estimulam e inibem a dor')
                                    : semana == '5'
                                        ? Text(
                                            '• Técnica de distração para alívio da dor \n'
                                            '• Sistema inibidor de ativação\n'
                                            '• 3 minutos para pensar sobre a dor crônica\n'
                                            '• Prática de relaxamento')
                                        : semana == '6'
                                            ? Text(
                                                '• Dor crônica e diminuição da atividade \n'
                                                '• Sistema de amplificação da dor\n'
                                                '• Atividades x Dor\n'
                                                '• Estratégias para voltar às atividades')
                                            : semana == '7'
                                                ? Text(
                                                    '• Sistema de amplificação da dor \n'
                                                    '• Cinesiofobia\n'
                                                    '• Atitudes em relação à dor\n'
                                                    '• Técnicas de distração')
                                                : Text(
                                                    '• Estratégias para realização de exercícios \n'
                                                    '• Dicas para  fazer exercícios\n'
                                                    '• Dicas de exercícios em caso de dor \n'
                                                    '• Descobrir novas atividades prazerosas')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
