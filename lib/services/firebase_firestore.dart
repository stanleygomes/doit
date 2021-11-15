import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/utils/date.dart';

class FirebaseFirestoreService {
  CollectionReference _getCollection(String collectionName) {
    return FirebaseFirestore.instance.collection(collectionName);
  }

  Map<String, dynamic> _validate(
      Map<String, dynamic> document, String? userId, String action,
      [String? documentId]) {
    if (userId == null) {
      throw ('User ID is a required parameter!');
    }

    if ((action == 'update' || action == 'delete') && documentId == null) {
      throw ('Document ID is a required parameter for update or delete!');
    }

    document['userId'] = userId;
    String now = DateUtil.nowFormat();

    if (action == 'create') {
      document['createdAt'] = now;
    } else if (action == 'update') {
      document['updatedAt'] = now;
    } else if (action == 'delete') {
      document['deletedAt'] = now;
    }

    return document;
  }

  Map<String, dynamic> putIdDocument(DocumentSnapshot<Object?> snapshot) {
    String documentId = snapshot.reference.id;
    var documentData = snapshot.data() as Map<String, dynamic>;
    documentData['id'] = documentId;

    return documentData;
  }

  Future<String?> create(
    String collectionName,
    Map<String, dynamic> document,
    String? userId,
  ) {
    final completer = Completer<String>();

    try {
      CollectionReference collection = _getCollection(collectionName);
      Object doc = _validate(document, userId, 'create');

      collection.add(doc).then((value) {
        completer.complete(value.id);
      }).catchError((error) {
        completer.completeError('Failed to create document: $error');
      });
    } catch (error) {
      completer.completeError('Failed to create document: $error');
    }

    return completer.future;
  }

  Future<String?> update(
    String collectionName,
    Map<String, dynamic> document,
    String documentId,
    String? userId,
  ) {
    final completer = Completer<String>();

    try {
      CollectionReference collection = _getCollection(collectionName);
      Map<String, dynamic> doc = _validate(
        document,
        userId,
        'update',
        documentId,
      );

      collection.doc(documentId).update(doc).then((value) {
        completer.complete(documentId);
      }).catchError((error) {
        completer.completeError('Failed to update document: $error');
      });
    } catch (error) {
      completer.completeError('Failed to update document: $error');
    }

    return completer.future;
  }

  Future<bool> delete(
    String collectionName,
    String documentId,
    String userId,
  ) {
    final completer = Completer<bool>();

    try {
      CollectionReference collection = _getCollection(collectionName);
      // Map<String, dynamic> doc = _validate(
      //   new Map<String, dynamic>(),
      //   userId,
      //   'delete',
      //   documentId,
      // );

      collection.doc(documentId).delete().then((value) {
        completer.complete(true);
      }).catchError((error) {
        completer.completeError('Failed to delete document: $error');
      });
    } catch (error) {
      completer.completeError('Failed to delete document: $error');
    }

    return completer.future;
  }

  Future<Map<String, dynamic>> getDocument(
      String collectionName, String documentId) {
    final completer = Completer<Map<String, dynamic>>();

    try {
      CollectionReference collection = _getCollection(collectionName);

      collection.doc(documentId).get().then((snapshot) {
        completer.complete(putIdDocument(snapshot));
      }).catchError((error) {
        completer.completeError('Failed to get document: $error');
      });
    } catch (error) {
      completer.completeError('Failed to get document: $error');
    }

    return completer.future;
  }

  Future<List<Map<String, dynamic>>> getDocumentsFromCollection(
    String collectionName,
    String? userId,
  ) {
    final completer = Completer<List<Map<String, dynamic>>>();

    try {
      CollectionReference collection = _getCollection(collectionName);

      if (userId == null) {
        throw ('User ID is a required parameter!');
      }

      collection.where('userId', isEqualTo: userId).get().then((snapshot) {
        var docs = snapshot.docs.map((doc) => putIdDocument(doc)).toList();
        completer.complete(docs);
      }).catchError((error) {
        completer.completeError('Failed to get document from a list: $error');
      });
    } catch (error) {
      completer.completeError('Failed to get document from a list: $error');
    }

    return completer.future;
  }
}
