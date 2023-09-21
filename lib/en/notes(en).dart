import 'package:flutter/material.dart';
import 'package:homefit/en/appbar_profile(en).dart';
import 'package:homefit/en/get_collection(en).dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';

class notes extends StatefulWidget {
  const notes({super.key});

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  getCollectionEn aux = getCollectionEn();
  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    return FutureBuilder(
        future: aux.Get('formulario'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 100,
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
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Notes History',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, index) {
                        if (snapshot.data[index]['Email'] ==
                            auth.usuario!.email) {
                          late String semana = snapshot.data[index]['Semana'];
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(3, 128, 136, 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(Icons.note),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Week $semana',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ]),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              snapshot.data[index]['Date'],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ])),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(height: 0);
                        }
                      })),
                ],
              )),
            );
          } else {
            return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 100,
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
                body: CircularProgressIndicator());
          }
        });
  }
}
