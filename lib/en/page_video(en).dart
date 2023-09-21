import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:homefit/en/formulario(en).dart';
import 'package:homefit/en/appbar_profile(en).dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PageVideoEn extends StatefulWidget {
  String semana;
  String url;
  String path;
  PageVideoEn({
    Key? key,
    required this.semana,
    required this.url,
    required this.path,
  }) : super(key: key);

  @override
  State<PageVideoEn> createState() => _PageVideoEnState();
}

class _PageVideoEnState extends State<PageVideoEn> {
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
  String today = DateFormat('MM/dd/yyy').format(DateTime.now());

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

    void sucess_save() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Annotation Saved Successfully'),
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
                title: Text('Want to Save Your Notes for Today?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () async {
                      final collection =
                          FirebaseFirestore.instance.collection('formulario');
                      await collection.add({
                        'Semana': semana,
                        'Date': today,
                        'Email': auth.usuario!.email,
                        'P1': p1.text,
                        'P2': p2.text,
                        'P3': p3.text,
                        'P4': p4.text,
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
          toolbarHeight: 100,
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
              campoProfileEn(),
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
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Week $_semana',
                    style: TextStyle(color: Colors.black, fontSize: 25),
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
                  future: initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        child: InkWell(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text('Notes: ', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(3, 128, 136, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextButton.icon(
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            controller.pause();
                            confirmed_save(
                              widget.semana,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              formularioEn(
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
