import 'package:beauty_app_by_hand/Controller/Auth%20Controller/loading_stop_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/email_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Core/utils.dart';
import '../../Services/Profile Screen Data Services/save_profile_data.dart';
import '../../View/Pages/Home Screen/home_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LoadingStopController loadingStopController =
      Get.put(LoadingStopController());
  RxBool showWidget = false.obs;

  void signUp(
    signUpEmailController,
    signUpPasswordController,
    String name,
  ) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: signUpEmailController.text.toString(),
        password: signUpPasswordController.text.toString(),
      )
          .then((value) async {
        await Future.delayed(const Duration(seconds: 2));
        Utils().toastMessage('User Registered Successfully');
        Get.offAll(
          const LoginScreen(),
          transition: Transition.fadeIn,
        );
        saveName(name);
      });
      showWidget.toggle();
    } catch (error) {
      loadingStopController.changeErrorValue();
      Utils().toastMessage(error.toString());
    }
  }

  void login(String email, String password) {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Get.offAll(HomeScreen(), transition: Transition.fadeIn);
    }).onError((error, stackTrace) {
      loadingStopController.changeErrorValue();
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    final NameController nameController = Get.put(NameController());
    final EmailController emailController = Get.put(EmailController());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Check if the user canceled the sign-in process
      if (googleUser == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      nameController.setName(googleUser.displayName);
      emailController.setEmail(googleUser.email);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        Utils().toastMessage(e.toString());
        print('google error: $e');
      }
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) =>
          Get.offAll(const LoginScreen(), transition: Transition.fadeIn));
      Utils().toastMessage('User signed out successfully');
    } catch (e) {
      Utils().toastMessage('Error signing out: $e');
    }
  }
}
