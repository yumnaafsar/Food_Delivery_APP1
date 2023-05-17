import 'package:get/get.dart';

class Dimensions{
  // screenHeight=683 

  static double screenHeight=Get.context!.height;
  static double screenWidth=Get.context!.width;
  //683/320  
  static double pageView=screenHeight/2.1;

  // 683/220=3.1
  static double pageViewContainer=screenHeight/3.1;
  static double pageViewTextContainer=screenHeight/5.6;
  
  // dynmic height mainly for padding and margin top bottom
  static double height10=screenHeight/68.3;
  static double height15=screenHeight/45.53;
  static double height20=screenHeight/34.15;
  static double height30=screenHeight/22.74;
  static double height45=screenHeight/15.17;

  // dynmic height mainly for padding and margin right left
  static double width10=screenHeight/68.3;
  static double width15=screenHeight/45.53;
  static double width20=screenHeight/34.15;
  static double width30=screenHeight/22.74;

  static double font20=screenHeight/34.15;

  static double radius15=screenHeight/45.53;
  static double radius20=screenHeight/34.15;
  static double radius30=screenHeight/22.74;

  // icon size
  static double iconSize24=screenHeight/28.33;

}