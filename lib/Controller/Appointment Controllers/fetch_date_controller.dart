import 'package:get/get.dart';

class FetchDateController extends GetxController{
  final RxString date=''.obs;
  void fetchDate(String dateSelected){
    date.value=dateSelected;
  }
}
class FetchTimeController extends GetxController{
  final RxString time=''.obs;
  void fetchDay(String timeSlot){
    time.value=timeSlot;
  }
}