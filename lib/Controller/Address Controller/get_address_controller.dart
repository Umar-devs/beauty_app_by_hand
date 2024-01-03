import 'package:get/get.dart';

class GetAddressController extends GetxController {
  RxString lane1 = ''.obs;
  RxString lane2 = ''.obs;
  RxString city = ''.obs;
  RxString county = ''.obs;
  void getAddress(
    lane1Address,
    lane2Address,
    cityAddress,
    countyAddress,
  ) {
    lane1.value = lane1Address;
    lane2.value = lane2Address;
    city.value = cityAddress;
    county.value = countyAddress;
  }
}

class GetPhoneController extends GetxController {
  RxString phone = ''.obs;
  void getPhone(phoneNumber) {
    phone.value = phoneNumber;
  }
}
