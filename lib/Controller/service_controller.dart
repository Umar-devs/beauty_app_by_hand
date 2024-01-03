import 'package:get/get.dart';

class ServiceController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool tapped = false.obs;
  void changeIndex(index) {
    selectedIndex.value = index;
  }
  void changeState(){
    tapped.value=!tapped.value;
  }
}
