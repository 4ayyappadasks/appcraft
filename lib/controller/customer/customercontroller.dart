import 'package:get/get.dart';
import '../../model/service provider/service provider.dart';

class CustomerController extends GetxController {
  final categories = ['Plumber', 'Cleaner', 'Tutor', 'Electrician', 'Mechanic', 'Gardener'];
  final selectedCategory = ''.obs;

  final allProviders = <ServiceProvider>[
    ServiceProvider('Alice', 'Expert plumber with 5 years experience', 'Plumber'),
    ServiceProvider('John', 'Fast & affordable plumbing', 'Plumber'),
    ServiceProvider('Bob', 'Cleaner for study and office', 'Cleaner'),
    ServiceProvider('Emma', 'Eco-friendly home cleaning', 'Cleaner'),
    ServiceProvider('Maya', 'Math tutor for high school', 'Tutor'),
    ServiceProvider('Liam', 'Physics & chemistry tutor', 'Tutor'),
    ServiceProvider('Noah', 'Certified electrician', 'Electrician'),
    ServiceProvider('Sophia', 'Residential electric services', 'Electrician'),
    ServiceProvider('Ethan', 'Bike mechanic expert', 'Mechanic'),
    ServiceProvider('Olivia', 'Car mechanic, 10 yrs experience', 'Mechanic'),
    ServiceProvider('Ava', 'Lawn maintenance & care', 'Gardener'),
    ServiceProvider('Mason', 'Experienced garden designer', 'Gardener'),
  ];

  RxList<ServiceProvider> topProviders = <ServiceProvider>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategory.value = categories.first;
    filterProviders(categories.first);
  }

  void filterProviders(String category) {
    selectedCategory.value = category;
    topProviders.value = allProviders.where((p) => p.category == category).toList();
  }

  /// search
  final isSearchActive = false.obs;

  void toggleSearch() {
    isSearchActive.value = !isSearchActive.value;
  }
  void closeSearch() {
    isSearchActive.value = false;
  }
}
