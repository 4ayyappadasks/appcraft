import 'package:appcraftmt/controller/authcontroller/authcontroller.dart';
import 'package:appcraftmt/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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