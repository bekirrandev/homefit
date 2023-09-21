import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homefit/br/get_collection.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:modular_core/modular_core.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'options_config.dart';

class campoProfile extends StatefulWidget {
  const campoProfile({super.key});

  @override
  State<campoProfile> createState() => _campoProfileState();
}

class _campoProfileState extends State<campoProfile> {
  firestoreService aux = firestoreService();
  int hour = DateTime.now().hour;
  late String nome;
  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    return FutureBuilder(
      future: aux.getData('usuarios'),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data.length; i++) {
            if (snapshot.data[i]['Email'] == auth.usuario!.email) {
              nome = snapshot.data[i]['Nome'];
              if (hour >= 6 && hour < 12) {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => optionsConfig(
                                          snapshot: snapshot,
                                          i: i,
                                        ),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      Image.network(snapshot.data[i]['URL'])
                                          .image,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: AutoSizeText(
                                  'Bom Dia, $nome',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else if (hour >= 12 && hour < 18) {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => optionsConfig(
                                          snapshot: snapshot,
                                          i: i,
                                        ),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      Image.network(snapshot.data[i]['URL'])
                                          .image,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: AutoSizeText(
                                  'Boa Tarde, $nome',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else if (hour >= 18 && hour < 0) {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => optionsConfig(
                                          snapshot: snapshot,
                                          i: i,
                                        ),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      Image.network(snapshot.data[i]['URL'])
                                          .image,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: AutoSizeText(
                                  'Boa Noite, $nome',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => optionsConfig(
                                          snapshot: snapshot,
                                          i: i,
                                        ),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage:
                                      Image.network(snapshot.data[i]['URL'])
                                          .image,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: AutoSizeText(
                                  'Boa Noite, $nome',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            }
          }
          return SizedBox(height: 0);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
