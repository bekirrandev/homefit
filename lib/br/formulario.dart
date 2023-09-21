import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class formulario extends StatefulWidget {
  late double valor_pergunta1;
  late double valor_pergunta2;
  late double valor_pergunta3;
  late double valor_pergunta4;
  final depoimento;
  final controller;
  final p1;
  final p2;
  final p3;
  final p4;
  formulario({
    Key? key,
    required this.valor_pergunta1,
    required this.valor_pergunta2,
    required this.valor_pergunta3,
    required this.valor_pergunta4,
    required this.depoimento,
    required this.controller,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
  }) : super(key: key);

  @override
  State<formulario> createState() => _formularioState();
}

class _formularioState extends State<formulario> {
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
                widget.controller.pause();
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
                          setState(() {
                            widget.valor_pergunta1 = newValue;
                          });
                          widget.p1.text = newValue.toString();
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
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
                          setState(() {
                            widget.valor_pergunta2 = newValue;
                          });
                          widget.p2.text = newValue.toString();
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
                          setState(() {
                            widget.valor_pergunta3 = newValue;
                          });
                          widget.p3.text = newValue.toString();
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
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
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
                          setState(() {
                            widget.valor_pergunta4 = newValue;
                          });
                          widget.p4.text = newValue.toString();
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
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                    maxLines: null,
                    controller: widget.depoimento,
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Digite aqui observações sobre a execução",
                    ),
                    keyboardType: TextInputType.text),
              )),
        ],
      ),
    );
  }
}
