import 'package:get/get.dart';

class NavBarController extends GetxController{
  RxInt selectedIndex=1.obs;
  void changeIndex(index){
    selectedIndex.value=index;
  }
}