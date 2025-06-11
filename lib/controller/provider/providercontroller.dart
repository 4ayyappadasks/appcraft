// provider_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProviderController extends GetxController {
  final name = ''.obs, detail = ''.obs;
  final orders = <String>[].obs;


  final storage = GetStorage();
  void setup(String n, String d) {
    name.value = n;
    detail.value = d;
    storage.write('user_name', n);
    storage.write('user_description', d);
  }

  void addDummyOrder() {
    orders.add('Order #${orders.length + 1}');
  }
}
