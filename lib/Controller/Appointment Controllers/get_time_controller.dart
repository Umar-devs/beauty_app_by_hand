import 'package:get/get.dart';

class GetTimeController extends GetxController{
  RxString time=''.obs;
  void getTime(String selectedTime){
    time.value=selectedTime;
  }
}