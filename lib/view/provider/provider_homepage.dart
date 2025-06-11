import 'package:appcraftmt/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/provider/providercontroller.dart';

class ProviderHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProviderController());
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: MyApp.h * .1,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Get.toNamed('/profile',);
                  },
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  )),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Welcome Back, ${ctrl.storage.read("user_name")}',
                    style: TextStyle(
                        fontSize: MyApp.h * .07, color: Colors.white))),
            SizedBox(height: MyApp.h * .02),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Description: ${ctrl.storage.read("user_description")}',
                    style: TextStyle(
                        fontSize: MyApp.h * .02, color: Colors.white))),
            SizedBox(height: MyApp.h * .05),
            GestureDetector(
              onTap: () {
                ctrl.addDummyOrder();
              },
              child: Container(
                width: MyApp.w * .5,
                height: MyApp.h * .05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyApp.h * .008),
                    gradient: LinearGradient(colors: [
                      Color(0xFF005F87),
                      Color(0xFF008736),
                    ])),
                child: Center(
                  child: Text(
                    'Add Dummy Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: MyApp.h * .05),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Orders',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            Expanded(child: Obx(() {
              if (ctrl.orders.isEmpty) return Text('No orders yet',style: TextStyle(color: Colors.white),);
              return ListView.builder(
                itemCount: ctrl.orders.length,
                itemBuilder: (ctx, i) =>
                    Card(child: ListTile(title: Text(ctrl.orders[i]))),
              );
            })),
          ],
        ),
      ),
    );
  }
}
