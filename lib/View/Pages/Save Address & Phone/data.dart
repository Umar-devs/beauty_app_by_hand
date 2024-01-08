import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Address Controller/get_address_controller.dart';
import 'Components/Reusable Components/details_row.dart';
import 'Components/Reusable Components/tile_divider.dart';

final GetAddressController getAddressController =
    Get.put(GetAddressController());
final GetPhoneController getPhoneController = Get.put(GetPhoneController());

List detailsRowTitle = [
  'Address Lane 1',
  'Address Lane 2',
  'City',
  'County',
  'Phone',
];

List detailsRowDetail = [
  getAddressController.lane1.value.toString(),
  getAddressController.lane2.value.toString(),
  getAddressController.city.value.toString(),
  getAddressController.county.value.toString(),
  getPhoneController.phone.value.toString(),
];
List <Widget> detailsRowTileList=[];
void addDetailsRowTiles(screenWidth){
  for(int i=0;i<9;i++){
    if(i%2==0){
      detailsRowTileList.add( DetailsRowSaveAddressScreen(
          screenWidth: screenWidth,
          title:detailsRowTitle[i],
          detail: detailsRowDetail[i]));
    }
    else{
      detailsRowTileList.add(const TileDivider());
    }
  }
}