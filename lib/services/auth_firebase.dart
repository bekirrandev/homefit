import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String massage;
  AuthException(this.massage);
}

class AuthServices extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthServices() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException("A senha é muito fraca!");
      } else if (e.code == 'email-already-in-use') {
        throw AuthException("Este email já está cadastrado");
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException("Usuario não encontrado. Cadastre-se");
      } else if (e.code == 'wrong-password') {
        throw AuthException("Senha incorreta digite novamente");
      }
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  change_password(String email, String oldPassword, String newPassword) async {
    var cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);

    await _auth.currentUser!.reauthenticateWithCredential(cred).then(((value) {
      _auth.currentUser!.updatePassword(newPassword);
    }));
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
