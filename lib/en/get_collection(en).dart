import 'package:cloud_firestore/cloud_firestore.dart';

class getCollectionEn {
  final db = FirebaseFirestore.instance;
  Future<dynamic> Get(String collection) async {
    QuerySnapshot resultado = await db.collection(collection).get();
    final data = resultado.docs as List;
    return data;
  }
}
