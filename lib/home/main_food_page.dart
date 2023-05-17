import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print('current height is '+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          // showing header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45,
              bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    children: [
                      BigText(text: "Pakistan", color: AppColors.mainColor),

                      Row(
                        children: [
                          SmallText(text: "Karachi", color: Colors.black54,),

                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
    
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
          ),
          // showing body
          FoodPageBody()        
        ],
      ),
    );
  }
}