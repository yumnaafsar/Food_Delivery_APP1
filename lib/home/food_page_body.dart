import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimension.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});


  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController=PageController(viewportFraction: 0.85);

  var _currPageValue=0.0;

  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
        
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        Container(
          // color: Colors.amber,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
        ),
        // dots
         DotsIndicator(
  dotsCount: 5,
  position: _currPageValue.toInt(),
  decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  ),
),
        // Popular text
        SizedBox(height: Dimensions.height30,),
      
        Container(
          margin: EdgeInsets.only(left: Dimensions.width10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        
        // list of food and images
       Container(
        height: 700,
        // for list view builder its parent should have a certain height
         child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
           return Container(
            margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: DecorationImage(image: AssetImage('assets/images/food0.jpg'))
                  ),
                )
              ],
            ),
           );
         }),
       )
      ],
    );
  }

  Widget _buildPageItem(int index){

    Matrix4 matrix= new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale= 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(index ==_currPageValue.floor()+1){
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale= 0.8;
      
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?Color(0xFF69c5df): Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/food1.jpg')
            )
          ),
        ),
    
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0,5)
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0)
                ),
                 BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0)
                )
              ]
            ),
            
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height15, left:  Dimensions.height15, right:  Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  BigText(text: 'Fast Food Side'),
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15,),
                      )
                  ),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: '4.5'),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: '1287'),
    
                  SizedBox(width: 10,),
    
                  SmallText(text: "comments")
                      
                  ],
                  ),
    
                  SizedBox(height: Dimensions.height20,),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(Icons.circle_sharp,
                       "Normal",
                        AppColors.iconColor1),
    
                         IconAndTextWidget(Icons.location_on,
                       "1.7km",
                        AppColors.mainColor),
    
                         IconAndTextWidget(Icons.access_time_rounded,
                       "32min",
                        AppColors.iconColor2)
                    ],
                  )
    
                ],
              ),
            ),
          ),
        ),
    
        ]
      ),
    );
  }
}