import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; //Firebase Authentication instance
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; //Firebase Firestore instance

  //Function to handle User SignUp
  Future<String?> signUp({
    required String emailId,
    required String password,
    required String role,
  }) async {
    try {
      //create user in firebase authentication with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailId.trim(), password: password.trim());
      //save additional data in firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        "email": emailId.trim(),
        "role": role.trim(),
      });
      return null; //No error message
    } catch (e) {
      return e.toString(); //Error: Return Exception
    }
  }

  //Function to handle user login
  Future<String?> login({
    required String emailId,
    required String password,
  }) async {
    try {
      //create user in firebase authentication with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailId.trim(), password: password.trim());
      //Fetching user details from firebase
      DocumentSnapshot userDoc = await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();
      return userDoc['role']; //Returns the user role
    } catch (e) {
      return e.toString(); //Error: Return Exception
    }
  }
  signOut() async{
    _auth.signOut();
  }
}
