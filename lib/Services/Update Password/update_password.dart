import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> changePassword(String currentPassword, String newPassword) async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Re-authenticate the user
    AuthCredential credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    // Change the password
    await user.updatePassword(newPassword);
    Utils().toastMessage('Password changed successfully.');
  } catch (error) {
    Utils().toastMessage('Error changing password: $error');
    // Handle errors accordingly
  }
}
