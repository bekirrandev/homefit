import 'package:flutter/material.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../services/auth_firebase.dart';

import 'edit_account.dart';
import 'get_collection.dart';

class optionsConfig extends StatefulWidget {
  AsyncSnapshot snapshot;
  late int i;
  optionsConfig({Key? key, required this.snapshot, required this.i})
      : super(key: key);

  @override
  State<optionsConfig> createState() => _optionsConfigState();
}

class _optionsConfigState extends State<optionsConfig> {
  late String nome = widget.snapshot.data[widget.i]['Nome'];
  late String email = widget.snapshot.data[widget.i]['Email'];
  late List verificador = [];
  firestoreService collection_helper = firestoreService();

  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Color.fromRGBO(3, 128, 136, 1),
                  Colors.white
                ])),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
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
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Dados da Conta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Nome: $nome'),
                              ],
                            ),
                            Row(
                              children: [Text('Email: $email')],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.1),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: Image.network(
                                        widget.snapshot.data[widget.i]['URL'])
                                    .image,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: collection_helper.getData("formulario"),
                  builder: ((context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      for (int i = 0; i < snapshot.data.length; i++) {
                        if (snapshot.data[i]['Email'] == auth.usuario!.email) {
                          if (int.parse(snapshot.data[i]['Semana']) == 1 ||
                              int.parse(snapshot.data[i]['Semana']) == 2 ||
                              int.parse(snapshot.data[i]['Semana']) == 3 ||
                              int.parse(snapshot.data[i]['Semana']) == 4 ||
                              int.parse(snapshot.data[i]['Semana']) == 5 ||
                              int.parse(snapshot.data[i]['Semana']) == 6 ||
                              int.parse(snapshot.data[i]['Semana']) == 7 ||
                              int.parse(snapshot.data[i]['Semana']) == 8) {
                            if (!verificador.contains(
                                int.parse(snapshot.data[i]['Semana']))) {
                              verificador
                                  .add(int.parse(snapshot.data[i]['Semana']));
                            }
                          }
                        }
                      }
                      double percent_indicator = verificador.length / 8;
                      print(verificador.length);
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: InputDecorator(
                          decoration: InputDecoration(
                              labelText: 'Progresso',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Semana 1: '),
                                        Text(
                                          (verificador.contains(1))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(1))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 2: '),
                                        Text(
                                          (verificador.contains(2))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(2))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 3: '),
                                        Text(
                                          (verificador.contains(3))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(3))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 4: '),
                                        Text(
                                          (verificador.contains(4))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(4))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 5: '),
                                        Text(
                                          (verificador.contains(5))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(5))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 6: '),
                                        Text(
                                          (verificador.contains(6))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(6))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 7: '),
                                        Text(
                                          (verificador.contains(7))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(7))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Semana 8: '),
                                        Text(
                                          (verificador.contains(8))
                                              ? 'Concluída'
                                              : 'Não Concluída',
                                          style: (verificador.contains(8))
                                              ? TextStyle(color: Colors.green)
                                              : TextStyle(color: Colors.red),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                CircularPercentIndicator(
                                  radius: 70.0,
                                  lineWidth: 10.0,
                                  percent: percent_indicator,
                                  center: new Icon(
                                    Icons.sports_gymnastics,
                                    size: 50.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  })),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editAccount(
                                      snapshot: widget.snapshot, i: widget.i)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(3, 128, 136, 1),
                          fixedSize: Size(100, 60),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                                fit: BoxFit.contain,
                                child: Text('Edite sua Conta'))
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<AuthServices>().logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          fixedSize: Size(100, 60),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(fit: BoxFit.contain, child: Text('Sair'))
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}
