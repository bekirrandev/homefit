import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class formularioNote extends StatefulWidget {
  late double valor_pergunta1;
  late double valor_pergunta2;
  late double valor_pergunta3;
  late double valor_pergunta4;
  late String depoimento;
  formularioNote({
    Key? key,
    required this.valor_pergunta1,
    required this.valor_pergunta2,
    required this.valor_pergunta3,
    required this.valor_pergunta4,
    required this.depoimento,
  }) : super(key: key);

  @override
  State<formularioNote> createState() => _formularioNoteState();
}

class _formularioNoteState extends State<formularioNote> {
  DateTime today = DateTime.now();
  void _exibirCalendario() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Selecione o dia em que você está fazendo o exercício'),
            content: SizedBox(
              height: 400,
              width: 400,
              child: TableCalendar(
                  focusedDay: today,
                  firstDay: DateTime.utc(2023),
                  lastDay: DateTime.utc(2100)),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(138, 203, 203, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            RawMaterialButton(
              onPressed: () {
                return _exibirCalendario();
              },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(
                Icons.calendar_month,
                size: 20.0,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            )
          ]),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Como você se sentia antes dos exercícios?')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/icons/bad_face.png'))),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/neutral_face.png'))),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/smile_face.png'))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Slider(
                        value: widget.valor_pergunta1,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Qual o seu nível de dor antes de fazer os exercícios?')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/smile_regua.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/neutral_regua1.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/neutral_regua2.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/bad_regua.png'))),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/icons/regua.png'))),
                            ),
                          ]),
                    ]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Slider(
                        value: widget.valor_pergunta2,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Como você se sentiu depois dos exercícios?')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/icons/bad_face.png'))),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/neutral_face.png'))),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/smile_face.png'))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Slider(
                        value: widget.valor_pergunta3,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Qual o seu nível de dor depois de fazer os exercícios?')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/smile_regua.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/neutral_regua1.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/neutral_regua2.png'))),
                          ),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/icons/bad_regua.png'))),
                          ),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/icons/regua.png'))),
                            ),
                          ]),
                    ]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Slider(
                        value: widget.valor_pergunta4,
                        min: -1.0,
                        max: 1.0,
                        onChanged: (newValue) {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(widget.depoimento))),
        ],
      ),
    );
  }
}
