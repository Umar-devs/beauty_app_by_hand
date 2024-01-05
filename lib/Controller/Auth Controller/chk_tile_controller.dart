import 'package:get/get.dart';

class ChkBoxController extends GetxController{
  RxBool chkValue=false.obs;
  void changeVal(bool val){
    chkValue.value=val;
  }
}