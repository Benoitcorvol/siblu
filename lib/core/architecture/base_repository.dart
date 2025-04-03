import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

abstract class BaseRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  BaseRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance;

  @protected
  CollectionReference<Map<String, dynamic>> collection(String path) {
    return _firestore.collection(path);
  }

  @protected
  DocumentReference<Map<String, dynamic>> document(String path) {
    return _firestore.doc(path);
  }

  @protected
  Reference storageRef(String path) {
    return _storage.ref(path);
  }

  @protected
  Future<T?> handleError<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } catch (e) {
      debugPrint('Error in repository operation: $e');
      return null;
    }
  }

  @protected
  Stream<T> handleStreamError<T>(Stream<T> stream) {
    return stream.handleError((error) {
      debugPrint('Error in repository stream: $error');
    });
  }
}