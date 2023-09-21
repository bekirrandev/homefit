import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../services/auth_firebase.dart';
import 'package:path/path.dart' as p;
import 'get_collection.dart';

class editAccount extends StatefulWidget {
  AsyncSnapshot snapshot;
  late int i;
  editAccount({Key? key, required this.snapshot, required this.i})
      : super(key: key);

  @override
  State<editAccount> createState() => _editAccountState();
}

class _editAccountState extends State<editAccount> {
  TextEditingController displayName = TextEditingController();
  TextEditingController displayPassword = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  late String oldPasswordValidator;
  bool getImage = false;
  var url;
  late String email;
  var _image;

  @override
  void initState() {
    super.initState();
    displayName.text = widget.snapshot.data[widget.i]['Nome'];
    displayPassword.text = widget.snapshot.data[widget.i]['Password'];
    oldPasswordValidator = widget.snapshot.data[widget.i]['Password'];
  }

  Stack imageProfile(var imageValue) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 48, backgroundImage: imageValue),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromRGBO(3, 128, 136, 1),
                    child: IconButton(
                        onPressed: () async {
                          final ImagePicker imagePicker = ImagePicker();
                          final source = ImageSource.gallery;
                          final XFile? image =
                              await imagePicker.pickImage(source: source);
                          if (image != null) {
                            getImage = true;
                            setState(() {
                              _image = File(image!.path);
                            });
                          }
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  addNewImage(var id) async {
    final filename = p.basename(_image.path);
    final db = FirebaseFirestore.instance;
    final _firebaseStorage = FirebaseStorage.instance;
    var snapshot = await _firebaseStorage
        .ref()
        .child('usuarios/fotos/$filename')
        .putFile(_image);
    url = await snapshot.ref.getDownloadURL();
    await db.collection('usuarios').doc(id).update({'URL': url});
  }

  @override
  Widget build(BuildContext context) {
    addNewPassword() async {
      await context
          .read<AuthServices>()
          .change_password(email, oldPassword.text, displayPassword.text);

      await context.read<AuthServices>().logout();
      /*ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados atualizados! Faça novamente o login')));*/
    }

    updateData() async {
      var url;
      firestoreService service = firestoreService();
      List dataUser = await service.getData('usuarios');
      for (int i = 0; i < dataUser.length; i++) {
        if ((dataUser[i]['Email'] == email)) {
          var id = dataUser[i].id;
          await service.updateDataName(id, 'usuarios', displayName.text);
          await service.updateDataPassword(
              id, 'usuarios', displayPassword.text);
          if (_image != null) {
            addNewImage(id);
          }
        }
      }
      addNewPassword();
    }

    vereficationPassword() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Digite sua senha atual'),
                content: SizedBox(
                  child: TextFormField(
                    controller: oldPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite sua senha atual",
                    ),
                    obscureText: true,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      if (oldPassword.text == oldPasswordValidator) {
                        Navigator.of(context).pop();
                        updateData();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Senha incorreta. Por favor digite novamente')));
                      }
                    },
                  )
                ]);
          });
    }

    AuthServices auth = Provider.of<AuthServices>(context);
    email = auth.usuario!.email!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
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
                Center(
                  child: Column(
                    children: [
                      Container(
                          child: getImage
                              ? imageProfile(Image.file(_image).image)
                              : imageProfile(Image.network(
                                      widget.snapshot.data[widget.i]['URL'])
                                  .image)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                "Nome",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextFormField(
                              controller: displayName,
                              decoration: InputDecoration(
                                hintText: "Altere seu nome",
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.length > 11) {
                                  return "Digite menos caracteres";
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text(
                                "Senha",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextFormField(
                              controller: displayPassword,
                              decoration: InputDecoration(
                                hintText: "Altere sua senha",
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "Sua senha deve ter no mínimo 6 caracteres";
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            return vereficationPassword();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(3, 128, 136, 1)),
                          child: Text('Salvar Alterações'))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
