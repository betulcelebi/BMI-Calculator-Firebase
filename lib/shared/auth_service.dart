// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../app/routes/app_pages.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  createUser(email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => Get.snackbar("Creating user", "Turned Login Page"));

       Get.toNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      else if (email == "" || password == "" ){
        return Get.defaultDialog(middleText: 'Cannot be blank');
      }
    } catch (e) {
      print(e);
    }
  }

  signUser(email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAndToNamed(Routes.HOME,
              result: Get.snackbar('Success Login', "success")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return Get.defaultDialog(title: "User not available, please register");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
       else if (email == "" || password == "" ){
        return Get.defaultDialog(middleText: 'Cannot be blank');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.snackbar("Sign out", "Returned Login Page"));
  }
}
