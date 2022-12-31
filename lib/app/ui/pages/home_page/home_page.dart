import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, right: 60, left: 25),
                width: 400,
                height: 100,
                child: const Text(
                  "Let`s calculate your current BMI",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color.fromARGB(255, 83, 83, 83)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, right: 60, left: 25),
                width: 400,
                height: 50,
                child: const Text(
                  "You can find out whether you are overweight, underweight or ideal weight.",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromARGB(255, 116, 115, 115)),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, top: 35),
                    alignment: Alignment.center,
                    width: 92,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 197, 194, 194)),
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 90, 90, 90),
                    ),
                    child: const Text(
                      "Female",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 35),
                    alignment: Alignment.center,
                    width: 95,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 197, 194, 194)),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Male",
                      style: TextStyle(
                          color: Color.fromARGB(255, 117, 116, 116),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 35),
                    alignment: Alignment.center,
                    width: 95,
                    height: 45,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 197, 194, 194)),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Other",
                      style: TextStyle(
                          color: Color.fromARGB(255, 117, 116, 116),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 35),
                padding: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: const Color.fromARGB(255, 117, 116, 116),
                    decoration: const InputDecoration(
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text('Age',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 155),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            WidgetSpan(
                              child: Text(
                                '',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.height = double.parse(value);
                      }
                    },
                    cursorColor: const Color.fromARGB(255, 117, 116, 116),
                    decoration: const InputDecoration(
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text('Height',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 155),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            WidgetSpan(
                              child: Text(
                                '',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.weight = double.parse(value);
                      }
                    },
                    cursorWidth: 1,
                    cursorColor: const Color.fromARGB(255, 73, 165, 241),
                    decoration: const InputDecoration(
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text('Weight',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 155),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            WidgetSpan(
                              child: Text(
                                '',
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.isBMIControl();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 160),
                  width: 350,
                  height: 50,
                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(
                        color: Color.fromARGB(255, 250, 245, 245),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
