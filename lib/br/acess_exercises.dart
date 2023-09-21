import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:homefit/br/page_video.dart';
import 'package:homefit/br/loading_info.dart';
import 'appbar_profile.dart';

class acessExercises extends StatefulWidget {
  const acessExercises({super.key});

  @override
  State<acessExercises> createState() => _acessExercisesState();
}

class _acessExercisesState extends State<acessExercises> {
  @override
  Widget build(BuildContext context) {
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
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '1',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana01.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana01.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana01.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '1'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '2',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana02.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana02.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana02.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '2'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '3',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana03.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana03.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana03.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '3'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '4',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana04.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana04.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana04.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '4'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '5',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana05.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana05.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana05.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '5'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '6',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana06.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana06.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana06.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '6'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '7',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana07.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana07.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana07.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '7'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => PageVideo(
                                      semana: '8',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana08.mp4?alt=media',
                                      path:
                                          'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana08.png',
                                    ))));
                      },
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana08.png'))),
                        child: Center(
                          child: Icon(Icons.play_circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        loagingInfo(semana: '8'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
