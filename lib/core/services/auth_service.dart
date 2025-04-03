import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  
  Future<UserCredential> signInWithEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
  Future<void> signOut() {
    return _auth.signOut();
  }
  
  // Méthodes RBAC pour les rôles admin et joueur
  Future<bool> isAdmin(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();
    return doc.data()?['role'] == 'admin';
  }
  
  // Obtenir l'utilisateur actuel
  User? get currentUser => _auth.currentUser;
  
  // Vérifier si l'utilisateur est connecté
  bool get isAuthenticated => currentUser != null;
  
  // Obtenir l'ID de l'utilisateur actuel
  String? get currentUserId => currentUser?.uid;
}
