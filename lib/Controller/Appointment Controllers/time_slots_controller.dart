import 'package:get/get.dart';

class TimeSlotController extends GetxController{
  RxInt selectedIndex=100.obs;
  void changeIndex(int index){
    selectedIndex.value=index;
  }
}