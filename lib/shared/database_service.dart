import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
  var user = FirebaseAuth.instance.currentUser;

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DatabaseService> init() async {
    return this;
  }

  Future<void> addUserKnowladge(height, weight, bmiScore) async {
    return await db
        .collection('user')
        .doc(user!.email!)
        .collection('bmi')
        .doc()
        .set({
          'height': height,
          'weight': weight,
          'bmiScore': bmiScore,
        })
        .then((value) => print("BMI Calculated"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
