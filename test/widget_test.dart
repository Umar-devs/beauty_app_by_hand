// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
// import 'dart:ffi';
// import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
// import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/save_address_phone_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
//
// class MockGetAddressController extends Mock implements GetAddressController {}
//
// class MockGetPhoneController extends Mock implements GetPhoneController {}
//
// void main() {
//   late MockGetAddressController mockGetAddressController;
//   late MockGetPhoneController mockGetPhoneController;
//
//   setUp(() {
//     mockGetAddressController = MockGetAddressController();
//     mockGetPhoneController = MockGetPhoneController();
//
//     when(mockGetAddressController.lane1).thenReturn(RxString('Test Lane 1'));
//     when(mockGetAddressController.lane2).thenReturn(RxString('Test Lane 2'));
//     when(mockGetAddressController.city).thenReturn(RxString('Test City'));
//     when(mockGetAddressController.county).thenReturn(RxString('Test County'));
//
//     when(mockGetPhoneController.phone).thenReturn(RxString('1234567890'));
//   });
//
//   testWidgets('SaveAddressScreen should display correct details', (WidgetTester tester) async {
//     // Build our widget and trigger a frame.
//     await tester.pumpWidget(
//       MaterialApp(
//         home: SaveAddressScreen(
//           screenWidth: 400.0, // Replace with your desired screen width
//           screenHeight: 800.0, // Replace with your desired screen height
//         ),
//       ),
//     );
//
//     // Expect the 'Address Lane 1' detail to be displayed
//     expect(find.text('Address Lane 1'), findsOneWidget);
//     expect(find.text('Test Lane 1'), findsOneWidget);
//
//     // Expect the 'Address Lane 2' detail to be displayed
//     expect(find.text('Address Lane 2'), findsOneWidget);
//     expect(find.text('Test Lane 2'), findsOneWidget);
//
//     // Expect the 'City' detail to be displayed
//     expect(find.text('City'), findsOneWidget);
//     expect(find.text('Test City'), findsOneWidget);
//
//     // Expect the 'County' detail to be displayed
//     expect(find.text('County'), findsOneWidget);
//     expect(find.text('Test County'), findsOneWidget);
//
//     // Expect the 'Phone' detail to be displayed
//     expect(find.text('Phone'), findsOneWidget);
//     expect(find.text('1234567890'), findsOneWidget);
//   });
// }





//
// import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
// import 'package:beauty_app_by_hand/Controller/Profile%20controller/about_app_controller.dart';
// import 'package:beauty_app_by_hand/Controller/Profile%20controller/email_controller.dart';
// import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
// import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
//
// // Mocks
// class MockNameController extends Mock implements NameController {}
//
// class MockEmailController extends Mock implements EmailController {}
//
// class MockGetPhoneController extends Mock implements GetPhoneController {}
//
// class MockAboutAppController extends Mock implements AboutAppController {}
//
// void main() {
//   late MockNameController mockNameController;
//   late MockEmailController mockEmailController;
//   late MockGetPhoneController mockGetPhoneController;
//   late MockAboutAppController mockAboutAppController;
//
//   setUp(() {
//     mockNameController = MockNameController();
//     mockEmailController = MockEmailController();
//     mockGetPhoneController = MockGetPhoneController();
//     mockAboutAppController = MockAboutAppController();
//
//     when(mockNameController.userName).thenReturn(RxString('Test User'));
//     when(mockEmailController.userEmail).thenReturn(RxString('test@example.com'));
//     when(mockGetPhoneController.phone).thenReturn(RxString('1234567890'));
//     when(mockAboutAppController.title).thenReturn(RxString('About Beauty Express'));
//   });
//
//   testWidgets('ProfileScreen should display correct details', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: ProfileScreen(),
//       ),
//     );
//
//     // Expect the name, email, and phone details to be displayed
//     expect(find.text('Test User'), findsOneWidget);
//     expect(find.text('test@example.com'), findsOneWidget);
//     expect(find.text('1234567890'), findsOneWidget);
//
//     // Tap on the "Edit Name" button
//     await tester.tap(find.byKey(const Key('editNameButton')));
//     await tester.pumpAndSettle();
//
//     // Verify that the bottom sheet for editing name is displayed
//     expect(find.text('Edit Name'), findsOneWidget);
//
//     // You can continue testing interactions and states based on your app's behavior
//   });
// }



//
//
// import 'package:beauty_app_by_hand/View/Pages/Payment%20Successful/payment_successful.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
//
// void main() {
//   testWidgets('PaymentSuccessfulScreen should display correct details', (WidgetTester tester) async {
//     // Build our widget and trigger a frame.
//     await tester.pumpWidget(
//       GetMaterialApp(
//         home: PaymentSuccessfulScreen(),
//       ),
//     );
//
//     // Expect the 'Payment Successful' text to be displayed
//     expect(find.text('Payment Successful'), findsOneWidget);
//
//     // Expect the 'Service Details' text to be displayed
//     expect(find.text('Service Details'), findsOneWidget);
//
//     // You can continue adding more expectations based on your UI
//     // For example, check if the 'Chosen Glamour' text is displayed
//     expect(find.text('Chosen Glamour'), findsOneWidget);
//
//     // Check if the 'Beauty Seeker' details row is displayed
//     expect(find.text('Beauty Seeker'), findsOneWidget);
//
//     // Add more expectations based on your UI structure
//
//     // Example: Check if the 'Home' button is displayed
//     expect(find.text('Home'), findsOneWidget);
//   });
// }



//
// import 'package:beauty_app_by_hand/View/Pages/Nav%20Bar/my_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
//
// void main() {
//   testWidgets('MyBottomNav should change the selected index', (WidgetTester tester) async {
//     // Build our widget and trigger a frame.
//     await tester.pumpWidget(
//       GetMaterialApp(
//         home: MyBottomNav(
//           screenHeight: 800.0, // Replace with your desired screen height
//           screenWidth: 400.0, // Replace with your desired screen width
//         ),
//       ),
//     );
//
//     // Expect the initial selected index to be 1
//     expect(find.text('Selected Index: 1'), findsOneWidget);
//
//     // Tap on the first item in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.home));
//     await tester.pump();
//
//     // Expect the selected index to be 0 after tapping on the first item
//     expect(find.text('Selected Index: 0'), findsOneWidget);
//
//     // Tap on the second item in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.favorite));
//     await tester.pump();
//
//     // Expect the selected index to be 1 after tapping on the second item
//     expect(find.text('Selected Index: 1'), findsOneWidget);
//
//     // Tap on the third item in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.settings));
//     await tester.pump();
//
//     // Expect the selected index to be 2 after tapping on the third item
//     expect(find.text('Selected Index: 2'), findsOneWidget);
//   });
// }
