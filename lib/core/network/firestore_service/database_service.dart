abstract class DatabaseService {
  Future<void> addData(
      {required String collectionName,
      required Map<String, dynamic> data,
      String? docId});

  Future<Map<String, dynamic>> getData(
      {required String docId, required String collectionName});

  Future<bool> isDataExist(
      {required String collectionName, required String docId});
}
