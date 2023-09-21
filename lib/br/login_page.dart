import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'get_collection.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final nome = TextEditingController();
  late String _email;
  var _image;
  var image;
  var url;

  bool isLogin = true;
  late String actionButton;
  late String toggleButton;
  bool isLoading = false;
  String loadingMessage = '';

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        actionButton = "Login";
        toggleButton = "Cadastre-se";
      } else {
        actionButton = "Cadastrar";
        toggleButton = "Voltar ao Login";
      }
    });
  }

  logoImage(bool acao) {
    if (acao) {
      return Image.asset('lib/assets/logo_com_fundo.png');
    } else {
      return Container(
        child: _image != null
            ? Stack(children: [
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      CircleAvatar(
                          radius: 48,
                          backgroundImage: Image.file(_image).image),
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
                                  final XFile? image = await imagePicker
                                      .pickImage(source: source);
                                  if (image != null) {
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
              ])
            : IconButton(
                onPressed: () async {
                  final ImagePicker imagePicker = ImagePicker();
                  final source = ImageSource.gallery;
                  final XFile? image =
                      await imagePicker.pickImage(source: source);
                  if (image != null) {
                    setState(() {
                      _image = File(image!.path);
                    });
                  }
                },
                icon: Icon(Icons.add_a_photo_rounded, size: 50)),
      );
    }
  }

  campoName(bool acao) {
    if (!acao) {
      return SizedBox(
        width: 350,
        child: TextFormField(
          controller: nome,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nome",
          ),
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.length > 11) {
              return "Digite menos caracteres";
            }
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  login() async {
    try {
      setLoading(true, 'Carregando...');
      await context.read<AuthServices>().login(email.text, password.text);
      Navigator.pop(context);
    } on AuthException catch (e) {
      setLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.massage)));
      print(e);
    }
  }

  registrar() async {
    try {
      if (_image != null) {
        final filename = p.basename(_image.path);
        final _firebaseStorage = FirebaseStorage.instance;
        var snapshot = await _firebaseStorage
            .ref()
            .child('usuarios/fotos/$filename')
            .putFile(_image);
        url = await snapshot.ref.getDownloadURL();
      }
      final collection = FirebaseFirestore.instance.collection('usuarios');
      await collection.add({
        'Nome': nome.text,
        'Email': email.text,
        'Password': password.text,
        'URL': url,
        'Singup': true
      });

      try {
        setLoading(true, 'Cadastrando...');
        await context.read<AuthServices>().registrar(email.text, password.text);
        Navigator.pop(context);
      } on AuthException catch (e) {
        setLoading(false);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.massage)));
      }
    } catch (e) {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro de Registro'),
      ));
    }
  }

  void setLoading(bool loading, [String message = '']) {
    setState(() {
      isLoading = loading;
      loadingMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
        elevation: 0,
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
        child: Padding(
          padding: EdgeInsets.only(
            top: 180,
          ),
          child: Center(
            child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    logoImage(isLogin),
                    SizedBox(
                      height: 50,
                    ),
                    campoName(isLogin),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe o email corretamente";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Senha",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe Sua Senha";
                          } else if (value.length < 6) {
                            return "Sua senha deve ter no mínimo 6 caracteres";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            if (isLogin) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(),
                                        Text('Carregando...')
                                      ],
                                    ));
                                  });
                              login();
                            } else {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircularProgressIndicator(),
                                        Text('Cadastrando...')
                                      ],
                                    ));
                                  });
                              registrar();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(3, 128, 136, 1),
                            fixedSize: Size(200, 36),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(actionButton)),
                    ElevatedButton(
                        onPressed: () => setFormAction(!isLogin),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(3, 128, 136, 1),
                            fixedSize: Size(200, 36),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Text(toggleButton)),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
