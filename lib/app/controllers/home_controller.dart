// ignore_for_file: prefer_typing_uninitialized_variables, unrelated_type_equality_checks

import 'package:bmi_calculator_firebase/shared/auth_service.dart';
import 'package:bmi_calculator_firebase/shared/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class HomeController extends GetxController {
  AuthService authService = AuthService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DatabaseService db = DatabaseService();
  var isSelected = false.obs;
  Color? bmiStatusColor;
  var bmiStatus;
  var bmiInterpretation;
  var height = 0.0;
  var weight = 0.0;
  var result = 0.0;
  var bmiScore = 0.0;

  void calculateBMI() {
    result = weight / ((height / 100) * (height / 100));
    bmiScore = result;

    if (bmiScore > 30) {
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatus = "Obesity";
      bmiStatusColor = Colors.pink;
      Get.toNamed(Routes.DETAIL);
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
      Get.toNamed(Routes.DETAIL);
    } else if (bmiScore >= 18.5) {
      bmiStatus = "You're healty!";
      bmiInterpretation =
          "This value is in the normal range of 20-25 for your age group. Keep up the good work!";
      bmiStatusColor = Colors.green;
      Get.toNamed(Routes.DETAIL);
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
      Get.toNamed(Routes.DETAIL);
    }
  }

  isBMIControl() {
    if (weight == 0.0 || height == 0.0) {
      Get.dialog(
        AlertDialog(
          title: const Text('Alert',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text(
            'Cannot be blank',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Color(0xff468FF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK',
                  style: TextStyle(
                      color: Color(0xff468FF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } else if (height < 50 || height > 250) {
      Get.dialog(
        AlertDialog(
          title: const Text('Alert',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text(
            'The height value should be in the range of 50 - 250 cm!',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Color(0xff468FF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else if (weight < 10 || weight > 300) {
      Get.dialog(
        AlertDialog(
          title: const Text('Alert',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          content: const Text(
            'The weight value should be in the range of 10 - 300 kg!',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Color(0xff468FF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK',
                  style: TextStyle(
                      color: Color(0xff468FF8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } else {
      calculateBMI();
      db.addUserKnowladge(height, weight, bmiScore);
    }
  }
}
