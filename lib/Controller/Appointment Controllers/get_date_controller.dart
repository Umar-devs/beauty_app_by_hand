import 'package:get/get.dart';

class GetDateController extends GetxController {
  RxString date = ''.obs;
  RxString day = ''.obs;
  void getDateDay(String? selectedDate, String? selectedDay) {
    date.value = selectedDate!;
    day.value = selectedDay!;
  }
}
