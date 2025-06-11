import 'package:appcraftmt/view/customerhm/customerhomepage.dart';
import 'package:appcraftmt/view/login/loginpage.dart';
import 'package:appcraftmt/view/profile/profilepage.dart';
import 'package:appcraftmt/view/provider/provider_details_entrypage.dart';
import 'package:appcraftmt/view/provider/provider_homepage.dart';
import 'package:appcraftmt/view/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static double h = 0.0;
  static double w = 0.0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service App Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/customerHome', page: () => CustomerHomePage()),
        GetPage(name: '/providerHome', page: () => ProviderHomePage()),
        GetPage(name: '/profile', page: () => CustomerProfilePage()),
        GetPage(name: '/providerEntry', page: () => ProviderDetailEntryPage()),
        GetPage(name: '/signup', page: () => Signup()),
      ],
    );
  }
}
