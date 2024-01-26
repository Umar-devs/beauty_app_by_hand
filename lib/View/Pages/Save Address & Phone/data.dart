import 'package:get/get.dart';
import '../../../Controller/Address Controller/get_address_controller.dart';

final GetAddressController getAddressController =
    Get.put(GetAddressController());
final GetPhoneController getPhoneController = Get.put(GetPhoneController());

List detailsRowTitle = [
  'Address Lane 1',
  '',
  'Address Lane 2',
  '',
  'City',
  '',
  'County',
  '',
  'Phone',
];

List<RxString> detailsRowDetail = [
  getAddressController.lane1,
  getAddressController.lane1,
  getAddressController.lane2,
  getAddressController.lane2,
  getAddressController.city,
  getAddressController.city,
  getAddressController.county,
  getAddressController.county,
  getPhoneController.phone,
  getPhoneController.phone,
];

