import 'package:get/get.dart';
class NameController extends GetxController{
  RxString userName=''.obs;
  void setName(name){
    userName.value=name;
  }
}