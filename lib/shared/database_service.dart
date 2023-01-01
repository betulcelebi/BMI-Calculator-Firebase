import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseService extends GetxService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference bmi = FirebaseFirestore.instance.collection('bmi');
  Future<DatabaseService> init() async {
    return this;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?>? getBmi() async {
    return await db.collection('bmi').doc("jwSJB4p7vCk08bzNAXsb").get();
  }

  Future<void> addUserKnowladge(height, weight, bmiScore) async {
    return await bmi
        .add({
          'height': height,
          'weight': weight,
          'bmiScore': bmiScore,
        })
        .then((value) => print("BMI Calculated"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Future<void> addBmi(bmiScore) async {
  //   return await bmi
  //       .add({'bmi': bmiScore})
  //       .then((value) => print("BMI Calculated"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }
}
