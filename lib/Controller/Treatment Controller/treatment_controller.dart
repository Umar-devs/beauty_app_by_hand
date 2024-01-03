import 'package:get/get.dart';

class GetCategoryController extends GetxController {
  final RxString category = ''.obs;
  void getCategory(categorySelected) {
    category.value = categorySelected;
  }
}

class GetSubCategoryController extends GetxController {
  final RxString subCategory = ''.obs;
  void getSubCategory(subCategorySelected) {
    subCategory.value = subCategorySelected;
  }
}
class GetPriceController extends GetxController {
  final RxString price = ''.obs;
  void getPrice(priceSelected) {
    price.value = priceSelected;
  }
}
