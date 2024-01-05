import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Profile controller/about_app_controller.dart';
import '../../../Controller/Profile controller/name_controller.dart';
import '../../../Controller/service_controller.dart';
import '../../Data/lists.dart';
import 'Components/Reusable Components/popular_services_container.dart';

List<Widget> popularTreatmentsWidgetList = [];
List popularTreatmentsStore(width, height) {
  for (int i = 1; i < 9; i++) {
    popularTreatmentsWidgetList.add(PopularTreatmentsContainer(
      screenWidth: width,
      screenHeight: height,
      title: treatmentsNames[i],
      subCategoryCount: i == 1
          ? subCategoriesFacial.length
          : i == 3
              ? subCategoriesMassage.length
              : subCategoriesMakeUp.length,
      img: imagesHomeScreen[i],
      pageNumber: i,
      numberOfSubCategories: i == 1
          ? subCategoriesFacial.length
          : i == 3
              ? subCategoriesMassage.length
              : subCategoriesMakeUp.length,
    ));
    if (i == 1) {
      i = i + 1;
    }
    if (i == 3) {
      i = i + 4;
    }
  }
  return popularTreatmentsWidgetList;
}
final ServiceController serviceController = Get.put(ServiceController());
final AboutAppController aboutAppController = Get.put(AboutAppController());
final NameController nameController = Get.put(NameController());