import 'package:get/get.dart';

class LoadingStopController extends GetxController{
  RxBool isError=false.obs;
  void changeErrorValue(){
    isError.value=true;
  }
}