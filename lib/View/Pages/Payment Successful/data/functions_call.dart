import 'package:beauty_app_by_hand/View/Pages/Payment%20Successful/data/payment_success_data.dart';
import '../../../../Services/Address Services/fetch_address.dart';
import '../../../../Services/Appointment Services/fetch_data.dart';
import '../../../../Services/Manage Orders/place_orders.dart';
import '../../../../Services/Profile Screen Data Services/fetch_profile_data.dart';
import '../../../../Services/Treatment Services/fetch_data.dart';

void callRequiredFunctions() {
  fetchName();
  fetchPhone();
  fetchDate();
  fetchTime();
  fetchSubCategory();
  fetchCategory();
  fetchPrice();
  placeOrder(
      getCategoryController.category.value,
      getSubCategoryController.subCategory.value,
      fetchDateController.date.value,
      fetchTimeController.time.value,
      getPhoneController.phone.value,
      'payIntent',
      '${addressController.lane1.value} ${addressController.lane2.value} ${addressController.city.value} ${addressController.county.value}',
      nameController.userName.value,
      getPriceController.price.value);
}
