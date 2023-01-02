import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/account_controller.dart';

import '../../utils/widgets/textfield.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/nutritionist.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),

                const SizedBox(height: 40),

                MyTextField(
                  onChanged: (value) => controller.email = value,
                  hintText: 'E-mail',
                  obscureText: false,
                ),

                const SizedBox(height: 12),
                // password textfield
                MyTextField(
                  onChanged: (value) => controller.password = value,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                InkWell(
                  onTap: () {
                    controller.authService
                        .createUser(controller.email, controller.password);
                    // Get.defaultDialog(middleText: "Please a register account");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 130),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
