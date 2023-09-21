import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homefit/br/formulario_note.dart';
import 'package:flutter/material.dart';
import 'package:homefit/br/appbar_profile.dart';

class acessNotes extends StatefulWidget {
  late String valor_pergunta1;
  late String valor_pergunta2;
  late String valor_pergunta3;
  late String valor_pergunta4;
  late String depoimento;
  late String semana;
  acessNotes({
    Key? key,
    required this.valor_pergunta1,
    required this.valor_pergunta2,
    required this.valor_pergunta3,
    required this.valor_pergunta4,
    required this.depoimento,
    required this.semana,
  }) : super(key: key);

  @override
  State<acessNotes> createState() => _acessNotesState();
}

class _acessNotesState extends State<acessNotes> {
  late String _semana = widget.semana;
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
          child: Column(children: [
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Semana $_semana',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
            ),
            formularioNote(
                valor_pergunta1: double.parse(widget.valor_pergunta1),
                valor_pergunta2: double.parse(widget.valor_pergunta2),
                valor_pergunta3: double.parse(widget.valor_pergunta3),
                valor_pergunta4: double.parse(widget.valor_pergunta4),
                depoimento: widget.depoimento)
          ]),
        ));
  }
}
