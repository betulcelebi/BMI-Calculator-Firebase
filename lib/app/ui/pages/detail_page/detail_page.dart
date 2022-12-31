import 'package:bmi_calculator_firebase/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:get/get.dart';
import '../../../controllers/detail_controller.dart';

class DetailPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            //alignment: Alignment.topCenter,
            width: 350,
            height: 500,
            margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(135, 187, 187, 187),
                      spreadRadius: 1,
                      blurRadius: 30,
                      blurStyle: BlurStyle.outer,
                      offset: Offset.fromDirection(2))
                ]),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Your BMI is",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4B4B4B)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Text(
                    controller.bmiScore.toStringAsFixed(2),
                    style: const TextStyle(
                        color: Color(0xff66CFA6),
                        fontWeight: FontWeight.bold,
                        fontSize: 62),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    controller.bmiInterpretation.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 270,
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(top: 4),

                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 250,
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.all(0),
                        child: Image.asset(
                          "assets/female-doctor.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      ChatBubble(
                        clipper:
                            ChatBubbleClipper1(type: BubbleType.receiverBubble),
                        backGroundColor: controller.bmiStatusColor,
                        margin: const EdgeInsets.only(top: 30),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.5,
                          ),
                          child: Text(
                            controller.bmiStatus.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 43, 43, 43),
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 160),
              width: 350,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Text(
                    "Start over",
                    style: TextStyle(
                        color: Color.fromARGB(255, 250, 245, 245),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff468FF8),
                  ),
                  color: const Color(0xff468FF8),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
