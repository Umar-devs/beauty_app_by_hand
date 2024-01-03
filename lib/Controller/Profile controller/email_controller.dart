import 'package:get/get.dart';
class EmailController extends GetxController{
  RxString userEmail=''.obs;
  void setEmail(email){
    userEmail.value=email;
  }
}