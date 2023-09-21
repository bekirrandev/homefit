import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homefit/br/get_collection.dart';
import 'package:provider/provider.dart';

import '../services/auth_firebase.dart';

class loagingInfo extends StatefulWidget {
  late String semana;
  loagingInfo({Key? key, required this.semana}) : super(key: key);

  @override
  State<loagingInfo> createState() => _loagingInfoState();
}

class _loagingInfoState extends State<loagingInfo> {
  firestoreService collection_helper = firestoreService();
  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    return FutureBuilder(
        future: collection_helper.getData("formulario"),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data.length; i++) {
              if (snapshot.data[i]['Email'] == auth.usuario!.email) {
                if (snapshot.data[i]['Semana'] == widget.semana) {
                  return Row(
                    children: [
                      Text('Atividade Completa'),
                      Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    ],
                  );
                } else {
                  if (i == snapshot.data.length - 1) {
                    return Row(
                      children: [
                        Text('Atividade Incompleta'),
                        Icon(
                          Icons.sd_card_alert,
                          color: Colors.yellow,
                        )
                      ],
                    );
                  }
                }
              } else {
                if (i == snapshot.data.length - 1) {
                  return Row(
                    children: [
                      Text('Atividade Incompleta'),
                      Icon(
                        Icons.sd_card_alert,
                        color: Colors.yellow,
                      )
                    ],
                  );
                }
              }
            }
            return SizedBox(height: 0);
          } else {
            return Row(
              children: [
                Text('Atividade incompleta'),
                Icon(
                  Icons.sd_card_alert,
                  color: Colors.yellow,
                )
              ],
            );
          }
        }));
  }
}
