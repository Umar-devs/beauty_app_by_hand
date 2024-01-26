import 'package:get/get.dart';
import '../../../../Controller/Address Controller/get_address_controller.dart';
import '../../../../Controller/Appointment Controllers/fetch_date_controller.dart';
import '../../../../Controller/Profile controller/name_controller.dart';
import '../../../../Controller/Treatment Controller/treatment_controller.dart';

final GetPhoneController getPhoneController = Get.put(GetPhoneController());
final NameController nameController = Get.put(NameController());
final FetchDateController fetchDateController = Get.put(FetchDateController());
final FetchTimeController fetchTimeController = Get.put(FetchTimeController());
final GetCategoryController getCategoryController =
    Get.put(GetCategoryController());
final GetSubCategoryController getSubCategoryController =
    Get.put(GetSubCategoryController());
final GetPriceController getPriceController = Get.put(GetPriceController());
final GetAddressController addressController = Get.put(GetAddressController());
