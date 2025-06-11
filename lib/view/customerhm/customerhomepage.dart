import 'package:appcraftmt/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/customer/customercontroller.dart';
import '../../model/service provider/service provider.dart';
import '../category/categorylist.dart';

class CustomerHomePage extends StatelessWidget {
  final ctrl = Get.put(CustomerController());
  final searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: MyApp.h * .03),
            Row(
              children: [
                SizedBox(
                  width: MyApp.w * .02,
                ),
                Text(
                  'Find Your Service',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MyApp.h * .025),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.toNamed('/profile');
                    },
                    icon: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: MyApp.w * .02,
                )
              ],
            ),
            SizedBox(height: MyApp.h * .03),

            /// searchbar
            Obx(() {
              return AnimatedCrossFade(
                duration: Duration(milliseconds: 300),
                firstChild: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xFF4A4A4A),
                      Colors.blue
                    ]),
                  ),
                  child: IconButton(
                    onPressed: () {
                      ctrl.toggleSearch();
                    },
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                secondChild: Container(
                  width: MyApp.w * 0.85,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search...',
                      suffixIcon: IconButton(
                        onPressed: ctrl.closeSearch,
                        icon: Icon(Icons.close),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MyApp.h * .02),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MyApp.h * .02),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MyApp.h * .02),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                crossFadeState: ctrl.isSearchActive.value
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstCurve: Curves.easeInOut,
                secondCurve: Curves.easeInOut,
                sizeCurve: Curves.easeInOut,
              );
            }),
            SizedBox(height: MyApp.h * .02),
            /// category list
            CategoryList(),
            SizedBox(height: MyApp.h * .02),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Top Providers',
                    style: TextStyle(
                        fontSize: MyApp.h * .025,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
            SizedBox(height: MyApp.h * .01),
            Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: ctrl.topProviders.length,
                      itemBuilder: (ctx, i) =>
                          ProviderTile(ctrl.topProviders[i]),
                    ))),
          ],
        ),
      ),
    );
  }
}

class ProviderTile extends StatelessWidget {
  final ServiceProvider provider;

  ProviderTile(this.provider);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(provider.name, style: TextStyle(color: Colors.white)),
        subtitle: Text(provider.description, style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}