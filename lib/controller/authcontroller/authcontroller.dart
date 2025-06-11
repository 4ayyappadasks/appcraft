import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final userlist = ["customer", "provider"];
  final RxString email = ''.obs;
  final RxString pass = ''.obs;
  final RxString role = "".obs;


  final storage = GetStorage();
  void login(String e, String r) {
    email.value = e;
    role.value = r;
    storage.write('user_email', e);
    storage.write('user_type', r);
    if (r == "customer") {
      Get.offAllNamed('/customerHome');
    } else {
      Get.offAllNamed('/providerEntry');
    }
  }

  void signup(String name, String passwd)
  {
    email.value = name;
    pass.value = passwd;
    Get.offAllNamed('/login');
  }
}