import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService {
  final db = FirebaseFirestore.instance;
  Future<dynamic> getData(String collection) async {
    QuerySnapshot resultado = await db.collection(collection).get();
    final data = resultado.docs as List;
    return data;
  }

  updateDataName(String id, String collection, String newName) async {
    await db.collection(collection).doc(id).update({'Nome': newName});
  }

  updateSign(String id, String collection, bool isSignin) async {
    await db.collection(collection).doc(id).update({'Singup': isSignin});
  }

  updateDataPassword(String id, String collection, String newPassword) async {
    await db.collection(collection).doc(id).update({'Password': newPassword});
  }
}
