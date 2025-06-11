import 'package:appcraftmt/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/customer/customercontroller.dart';

class CategoryList extends StatelessWidget {
  final controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyApp.h*.045,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemBuilder: (ctx, i) {
          final cat = controller.categories[i];
          return Obx(() {
            final isSelected = controller.selectedCategory.value == cat;

            return GestureDetector(
              onTap: () => controller.filterProviders(cat),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: MyApp.w*.03, vertical: MyApp.h*.01),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(colors: [Color(0xFF4A4A4A), Colors.blue])
                      : LinearGradient(colors: [Colors.grey.shade800, Colors.grey.shade700]),
                  borderRadius: BorderRadius.circular(MyApp.h*.01),
                ),
                child: Center(
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

