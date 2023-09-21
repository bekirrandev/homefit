import 'package:homefit/en/get_collection(en).dart';
import 'package:flutter/material.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';

class campoProfileEn extends StatefulWidget {
  const campoProfileEn({super.key});

  @override
  State<campoProfileEn> createState() => _campoProfileEnState();
}

class _campoProfileEnState extends State<campoProfileEn> {
  getCollectionEn aux = getCollectionEn();
  int hour = DateTime.now().hour;
  late String nome;
  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    return FutureBuilder(
      future: aux.Get('usuarios'),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data.length; i++) {
            if (snapshot.data[i]['Email'] == auth.usuario!.email) {
              nome = snapshot.data[i]['Nome'];
              if (hour >= 6 && hour < 12) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  Image.network(snapshot.data[i]['URL']).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Good Morning, $nome',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    )
                  ],
                );
              } else if (hour >= 12 && hour < 18) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  Image.network(snapshot.data[i]['URL']).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Good Afternoon, $nome',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    )
                  ],
                );
              } else if (hour >= 18 && hour < 0) {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  Image.network(snapshot.data[i]['URL']).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('Good Night, $nome',
                        style: TextStyle(color: Colors.black, fontSize: 5))
                  ],
                );
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  Image.network(snapshot.data[i]['URL']).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text('Good Night, $nome',
                        style: TextStyle(color: Colors.black, fontSize: 12.5))
                  ],
                );
              }
            }
          }
          return CircularProgressIndicator();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
