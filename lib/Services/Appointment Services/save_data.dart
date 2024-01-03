

import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void saveDate(String appointmentDate){
  final User?user =FirebaseAuth.instance.currentUser;
  if(user!=null){
    try{
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Appointment Date').child(userId);
      databaseRef.set({
        'date':appointmentDate
      });
    }
    catch(e){
      Utils().toastMessage(e.toString());
    }
  }
}
void saveDay(String appointmentDay){
  final User?user =FirebaseAuth.instance.currentUser;
  if(user!=null){
    try{
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Appointment Day').child(userId);
      databaseRef.set({
        'day':appointmentDay
      });
    }
    catch(e){
      Utils().toastMessage(e.toString());
    }
  }
}
void saveSlot(String timeSlot){
  final User?user =FirebaseAuth.instance.currentUser;
  if(user!=null){
    try{
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Time Slot').child(userId);
      databaseRef.set({
        'timeSlot':timeSlot
      });
    }
    catch(e){
      Utils().toastMessage(e.toString());
    }
  }
}
