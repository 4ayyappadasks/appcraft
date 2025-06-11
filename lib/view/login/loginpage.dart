import 'package:appcraftmt/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authcontroller/authcontroller.dart';

class LoginPage extends StatelessWidget {
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MyApp.h * .1),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MyApp.h * .05),
                )),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'email',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(MyApp.h * .02),
                      borderSide: BorderSide(color: Colors.grey))),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: MyApp.h * .05),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "choose your role",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MyApp.h * .02),
            RoleSelector(),
            SizedBox(height: MyApp.h * .02),
            Obx(() => GestureDetector(
              onTap: () {
                if (authC.role.value.isNotEmpty &&
                    authC.email.value.contains('@')) {
                  authC.login(authC.email.value, authC.role.value);
                } else {
                  Get.snackbar('Error', 'Enter valid email & role',backgroundColor: Colors.white);
                }
              },
              child: Container(
                width: MyApp.w*.5,
                height: MyApp.h*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyApp.h*.008),
                    gradient: LinearGradient(colors:
                    (authC.email.value==""||authC.role.value=="")
                        ?
                    [
                      Color(0xFF304F57),
                      Color(0xFF3D614C),
                    ]
                        :[
                      Color(0xFF005F87),
                      Color(0xFF008736),
                    ])
                ),
                child: Center(
                  child: Text('Continue',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class RoleSelector extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: authC.role.value == authC.userlist[0]
              ?[
                Color(0xFF008736),
                Color(0xFF005F87),
              ]
              :[
                Color(0xFF373636),
                Color(0xFF373636),
              ]),
                borderRadius: BorderRadius.circular(MyApp.w * .02)),
            height: MyApp.h * .05,
            width: MyApp.w * .3,
            child: TextButton(
                onPressed: () {
                  authC.role.value = authC.userlist[0];
                },
                child: Text(
                  'Customer',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:authC.role.value == authC.userlist[1]
                    ?[
                  Color(0xFF008736),
                  Color(0xFF005F87),
                ]
                    :[
                  Color(0xFF373636),
                  Color(0xFF373636),
                ]),
                borderRadius: BorderRadius.circular(MyApp.w * .02)),
            height: MyApp.h * .05,
            width: MyApp.w * .3,
            child: TextButton(
                onPressed: () {
                  authC.role.value = authC.userlist[1];
                },
                child: Text(
                  'Provider',
                  style: TextStyle(
                      color:  Colors.white),
                )),
          ),
        ],
      );
    });
  }
}
