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

class LoginPageEn extends StatefulWidget {
  const LoginPageEn({super.key});

  @override
  State<LoginPageEn> createState() => _LoginPageEnState();
}

class _LoginPageEnState extends State<LoginPageEn> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final nome = TextEditingController();
  var _image;
  var image;
  var url;

  bool isLogin = true;
  late String actionButton;
  late String toggleButton;

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
        toggleButton = "Sign up";
      } else {
        actionButton = "Sign up";
        toggleButton = "Back";
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
                            width: 210,
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
                                  setState(() {
                                    _image = File(image!.path);
                                  });
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
                  setState(() {
                    _image = File(image!.path);
                  });
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
            labelText: "Name",
          ),
          keyboardType: TextInputType.name,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  login() async {
    try {
      await context.read<AuthServices>().login(email.text, password.text);
    } on AuthException catch (e) {
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
      await collection
          .add({'Nome': nome.text, 'Email': email.text, 'URL': url});
      try {
        await context.read<AuthServices>().registrar(email.text, password.text);
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.massage)));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
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
          padding: EdgeInsets.only(top: 180, left: 28),
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
                          return "Enter the email correctly";
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
                        labelText: "Password",
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Inform your password";
                        } else if (value.length < 6) {
                          return "Your password must be at least 6 characters long";
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
                            login();
                          } else {
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
    );
  }
}
