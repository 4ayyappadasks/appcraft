import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authcontroller/authcontroller.dart';
import '../../main.dart';
import '../../widget/roleselecter.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MyApp.h * .1),
              Row(
                children: [
                  IconButton(onPressed: () {Get.offAllNamed('/login');
                  }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: MyApp.h * .05),
                  ),
                ],
              ),
              SizedBox(height: MyApp.h * .1), // Replace Spacer with fixed spacing
              Text(
                'email',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MyApp.h * .02),
              TextField(
                cursorColor: Colors.white,
                onChanged: (value) {
                  authC.email.value = value;
                },
                decoration: InputDecoration(
                  hintText: "...email.com",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.mail, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: MyApp.h * .01),
              Text(
                'password',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MyApp.h * .02),
              TextField(
                obscureText: true,
                cursorColor: Colors.white,
                onChanged: (value) {
                  authC.pass.value = value;
                },
                decoration: InputDecoration(
                  hintText: "*******",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: MyApp.h * .05),
              Text(
                "choose your role",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MyApp.h * .02),
              RoleSelector(),
              SizedBox(height: MyApp.h * .02),
              Obx(
                    () => Center(
                      child: GestureDetector(
                                          onTap: () {
                      if (authC.role.value.isNotEmpty &&
                          authC.pass.value.isNotEmpty &&
                          authC.email.value.contains('@')) {
                        authC.signup(authC.email.value, authC.pass.value);
                      } else {
                        Get.snackbar('Error', 'Enter valid email & role',
                            backgroundColor: Colors.white);
                      }
                                          },
                                          child: Container(
                      width: MyApp.w * .5,
                      height: MyApp.h * .05,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(MyApp.h * .008),
                          gradient: LinearGradient(
                              colors: (authC.email.value == "" ||
                                  authC.pass.value == ""||authC.role.value=="")
                                  ? [
                                Color(0xFF304F57),
                                Color(0xFF3D614C),
                              ]
                                  : [
                                Color(0xFF005F87),
                                Color(0xFF008736),
                              ])),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                                          ),
                                        ),
                    ),
              ),
              SizedBox(height: MyApp.h * .1), // Replace Spacer with fixed height
            ],
          ),
        ),
      ),
    );
  }
}
