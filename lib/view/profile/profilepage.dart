import 'package:appcraftmt/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/authcontroller/authcontroller.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MyApp.h*.1,),
          Row(
            children: [
              IconButton(onPressed: () {
                authC.storage.read('user_type')=="customer"
                ?Get.offAllNamed('/customerHome')
                :Get.offAllNamed('/providerHome');
              }, icon: Icon(CupertinoIcons.back,color: Colors.white,)),
              Text('Profile',style: TextStyle(color: Colors.white,fontSize: MyApp.h*.05,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: MyApp.h*.1,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MyApp.w*.05),
            child: Text('Email: ${authC.storage.read('user_email') ?? "No email"}',style: TextStyle(color: Colors.white,fontSize: MyApp.h*.02,),),
          ),
          SizedBox(height: MyApp.h*.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MyApp.w*.05),
            child: Text('Type: ${authC.storage.read('user_type') ?? "No description"}',style: TextStyle(color: Colors.white,fontSize: MyApp.h*.02,),),
          ),
          SizedBox(height: MyApp.h*.02),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/login');
              if (authC.storage.read('user_type') == "customer") {
                authC.storage.remove("user_email");
              } else {
                authC.storage.remove("user_name");
                authC.storage.remove("user_description");
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MyApp.w*.05),
              child: Container(
                width: MyApp.w,
                height: MyApp.h*.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyApp.h*.008),
                    gradient: LinearGradient(colors:
                    [
                      Color(0xFF4A4A4A),
                      Colors.blue
                    ]
                    )
                ),
                child: Center(
                  child: Text('Logout',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
