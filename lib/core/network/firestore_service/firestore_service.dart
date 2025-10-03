import 'package:fruits_hub/core/network/firestore_service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String collectionName,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId == null) {
      await firestore.collection(collectionName).add(data);
    } else {
      await firestore.collection(collectionName).doc(docId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String docId, required String collectionName}) async {
    var data = await firestore.collection(collectionName).doc(docId).get();

    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isDataExist(
      {required String collectionName, required String docId}) async {
    var data = await firestore.collection(collectionName).doc(docId).get();

    return data.exists;
  }
}
