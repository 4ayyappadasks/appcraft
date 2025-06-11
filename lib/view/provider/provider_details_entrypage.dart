import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/provider/providercontroller.dart';
import '../../main.dart';

class ProviderDetailEntryPage extends StatelessWidget {
  final ctrl = Get.put(ProviderController());

  // final nameCtrl = TextEditingController();
  // final detailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          SizedBox(
            height: MyApp.h * .1,
          ),
          Text(
            'Complete Your Profile',
            style: TextStyle(
                color: Colors.white,
                fontSize: MyApp.h * .05,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            onChanged: (value) {
              ctrl.name.value = value;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MyApp.w * .05, vertical: MyApp.h * .02),
              labelText: 'Your Name',
              labelStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(MyApp.h * .02),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(MyApp.h * .02),
                  borderSide: BorderSide(color: Colors.grey)),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(MyApp.h * .02),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          SizedBox(height: 16),
          TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onChanged: (value) {
                ctrl.detail.value = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MyApp.w * .05, vertical: MyApp.h * .02),
                labelText: 'Service Description',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(MyApp.h * .02),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(MyApp.h * .02),
                    borderSide: BorderSide(color: Colors.grey)),
                border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(MyApp.h * .02),
                    borderSide: BorderSide(color: Colors.grey)),
              )),
          SizedBox(height: 20),
          Obx(() => GestureDetector(
            onTap: () {
              if (ctrl.name.value.isEmpty || ctrl.detail.value.isEmpty) {
                Get.snackbar('Error', 'Fill all fields',
                    backgroundColor: Colors.white);
              } else {
                ctrl.setup(ctrl.name.value, ctrl.detail.value);
                Get.offAllNamed('/providerHome');
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MyApp.w * .05),
              child: Container(
                width: MyApp.w,
                height: MyApp.h * .05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MyApp.h * .008),
                    gradient: LinearGradient(
                        colors:
                        (ctrl.name.value == "" || ctrl.detail.value == "")
                            ? [
                          Color(0xFF4A4A4A),
                          Color(
                            0x2196F3FF,
                          )
                        ]
                            : [
                          Color(0xFF4A4A4A),
                          Colors.blue,
                        ])),
                child: Center(
                  child: Text(
                    'Proceed to Dashboard',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),),
        ]),
      ),
    );
  }
}
