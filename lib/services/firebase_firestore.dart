import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/services/date_transform.dart';

class FirebaseFirestoreService {
  CollectionReference _getCollection(String collectionName) {
    return FirebaseFirestore.instance.collection(collectionName);
  }

  // setUsuario
  // setDtaCriacao
  // setDtaAlteracao

  Object _createDocument(
    Map<String, dynamic> document,
    String? userId,
    String action,
  ) {
    if (userId == null) {
      throw ('User ID is a required parameter!');
    }

    document['userId'] = userId;
    String now = DateTransform.nowFormat();

    if (action == 'create') {
      document['createdAt'] = now;
    } else if (action == 'update') {
      document['updatedAt'] = now;
    } else if (action == 'delete') {
      document['deletedAt'] = now;
    }

    return document;
  }

  Future<String?> create(
    String collectionName,
    Map<String, dynamic> document,
    String? userId,
  ) {
    final completer = Completer<String>();

    try {
      CollectionReference collection = _getCollection(collectionName);
      Object doc = _createDocument(document, userId, 'create');

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

  // passar o id do usuario como obrigatorio

  // create
  // get
  // update
  // delete
}
